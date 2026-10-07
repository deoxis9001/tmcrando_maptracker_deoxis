#!/usr/bin/env python3
"""Convertit un export CSV du Google Sheet de flags en JSON pour
send_flags_to_emotracker.py / nwa_bizhawk_simulator.py.

Format CSV attendu (2 lignes par adresse, comme l'export du sheet) :

  2A80,"0000 0001",Map Screen Square Revealed,Mount Crenel,,,
  ,"0000 0010",Map Screen Square Revealed,Mount Crenel Base,,,
  ...
  2A81,"1000 0000",Map Screen Square Revealed,Lake Hylia,,,

Règles :
  - colonne A vide      -> on réutilise la dernière adresse non vide ;
  - colonne B           -> bits "0000 0001" -> masque binaire -> flag 0x01 ;
                           "1000 0000" -> bit haut -> 0x80 ;
                           accepte aussi 0x80 / 80 / 1 ;
  - colonne C           -> description ;
  - colonne D           -> nom / contexte ;
  - ligne totalement vide -> séparateur, ignorée.

L'adresse est préfixée en 0x200XXXX (ex : 2A80 -> 0x2002A80).

Utilisation :
  python3 tools/parse_flags_csv.py flags.csv -o tools/flags.json
  python3 tools/parse_flags_csv.py flags.csv            # stdout
  python3 tools/parse_flags_csv.py flags.csv --stats    # résumé par adresse
"""
import argparse
import csv
import json
import re
import sys
from collections import OrderedDict


def parse_mask(text):
    """'0000 0001' -> 0x01 ; '1000 0000' -> 0x80 ; '0x80' -> 0x80 ; '1' -> 0x01."""
    t = text.strip()
    if not t:
        return None
    if t.lower().startswith("0x"):
        return int(t, 16) & 0xFF
    # forme binaire avec espaces : "0000 0001"
    bits = re.sub(r"[^01]", "", t)
    if len(bits) == 8 and re.fullmatch(r"[01 ]+", t.replace("0x", "")):
        return int(bits, 2)
    # décimal simple ("1", "128") uniquement si pas ambigu
    if re.fullmatch(r"\d+", t):
        v = int(t)
        if v <= 1:                      # '1' => bit 0 => 0x01
            return 0x01 if v == 1 else 0
        if v <= 0xFF:
            return v
        return v & 0xFF
    return None


def normalize_addr(text):
    """'2A80' / '0x2A80' / '0x2002A80' / '2002A80' -> '0x2002A80'."""
    t = text.strip().lower().replace("0x", "")
    if not re.fullmatch(r"[0-9a-f]+", t):
        return None
    if len(t) > 5 and t.startswith("200"):
        full = t
    else:
        full = "200" + t.zfill(4)       # 2A80 -> 2002A80
    return "0x" + full.upper()


def parse_csv(path):
    entries = []
    current_addr = None
    with open(path, newline="", encoding="utf-8-sig") as fh:
        reader = csv.reader(fh)
        for lineno, row in enumerate(reader, 1):
            row = [c.strip() for c in row]
            if not any(row):
                continue                          # ligne vide = séparateur
            a = row[0] if len(row) > 0 else ""
            b = row[1] if len(row) > 1 else ""
            desc = row[2] if len(row) > 2 else ""
            name = row[3] if len(row) > 3 else ""
            if a:
                addr = normalize_addr(a)
                if addr is None:
                    print(f"[CSV] ligne {lineno}: adresse invalide {a!r}, "
                          f"ignorée", file=sys.stderr)
                    continue
                current_addr = addr
            if current_addr is None:
                continue                          # avant toute adresse connue
            mask = parse_mask(b)
            if mask is None or mask == 0:
                continue                          # pas de bit (titre/ligne vide)
            label = name or desc
            entries.append(OrderedDict([
                ("addr", current_addr),
                ("flag", f"0x{mask:02X}"),
                ("name", label),
                ("context", desc if name else ""),
            ]))
    return entries


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("csv_file", help="export CSV du Google Sheet")
    ap.add_argument("-o", "--output", help="fichier JSON de sortie "
                    "(défaut : stdout)")
    ap.add_argument("--stats", action="store_true",
                    help="affiche un résumé au lieu du JSON")
    args = ap.parse_args()

    entries = parse_csv(args.csv_file)

    if args.stats:
        by_addr = OrderedDict()
        for e in entries:
            by_addr.setdefault(e["addr"], []).append(e)
        print(f"{len(entries)} entrées sur {len(by_addr)} adresses :")
        for addr, group in by_addr.items():
            names = ", ".join(g["name"] for g in group)
            print(f"  {addr} ({len(group)} flags) : {names}")
        return

    payload = json.dumps(entries, ensure_ascii=False, indent=2)
    if args.output:
        with open(args.output, "w", encoding="utf-8") as fh:
            fh.write(payload + "\n")
        print(f"[CSV] {len(entries)} entrées écrites dans {args.output}")
    else:
        print(payload)


if __name__ == "__main__":
    main()
