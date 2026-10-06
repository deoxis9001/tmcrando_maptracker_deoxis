#!/usr/bin/env python3
"""Envoie des flags 0xXX à EmoTracker via nwa_bizhawk_simulator.py.

Principe (identique au plugin Bizhawk-nwa-tool côté BizHawk) :
  - le simulateur NWA écoute sur 127.0.0.1:49135 (0xBEEF) et expose une RAM
    GBA simulée que EmoTracker lit avec ses memory watches ;
  - ce client se connecte AU MÊME serveur NWA (en plus d'EmoTracker), écrit
    les flags dans la RAM via bCORE_WRITE -> EmoTracker voit les changements
    et active/désactive ses boutons automatiquement.

Utilisation :
  python3 tools/nwa_bizhawk_simulator.py &          # serveur NWA + web :8090
  EmoTracker -> connexion NWA 127.0.0.1 port 49135
  python3 tools/send_flags_to_emotracker.py --all            # active tout
  python3 tools/send_flags_to_emotracker.py 0x01 0x6A 0xF3   # flags précis
  python3 tools/send_flags_to_emotracker.py --off 0x01        # désactive
  python3 tools/send_flags_to_emotracker.py --list            # flags connus
  python3 tools/send_flags_to_emotracker.py --sheet data.json # depuis export CSV/JSON du Google Sheet

Format JSON "sheet" (colonnes de la feuille de flags) :
  [{"addr": "0x2002AC0", "flag": "0x01", "name": "gravekey"}, ...]
Chaque entrée = un octet `addr` dont le bit `flag` doit être posé.

Option --via-web : passe par l'API du web (:8090 /api/flags) au lieu d'un
client NWA direct (utile si le web est déjà ouvert).
"""
import argparse
import json
import socket
import struct
import sys

sys.path.insert(0, __file__.rsplit("/", 1)[0])
from nwa_bizhawk_simulator import (  # noqa: E402
    FLAG_DEFS, FLAG_BASE, ram_flag_offset, flag_slot, set_flags_in_ram,
)

NWA_HOST = "127.0.0.1"
NWA_PORT = 0xBEEF


class NwaWriter:
    """Client NWA minimal qui sait ÉCRIRE la RAM (bCORE_WRITE), exactement
    comme le ferait BizHawk quand un cheat/mod applique des flags."""

    def __init__(self, host=NWA_HOST, port=NWA_PORT):
        self.sock = socket.create_connection((host, port), timeout=3)
        self.buf = b""
        greet, _ = self._read()                       # salutation du serveur
        if greet != "OK":
            raise ConnectionError("handshake NWA invalide")
        self._send("MY_NAME_IS FLAG-SENDER")          # pas de réponse attendue
        info = self._cmd("EMULATOR_INFO")
        print(f"[SEND] connecté à {info.get('name')} {info.get('version')} "
              f"(commands: {'NWA ok'})")

    def _send(self, line):
        self.sock.sendall((line + "\n").encode())

    def _read(self):
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
                    return "ERR", payload.decode(errors="replace")
                pairs = {}
                for l in payload.split(b"\n"):
                    if b":" in l:
                        k, v = l.split(b":", 1)
                        pairs[k.decode()] = v.decode()
                return "OK", pairs
            chunk = self.sock.recv(4096)
            if not chunk:
                raise ConnectionError("connexion NWA fermée")
            self.buf += chunk

    def _cmd(self, line, binary=None):
        self._send(line)
        status, payload = self._read()
        if binary is not None:
            block = bytes([0]) + struct.pack(">I", len(binary)) + binary
            self.sock.sendall(block)
            status, payload = self._read()
        if status == "ERR" or payload == b"":
            if status == "ERR":
                raise RuntimeError(f"NWA erreur : {payload}")
        return payload

    def write_bytes(self, offset, data):
        """Écrit `data` à l'offset domaine (relatif IWRAM ou absolu GBA)."""
        self._cmd(f"bCORE_WRITE EXECUTEMEMORY;0x{offset:x};{len(data)}",
                  binary=data)

    def close(self):
        try:
            self.sock.close()
        except OSError:
            pass


def build_payload(flags, on=True):
    """Construit (offset_base, octets) pour ecrire tous les flags en UNE fois.

    On applique la logique officielle des drapeaux (set_flags_in_ram) dans une
    RAM intermediaire puis on extrait uniquement la zone des slots utilises."""
    if not flags:
        raise SystemExit("aucun flag valide a envoyer")
    scratch = bytearray(0x40000)
    set_flags_in_ram(scratch, flags, on=on)
    base = min(ram_flag_offset(f) for f in flags)
    top = max(ram_flag_offset(f) for f in flags)
    return base, bytes(scratch[base:top + 1])


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("flags", nargs="*", help="flags hex (0x01, 6A, F3...) — vide = tous")
    ap.add_argument("--all", action="store_true", help="envoyer TOUS les flags connus")
    ap.add_argument("--off", action="store_true", help="désactiver au lieu d'activer")
    ap.add_argument("--port", type=lambda v: int(v, 0), default=NWA_PORT,
                    help="port NWA (défaut 49135)")
    ap.add_argument("--via-web", action="store_true",
                    help="utiliser l'API web /api/flags plutôt qu'un client NWA direct")
    ap.add_argument("--web-port", type=int, default=8090)
    ap.add_argument("--sheet", metavar="FILE",
                    help="JSON exporté du Google Sheet : [{addr, flag, name}, ...]")
    ap.add_argument("--list", action="store_true", help="liste les flags connus")
    args = ap.parse_args()

    if args.list:
        for f, desc, bit, val in FLAG_DEFS:
            print(f"0x{f:02X}  {desc:<28} slot RAM 0x{0x02000000 + ram_flag_offset(f):07X}"
                  f"  bit/mask 0x{bit:02X}  valeur 0x{val:02X}")
        return

    # Flags demandés : soit depuis le sheet, soit la ligne de commande
    if args.sheet:
        with open(args.sheet, encoding="utf-8") as fh:
            rows = json.load(fh)
        addr_flags = []
        for r in rows:
            a = int(str(r.get("addr", "0")), 0)
            fl = int(str(r.get("flag", "0x01")), 0)
            addr_flags.append((a, fl, r.get("name", "")))
        print(f"[SEND] {len(addr_flags)} entrées adresse+flag depuis {args.sheet}")
    else:
        addr_flags = []
        known = {f for f, *_ in FLAG_DEFS}
        if args.all or not args.flags:
            flags = sorted(known)
        else:
            flags = []
            for t in args.flags:
                v = int(t, 16) if not t.lower().startswith("0x") else int(t, 0)
                if v not in known:
                    print(f"[SEND] AVERTISSEMENT : 0x{v:02X} absent de FLAG_DEFS "
                          f"(utilisez --list), ignoré")
                    continue
                flags.append(v)

    on = not args.off
    if args.via_web:
        import urllib.request
        body = json.dumps({"flags": flags if not args.sheet else [],
                           "on": on}).encode()
        url = f"http://127.0.0.1:{args.web_port}/api/flags"
        req = urllib.request.Request(url, data=body,
                                     headers={"Content-Type": "application/json"})
        res = json.load(urllib.request.urlopen(req, timeout=3))
        print(f"[SEND] via web : {res}")
        return

    w = NwaWriter(port=args.port)
    try:
        if addr_flags:
            # Mode sheet : écrit chaque bit de flag à son adresse réelle.
            # L'autotracker EmoTracker lit ces adresses -> déclenche le watch.
            grouped = {}
            for a, fl, _n in addr_flags:
                grouped.setdefault(a, 0)
                grouped[a] |= fl
            for a, mask in sorted(grouped.items()):
                off = a - 0x02000000
                cur = w._cmd(f"CORE_READ EXECUTEMEMORY;0x{off:x};1")
                cur = cur[0] if isinstance(cur, bytes) and cur else 0
                new = (cur | mask) if on else (cur & ~mask) & 0xFF
                w.write_bytes(off, bytes([new]))
                print(f"[SEND] 0x{a:07X} : 0x{cur:02X} -> 0x{new:02X} (mask 0x{mask:02X})")
        else:
            # Mode flags connus : zone drapeaux dédiée, écrite en UNE transaction
            lo, data = build_payload(flags, on=on)
            w.write_bytes(lo, data)
            print(f"[SEND] {len(flags)} flags {'ACTIVÉS' if on else 'DÉSACTIVÉS'} "
                  f"écrits en RAM 0x{0x02000000 + lo:07X}..0x{0x02000000 + lo + len(data) - 1:07X}")
            # Vérification relecture (comme le ferait le memory watch EmoTracker)
            back = w._cmd(f"CORE_READ EXECUTEMEMORY;0x{lo:x};{len(data)}")
            ok = isinstance(back, bytes) and back == data
            print(f"[SEND] vérification relecture : {'OK ✔' if ok else 'ÉCHEC ✘'}")
    finally:
        w.close()
    print("[SEND] EmoTracker va lire ces octets à son prochain memory watch (<1 s).")


if __name__ == "__main__":
    main()
