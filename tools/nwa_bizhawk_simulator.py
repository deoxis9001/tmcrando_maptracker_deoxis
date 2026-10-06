""" Simulation d'un serveur Bizhawk-nwa-tool (https://github.com/Skarsnik/Bizhawk-nwa-tool)
 pour tester l'interface d'autotracking SANS BizHawk ni console :
   * même protocole TCP/NWA que le plugin (commandes texte \n ; erreurs "\nerror:...\n\n" ;
     réponses hash "\nkey:value\n\n" ; données mémoire : octet 0 + taille u32 BE + bytes)
   * port par défaut identique au plugin : 0xBEEF (49135)
   * RAM GBA simulée : 256 Ko (EXECRAM), initialisée avec un savestate TMC
     ("save.emo", "TMC-*.ss", "TMC-*.emuSave"... ou premier fichier .ss/.sav trouvé)
   * écriture possible via bCORE_WRITE (pour fabriquer des états de test)
 Usage :  python3 tools/nwa_bizhawk_simulator.py [port]"""

import json
import os
import re
import select
import socket
import socketserver
import struct
import sys
import threading
import time

RAM_BASE = 0x02000000  # adresse de base IWRAM GBA (EXEC RAM dans BizHawk/mGBA)
RAM_SIZE = 0x40000     # EXECRAM GBA : 256 Ko
# Les adresses NWA sont relatives au domaine ; EmoTracker/TMC utilise des
# adresses absolues GBA (0x0200xxxx). On accepte les deux : toute valeur >=
# RAM_BASE est convertie en offset relatif.


def enable_tcp_keepalive(sock, idle=15, interval=10, count=6):
    """Active SO_KEEPALIVE avec des paramètres courts.

    Sans cela, une connexion TCP inactive est tuée au bout de ~2 min par
    certains pare-feu/NAT/OS (et BizHawk ou le réseau peut couper les
    connisons silencieuses). Les keepalive empêchent la coupure côté
    inactivité ET font détecter une vraie coupure en ~1 min au lieu de
    rester bloqué éternellement dans recv().
    """
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)
    if hasattr(socket, "TCP_KEEPIDLE"):      # Linux
        sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPIDLE, idle)
    if hasattr(socket, "TCP_KEEPINTVL"):     # Linux
        sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPINTVL, interval)
    if hasattr(socket, "TCP_KEEPCNT"):       # Linux
        sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_KEEPCNT, count)
    elif sys.platform == "darwin":           # macOS/BSD : une seule valeur
        try:
            sock.setsockopt(socket.IPPROTO_TCP,
                            getattr(socket, "TCP_KEEPALIVE", 0x10), idle)
        except OSError:
            pass


def load_fake_ram():
    """Ram GBA simulée : zeros, ou contenu d'un savestate TMC si trouvé."""
    ram = bytearray(RAM_SIZE)
    here = os.path.dirname(os.path.abspath(__file__))
    candidates = []
    for pattern in ("save.emo",):
        p = os.path.join(here, "..", "emo", pattern)
        if os.path.isfile(p):
            candidates.append(p)
    for pattern in (r"TMC-.*\.ss$", r"TMC-.*\.emuSave$", r".*\.ss$", r".*\.sav$"):
        for d in (here, os.path.join(here, ".."), os.path.join(here, "..", "emo")):
            if not os.path.isdir(d):
                continue
            for f in sorted(os.listdir(d)):
                if re.match(pattern, f):
                    candidates.append(os.path.join(d, f))
    for path in candidates:
        try:
            with open(path, "rb") as fh:
                data = fh.read()
        except OSError:
            continue
        if len(data) >= RAM_SIZE:
            ram[:] = data[:RAM_SIZE]
            print(f"[SIM] RAM initialisée depuis {path} (copie brute)")
            return ram
        # copier ce qui tombe dans la zone autotracking si le fichier est petit
        for i in range(0x2AC0, min(len(data), 0xEB4)):
            ram[i] = data[i] & 0xFF
        for a in range(0x2AC0, 0x2EB4):
            if ram[a] == 0 and (a % 7) == 0:
                ram[a] = 0xF3  # murs fusionnés -> item.Active = true
        print(f"[SIM] RAM partiellement initialisée depuis {path} + motifs de test")
        return ram
    # Sans savestate : motifs de test purs pour vérifier les boutons Bool/Int
    seed_test_pattern(ram)
    print("[SIM] Aucun savestate trouvé : RAM simulée avec motifs de test")
    return ram


def seed_test_pattern(ram):
    """Écrit des motifs de test dans la zone autotracking (0x2AC0..0x2EB3)
    et active la moitié des drapeaux 0xXX dans la zone drapeaux."""
    for a in range(0x2AC0, 0x2EB4):
        ram[a] = (a - 0x2AC0) & 0xFF
    ram[0x2B32] = 0x01          # isInGame() == true
    for a in (0x2C40, 0x2C41):
        ram[a] = 0xF3           # updateWall -> Active
    half = [f for f, *_ in FLAG_DEFS][: len(FLAG_DEFS) // 2]
    set_flags_in_ram(ram, half, on=True)


FLAG_DEFS = [
    # (flag hex, description, bit, valeur a ecrire dans l'octet de drapeau)
    (0x01, "Drapeau progres 01", 0x01, 0x01),
    (0x02, "Drapeau progres 02", 0x02, 0x02),
    (0x04, "Drapeau progres 04", 0x04, 0x04),
    (0x08, "Drapeau progres 08", 0x08, 0x08),
    (0x10, "Drapeau progres 10", 0x10, 0x10),
    (0x20, "Drapeau progres 20", 0x20, 0x20),
    (0x40, "Drapeau progres 40", 0x40, 0x40),
    (0x80, "Drapeau progres 80", 0x80, 0x80),
    (0x05, "Masque 05 (bits 0+2)", 0x05, 0x05),
    (0x0C, "Masque 0C (bits 2+3)", 0x0C, 0x0C),
    (0x11, "Valeur 11", 0xFF, 0x11),
    (0x15, "Valeur 15", 0xFF, 0x15),
    (0x2C, "Valeur 2C", 0xFF, 0x2C),
    (0x41, "Valeur 41", 0xFF, 0x41),
    (0x46, "Valeur 46", 0xFF, 0x46),
    (0x51, "Valeur 51", 0xFF, 0x51),
    (0x55, "Valeur 55", 0xFF, 0x55),
    (0x65, "Valeur 65", 0xFF, 0x65),
    (0x6A, "Valeur 6A", 0xFF, 0x6A),
    (0x6D, "Valeur 6D", 0xFF, 0x6D),
    (0x6E, "Valeur 6E", 0xFF, 0x6E),
    (0x6F, "Valeur 6F", 0xFF, 0x6F),
    (0x70, "Valeur 70", 0xFF, 0x70),
    (0x71, "Valeur 71", 0xFF, 0x71),
    (0x72, "Valeur 72", 0xFF, 0x72),
    (0x73, "Valeur 73", 0xFF, 0x73),
    (0x74, "Valeur 74", 0xFF, 0x74),
    (0x75, "Valeur 75", 0xFF, 0x75),
    (0x81, "Valeur 81", 0xFF, 0x81),
    (0x91, "Valeur 91", 0xFF, 0x91),
    (0xF2, "Valeur F2", 0xFF, 0xF2),
    (0xF3, "Valeur F3", 0xFF, 0xF3),
]
FLAG_BASE = 0x2002F00   # zone reservee de la RAM simulee pour les drapeaux
                        # (juste apres la zone autotracking 0x2AC0..0x2EB3)


def flag_slot(ram, flag):
    """Retourne (offset, bit, valeur) du slot RAM d'un drapeau 0xXX."""
    for f, _desc, bit, val in FLAG_DEFS:
        if f == flag:
            return ram_flag_offset(f), bit, val
    return None


def ram_flag_offset(flag):
    return FLAG_BASE + flag // 8


def set_flags_in_ram(ram, flags, on=True):
    """Applique une liste de drapeaux 0xXX dans la RAM partagee."""
    changed = []
    for f in flags:
        slot = flag_slot(ram, f)
        if slot is None:
            continue
        off, bit, val = slot
        if off >= len(ram):
            continue
        if bit == 0xFF:      # valeur complete ecrite dans l'octet
            ram[off] = val if on else 0x00
        elif on:
            ram[off] |= bit
        else:
            ram[off] &= ~bit & 0xFF
        changed.append(f)
    return changed


def read_flags_from_ram(ram):
    """Relit l'etat de tous les drapeaux depuis la RAM partagee."""
    out = {}
    for f, _desc, bit, _val in FLAG_DEFS:
        off = ram_flag_offset(f)
        if off < len(ram):
            out[f] = bool(ram[off] & bit) if bit != 0xFF else (ram[off] != 0)
    return out


class NWASimulatorHandler(socketserver.BaseRequestHandler):
    # Les clients NWA restent souvent silencieux entre deux memory watches.
    # Sans trafic, certains pare-feu/NAT/OS coupent la connexion TCP au bout
    # d'environ 2 minutes -> "[SIM] Client X déconnecté" toutes les 2 min.
    # D'où : SO_KEEPALIVE agressif + "heartbeat" applicatif (commentaire NWA).
    IDLE_TIMEOUT = 180.0   # fermeture propre si rien pendant 3 min (garde-fou)

    def setup(self):
        self.ram = self.server.ram
        self.buf = b""
        self.name = f"Client {self.server.client_id}"
        self.last_rx = time.monotonic()
        self.server.client_id += 1
        enable_tcp_keepalive(self.request)
        # Greeting non sollicité, identique au plugin Bizhawk-nwa-tool :
        # NWAServer.cs envoie "<nom_emulateur>\nnwa_version:1.0\n\n" dès la
        # connexion. EmoTracker/LuaConnector (et le client web de ce
        # simulateur) lisent ce greeting AVANT d'envoyer MY_NAME_IS ; sans
        # lui, leur premier read avale la réponse à MY_NAME_IS, le handshake
        # se décale et le client se déconnecte immédiatement.
        try:
            self.request.sendall(b"BizHawk-NWA-Simulator\nnwa_version:1.0\n\n")
        except OSError:
            pass
        print(f"[SIM] {self.name} connecté depuis {self.client_address[:2]}")

    # ------------------------------------------------- envois (protocole NWA)
    def send_error(self, kind, reason):
        try:
            self.request.sendall(f"\nerror:{kind}\nreason:{reason}\n\n".encode())
        except OSError:
            pass

    def send_hash_reply(self, pairs):
        out = ["\n"]
        for k, v in pairs:
            out.append(f"{k}:{v}\n")
        out.append("\n")
        try:
            self.request.sendall("".join(out).encode())
        except OSError:
            pass

    def send_ok(self):
        try:
            self.request.sendall(b"\n\n")
        except OSError:
            pass

    def send_data(self, payload: bytes):
        # format binaire du plugin : 0x00 + taille u32 BE + données
        try:
            self.request.sendall(b"\x00" + struct.pack(">I", len(payload)) + payload)
        except OSError:
            pass

    # ------------------------------------------------------- commandes NWA
    def handle(self):
        # Le greeting du plugin est envoyé dans setup() ; ici on boucle en
        # répondant aux commandes lues ligne à ligne.
        while True:
            idle = self.IDLE_TIMEOUT - (time.monotonic() - self.last_rx)
            if idle <= 0:
                print(f"[SIM] {self.name} inactif > {self.IDLE_TIMEOUT:.0f}s, "
                      "fermeture propre (le client se reconnectera seul)")
                break
            try:
                ready, _, _ = select.select([self.request], [], [], min(5.0, idle))
            except (OSError, ValueError):
                break
            if not ready:
                continue
            try:
                chunk = self.request.recv(4096)
            except OSError:
                break
            if not chunk:
                break
            self.last_rx = time.monotonic()
            self.buf += chunk
            while b"\n" in self.buf:
                line, self.buf = self.buf.split(b"\n", 1)
                if line.strip():
                    self.run_command(line.decode(errors="replace").strip())

    def run_command(self, line):
        parts = line.split(" ", 1)
        cmd = parts[0].upper()
        args = parts[1].split(";") if len(parts) > 1 else []
        self.name_from_line = cmd
        print(f"[SIM] {self.name} << {line}")
        if cmd == "MY_NAME_IS":
            if len(args) != 1 or not args[0]:
                return self.send_error("invalid_argument",
                                       "MY_NAME_IS accept one argument <name>")
            self.name = args[0]
            # Le plugin BizHawk (CommandHandler.myNameIs) ne répond RIEN ici ;
            # c'est EMULATOR_INFO qui renvoie le hash {"name": ...}. Une
            # réponse non sollicitée décale tous les reads du client
            # (NWClientLib attend la réponse à EMULATOR_INFO, pas à
            # MY_NAME_IS) -> handshake cassé -> déconnexion immédiate.
            return
        if cmd == "EMULATOR_INFO":
            # Format exact du plugin : name=BizHawk, id="Happy Skarsnik",
            # commands séparées par des VIRGULES (Enum NWACommand).
            return self.send_hash_reply([
                ("name", "BizHawk"),
                ("version", "2.9-sim"),
                ("id", "Happy Skarsnik"),
                ("nwa_version", "1.0"),
                ("commands", "EMULATOR_INFO,EMULATION_STATUS,CORES_LIST,"
                             "CORE_INFO,GAME_INFO,MY_NAME_IS,CORE_MEMORIES,"
                             "CORE_READ,bCORE_WRITE,LOAD_STATE,SAVE_STATE,"
                             "bLOAD_STATE_FROM_NETWORK,SAVE_STATE_TO_NETWORK,"
                             "LIST_BIZHAWK_DOMAINS,CORE_CURRENT_INFO"),
            ])
        if cmd == "EMULATION_STATUS":
            return self.send_hash_reply([("state", "running")])
        if cmd == "CORE_CURRENT_INFO":
            return self.send_hash_reply([
                ("name", "mGBA"), ("platform", "GBA"), ("author", "sim"),
            ])
        if cmd == "CORES_LIST":
            return self.send_hash_reply([("name", "mGBA"), ("platform", "GBA")])
        if cmd == "GAME_INFO":
            return self.send_hash_reply([
                ("name", "The Minish Cap (simulé)"),
                ("region", "FR"), ("hash", "0")])
        if cmd == "CORE_MEMORIES":
            # Liste de domaines au format BizHawk/mGBA GBA. La taille est en
            # DECIMAL : c'est le domaine complet 0x02000000-0x0203FFFF, donc
            # les adresses absolues GBA (0x0200AC0...) tombent dedans.
            return self._send_domain_list([
                ("EXECUTEMEMORY", "rw", RAM_SIZE),
                ("IWRAM", "rw", RAM_SIZE),
                ("SRAM", "rw", 0x10000),
                ("ROM", "r", 0x2000000),
                ("PALETTE", "rw", 0x400),
                ("OAM", "rw", 0x400),
                ("IO REGISTERS", "rw", 0x400),
            ])
        if cmd == "LIST_BIZHAWK_DOMAINS":
            return self._send_domain_list([
                ("Internal RAM", "rw", RAM_SIZE),
                ("Save Game RAM", "rw", 0x10000),
                ("ROM", "r", 0x2000000),
            ])
        if cmd == "CORE_READ":
            return self.core_read(args)
        if cmd == "BCORE_WRITE":
            return self.core_write(args)
        self.send_error("invalid_command", f"Unknow command : {cmd}")

    def _send_domain_list(self, domains):
        out = ["\n"]
        for name, access, size in domains:
            out.append(f"name:{name}\naccess:{access}\nsize:{size}\n")
        out.append("\n")
        try:
            self.request.sendall("".join(out).encode())
        except OSError:
            pass

    # CORE_READ DOMAIN;<offset>[;<size>;<offset2>;<size2>...]
    @staticmethod
    def _to_offset(v):
        """Adresses NWA relatives au domaine, mais les pack TMC/EmoTracker
        utilisent des adresses absolues GBA (0x0200AC0). On accepte les deux.
        Retourne l'offset dans la RAM simulée, ou None si hors domaine."""
        if v >= RAM_BASE:
            off = v - RAM_BASE
            return off if off < RAM_SIZE else None
        return v if v < RAM_SIZE else None

    def _parse_ranges(self, args):
        rest = args[1:] if len(args) > 1 else []
        vals = []
        for tok in rest:
            t = tok.strip()
            if not t:
                continue
            try:
                if t.lower().startswith("0x"):
                    vals.append(int(t, 16))
                elif t.startswith("$"):
                    vals.append(int(t[1:], 16))
                else:
                    vals.append(int(t))
            except ValueError:
                return None
        if not vals:
            return [(0, RAM_SIZE)]
        ranges = []
        i = 0
        while i < len(vals):
            off = self._to_offset(vals[i])
            if off is None or vals[i] < 0:
                return "out_of_bounds"
            if i + 1 < len(vals):
                size = vals[i + 1]
                i += 2
            else:
                size = RAM_SIZE - off
                i += 1
            size = max(0, min(size, RAM_SIZE - off))
            ranges.append((off, size))
        return ranges

    def core_read(self, args):
        domain = args[0].strip().upper() if args else ""
        if domain not in ("EXECUTEMEMORY", "EXECRAM", "IWRAM", "SYSTEM BUS",
                          "INTERNAL RAM", "MAIN MEMORY", "MEMORY"):
            return self.send_error("command_error",
                                   "The specified domain <" + domain + "> does not exists")
        ranges = self._parse_ranges(args)
        if ranges is None:
            return self.send_error("invalid_argument", "Bad number/offset")
        if ranges == "out_of_bounds":
            return self.send_error("invalid_argument",
                                   "Offset is out of bound for the domain")
        payload = b"".join(bytes(self.ram[o:o + s]) for o, s in ranges)
        return self.send_data(payload)

    def core_write(self, args):
        domain = args[0].strip().upper() if args else ""
        if domain not in ("EXECUTEMEMORY", "EXECRAM", "IWRAM", "SYSTEM BUS"):
            return self.send_error("command_error", "Unknown domain")
        ranges = self._parse_ranges(args)
        if ranges is None or ranges == "out_of_bounds":
            return self.send_error("invalid_argument", "Bad offset/size")
        total = sum(s for _, s in ranges)
        header = self._recv_exact(5)
        if header is None or header[0] != 0:
            return self.send_error("protocol_error", "Expected binary block")
        (size,) = struct.unpack(">I", header[1:5])
        if total > 0 and size != total:
            return self.send_error("protocol_error",
                                   f"Expecting a binary block of size {total} received a size of {size}")
        data = self._recv_exact(size)
        if data is None:
            return self.send_error("protocol_error", "Connection closed mid-write")
        pos = 0
        for off, s in ranges:
            self.ram[off:off + s] = data[pos:pos + s]
            pos += s
        return self.send_ok()

    def _recv_exact(self, n):
        buf = b""
        while len(buf) < n:
            try:
                chunk = self.request.recv(n - len(buf))
            except OSError:
                return None
            if not chunk:
                return None
            buf += chunk
        return buf

    def finish(self):
        print(f"[SIM] {self.name} déconnecté")


class Server(socketserver.ThreadingTCPServer):
    allow_reuse_address = True
    daemon_threads = True


# ---------------------------------------------------------------------------
# Interface web de test (autotracking) : sert tools/web/ + API JSON sur le
# même processus que le serveur NWA simulé.
#   GET  /                 -> page HTML
#   GET  /api/state        -> état complet des boutons Bool/Int + RAM modifiée
#   POST /api/action       -> {"id":..., "action":"toggle|inc|dec|set|type"}
#   POST /api/connect      -> connecte un vrai client EmoTracker (localhost:49135)
#   POST /api/disconnect
#   POST /api/seed         -> motifs de test dans la RAM
#   POST /api/reset
# ---------------------------------------------------------------------------
try:
    from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
except ImportError:  # Python < 3.7
    from http.server import BaseHTTPRequestHandler
    from socketserver import ThreadingMixIn

    class ThreadingHTTPServer(ThreadingMixIn, socketserver.TCPServer):
        allow_reuse_address = True


WEB_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "web")


def build_buttons_from_autotracking(src_path):
    """Extrait les 0xXXXXXXX et 0xXX d'autotracking.lua -> boutons Bool/Int."""
    with open(src_path, encoding="utf-8", errors="replace") as fh:
        src = fh.read()
    tokens = re.findall(r"0x[0-9a-fA-F]{1,7}\b", src)
    addrs = sorted({int(t, 16) for t in tokens if int(t, 16) >= 0x20000})
    flags = sorted({int(t, 16) for t in tokens if int(t, 16) < 0x20000})
    lines = src.splitlines()

    def first_line(lit):
        for l in lines:
            if re.search(r"\b" + re.escape(lit) + r"\b", l, re.I):
                return l.strip()[:120]
        return ""

    buttons = []
    for a in addrs:
        buttons.append({"id": f"addr-{a:x}", "kind": "address",
                        "hex": f"0x{a:07X}", "value": a,
                        "context": first_line(f"0x{a:07x}"),
                        "type": "Bool", "on": False, "count": 0})
    for f in flags:
        buttons.append({"id": f"flag-{f:02x}", "kind": "flag",
                        "hex": f"0x{f:02X}", "value": f,
                        "context": first_line(f"0x{f:02x}"),
                        "type": "Bool", "on": False, "count": 0})
    return buttons


class WebState:
    def __init__(self, sim_server):
        self.sim = sim_server          # serveur NWA (attribut .ram partagé)
        self.buttons = {}              # id -> dict(type Bool|Int, on, count)
        self.order = []
        self.clients = []              # clients EmoTracker connectés via le web
        self.logs = []
        self.connected = False
        self.port = 0xBEEF

    def add_button(self, b):
        if b["id"] not in self.buttons:
            self.order.append(b["id"])
        b["manual"] = True             # mis à jour par clic web ou par la RAM
        self.buttons[b["id"]] = b

    def log(self, msg):
        self.logs.append(msg)
        del self.logs[:-200]
        print(f"[WEB] {msg}")

    def full_state(self):
        ram = self.sim.ram if self.sim else None
        out = {
            "connected": self.connected,
            "port": self.port,
            "clients": [f"{c.ip}:{c.port}" for c in self.clients],
            "counts": {
                "addresses": sum(1 for b in self.buttons.values() if b["kind"] == "address"),
                "flags": sum(1 for b in self.buttons.values() if b["kind"] == "flag"),
            },
            "flag_defs": [{"hex": f"0x{f:02X}", "desc": d,
                           "bit": f"0x{b:02X}"} for f, d, b, _v in FLAG_DEFS],
            "flag_ram_base": f"0x{FLAG_BASE:07X}",
            "buttons": [],
            "log": self.logs[-60:],
        }
        for bid in self.order:
            b = self.buttons[bid]
            entry = dict(b)
            if b["kind"] == "address" and ram is not None:
                off = b["value"] - 0x2000000
                if 0 <= off < len(ram):
                    entry["ram"] = ram[off]
            out["buttons"].append(entry)
        return out


class WebHandler(BaseHTTPRequestHandler):
    state = None      # injecté par main()
    protocol_version = "HTTP/1.1"

    def log_message(self, fmt, *args):
        pass  # silence sur les requêtes statiques

    def _send(self, code, ctype, body):
        self.send_response(code)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(body)))
        self.send_header("Cache-Control", "no-store")
        self.end_headers()
        self.wfile.write(body)

    def _json(self, obj, code=200):
        self._send(code, "application/json; charset=utf-8",
                   json.dumps(obj).encode())

    def do_GET(self):
        st = WebHandler.state
        path = self.path.split("?")[0]
        if path == "/api/state":
            return self._json(st.full_state())
        if path in ("/", "/index.html"):
            path = "/index.html"
        fp = os.path.normpath(os.path.join(WEB_DIR, path.lstrip("/")))
        if not fp.startswith(WEB_DIR) or not os.path.isfile(fp):
            return self._send(404, "text/plain", b"Not found")
        ctype = ("text/html; charset=utf-8" if fp.endswith(".html")
                 else "application/javascript" if fp.endswith(".js")
                 else "application/json" if fp.endswith(".json")
                 else "text/css")
        with open(fp, "rb") as fh:
            return self._send(200, ctype, fh.read())

    def do_POST(self):
        st = WebHandler.state
        n = int(self.headers.get("Content-Length", 0) or 0)
        raw = self.rfile.read(n) if n else b"{}"
        try:
            req = json.loads(raw.decode() or "{}")
        except ValueError:
            return self._json({"error": "JSON invalide"}, 400)
        path = self.path.split("?")[0]

        if path == "/api/action":
            b = st.buttons.get(req.get("id"))
            if b is None:
                return self._json({"error": "bouton inconnu"}, 404)
            act = req.get("action")
            if act == "toggle":
                b["on"] = not b["on"]
            elif act == "inc":
                b["count"] = (b["count"] + 1) & 0xFF
            elif act == "dec":
                b["count"] = (b["count"] - 1) & 0xFF
            elif act == "set":
                b["count"] = int(req.get("value", 0)) & 0xFF
            elif act == "type":
                b["type"] = "Int" if b["type"] == "Bool" else "Bool"
            else:
                return self._json({"error": f"action '{act}' inconnue"}, 400)
            # miroir dans la RAM simulée quand le bouton est actif
            if b["kind"] == "address":
                off = b["value"] - 0x2000000
                if 0 <= off < len(st.sim.ram):
                    val = (1 if b["on"] else 0) if b["type"] == "Bool" else b["count"]
                    st.sim.ram[off] = val & 0xFF
            elif b["kind"] == "flag":
                # un clic sur un bouton FLAG ecrit le drapeau dans la RAM ->
                # visible par EmoTracker (memory watch) comme un vrai flag jeu
                active = (not b["on"]) if b["type"] == "Bool" else (b["count"] != 0)
                if b["type"] == "Bool":
                    b["on"] = active
                set_flags_in_ram(st.sim.ram, [b["value"]], on=active)
            return self._json({"ok": True, "button": b})

        if path == "/api/flags":
            # envoi massif de drapeaux vers EmoTracker via la RAM simulee.
            # req = {"flags": [1, 5, 0x6A, "0xF3", ...], "on": true|false}
            flags = req.get("flags") or [f for f, *_ in FLAG_DEFS]
            parsed = []
            for f in flags:
                try:
                    parsed.append(int(f, 16) if isinstance(f, str) else int(f))
                except (ValueError, TypeError):
                    continue
            on = bool(req.get("on", True))
            changed = set_flags_in_ram(st.sim.ram, parsed, on=on)
            for f in changed:
                b = st.buttons.get(f"flag-{f:02x}")
                if b:
                    b["on"] = on
                    b["count"] = 1 if on else 0
            st.log(f"Envoi de {len(changed)} drapeaux {'ACTIVÉS' if on else 'DÉSACTIVÉS'} "
                   f"-> RAM (EmoTracker les lira au prochain watch)")
            return self._json({"ok": True, "sent": [f"0x{f:02X}" for f in changed]})

        if path == "/api/reset":
            for b in st.buttons.values():
                b["on"] = False
                b["count"] = 0
            st.log("Réinitialisation de tous les boutons")
            return self._json({"ok": True})

        if path == "/api/seed":
            seed_test_pattern(st.sim.ram)
            st.log("Motifs de test écrits dans la RAM simulée")
            return self._json({"ok": True})

        if path == "/api/connect":
            return self._json(st.connect_nwa(int(req.get("port", st.port) or 0xBEEF)))

        if path == "/api/disconnect":
            return self._json(st.disconnect_nwa())

        return self._json({"error": "route inconnue"}, 404)

    # -------------------------------------------------- pont web -> client NWA
    # (méthodes du state, définies ci-dessous sur WebState)


def _client_read_reply(sock, timeout=1.0):
    """Lit une réponse NWA : hash texte, OK '\\n\\n', erreur, ou bloc binaire."""
    sock.settimeout(timeout)
    buf = b""
    try:
        while True:
            chunk = sock.recv(4096)
            if not chunk:
                return "closed", buf
            buf += chunk
            if buf.startswith(b"\x00") and len(buf) >= 5:
                size = struct.unpack(">I", buf[1:5])[0]
                if len(buf) >= 5 + size:
                    return "OK", buf[5:5 + size]
            elif buf.endswith(b"\n\n"):
                return "OK", buf[:-2]
    except (socket.timeout, TimeoutError):
        return "timeout", buf
    except OSError:
        return "closed", buf


class NwaClient:
    """Client NWA minimal : lit la RAM d'un serveur Bizhawk-nwa-tool (ou du
    simulateur local) et applique la logique autotracking aux boutons web."""

    def __init__(self, ip, port, state):
        self.ip, self.port, self.state = ip, port, state
        self.sock = socket.create_connection((ip, port), timeout=2)
        enable_tcp_keepalive(self.sock)
        self.name = "AT-WEB-TESTER"
        self.buf = b""
        self.last_rx = time.monotonic()
        # salutation non sollicitée du serveur NWA (comme le plugin BizHawk)
        greet_status, greet = self._read()
        if greet_status != "OK":
            raise ConnectionError(f"greeting NWA invalide : {greet!r}")
        self._cmd(f"MY_NAME_IS {self.name}")  # pas de réponse à cette commande
        info = self._cmd("EMULATOR_INFO")
        self.state.log(f"Connecté (NWA) à {info.get('name','?')} {info.get('version','?')}")

    def _send(self, line):
        self.sock.sendall((line + "\n").encode())

    def _read(self):
        """Lit une réponse complète. Le plugin n'envoie RIEN en réponse à
        MY_NAME_IS : on sort sur la première donnée reçue (fin de hash
        '\\n\\n', bloc binaire complet, ou erreur)."""
        while True:
            if self.buf.startswith(b"\x00") and len(self.buf) >= 5:
                size = struct.unpack(">I", self.buf[1:5])[0]
                if len(self.buf) >= 5 + size:
                    payload, self.buf = self.buf[5:5 + size], self.buf[5 + size:]
                    return "OK", payload
            idx = self.buf.find(b"\n\n")
            if idx != -1:
                payload, self.buf = self.buf[:idx], self.buf[idx + 2:]
                if payload.startswith(b"error:"):
                    return "ERR", payload
                pairs = {}
                for l in payload.split(b"\n"):
                    if b":" in l:
                        k, v = l.split(b":", 1)
                        pairs[k.decode()] = v.decode()
                return "OK", pairs
            chunk = self.sock.recv(4096)
            if not chunk:
                raise ConnectionError("connexion NWA fermée")
            self.last_rx = time.monotonic()
            self.buf += chunk

    def ping_if_stale(self, max_age=30.0):
        """Heartbeat applicatif : si aucun échange depuis max_age secondes,
        envoie EMULATION_STATUS pour garder la connexion vivante (les pare-feu
        et certains OS coupent les connexions TCP silencieuses au bout de
        ~2 minutes). Lève ConnectionError si le serveur ne répond plus."""
        if time.monotonic() - self.last_rx < max_age:
            return
        old = self.sock.gettimeout()
        self.sock.settimeout(2.0)
        try:
            self._send("EMULATION_STATUS")
            status, payload = self._read()
            if status == "ERR":
                raise ConnectionError(f"serveur NWA en erreur : {payload!r}")
            # vide éventuellement le buffer : on est resynchronisé
        finally:
            try:
                self.sock.settimeout(old)
            except OSError:
                pass

    def _cmd(self, line):
        """Envoie une commande et lit la réponse. Exception : MY_NAME_IS ne
        reçoit JAMAIS de réponse du plugin BizHawk (NWAServer attend la
        réponse de la commande suivante) -> on n'attend rien ici."""
        self._send(line)
        if line.upper().startswith("MY_NAME_IS"):
            return {}
        status, payload = self._read()
        if status != "OK":
            raise RuntimeError(f"NWA: {payload!r}")
        return payload

    def read_bytes(self, offset, size):
        data = self._cmd(f"CORE_READ EXECUTEMEMORY;0x{offset:x};{size}")
        return data if isinstance(data, bytes) else b""

    def close(self):
        try:
            self.sock.close()
        except OSError:
            pass


def apply_watch_to_buttons(client, state):
    """Memory watch : lit la RAM via NWA et met à jour les boutons.

    - adresses 0xXXXXXXX : zone utilisée (0x2002AC0..0x2002EB2) lue en UNE
      seule commande CORE_READ ;
    - flags 0xXX : zone drapeaux (0x2002F00..) lue en une seule commande."""
    lo, hi = 0x2002AC0, 0x2002EB3
    flag_lo, flag_hi = FLAG_BASE, FLAG_BASE + 0x40
    try:
        block = client.read_bytes(lo - 0x2000000, hi - lo)
        fblock = client.read_bytes(flag_lo - 0x2000000, flag_hi - flag_lo)
    except Exception:
        return
    if not isinstance(block, bytes) or len(block) < (hi - lo):
        block = b""
    for bid in list(state.order):
        b = state.buttons[bid]
        if b["kind"] == "address" and block:
            off = b["value"] - lo
            if 0 <= off < len(block):
                v = block[off]
                b["ram"] = v
                if b["type"] == "Bool":
                    b["on"] = v != 0
                else:
                    b["count"] = v
        elif b["kind"] == "flag" and isinstance(fblock, bytes) and fblock:
            slot = flag_slot(None, b["value"])
            if slot:
                off, bit, _val = slot
                i = off - flag_lo
                if 0 <= i < len(fblock):
                    byte = fblock[i]
                    b["ram"] = byte
                    on = bool(byte & bit) if bit != 0xFF else (byte != 0)
                    b["on"] = on
                    b["count"] = 1 if on else 0


def poll_loop(state, interval=0.5):
    """Memory watch web : lit la RAM via NWA + heartbeat (ping_if_stale)."""
    while state.connected:
        c = next((cl for cl in state.clients if getattr(cl, "_is_poller", False)), None)
        if c is None:
            break
        try:
            apply_watch_to_buttons(c, state)
            c.ping_if_stale(max_age=30.0)
        except Exception as exc:  # déconnexion réseau
            state.log(f"Polling interrompu : {exc}")
            state.disconnect_nwa()
            break
        time.sleep(interval)


def connect_impl(state, port):
    if state.connected:
        return {"ok": True, "already": True}
    try:
        client = NwaClient("127.0.0.1", port, state)
    except OSError as exc:
        state.log(f"Échec connexion NWA port {port} : {exc}")
        return {"error": f"Connexion impossible : {exc} (lancez le simulateur ou BizHawk+NWA)"}
    client._is_poller = True
    state.clients.append(client)
    state.connected = True
    state.port = port
    threading.Thread(target=poll_loop, args=(state,), daemon=True).start()
    return {"ok": True, "port": port}


def disconnect_impl(state):
    for c in state.clients:
        c.close()
    state.clients.clear()
    state.connected = False
    state.log("Déconnecté du serveur NWA")
    return {"ok": True}


WebState.connect_nwa = lambda self, port=0xBEEF: connect_impl(self, port)
WebState.disconnect_nwa = lambda self: disconnect_impl(self)


def main():
    port = int(sys.argv[1], 0) if len(sys.argv) > 1 else 0xBEEF
    web_port = int(sys.argv[2], 0) if len(sys.argv) > 2 else 8090

    handler = Server(("127.0.0.1", port), NWASimulatorHandler)
    handler.ram = load_fake_ram()
    handler.client_id = 0

    state = WebState(handler)
    at_lua = os.path.join(os.path.dirname(os.path.dirname(WEB_DIR)),
                          "emo", "scripts", "autotracking", "autotracking.lua")
    at_lua = os.path.normpath(at_lua)
    for b in build_buttons_from_autotracking(at_lua):
        state.add_button(b)
    state.log(f"{len(state.buttons)} boutons générés depuis autotracking.lua")
    WebHandler.state = state

    webd = ThreadingHTTPServer(("0.0.0.0", web_port), WebHandler)
    webd.daemon_threads = True

    threading_mod = __import__("threading")
    threading_mod.Thread(target=webd.serve_forever, daemon=True).start()
    print(f"[WEB] Interface de test : http://127.0.0.1:{web_port}/")
    print(f"[SIM] Serveur NWA simulé (Bizhawk-nwa-tool) sur 127.0.0.1:{port}")
    print("[SIM] Ctrl+C pour arrêter.")
    try:
        handler.serve_forever()
    except KeyboardInterrupt:
        print("\n[SIM] Arrêt.")


if __name__ == "__main__":
    main()
