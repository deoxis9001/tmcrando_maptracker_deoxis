-- Simulation d'un serveur Bizhawk-nwa-tool (https://github.com/Skarsnik/Bizhawk-nwa-tool)
-- pour tester l'interface d'autotracking SANS BizHawk ni console :
--   * même protocole TCP/NWA que le plugin (commandes texte \n ; erreurs "\nerror:...\n\n" ;
--     réponses hash "\nkey:value\n\n" ; données mémoire : octet 0 + taille u32 BE + bytes)
--   * port par défaut identique au plugin : 0xBEEF (49135)
--   * RAM GBA simulée : 256 Ko (EXECRAM), initialisée avec un savestate TMC
--     ("save.emo", "TMC-*.ss", "TMC-*.emuSave"... ou premier fichier .ss/.sav trouvé)
--   * écriture possible via bCORE_WRITE (pour fabriquer des états de test)
-- Usage :  python3 tools/nwa_bizhawk_simulator.py [port]

import os
import re
import socketserver
import struct
import sys

RAM_SIZE = 0x40000  # EXECRAM GBA : 256 Ko


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
    for a in range(0x2AC0, 0x2EB4):
        ram[a] = (a - 0x2AC0) & 0xFF
    ram[0x2B32] = 0x01          # isInGame() == true
    for a in (0x2C40, 0x2C41):
        ram[a] = 0xF3           # updateWall -> Active
    print("[SIM] Aucun savestate trouvé : RAM simulée avec motifs de test")
    return ram


class NWASimulatorHandler(socketserver.BaseRequestHandler):
    def setup(self):
        self.ram = self.server.ram
        self.buf = b""
        self.name = f"Client {self.server.client_id}"
        self.server.client_id += 1
        print(f"[SIM] {self.name} connecté depuis {self.client_address[:2]}")

    # ------------------------------------------------- envois (protocole NWA)
    def send_error(self, kind, reason):
        self.request.sendall(f"\nerror:{kind}\nreason:{reason}\n\n".encode())

    def send_hash_reply(self, pairs):
        out = ["\n"]
        for k, v in pairs:
            out.append(f"{k}:{v}\n")
        out.append("\n")
        self.request.sendall("".join(out).encode())

    def send_ok(self):
        self.request.sendall(b"\n\n")

    def send_data(self, payload: bytes):
        # format binaire du plugin : 0x00 + taille u32 BE + données
        self.request.sendall(b"\x00" + struct.pack(">I", len(payload)) + payload)

    # ------------------------------------------------------- commandes NWA
    def handle(self):
        while True:
            try:
                chunk = self.request.recv(4096)
            except OSError:
                break
            if not chunk:
                break
            self.buf += chunk
            while b"\n" in self.buf:
                line, self.buf = self.buf.split(b"\n", 1)
                if line.strip():
                    self.run_command(line.decode(errors="replace").strip())

    def run_command(self, line):
        parts = line.split(" ", 1)
        cmd = parts[0].upper()
        args = parts[1].split(";") if len(parts) > 1 else []
        print(f"[SIM] {self.name} << {line}")
        if cmd == "MY_NAME_IS":
            if len(args) != 1 or not args[0]:
                return self.send_error("invalid_argument",
                                       "MY_NAME_IS accept one argument <name>")
            self.name = args[0]
            return self.send_hash_reply([("name", self.name)])
        if cmd == "EMULATOR_INFO":
            return self.send_hash_reply([
                ("name", "BizHawk-NWA-Simulator"),
                ("version", "2.9-sim"),
                ("id", "Happy Skarsnik (simulation)"),
                ("nwa_version", "1.0"),
                ("commands", "MY_NAME_IS;CORE_CURRENT_INFO;CORE_MEMORIES;"
                             "CORE_READ;bCORE_WRITE;EMULATION_STATUS;GAME_INFO"),
            ])
        if cmd == "EMULATION_STATUS":
            return self.send_hash_reply([("status", "running"), ("paused", "false")])
        if cmd == "CORE_CURRENT_INFO":
            return self.send_hash_reply([
                ("core", "mGBA"), ("system", "GBA"),
                ("domain", "EXECUTEMEMORY"), ("size", str(RAM_SIZE)),
            ])
        if cmd == "GAME_INFO":
            return self.send_hash_reply([
                ("name", "The Minish Cap (simulé)"), ("system", "GBA")])
        if cmd == "CORE_MEMORIES":
            return self.send_hash_reply([("name", "EXECUTEMEMORY"),
                                         ("access", "rw"),
                                         ("size", str(RAM_SIZE))])
        if cmd == "CORE_READ":
            return self.core_read(args)
        if cmd == "BCORE_WRITE":
            return self.core_write(args)
        self.send_error("invalid_command", f"Unknow command : {cmd}")

    # CORE_READ DOMAIN;<offset>[;<size>;<offset2>;<size2>...]
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
            off = vals[i]
            if off < 0 or off >= RAM_SIZE:
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
        if domain not in ("EXECUTEMEMORY", "EXECRAM", "IWRAM", "SYSTEM BUS"):
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


def main():
    port = int(sys.argv[1], 0) if len(sys.argv) > 1 else 0xBEEF
    handler = Server(("127.0.0.1", port), NWASimulatorHandler)
    handler.ram = load_fake_ram()
    handler.client_id = 0
    print(f"[SIM] Serveur NWA simulé (Bizhawk-nwa-tool) sur 127.0.0.1:{port}")
    print("[SIM] Ctrl+C pour arrêter.")
    try:
        handler.serve_forever()
    except KeyboardInterrupt:
        print("\n[SIM] Arrêt.")


if __name__ == "__main__":
    main()
