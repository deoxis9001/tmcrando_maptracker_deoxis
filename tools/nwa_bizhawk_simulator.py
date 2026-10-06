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
    et active la moitié des flags du Google Sheet à leur adresse réelle."""
    for a in range(0x2AC0, 0x2EB4):
        ram[a] = (a - 0x2AC0) & 0xFF
    ram[0x2B32] = 0x01          # isInGame() == true
    for a in (0x2C40, 0x2C41):
        ram[a] = 0xF3           # updateWall -> Active
    half = list(range(len(FLAG_DEFS) // 2))
    set_sheet_flags(ram, half, on=True)


# FLAG_DEFS : chargées au démarrage depuis tools/flags.json (sortie de
# parse_flags_csv.py sur le CSV du Google Sheet). Chaque entrée :
#   {"addr": 33565376, "hex": "0x2002AC0", "flag": "0x01", "context": "gravekey"}
# -> tuple (addr_absolue, masque_bit, description).
# Fallback : si flags.json est absent, on utilise les bits 0x01..0x80 par
# adresse pour que le simulateur reste fonctionnel.

def load_flag_defs():
    here = os.path.dirname(os.path.abspath(__file__))
    # ordre de recherche : --flags /nwa_flags.json (genere par
    # send_flags_to_emotracker.py) puis flags.json (sortie parse_flags_csv.py)
    for path in (os.path.join(here, "nwa_flags.json"),
                 os.path.join(here, "flags.json")):
        try:
            with open(path, encoding="utf-8") as fh:
                data = json.load(fh)
        except (OSError, ValueError):
            continue
        entries = data.get("flags", data) if isinstance(data, dict) else data
        defs = []
        for e in entries:
            addr = int(e.get("addr"), 0)
            mask = int(e.get("flag", e.get("mask", 1)), 0) & 0xFF
            desc = f'{e.get("context", "")} {e.get("name", "")}'.strip() or \
                   f"flag {mask:02X}@{addr - RAM_BASE:04X}"
            defs.append((addr, mask, desc))
        print(f"[SIM] FLAG_DEFS : {len(defs)} flags chargés depuis {path}")
        return defs
    print("[SIM] FLAG_DEFS : aucun flags.json trouvé, "
          "fallback bits 0x01..0x80 par adresse (zones 2A80..2ADF)")
    defs = []
    for off in range(0x2A80, 0x2AE0):          # zones flags TMC connues
        for bit in (0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80):
            defs.append((RAM_BASE + off, bit, f"bit {bit:02X}@0x{off:04X}"))
    return defs


FLAG_DEFS = load_flag_defs()

# Table des valeurs 0xXX "entières" écrites dans la zone réservee FLAG_BASE
# (utilisée par send_flags_to_emotracker.py pour les tests autotracking qui
# comparent un octet à une valeur, ex : progression 0x6A, murs 0xF3...).
VALUE_DEFS = [
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
FLAG_BASE = 0x2002F00   # zone reservee de la RAM simulee pour les VALEURS
                        # testees par send_flags_to_emotracker.py (0xXX "entiers")


def value_slot(flag):
    """Retourne (offset, bit, valeur) du slot RAM d'une valeur testee 0xXX."""
    for f, _desc, bit, val in VALUE_DEFS:
        if f == flag:
            return ram_flag_offset(f), bit, val
    return None


def ram_flag_offset(flag):
    return FLAG_BASE + flag // 8


def set_flags_in_ram(ram, flags, on=True):
    """Applique une liste de valeurs 0xXX dans la zone FLAG_BASE."""
    changed = []
    for f in flags:
        slot = value_slot(f)
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
    """Relit l'etat des valeurs testees depuis la zone FLAG_BASE."""
    out = {}
    for f, _desc, bit, _val in VALUE_DEFS:
        off = ram_flag_offset(f)
        if off < len(ram):
            out[f] = bool(ram[off] & bit) if bit != 0xFF else (ram[off] != 0)
    return out


# ---------------------------------------------------------------------------
# VRAIS FLAGS du CSV Google Sheet : chaque entree FLAG_DEFS est un BIT a
# poser/casser a son ADRESSE REELLE en RAM (ex : addr 0x2002AC0, flag 0x01).
# C'est exactement ce que lit EmoTracker via ses memory watches NWA ->
# autotracking direct, sans zone intermediaire.
# ---------------------------------------------------------------------------

def _flag_to_offs(entry):
    """(addr_absolue, masque, desc) -> (offset_relatif, masque) ou None."""
    try:
        addr = int(entry[0], 0)
        mask = int(entry[1], 0) & 0xFF
    except (TypeError, ValueError):
        return None
    off = addr - RAM_BASE
    if 0 <= off < RAM_SIZE and mask:
        return (off, mask)
    return None


def set_sheet_flags(ram, flags, on=True):
    """flags = indices dans FLAG_DEFS ou tuples (addr, masque, desc).

    Ecrit le bit `masque` a l'adresse reelle dans la RAM partagee.
    Retourne la liste des entrees appliquees.
    """
    applied = []
    for f in flags:
        entry = FLAG_DEFS[f] if isinstance(f, int) and 0 <= f < len(FLAG_DEFS) else f
        pair = _flag_to_offs(entry)
        if pair is None:
            continue
        off, mask = pair
        if on:
            ram[off] |= mask
        else:
            ram[off] &= ~mask & 0xFF
        applied.append(entry)
    return applied


def clear_all_flags(ram):
    """Remet toute la RAM a zero (desactive tous les flags/adresses)."""
    for i in range(len(ram)):
        ram[i] = 0


def read_sheet_flags(ram):
    """Etat courant de chaque flag du sheet : True si le bit est pose."""
    out = []
    for addr, mask, desc in FLAG_DEFS:
        state = False
        pair = _flag_to_offs((addr, mask))
        if pair is not None:
            off, m = pair
            state = bool(ram[off] & m)
        out.append({"addr": addr, "hex": f"0x{addr:07X}", "flag": f"0x{mask:02X}",
                    "context": desc, "on": state})
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
            # Tant que le buffer commence par une ligne texte, on l'exécute.
            # Si run_command attend un bloc binaire (bCORE_WRITE), elle le
            # lit directement sur la socket via _recv_exact ; à son retour,
            # self.buf peut commencer par 0x00 (bloc restant) -> on sort de
            # la boucle texte et on laisse les prochains recv alimenter
            # _recv_exact (qui lit self.buf en priorité).
            while self.buf[:1] != b"\x00":
                idx = self.buf.find(b"\n")
                if idx == -1:
                    break
                line, self.buf = self.buf[:idx], self.buf[idx + 1:]
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
            # La liste doit contenir TOUTES les commandes qu'EmoTracker peut
            # envoyer (NWConnector.lua / NwaDevice.cs), sinon il considère le
            # serveur comme incompatible -> déconnexion.
            return self.send_hash_reply([
                ("name", "BizHawk"),
                ("version", "2.9-sim"),
                ("id", "Happy Skarsnik"),
                ("nwa_version", "1.0"),
                ("commands", "EMULATOR_INFO,EMULATION_STATUS,CORES_LIST,"
                             "CORE_INFO,GAME_INFO,MY_NAME_IS,CORE_MEMORIES,"
                             "CORE_READ,bCORE_WRITE,LOAD_STATE,SAVE_STATE,"
                             "bLOAD_STATE_FROM_NETWORK,SAVE_STATE_TO_NETWORK,"
                             "LIST_BIZHAWK_DOMAINS,CORE_CURRENT_INFO,"
                             "SOFT_RESET,HARD_RESET,PRESS_BUTTON,"
                             "GET_LUA_OBJECTS,DO_SCRIPT,LUA_CALL_FUNCTION,"
                             "LUA_GET_GLOBAL,LUA_SET_GLOBAL,LUA_RUN_SNIPPET,"
                             "POPUP_MESSAGE,SET_POPUP_TITLE,SET_PAUSE_SYNC"),
            ])
        if cmd == "EMULATION_STATUS":
            # EmoTracker (ProbeAsync + détection de changement de jeu) lit
            # "game" dans EMULATION_STATUS ; sans cette clé il ne voit aucun
            # jeu chargé et peut rejeter/fermer la connexion.
            return self.send_hash_reply([("state", "running"),
                                         ("game", "The Minish Cap (simulé)")])
        if cmd == "CORE_CURRENT_INFO":
            # "game" est requis : NwaDevice.HasCoreOrGameChangedAsync compare
            # le nom du jeu à chaque erreur de lecture. Sans clé "game", la
            # valeur stockée (null) diffère de la nouvelle réponse (""), le
            # changement est détecté -> reconnexion en boucle -> déconnections
            # répétées juste après CORE_MEMORIES.
            return self.send_hash_reply([
                ("name", "mGBA"), ( "platform", "GBA"), ("author", "sim"),
                ("game", "The Minish Cap (simulé)"),
            ])
        if cmd == "CORES_LIST":
            return self.send_hash_reply([("name", "mGBA"), ("platform", "GBA")])
        if cmd == "GAME_INFO":
            return self.send_hash_reply([
                ("name", "The Minish Cap (simulé)"),
                ("region", "FR"), ("hash", "0")])
        if cmd == "CORE_MEMORIES":
            # Le premier domaine DOIT s'appeler "System Bus" : EmoTracker
            # (NwaDevice.InitializeAddressMapAsync) l'exige et échoue à la
            # connexion sinon -> déconnexion juste après CORE_MEMORIES.
            # C'est aussi le nom du domaine System Bus dans BizHawk.
            # Taille en DECIMAL = domaine complet 0x02000000-0x0203FFFF :
            # DefaultAddressMap mappe les adresses absolues GBA (0x0200xxxx)
            # directement dedans, sans translation.
            return self._send_domain_list([
                ("System Bus", "rw", RAM_SIZE),
                ("IWRAM", "rw", RAM_SIZE),
                ("EWRAM", "rw", 0x40000),
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
        # Commandes connues du plugin que le simulateur ne sait pas exécuter.
        # Il faut répondre quelque chose (sinon le client attend, timeout,
        # puis se déconnecte). ACK vide = succès silencieux.
        known_noop = ("CORE_INFO", "LOAD_STATE", "SAVE_STATE",
                      "bLOAD_STATE_FROM_NETWORK", "SAVE_STATE_TO_NETWORK",
                      "SOFT_RESET", "HARD_RESET", "PRESS_BUTTON",
                      "GET_LUA_OBJECTS", "DO_SCRIPT", "LUA_CALL_FUNCTION",
                      "LUA_GET_GLOBAL", "LUA_SET_GLOBAL", "LUA_RUN_SNIPPET",
                      "POPUP_MESSAGE", "SET_POPUP_TITLE", "SET_PAUSE_SYNC")
        if cmd in known_noop:
            print(f"[SIM] {self.name} : {cmd} non simulé -> ACK vide")
            return self.send_ok()
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
        # "System Bus" est le domaine qu'EmoTracker utilise (DefaultAddressMap
        # GBA n'est pas nécessaire : il mappe les adresses absolues 0x02xxxxxx
        # directement dedans). Les autres noms restent acceptés.
        if domain not in ("SYSTEM BUS", "EXECUTEMEMORY", "EXECRAM", "IWRAM",
                          "EWRAM", "INTERNAL RAM", "MAIN MEMORY", "MEMORY"):
            return self.send_error("command_error",
                                   "The specified domain <" + args[0] + "> does not exists")
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
        if domain not in ("SYSTEM BUS", "EXECUTEMEMORY", "EXECRAM", "IWRAM",
                          "EWRAM"):
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
                "sheet_flags": len(FLAG_DEFS),
            },
            # flags du Google Sheet (CSV -> parse_flags_csv.py -> flags.json)
            # avec leur etat REEL lu dans la RAM partagee : le web peut donc
            # afficher/cocher les vrais flags (addr + bit), pas seulement les
            # boutons autotracking.
            "sheet_flags": read_sheet_flags(ram) if ram is not None else [],
            "flag_defs": [{"hex": f"0x{f:02X}", "desc": d,
                           "bit": f"0x{b:02X}"} for f, d, b, _v in VALUE_DEFS],
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
            # envoi massif de FLAGS DU SHEET vers EmoTracker via la RAM simulee.
            # req = {"flags": [...], "on": true|false, "addr": "0x2002A81",
            #        "mask": "0x80"}
            # Deux modes :
            #  A) flags = ["0xADDR:0xMASK" | {addr, flag} | index FLAG_DEFS]
            #     -> chaque entree est ecrite a SON adresse reelle ;
            #  B) addr + mask (ou flags=["0x80"]) -> un seul octet `addr` avec
            #     le(s) bit(s) `mask` pose(s)/casse(s) — comportement "tout c'est
            #     2A81 = 0x80" du CSV Google Sheet.
            # Sans "flags" et sans "addr" : TOUS les flags du sheet.
            raw = req.get("flags")
            on = bool(req.get("on", True))
            entries = []
            if raw is None and req.get("addr") is not None:
                # mode B : une adresse + un/des masque(s) -> "2A81 = 0x80"
                masks = req.get("mask", req.get("flag", "0xFF"))
                if not isinstance(masks, list):
                    masks = [masks]
                try:
                    base_addr = int(str(req["addr"]), 0)
                except (ValueError, TypeError):
                    return self._json({"error": f"addr invalide : {req['addr']}"}, 400)
                for m in masks:
                    try:
                        entries.append((base_addr, int(str(m), 0) & 0xFF, ""))
                    except (ValueError, TypeError):
                        continue
            elif raw is None:
                entries = list(range(len(FLAG_DEFS)))
            else:
                for f in raw:
                    if isinstance(f, dict):
                        entries.append((int(str(f.get("addr")), 0),
                                        int(str(f.get("flag", "1")), 0), ""))
                    elif isinstance(f, str) and ":" in f:
                        a, m = f.split(":", 1)
                        entries.append((int(a, 0), int(m, 0), ""))
                    else:
                        try:
                            v = int(f, 0) if isinstance(f, str) else int(f)
                        except (ValueError, TypeError):
                            continue
                        if 0 <= v < len(FLAG_DEFS):
                            entries.append(v)
                        else:      # on dirait une adresse absolue -> bit 0x01
                            entries.append((v, 0x01, ""))
            changed = set_sheet_flags(st.sim.ram, entries, on=on)
            for entry in changed:
                addr, mask, _d = entry
                b = st.buttons.get(f"addr-{addr:x}")
                if b:
                    b["on"] = on or bool(b["on"])
            st.log(f"Envoi de {len(changed)} flags du sheet "
                   f"{'ACTIVÉS' if on else 'DÉSACTIVÉS'} à leur adresse réelle "
                   f"-> RAM (EmoTracker les lira au prochain watch)")
            return self._json({"ok": True,
                               "sent": [{"addr": f"0x{a:07X}", "flag": f"0x{m:02X}"}
                                        for a, m, _d in changed]})

        if path == "/api/sheet_flags":
            # requete equivalente pour send_flags_to_emotracker.py --sheet :
            # req = {"sheet": [{addr, flag, context}, ...], "on": true|false}
            sheet = req.get("sheet") or []
            entries = []
            for e in sheet:
                try:
                    entries.append((int(str(e.get("addr")), 0),
                                    int(str(e.get("flag", "1")), 0),
                                    str(e.get("context", ""))))
                except (ValueError, TypeError, AttributeError):
                    continue
            on = bool(req.get("on", True))
            changed = set_sheet_flags(st.sim.ram, entries, on=on)
            st.log(f"Sheet : {len(changed)}/{len(entries)} flags "
                   f"{'ACTIVÉS' if on else 'DÉSACTIVÉS'} dans la RAM")
            return self._json({"ok": True, "applied": len(changed)})

        if path == "/api/reset":
            for b in st.buttons.values():
                b["on"] = False
                b["count"] = 0
            clear_all_flags(st.sim.ram)
            seed_test_pattern(st.sim.ram)
            st.log("Réinitialisation : boutons OFF, RAM remise aux motifs de test")
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
        # "System Bus" = domaine préféré d'EmoTracker (DefaultAddressMap) ;
        # le simulateur accepte les deux noms.
        data = self._cmd(f"CORE_READ System Bus;0x{offset:x};{size}")
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
            slot = value_slot(b["value"])
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
