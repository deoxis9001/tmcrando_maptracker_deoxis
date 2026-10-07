#!/usr/bin/env python3
"""Client de test NWA qui imite EXACTEMENT EmoTracker 3.x (NwaDevice.cs) et le
plugin Bizhawk-nwa-tool, pour vérifier que nwa_bizhawk_simulator.py est
compatible :

  1. Probe (comme NwaDevice.ProbeAsync) : EMULATOR_INFO -> CORE_CURRENT_INFO
     -> EMULATION_STATUS ; le device n'est "vu" que si name: est renvoyé.
  2. Connexion (comme ConnectAsync) : MY_NAME_IS EmoTracker -> CORE_CURRENT_INFO
     -> CORE_MEMORIES (doit contenir un domaine "System Bus") -> ...
  3. Memory watch (comme ReadAsync/SendReadCommandAsync) : CORE_READ avec
     en-tête binaire <0x00><taille u32 BE>.
  4. Écriture (comme WriteAsync/SendWriteCommandAsync) : bCORE_WRITE + bloc
     binaire + ACK "\\n\\n".

Usage : python3 tools/test_nwa_client.py [port]   (défaut 49135 = 0xBEEF)
"""
import socket
import struct
import sys

PORT = int(sys.argv[1], 0) if len(sys.argv) > 1 else 0xBEEF
HOST = "127.0.0.1"


class Client:
    def __init__(self, host, port):
        self.s = socket.create_connection((host, port), timeout=5)
        self.buf = b""

    def _byte(self):
        while not self.buf:
            chunk = self.s.recv(65536)
            if not chunk:
                raise EOFError("serveur fermé")
            self.buf += chunk
        b, self.buf = self.buf[:1], self.buf[1:]
        return b[0]

    def read_ascii_reply(self):
        # comme ReadAsciiReplyAsync : 1er octet \n puis key:value\n...\n\n
        first = self._byte()
        assert first == 0x0A, f"attendu ASCII reply (0x0A), recu 0x{first:02X}"
        pairs, line = [], b""
        while True:
            b = self._byte()
            if b == 0x0A:
                if not line:
                    break
                k, _, v = line.partition(b":")
                pairs.append((k.decode(), v.decode()))
                line = b""
            else:
                line += bytes([b])
        return pairs

    def read_binary(self):
        # comme SendReadCommandAsync : 0x00 + taille u32 BE + données
        first = self._byte()
        if first == 0x00:
            size = struct.unpack(">I", bytes(self._byte() for _ in range(4)))[0]
            data = bytes(self._byte() for _ in range(size))
            return ("bin", data)
        if first == 0x0A:
            # erreur ou ACK vide
            line = b""
            pairs = []
            while True:
                b = self._byte()
                if b == 0x0A:
                    if not line:
                        break
                    k, _, v = line.partition(b":")
                    pairs.append((k.decode(), v.decode()))
                    line = b""
                else:
                    line += bytes([b])
            return ("ascii", pairs)
        raise AssertionError(f"octet inattendu 0x{first:02X}")

    def cmd(self, line, binary=None):
        self.s.sendall((line + "\n").encode())
        if binary is not None:
            self.s.sendall(b"\x00" + struct.pack(">I", len(binary)) + binary)
        return self.read_ascii_reply()

    def cmd_read(self, line):
        self.s.sendall((line + "\n").encode())
        return self.read_binary()


def main():
    ok = True

    # ---- 1. Probe à la EmoTracker (découverte du device) ----
    c = Client(HOST, PORT)
    info = dict(c.cmd("EMULATOR_INFO"))
    assert "name" in info, "EMULATOR_INFO sans name: -> device invisible !"
    core = dict(c.cmd("CORE_CURRENT_INFO"))
    status = dict(c.cmd("EMULATION_STATUS"))
    print(f"[PROBE] OK — name={info.get('name')} version={info.get('version')} "
          f"platform={core.get('platform')} state={status.get('state')} "
          f"game={status.get('game')!r}")
    assert core.get("platform"), "pas de platform -> pas de map possible"
    assert "game" in core and "game" in status, "clé game manquante"
    c.s.close()

    # ---- 2. Connexion complète à la NwaDevice.ConnectAsync ----
    c = Client(HOST, PORT)
    c.cmd(f"MY_NAME_IS EmoTracker 3.0.3.2 (test)")           # pas de réponse attendue... 
    # ...MAIS le plugin ne répond rien à MY_NAME_IS ; EmoTracker (SendCommandAsync)
    # attend lui une réponse. Vérifions lequel des deux le simulateur applique :
    # => Incohérence connue : NwaDevice.cs fait `await SendCommandAsync("MY_NAME_IS ...")`
    # qui lit une réponse. Le simulateur doit donc RÉPONDRE à MY_NAME_IS.
    try:
        c.s.settimeout(2)
        r = c.read_ascii_reply()
        print(f"[CONNECT] réponse MY_NAME_IS reçue : {r} (OK pour EmoTracker)")
    except (socket.timeout, AssertionError) as e:
        print(f"[CONNECT] ÉCHEC : pas de réponse à MY_NAME_IS ({e}) "
              "-> EmoTracker attend et finit par se déconnecter")
        ok = False
    mems = c.cmd("CORE_MEMORIES")
    names = [v for k, v in mems if k == "name"]
    sizes = [int(v) for k, v in mems if k == "size"]
    print(f"[CONNECT] domaines : {list(zip(names, sizes))}")
    assert "System Bus" in names, "pas de 'System Bus' -> InitializeAddressMapAsync échoue"
    assert all(s > 0 for s in sizes), "un domaine a size 0"

    # ---- 3. Memory watch : lecture d'une adresse absolue GBA ----
    addr, off = 0x02002AC0, 0x2AC0
    kind, payload = c.cmd_read(f"CORE_READ System Bus;${addr:X};$8")
    assert kind == "bin" and len(payload) == 8, f"lecture invalide : {kind} {payload!r}"
    print(f"[WATCH] CORE_READ 0x{addr:X} x8 -> {payload.hex()} OK")

    # multi-ranges (le plugin renvoie UN bloc par range)
    c.s.sendall(b"CORE_READ System Bus;$100;$4;$200;$2\n")
    k1, p1 = c.read_binary()
    k2, p2 = c.read_binary()
    assert k1 == "bin" and len(p1) == 4 and k2 == "bin" and len(p2) == 2, \
        f"multi-range incorrect : {(k1, len(p1) if k1=='bin' else p1)} {(k2, len(p2) if k2=='bin' else p2)}"
    print("[WATCH] CORE_READ multi-ranges -> 2 blocs séparés OK")

    # ---- 4. Écriture bCORE_WRITE (patch flag) + relecture ----
    ack = c.cmd("bCORE_WRITE System Bus;$2AC0;$1", binary=b"\x42")
    assert ack == [], f"ACK écriture inattendu : {ack}"
    kind, payload = c.cmd_read("CORE_READ System Bus;$2AC0;$1")
    assert kind == "bin" and payload == b"\x42", f"écriture non appliquée : {payload!r}"
    print("[WRITE] bCORE_WRITE 0x2002AC0=0x42 puis relecture -> 0x42 OK")

    # ---- 5. Commande inconnue -> erreur propre, connexion toujours usable ----
    err = c.cmd("NOT_A_COMMAND foo")
    d = dict(err)
    assert d.get("error"), f"pas d'erreur renvoyée : {err}"
    kind, payload = c.cmd_read("CORE_READ System Bus;$2AC0;$1")
    assert kind == "bin", "flux décalé après erreur !"
    print(f"[ERR] commande inconnue -> error:{d.get('error')} + flux intact OK")

    # ---- 6. Bloc binaire coupé en deux segments TCP (fragmentation) ----
    c.s.sendall(b"bCORE_WRITE System Bus;$2AC1;$2\n\x00\x00\x00")
    import time as _t; _t.sleep(0.2)
    c.s.sendall(b"\x02\xAA\xBB")
    ack = c.read_ascii_reply()
    assert ack == [], f"ACK fragmenté inattendu : {ack}"
    kind, payload = c.cmd_read("CORE_READ System Bus;$2AC1;$2")
    assert payload == b"\xAA\xBB", f"écriture fragmentée perdue : {payload!r}"
    print("[FRAG] bCORE_WRITE fragmenté (2 paquets) -> écriture OK")

    c.s.close()
    print("\n" + ("TOUS LES TESTS PASSENT ✔" if ok else "ÉCHECS ✘"))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
