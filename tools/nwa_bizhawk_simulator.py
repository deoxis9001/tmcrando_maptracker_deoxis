""" Simulation d'un serveur Bizhawk-nwa-tool (https://github.com/Skarsnik/Bizhawk-nwa-tool)
 pour tester l'interface d'autotracking SANS BizHawk ni console :
   * même protocole TCP/NWA que le plugin (commandes texte \n ; erreurs "\nerror:...\n\n" ;
     réponses hash "\nkey:value\n\n" ; données mémoire : octet 0 + taille u32 BE + bytes)
   * port par défaut identique au plugin : 0xBEEF (49135)
   * RAM GBA simulée : 256 Ko (EXECRAM), initialisée avec un savestate TMC
     ("save.emo", "TMC-*.ss", "TMC-*.emuSave"... ou premier fichier .ss/.sav trouvé)
   * écriture possible via bCORE_WRITE (pour fabriquer des états de test)
 Usage :  python3 tools/nwa_bizhawk_simulator.py [port]"""

import csv
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


def load_fake_ram(seed=False, savestate=False):
    """Ram GBA simulée : TOUJOURS à 0 au départ (tous les flags à 0x00).

    Le chargement d'un savestate et les motifs de test sont désactivés par
    défaut ; utiliser --savestate / --seed (ou POST /api/seed) pour tester
    des états non nuls.
    """
    ram = bytearray(RAM_SIZE)
    if seed:
        seed_test_pattern(ram)
        print("[SIM] RAM initialisée avec motifs de test (--seed)")
        return ram
    if not savestate:   # save TMC chargé seulement si --savestate est passé
        print("[SIM] RAM simulée initialisée à 0 (tous les flags 0x00)")
        return ram
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
        print(f"[SIM] RAM partiellement initialisée depuis {path}")
        return ram
    # Aucun savestate demandé/trouvé : RAM à 0 (tous les flags 0x00)
    print("[SIM] RAM simulée initialisée à 0 (tous les flags 0x00)")
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
            # nom / context SEPARÉS : le type du bouton (Bool/Int) dépend de
            # leur présence (règle utilisateur : 0x01->Bool ; 0x02+ -> Int si
            # name ET context vides/absents, sinon Bool).
            name = str(e.get("name", "") or "").strip()
            ctx = str(e.get("context", "") or "").strip()
            desc = f"{ctx} {name}".strip() or f"flag {mask:02X}@{addr - RAM_BASE:04X}"
            defs.append((addr, mask, desc, name, ctx))
        print(f"[SIM] FLAG_DEFS : {len(defs)} flags chargés depuis {path}")
        return defs
    print("[SIM] FLAG_DEFS : aucun flags.json trouvé, "
          "fallback bits 0x01..0x80 par adresse (zones 2A80..2ADF)")
    defs = []
    for off in range(0x2A80, 0x2AE0):          # zones flags TMC connues
        for bit in (0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80):
            d = f"bit {bit:02X}@0x{off:04X}"
            defs.append((RAM_BASE + off, bit, d, d, ""))
    return defs


FLAG_DEFS = load_flag_defs()


# ---------------------------------------------------------------------------
# Règle de TYPE PAR DÉFAUT des boutons (demande utilisateur) :
#   masque 0x01                     -> Booléen
#   masque 0x02+ ET name/context    -> Booléen
#   masque 0x02+ SANS name/context  -> Int borné à la limite du flag :
#       0x02 -> 0x00..0x03 | 0x04 -> 0x00..0x07 | 0x08 -> 0x00..0x0F
#       0x10 -> 0x00..0x1F | 0x20 -> 0x00..0x3F | 0x40 -> 0x00..0x7F
#       0x80 -> 0x00..0xFF
# De plus, si la MEME ADRESSE possède plusieurs flags masqués, le champ non
# masqué forme une valeur combinée : un bouton Int sur cette adresse est
# automatiquement limité à la valeur max de l'octet moins les bits réservés
# par les autres flags (ex. addr avec 0x01 et 0x20 -> Int max 0x1F).
def _mask_to_int_max(mask):
    """Limite haute d'un compteur Int déduite du masque du flag."""
    m = mask & 0xFF
    if not m or (m & (m - 1)):        # pas une puissance de deux -> octet entier
        return 0xFF
    return (m << 1) - 1               # 0x02->0x03, 0x04->0x07 ... 0x80->0xFF


def _valid_defs(defs):
    """Entrées normalisées (addr:int, mask:int, desc, name, ctx) — invalides filtrées."""
    out = []
    for e in defs:
        e = tuple(e) + ("", "", "", "")
        try:
            addr = int(e[0], 0) if isinstance(e[0], str) else int(e[0])
            mask = int(e[1], 0) & 0xFF if isinstance(e[1], str) else int(e[1]) & 0xFF
        except (TypeError, ValueError):
            continue
        out.append((addr, mask, str(e[2] or ""), str(e[3] or "").strip(),
                    str(e[4] or "").strip()))
    return out


def _contiguous_low_mask(m):
    """0x07 -> 0x07 ; 0x05 -> 0x03 ; 0x06 -> 0x02 ; 0x80 -> 0x00.
    Plus petit masque contigu bas de page inclus dans m."""
    low = 0
    for j in range(8):
        if m >> j & 1:
            low |= 1 << j
        else:
            break
    return low


def default_button_type(defs):
    """Calcule (type, int_max, hidden, group_max) pour chaque entrée valide
    de `defs`. Règle utilisateur :

      masque 0x01                                  -> Booléen
      masque 0x02+ AVEC name ET context présents   -> Booléen
      masque 0x02+ SANS name ni context            -> Int borné à la limite
                                    (0x02->0..3, 0x04->0..7, 0x08->0..15 ...)

      REGROUPEMENT : si la MEME ADRESSE porte plusieurs flags dont les bits
      sont CONTIGUS en bas de l'octet et tous "vides" (sans name/context),
      on n'affiche QUE LE PREMIER (le plus petit bit, ex. 0x01) en Int avec
      la limite combinée (0x01+0x02 -> max 0x03 ; 0x04+0x08 -> max 0x0F), et
      les suivants sont masqués (hidden=True). Des bits non contigus restent
      des boutons séparés (0x01+0x04 sans nom -> Bool + Int 0..7 distincts).

    Les bits réservés par des flags NOMMÉS (Bool) voisins ne bornent pas le
    groupe : le champ Int s'étend jusqu'au premier bit occupé par un autre
    bouton visible. Liste alignée sur _valid_defs(defs)."""
    norm = _valid_defs(defs)
    empty_by_addr = {}       # addr -> union des masques "vides" (sans nom)
    for addr, mask, _d, name, ctx in norm:
        if not (name and ctx):
            empty_by_addr[addr] = empty_by_addr.get(addr, 0) | mask
    leader_of = {}           # (addr, lo_bit) -> masque du groupe contigu bas
    for addr, emask in empty_by_addr.items():
        grp = _contiguous_low_mask(emask)
        # un groupe d'un seul bit sans nom : comportement de base
        # (0x01 -> Booléen ; 0x02+ -> Int borné au flag), PAS de regroupement.
        if grp and grp & (grp - 1):
            leader_of[(addr, (grp & -grp).bit_length() - 1)] = grp

    def group_max(addr, grp):
        gwidth = grp.bit_length()
        hi_bit = gwidth - 1
        reserved = empty_by_addr.get(addr, 0) & ~grp   # bits isolés au-dessus
        for j in range(gwidth, 8):
            if reserved >> j & 1:
                hi_bit = j - 1
                break
        return (1 << (hi_bit - gwidth + 1)) - 1 if hi_bit >= gwidth - 1 \
            else (1 << gwidth) - 1

    out = []
    for addr, mask, _d, name, ctx in norm:
        named = bool(name and ctx)
        lo_bit = (mask & -mask).bit_length() - 1 if mask else 0
        grp = leader_of.get((addr, lo_bit))          # leader d'un groupe vide ?
        if grp is not None and not named:
            # LEADER : bouton unique du groupe de bits contigus "vides"
            # (ex. 0x01+0x02 vides -> un seul Int max 0x03 affiché sur 0x01 ;
            #  0x04+0x08 vides -> un seul Int max 0x0F affiché sur 0x04).
            gmax = group_max(addr, grp)
            out.append(("Int", gmax, False, gmax))
            continue
        if mask <= 0x01 or named:
            # 0x01 -> Booléen SAUF s'il est leader d'un groupe vide (ci-dessus)
            out.append(("Bool", None, False, None))
            continue
        grp_all = _contiguous_low_mask(empty_by_addr.get(addr, 0))
        if (leader_of.get((addr, (grp_all & -grp_all).bit_length() - 1)) is not None
                and grp_all >> lo_bit & 1):
            # membre NON-leader d'un groupe contigu "vide" (>1 bit) : caché
            # derrière le premier bit (le leader porte la valeur combinée).
            first_bit = (grp_all & -grp_all).bit_length() - 1
            gmax = group_max(addr, grp_all)
            out.append(("Int", gmax, lo_bit != first_bit, gmax))
            continue
        # bit isolé (non contigu en bas d'octet) : bouton propre,
        # borné par les bits voisins déjà utilisés.
        others = empty_by_addr.get(addr, 0) & ~grp_all
        hi_bit = 7
        for j in range(lo_bit + 1, 8):
            if others >> j & 1:
                hi_bit = j - 1
                break
        width = hi_bit - lo_bit + 1
        hi = min(_mask_to_int_max(mask), (1 << width) - 1)
        out.append(("Int", hi, False, None))
    return out


def _norm_types(types):
    """Compat : accepte les anciens triplets/tuplets (type, int_max)."""
    out = []
    for t in types:
        t = tuple(t)
        btype = t[0]
        imax = t[1] if len(t) > 1 else None
        hidden = t[2] if len(t) > 2 else False
        gmax = t[3] if len(t) > 3 else None
        out.append((btype, imax, bool(hidden), gmax))
    return out


DEFAULT_TYPES = default_button_type(FLAG_DEFS)


def _entry_extra(entry):
    """(name, context) d'une entrée de defs (tuples 3 ou 5 champs)."""
    if isinstance(entry, (list, tuple)) and len(entry) >= 5:
        return str(entry[3] or ""), str(entry[4] or "")
    return "", ""


def parse_mask(text):
    """'0000 0001' -> 0x01 ; '1000 0000' -> 0x80 ; '0x80' -> 0x80 ; '1' -> 0x01."""
    t = text.strip()
    if not t:
        return None
    if t.lower().startswith("0x"):
        return int(t, 16) & 0xFF
    bits = re.sub(r"[^01]", "", t)
    if len(bits) == 8 and re.fullmatch(r"[01 ]+", t.replace("0x", "")):
        return int(bits, 2)
    if re.fullmatch(r"\d+", t):
        v = int(t)
        if v <= 1:
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


def parse_csv_text(text):
    """Parse le contenu CSV d'un export du Google Sheet (meme regles que
    tools/parse_flags_csv.py) SANS fichier : retourne une liste d'entries
    {addr, flag, name, context}. Colonne A vide -> derniere adresse connue ;
    '1000 0000' -> flag 0x80 ; 2A81 -> 0x2002A81."""
    entries = []
    current_addr = None
    for row in csv.reader(text.splitlines()):
        row = [c.strip() for c in row]
        if not any(row):
            continue                                  # séparateur
        a = row[0] if len(row) > 0 else ""
        b = row[1] if len(row) > 1 else ""
        desc = row[2] if len(row) > 2 else ""
        name = row[3] if len(row) > 3 else ""
        if a:
            addr = normalize_addr(a)
            if addr is not None:
                current_addr = addr
        if current_addr is None:
            continue
        mask = parse_mask(b)
        if mask is None or mask == 0:
            continue
        entries.append({"addr": current_addr, "flag": f"0x{mask:02X}",
                        "name": name or desc, "context": desc if name else ""})
    return entries


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


def set_sheet_flags(ram, flags, on=True, defs=None):
    """flags = indices dans `defs` (FLAG_DEFS par defaut) ou tuples
    (addr, masque, desc).

    Ecrit le bit `masque` a l'adresse reelle dans la RAM partagee.
    Retourne la liste des entrees appliquees.
    """
    if defs is None:
        defs = FLAG_DEFS
    applied = []
    for f in flags:
        entry = defs[f] if isinstance(f, int) and 0 <= f < len(defs) else f
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
    for addr, mask, desc, *_rest in FLAG_DEFS:
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
        self.binary_wait = None   # (expected_size, deadline) si bCORE_WRITE en attente
        self.name = f"Client {self.server.client_id}"
        self.last_rx = time.monotonic()
        self.server.client_id += 1
        enable_tcp_keepalive(self.request)
        # PAS de greeting non sollicité ici. Le plugin Bizhawk-nwa-tool
        # (NWAServer.cs) n'envoie RIEN avant la première commande du client :
        # NWClientLib.executeCommand attend la réponse à SA commande et lit
        # "name:" dans les premières données reçues. Si le serveur parle en
        # premier ("BizHawk-NWA-Simulator..."), ces octets sont avalés comme
        # étant la réponse -> hash vide / décalage du flux -> EmoTracker ne
        # "voit pas le device" et se déconnecte juste après CORE_MEMORIES.
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
        # Boucle : select() non bloquant -> process() (machine à états du
        # plugin). Quand le client est silencieux depuis >25 s, on lui envoie
        # un EMULATION_STATUS spontané (heartbeat applicatif) : les pare-
        # feu/NAT coupent les connexions TCP sans trafic (~2 min), et cela
        # prouve au client que le serveur est vivant.
        last_tx = time.monotonic()
        while True:
            idle = self.IDLE_TIMEOUT - (time.monotonic() - self.last_rx)
            if idle <= 0:
                print(f"[SIM] {self.name} inactif > {self.IDLE_TIMEOUT:.0f}s, "
                      "fermeture propre (le client se reconnectera seul)")
                break
            wait = 1.0
            if self.binary_wait is None and time.monotonic() - last_tx > 25.0 \
                    and time.monotonic() - self.last_rx > 25.0:
                # heartbeat : identique au format d'une vraie réponse
                self.send_hash_reply([("state", "running"),
                                      ("game", "The Minish Cap (simulé)")])
                last_tx = time.monotonic()
            try:
                ready, _, _ = select.select([self.request], [], [], wait)
            except (OSError, ValueError):
                break
            if not ready:
                self.process()   # peut expirer un bloc binaire en attente
                continue
            try:
                chunk = self.request.recv(4096)
            except OSError:
                break
            if not chunk:
                break
            self.last_rx = time.monotonic()
            last_tx = time.monotonic()
            self.buf += chunk
            self.process()

    def process(self):
        # Machine à états identique au plugin Bizhawk-nwa-tool
        # (NWAServer.handleReadData) : soit on attend un bloc binaire
        # (après bCORE_WRITE), soit on lit des lignes de commande.
        # IMPORTANT : on ne consomme JAMAIS un octet 0x00 comme début de
        # commande, et on n'attend pas \n pour exécuter un bloc binaire
        # complet — sinon le flux TCP se décale et EmoTracker ferme la
        # connexion juste après CORE_MEMORIES ("device non vu").
        guard = 0
        while True:
            guard += 1
            if guard > 10000:
                break
            if self.binary_wait is not None:
                if not self._consume_binary():
                    break              # bloc incomplet : attendre plus de données
            else:
                if self.buf[:1] == b"\x00":
                    self.send_error("protocol_error",
                                    "Invalid data sent when waiting for a command")
                    break
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
            # Le plugin BizHawk (CommandHandler.myNameIs) RÉPOND un hash
            # {"name": ...} à MY_NAME_IS. EmoTracker 3.x (NwaDevice.
            # ConnectAsync) fait `await SendCommandAsync("MY_NAME_IS ...")`
            # qui LIT cette réponse avant toute commande suivante. Sans
            # réponse, il attend jusqu'à ReceiveTimeout (5 s), lève une
            # exception -> CleanupConnection() -> "[SIM] EmoTracker
            # déconnecté" juste après s'être identifié : c'est exactement
            # le log observé et le "EmoTracker ne voit pas le device".
            return self.send_hash_reply([("name", self.name)])
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
            # Taille DECIMALE = taille REELLE de chaque domaine : BizHawk
            # (MemoryDomain.Size) renvoie les tailles brutes, jamais 0. Un
            # size:0 rend le domainCheck() d'EmoTracker invalide -> "device
            # non vu" / reconnexion en boucle. Les adresses absolues GBA
            # (0x0200xxxx) sont acceptées par _to_offset sur tous les
            # domaines mémoire.
            return self._send_domain_list([
                ("System Bus", "rw", RAM_SIZE),
                ("IWRAM", "rw", 0x8000),
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
        # Le plugin (actualReadMemory -> sendData) envoie UN bloc binaire
        # (<0x00><taille u32 BE><données>) PAR plage d'accès mémoire, pas un
        # bloc fusionné. EmoTracker (SendReadCommandAsync) lit exactement un
        # bloc par CORE_READ ; avec un bloc fusionné de taille différente,
        # la lecture se décale -> protocole cassé -> déconnexion.
        for o, s in ranges:
            self.send_data(bytes(self.ram[o:o + s]))

    def core_write(self, args):
        domain = args[0].strip().upper() if args else ""
        if domain not in ("SYSTEM BUS", "EXECUTEMEMORY", "EXECRAM", "IWRAM",
                          "EWRAM"):
            # Le plugin (CommandHandler.coreWrite) attend les données binaires
            # APRÈS la commande ; si on répond et ignore le bloc, le flux est
            # décalé -> erreur protocol côté client. On consomme quand même
            # le bloc pour rester synchrone.
            self.binary_wait = (-1, time.monotonic() + 5.0)
            return self.send_error("command_error", "Unknown domain")
        ranges = self._parse_ranges(args)
        if ranges is None or ranges == "out_of_bounds":
            # Pas de total exploitable : lit un bloc dont la taille est
            # annoncée par son propre en-tête (expected=-1), puis erreur.
            self.binary_wait = (-1, time.monotonic() + 5.0)
            if ranges is None:
                return self.send_error("invalid_argument", "Bad number/offset")
            return self.send_error("invalid_argument",
                                   "Offset is out of bound for the domain")
        total = sum(s for _, s in ranges)
        # NE PAS lire sur la socket ici : le bloc peut arriver dans un autre
        # segment TCP. On mémorise la taille attendue et la boucle handle()
        # appellera _consume_binary() dès que les octets sont disponibles.
        self.pending_ranges = ranges
        self.binary_wait = (total, time.monotonic() + 10.0)

    def _consume_binary(self):
        """Essaie de consommer le bloc binaire attendu (0x00 + taille u32 BE +
        données) depuis self.buf. Retourne True si le bloc est complet
        (traitement fait), False s'il manque des octets."""
        expected, deadline = self.binary_wait
        if time.monotonic() > deadline:
            print(f"[SIM] {self.name} timeout bloc binaire bCORE_WRITE")
            self.binary_wait = None
            self.pending_ranges = None
            return False
        need = 5 if len(self.buf) < 5 else None
        if need is not None and len(self.buf) < need:
            return False
        if self.buf[:1] != b"\x00":
            self.binary_wait = None
            self.pending_ranges = None
            return self.send_error("protocol_error", "Expected binary block")
        if len(self.buf) < 5:
            return False
        (size,) = struct.unpack(">I", self.buf[1:5])
        if expected > 0 and size != expected:
            self.binary_wait = None
            self.pending_ranges = None
            self.buf = self.buf[5:]  # on ne peut pas resynchroner à l'aveugle
            return self.send_error(
                "protocol_error",
                f"Expecting a binary block of size {expected} received a size of {size}")
        if len(self.buf) < 5 + size:
            return False             # données incomplètes : attendre
        data = self.buf[5:5 + size]
        self.buf = self.buf[5 + size:]
        self.binary_wait = None
        ranges = getattr(self, "pending_ranges", None)
        self.pending_ranges = None
        if ranges is None:
            # écriture d'erreur (domaine/taille invalide) : on a consommé le
            # bloc pour garder la synchro, rien à écrire.
            return True
        pos = 0
        for off, s in ranges:
            n = min(s, len(data) - pos)
            if n > 0:
                self.ram[off:off + n] = data[pos:pos + n]
                pos += n
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


def build_buttons_from_flags(defs):
    """Un bouton par flag de la liste — source : flags.json / CSV du Google
    Sheet. Entrées = (addr, mask, desc[, name, ctx]).

    TYPE PAR DÉFAUT (règle utilisateur) :
      0x01              -> Booléen
      0x02+ avec name ET context -> Booléen
      0x02+ sans name/context    -> Int borné à la limite du flag
                                    (0x02->0..3, 0x04->0..7, 0x08->0..15 ...)
    REGROUPEMENT : bits contigus "vides" sur une même adresse (ex. 0x01 et
    0x02, ou 0x04 plein + 0x08 vide) -> un SEUL bouton affiché (le premier
    bit), en Int avec la limite combinée ; les suivants sont hidden=True."""
    types = _norm_types(default_button_type(defs))
    buttons = []
    for (addr, mask, desc, _n, _c), (btype, imax, hidden, gmax) in \
            zip(_valid_defs(defs), types):
        m = mask & 0xFF
        buttons.append({"id": f"flag-{addr:x}-{m:02x}", "kind": "flag",
                        "hex": f"0x{addr:07X}", "value": m,
                        "addr_hex": f"0x{addr:07X}",
                        "context": desc or f"flag {m:02X}@{addr - RAM_BASE:04X}",
                        "type": btype, "int_max": imax,
                        "hidden": hidden, "group_max": gmax,
                        "on": False, "count": 0})
    return buttons


def _field_mask(b):
    """Masque des bits du CHAMP d'un bouton Int : le groupe de bits contigus
    "vides" auquel appartient le flag (ex. flags 0x01+0x02 sans nom -> champ
    0x03 ; 0x04+0x08 -> champ 0x0C), borné par int_max à partir du bit de
    base du masque affiché. Les flags nommés (Bool) voisins ne font PAS
    partie du champ."""
    m = b["value"] & 0xFF
    if not m:
        return 0xFF
    lo = (m & -m).bit_length() - 1
    imax = b.get("int_max")
    hi = imax if isinstance(imax, int) else 0xFF
    width = max(1, hi.bit_length())
    width = min(width, 8 - lo)
    return ((1 << width) - 1) << lo


def _apply_flag_button(ram, b):
    """Écrit l'état d'un bouton-flag (addr_hex + value=masque) dans la RAM.

    Le web est la SOURCE D'ENVOI directe vers EmoTracker : on écrit UNIQUEMENT
    quand l'utilisateur agit sur le bouton (drapeau dirty). La valeur envoyée
    est brute : Bool -> bit posé (octet modifié => 1) ou cassé (=> 0),
    Int -> la valeur du compteur. Plus de réécriture périodique qui écrasait
    les changements faits depuis d'autres clients NWA (BizHawk/EmoTracker)."""
    off = _flag_off(b)
    if off is None:
        return
    m = b["value"] & 0xFF
    if b["type"] == "Bool":
        ram[off] = (ram[off] | m) if b["on"] else (ram[off] & ~m) & 0xFF
    else:
        # Int : on écrit la VALEUR DU COMPTEUR dans le CHAMP du flag (bits
        # à partir du bit de base du masque, borné par int_max). Les bits
        # réservés aux autres flags du même octet sont préservés.
        lo = (m & -m).bit_length() - 1 if m else 0
        imax = b.get("int_max")
        hi = imax if isinstance(imax, int) else 0xFF
        field = _field_mask(b)
        v = (min(b["count"], hi) & (field >> lo)) << lo
        ram[off] = (ram[off] & ~field | v) & 0xFF


def _flag_off(b):
    """Offset RAM d'un bouton flag, gère addr_hex OU hex sans préfixe
    ('2A80', '0x2A80', '0x2002A80'). Retourne None si hors zone."""
    txt = str(b.get("addr_hex") or b.get("hex") or "")
    try:
        v = int(txt, 16)
    except ValueError:
        return None
    if not txt:
        return None
    # adresses courtes du CSV ('2A80') -> absolues ; >= RAM_BASE -> deja absolue
    addr = v if v >= RAM_BASE else RAM_BASE + v
    off = addr - RAM_BASE
    return off if 0 <= off < RAM_SIZE else None


# Protection anti-écrasement : après une action web sur un bouton, on ignore
# la synchro montante (lecture RAM) pendant ce délai. Un booléen 'dirty' ne
# suffit pas : il est consommé dès le premier passage du poller (0,5 s), alors
# que /api/state ou le watch peuvent arriver juste après et lire une RAM pas
# encore stabilisée -> le compteur retombait à 0 ("les boutons ne marchent
# pas"). Le délai temporel couvre tout le temps de propagation NWA.
DIRTY_HOLD = 3.0


def _mark_dirty(b):
    b["dirty"] = True
    b["dirty_until"] = time.monotonic() + DIRTY_HOLD


def _is_dirty(b):
    d = bool(b.get("dirty"))
    until = b.get("dirty_until", 0)
    if until and time.monotonic() < until:
        d = True
    return d


def push_buttons_to_ram(state):
    """Ré-écrit dans la RAM partagée uniquement les boutons marqués 'dirty'
    (un clic/action web récent). Appelé par le poller NWA quand un VRAI
    émulateur BizHawk est connecté via /api/connect : le poller maintient
    alors la RAM locale synchrone avec l'émulateur, et re-pousser les actions
    web garantit qu'elles y sont écrites aussi (l'écriture HTTP directe ne
    touche que la RAM locale, invisible pour BizHawk)."""
    ram = state.sim.ram
    pushed = []
    for bid in list(state.order):
        b = state.buttons[bid]
        if not b.get("dirty"):
            continue
        b.pop("dirty", None)      # envoi fait ; dirty_until reste actif
        b["sent_at"] = time.monotonic()
        if b["kind"] == "address":
            off = b["value"] - 0x2000000
            if 0 <= off < len(ram):
                ram[off] = ((1 if b["on"] else 0) if b["type"] == "Bool"
                            else b["count"]) & 0xFF
                pushed.append(b["id"])
        elif b["kind"] == "flag" and b.get("addr_hex"):
            _apply_flag_button(ram, b)
            pushed.append(b["id"])
    return pushed


def write_flags_to_nwa(client, entries, on=True):
    """Écrit des flags directement dans la RAM de l'émulateur via NWA
    (bCORE_WRITE), sans passer par la RAM locale du simulateur. Utilisé par
    /api/flags et /api/sheet_flags quand un vrai BizHawk est connecté :
    EmoTracker voit ainsi les flags dès son prochain memory watch."""
    changed = []
    for entry in entries:
        pair = _flag_to_offs(entry) if not isinstance(entry, tuple) \
            else _flag_to_offs(entry)
        if pair is None:
            continue
        off, mask = pair
        try:
            cur = client.read_bytes(off, 1)
            cur = cur[0] if isinstance(cur, bytes) and cur else 0
        except Exception:
            cur = 0
        newv = (cur | mask) if on else (cur & ~mask) & 0xFF
        if newv != cur:
            try:
                client.write_bytes(off, bytes([newv]))
            except Exception as exc:
                raise ConnectionError(f"bCORE_WRITE a échoué : {exc}")
        changed.append((entry[0], mask, entry[2] if len(entry) > 2 else ""))
    return changed


def _make_test_state(sim_ram):
    """État minimal pour tests unitaires (sans serveur HTTP)."""
    st = WebState.__new__(WebState)
    class _Sim:  # bouchon : seul .ram est utilisé
        ram = sim_ram
    st.sim = _Sim()
    st.buttons = {}
    st.order = []
    st.logs = []
    st.clients = []
    st.connected = False
    st.port = 0xBEEF
    st.sheet = list(FLAG_DEFS)
    st.sheet_source = "flags.json"
    return st


def _do_action(st, req):
    """Logique de /api/action, factorisée (handler HTTP + tests).

    Retourne (code_http, reponse_dict)."""
    b = st.buttons.get(req.get("id"))
    if b is None:
        return 404, {"error": "bouton inconnu"}
    act = req.get("action")
    if act == "toggle":
        # toggle sur un bouton Int : 1 -> 0, sinon -> 1 (borné comme set)
        imax = b.get("int_max")
        hi = imax if isinstance(imax, int) else 0xFF
        if b["type"] == "Int":
            b["count"] = 0 if b["count"] else min(1, hi)
        else:
            b["on"] = not b["on"]
    elif act == "inc":
        imax = b.get("int_max")
        hi = imax if isinstance(imax, int) else 0xFF
        nxt = b["count"] + 1
        b["count"] = 0 if nxt > hi else nxt      # wrap à la limite du flag
    elif act == "dec":
        imax = b.get("int_max")
        hi = imax if isinstance(imax, int) else 0xFF
        b["count"] = hi if b["count"] - 1 < 0 else max(0, b["count"] - 1)
    elif act == "set":
        v = int(req.get("value", 0))
        imax = b.get("int_max")
        hi = imax if isinstance(imax, int) else 0xFF
        b["count"] = max(0, min(v, hi))          # limité à la borne du flag
    elif act == "type":
        b["type"] = "Int" if b["type"] == "Bool" else "Bool"
        b["manual_type"] = True                  # choix explicite : survit au reload
        if b["type"] == "Int":                   # ramène le count dans la borne
            imax = b.get("int_max")
            if isinstance(imax, int):
                b["count"] = min(b["count"], imax)
    else:
        return 400, {"error": f"action '{act}' inconnue"}
    # Le web ENVOIE directement la donnée à EmoTracker : écriture immédiate
    # dans la RAM partagée (servie aux clients NWA) + drapeau dirty.
    _mark_dirty(b)
    if b["kind"] == "address":
        off = b["value"] - 0x2000000
        if 0 <= off < len(st.sim.ram):
            val = (1 if b["on"] else 0) if b["type"] == "Bool" else b["count"]
            st.sim.ram[off] = val & 0xFF
    elif b["kind"] == "flag" and b.get("addr_hex"):
        # un clic sur un bouton FLAG ecrit le bit du flag a son adresse
        # reelle (addr_hex, masque=value) dans la RAM -> visible par
        # EmoTracker (memory watch) comme un vrai flag du jeu
        _apply_flag_button(st.sim.ram, b)
        # NOTE : on ne recalcule PAS count/on depuis la RAM ici. En mode Int,
        # plusieurs flags partagent le meme octet ; relire "bit pose ? 1 : 0"
        # detruirait le compteur de l'user (ex. count=3 -> 1). La synchro
        # montante dans full_state() est deja protegee par 'dirty'.
    # Si un client NWA externe (vrai BizHawk) est connecté via /api/connect,
    # pousser aussi l'écriture dans SA ram (bCORE_WRITE) : sans ça, le clic
    # web reste invisible pour EmoTracker branché sur BizHawk.
    poller = next((c for c in getattr(st, "clients", [])
                   if getattr(c, "_is_poller", False)), None)
    if poller is not None:
        try:
            if b["kind"] == "address":
                off = b["value"] - 0x2000000
                if 0 <= off < RAM_SIZE:
                    val = ((1 if b["on"] else 0) if b["type"] == "Bool"
                           else b["count"]) & 0xFF
                    poller.write_bytes(off, bytes([val]))
            else:
                off = _flag_off(b)
                if off is not None:
                    cur = poller.read_bytes(off, 1)
                    cur = cur[0] if isinstance(cur, bytes) and cur else 0
                    m = b["value"] & 0xFF
                    if b["type"] == "Bool":
                        newv = (cur | m) if b["on"] else (cur & ~m) & 0xFF
                    else:
                        # Int : valeur du compteur écrite dans le CHAMP du
                        # flag (cohérent avec _apply_flag_button local).
                        lo2 = (m & -m).bit_length() - 1 if m else 0
                        imax2 = b.get("int_max")
                        hi2 = imax2 if isinstance(imax2, int) else 0xFF
                        w2 = max(1, hi2.bit_length())
                        fld = ((1 << w2) - 1) << lo2
                        newv = (cur & ~fld |
                                (min(b["count"], hi2) & ((1 << w2) - 1)) << lo2) & 0xFF
                    if newv != cur:
                        poller.write_bytes(off, bytes([newv]))
        except Exception as exc:
            st.log(f"⚠ Envoi NWA (bouton {b['id']}) échoué : {exc}")
    return 200, {"ok": True, "button": b}


class WebState:
    def __init__(self, sim_server):
        self.sim = sim_server          # serveur NWA (attribut .ram partagé)
        self.buttons = {}              # id -> dict(type Bool|Int, on, count)
        self.order = []
        self.clients = []              # clients EmoTracker connectés via le web
        self.logs = []
        self.connected = False
        self.port = 0xBEEF
        # Source affichée dans le panneau "Flags Google Sheet" du web :
        # liste (addr, mask, desc). Initialisée depuis FLAG_DEFS (flags.json),
        # remplacée à chaud par /api/load_flags (upload CSV/JSON du sheet).
        self.sheet = list(FLAG_DEFS)
        self.sheet_source = "flags.json" if FLAG_DEFS else ""

    def read_sheet(self, ram=None):
        """Etat courant de chaque flag de la source active (self.sheet), lu
        dans la RAM partagée -> sert directement au panneau web.

        Les flags regroupés (bits contigus "vides" d'une même adresse, caché
        derrière le premier bit en Int combiné) sont marqués hidden=True :
        le web n'affiche que le bouton leader du groupe."""
        if ram is None:
            ram = self.sim.ram if self.sim else None
        out = []
        types = _norm_types(default_button_type(self.sheet))
        for (entry, (btype, imax, hidden, gmax)) in zip(_valid_defs(self.sheet), types):
            addr, mask, desc = entry[0], entry[1], entry[2]
            on = False
            if ram is not None:
                pair = _flag_to_offs((addr, mask))
                if pair is not None:
                    off, m = pair
                    on = bool(ram[off] & m)
            out.append({"id": f"flag-{addr:x}-{mask:02x}",
                        "addr": addr, "hex": f"0x{addr:07X}",
                        "flag": f"0x{mask:02X}", "context": desc, "on": on,
                        "type": btype, "int_max": imax,
                        "hidden": hidden, "group_max": gmax})
        return out

    def rebuild_buttons(self):
        """Régénère les boutons web depuis la source active self.sheet
        (flags.json / CSV du Google Sheet). Conserve l'état Bool/Int des
        boutons existants. Aucune dépendance à autotracking.lua."""
        new_buttons = {}
        new_order = []
        ram = self.sim.ram if self.sim else None
        for b in build_buttons_from_flags(self.sheet):
            old = self.buttons.get(b["id"])
            if old:
                # type : on garde un choix MANUEL explicite de l'utilisateur,
                # sinon on SUIT la règle par défaut (flags.json / CSV rechargé)
                if old.get("manual_type"):
                    b["type"] = old.get("type", "Bool")
                b["count"] = old.get("count", 0)
                b["on"] = old.get("on", b["on"])
                b["manual"] = old.get("manual", True)
            elif ram is not None:
                # bouton neuf : on herite de l'etat deja present dans la RAM
                pair = _flag_to_offs((int(b["addr_hex"], 16), b["value"]))
                if pair is not None:
                    off, m = pair
                    b["on"] = bool(ram[off] & m)
            new_buttons[b["id"]] = b
            new_order.append(b["id"])
        # boutons ajoutés manuellement (expérimentation) conservés en fin
        for bid in self.order:
            if bid not in new_buttons:
                new_buttons[bid] = self.buttons[bid]
                new_order.append(bid)
        self.buttons = new_buttons
        self.order = new_order

    def apply_sheet(self, entries, on=True):
        """Écrit des flags (tuples (addr, mask, desc) ou indices) dans la RAM
        partagée. Retourne la liste des entrées réellement modifiées.

        Si un client NWA externe est connecté (/api/connect -> vrai BizHawk),
        les flags sont écrits DIRECTEMENT dans sa RAM via bCORE_WRITE : le web
        devient la source d'envoi vers l'émulateur/EmoTracker."""
        # résoudre les indices en tuples réels
        resolved = []
        for e in entries:
            if isinstance(e, int) and 0 <= e < len(self.sheet):
                resolved.append(self.sheet[e])
            else:
                resolved.append(e)
        changed = set_sheet_flags(self.sim.ram, resolved, on=on)
        # envoi direct vers l'émulateur connecté (NWA bCORE_WRITE)
        poller = next((c for c in self.clients
                       if getattr(c, "_is_poller", False)), None)
        if poller is not None:
            try:
                write_flags_to_nwa(poller, resolved, on=on)
                self.log(f"Flags écrits directement dans la RAM de l'émulateur "
                         f"connecté (bCORE_WRITE)")
            except ConnectionError as exc:
                self.log(f"⚠ Envoi NWA échoué : {exc}")
        # synchronise l'état des boutons correspondants
        for entry in changed:
            addr, mask, _d = entry
            b = self.buttons.get(f"flag-{addr:x}-{mask:02x}") or \
                self.buttons.get(f"addr-{addr:x}")
            if b:
                if b["type"] == "Bool":
                    b["on"] = on
                elif on and not b["count"]:
                    b["count"] = 1
                elif not on:
                    b["count"] = 0
                _mark_dirty(b)     # protège contre l'écho du watch
        return changed

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
        # counts : basés sur la SOURCE REELLE du panneau Flags (state.sheet),
        # pas seulement sur les FLAG_DEFS chargées au démarrage.
        n_sheet = len(self.sheet) if self.sheet else len(FLAG_DEFS)
        out = {
            "connected": self.connected,
            "port": self.port,
            "clients": [f"{c.ip}:{c.port}" for c in self.clients],
            "counts": {
                "addresses": sum(1 for b in self.buttons.values() if b["kind"] == "address"),
                "flags": sum(1 for b in self.buttons.values() if b["kind"] == "flag"),
                "sheet_flags": n_sheet,
            },
            # flags du Google Sheet : la SOURCE REELLE de l'affichage web est
            # state.sheet (chargee par /api/load_flags depuis le CSV/JSON du
            # sheet, ou FLAG_DEFS au demarrage). Plus aucun passage par Lua :
            # le web lit/ecrit directement dans la RAM partagee du simulateur.
            "sheet_flags": self.read_sheet(),
            "sheet_source": self.sheet_source or ("flags.json" if FLAG_DEFS else "aucun"),
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
            elif b["kind"] == "flag" and ram is not None and b.get("addr_hex"):
                try:
                    off = _flag_off(b)
                except TypeError:
                    off = -1
                if off is not None and 0 <= off < len(ram):
                    # état réel du bit dans la RAM (source de vérité EmoTracker)
                    entry["ram"] = ram[off]
                    entry["ram_on"] = bool(ram[off] & b["value"])
                    # synchro montante : si la RAM change autrement (BizHawk,
                    # /api/flags, seed), le bouton suit — sauf juste après une
                    # action web (fenêtre anti-écho DIRTY_HOLD). En mode Int,
                    # l'octet de la RAM porte la VALEUR BRUTE du compteur
                    # (0x00 -> 0x01 -> 0x02 ...) : on reflète toute valeur
                    # externe, sans jamais écraser un clic web récent.
                    if not _is_dirty(b):
                        if b["type"] == "Int":
                            # seul le CHAMP du flag compte : les bits réservés
                            # aux autres flags du même octet sont ignorés.
                            # champ = groupe de bits contigus "vides" (ex.
                            # 0x01+0x02 -> 0x03), borné par int_max.
                            m = b["value"] & 0xFF
                            lo = (m & -m).bit_length() - 1        # bit de base
                            imax = b.get("int_max")
                            hi = imax if isinstance(imax, int) else 0xFF
                            field = _field_mask(b)
                            v = (ram[off] & field) >> lo
                            if v > hi:                # sécurité si RAM hors borne
                                v = v & ((1 << max(1, hi.bit_length())) - 1)
                            if v != b["count"]:
                                b["count"] = v
                        else:
                            on = bool(ram[off] & b["value"])
                            last = b.get("last_ram_on")
                            b["last_ram_on"] = on
                            b["on"] = on
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
            code, payload = _do_action(st, req)
            return self._json(payload, code)

        if path == "/api/flags":
            # envoi massif de FLAGS DU SHEET vers EmoTracker via la RAM simulee.
            # req = {"flags": [...], "on": true|false, "addr": "0x2002A81",
            #        "mask": "0x80"}
            # Deux modes :
            #  A) flags = ["0xADDR:0xMASK" | {addr, flag} | index dans la
            #     source active du panneau (state.sheet)]
            #     -> chaque entree est ecrite a SON adresse reelle ;
            #  B) addr + mask (ou flags=["0x80"]) -> un seul octet `addr` avec
            #     le(s) bit(s) `mask` pose(s)/casse(s) — comportement "tout c'est
            #     2A81 = 0x80" du CSV Google Sheet.
            # Sans "flags" et sans "addr" : TOUS les flags de la source active.
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
                        mm = int(str(m), 0) & 0xFF
                        entries.append((base_addr, mm, "", "", ""))
                    except (ValueError, TypeError):
                        continue
            elif raw is None:
                entries = list(range(len(st.sheet)))   # toute la source active
            else:
                for f in raw:
                    if isinstance(f, dict):
                        entries.append((int(str(f.get("addr")), 0),
                                        int(str(f.get("flag", "1")), 0),
                                        "", "", ""))
                    elif isinstance(f, str) and ":" in f:
                        a, m = f.split(":", 1)
                        entries.append((int(a, 0), int(m, 0), "", "", ""))
                    else:
                        try:
                            v = int(f, 0) if isinstance(f, str) else int(f)
                        except (ValueError, TypeError):
                            continue
                        if 0 <= v < len(st.sheet):
                            entries.append(v)          # index dans state.sheet
                        else:      # on dirait une adresse absolue -> bit 0x01
                            entries.append((v, 0x01, ""))
            changed = st.apply_sheet(entries, on=on)
            st.log(f"Envoi de {len(changed)} flags du sheet "
                   f"{'ACTIVÉS' if on else 'DÉSACTIVÉS'} à leur adresse réelle "
                   f"-> RAM (EmoTracker les lira au prochain watch)")
            return self._json({"ok": True,
                               "sent": [{"addr": f"0x{a:07X}", "flag": f"0x{m:02X}"}
                                        for a, m, _d in changed]})

        if path == "/api/load_flags":
            # Charge la liste des flags AFFICHEE dans le panneau web depuis :
            #  - {"csv": "<export CSV brut du Google Sheet>"}  (colonnes :
            #    addr vide = adresse precedente ; bits "0000 0001" -> 0x01,
            #    "1000 0000" -> 0x80 ; 2A81 -> 0x2002A81)
            #  - {"json": [<entries parse_flags_csv.py>] | {"flags": [...]}}
            #  - {"path": "tools/flags.csv"} (fichier local CSV ou JSON)
            # Aucune dépendance à autotracking.lua : le web affiche UNIQUEMENT
            # ce qui vient du sheet.
            src_name = None
            new_defs = []
            try:
                if req.get("csv"):
                    # parse_csv_text : meme logique que parse_flags_csv.py
                    # (addr vide = adresse precedente, bits "0000 0001" ->
                    # 0x01 ... "1000 0000" -> 0x80, 2A81 -> 0x2002A81)
                    entries = parse_csv_text(req["csv"])
                    src_name = "CSV (upload)"
                elif req.get("json") is not None:
                    data = req["json"]
                    entries = data.get("flags", data) if isinstance(data, dict) else data
                    src_name = "JSON (upload)"
                elif req.get("path"):
                    fp = os.path.abspath(req["path"])
                    if not os.path.isfile(fp):
                        return self._json({"error": f"fichier introuvable : {fp}"}, 400)
                    if fp.endswith(".json"):
                        with open(fp, encoding="utf-8") as fh:
                            data = json.load(fh)
                        entries = data.get("flags", data) if isinstance(data, dict) else data
                    else:
                        with open(fp, newline="", encoding="utf-8-sig") as fh:
                            entries = parse_csv_text(fh.read())
                    src_name = os.path.basename(fp)
                else:
                    return self._json({"error": "csv, json ou path requis"}, 400)
            except Exception as exc:                      # noqa: BLE001
                return self._json({"error": f"chargement impossible : {exc}"}, 400)
            # normalisation : flags.json contient des entrees SANS bits
            # ("0000 0001") -> flag peut etre une liste ["0000","0001"] ;
            # le bit bas position = masque (regle du sheet : 1000 0000 -> 0x80)
            def _mask_of(v):
                if isinstance(v, (list, tuple)):
                    v = "".join(str(x) for x in v)
                s = str(v).replace(" ", "")
                if not s:
                    return None
                try:
                    n = int(s, 2) if set(s) <= set("01") and len(s) > 2 else int(s, 0)
                except ValueError:
                    return None
                return n & 0xFF or None
            for e in entries:
                try:
                    addr = int(str(e.get("addr")), 0)
                except (ValueError, TypeError, AttributeError):
                    continue
                raw = e.get("flag", e.get("mask"))
                if raw is None:
                    raw = e.get("bits")
                mask = _mask_of(raw) if raw is not None else 1
                if mask is None:
                    continue
                ctx = str(e.get("context", "") or "").strip()
                name = str(e.get("name", "") or "").strip()
                desc = f"{ctx} {name}".strip() or \
                       f"flag {mask:02X}@{addr - RAM_BASE:04X}"
                # 5 champs (addr, mask, desc, name, ctx) : la règle de type
                # Bool/Int par défaut dépend de name/context (voir load_flag_defs)
                new_defs.append((addr, mask, desc, name, ctx))
            if not new_defs:
                return self._json({"error": "aucun flag valide trouvé dans la source"}, 400)
            st.sheet = new_defs
            st.sheet_source = src_name
            st.rebuild_buttons()   # les boutons web viennent des flags, pas du lua
            st.log(f"Panneau Flags : {len(new_defs)} flags chargés depuis {src_name} "
                   f"-> {len(st.buttons)} boutons régénérés (source = Google Sheet, "
                   "plus autotracking.lua)")
            return self._json({"ok": True, "count": len(new_defs),
                               "source": src_name,
                               "sheet_flags": st.read_sheet()})

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
            changed = st.apply_sheet(entries, on=on)
            st.log(f"Sheet : {len(changed)}/{len(entries)} flags "
                   f"{'ACTIVÉS' if on else 'DÉSACTIVÉS'} dans la RAM")
            return self._json({"ok": True, "applied": len(changed)})

        if path == "/api/reset":
            for b in st.buttons.values():
                b["on"] = False
                b["count"] = 0
                b.pop("dirty", None)
                b.pop("last_write", None)
            # RAM remise à ZÉRO partout (tous les flags 0x00), PAS de motifs
            st.sim.ram[:] = bytes(len(st.sim.ram))
            clear_all_flags(st.sim.ram)
            st.log("Réinitialisation : boutons OFF, RAM remise à 0 "
                   "(tous les flags 0x00)")
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
        # PAS de greeting lu ici : le plugin Bizhawk-nwa-tool (et ce
        # simulateur) n'envoie rien avant la première commande du client.
        # Attendre un greeting bloquait/cassait le handshake.
        self._cmd(f"MY_NAME_IS {self.name}")  # le plugin répond hash{name:}
        info = self._cmd("EMULATOR_INFO")
        self.state.log(f"Connecté (NWA) à {info.get('name','?')} {info.get('version','?')}")

    def _send(self, line):
        self.sock.sendall((line + "\n").encode())

    def write_bytes(self, offset, data: bytes):
        """Écrit dans la RAM du serveur via bCORE_WRITE (comme le plugin)."""
        self._send(f"bCORE_WRITE System Bus;${offset:X};${len(data):X}")
        self.sock.sendall(b"\x00" + struct.pack(">I", len(data)) + data)
        status, payload = self._read()
        if status != "OK":
            raise RuntimeError(f"NWA write: {payload!r}")
        return True

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
        """Envoie une commande et lit la réponse (toutes les commandes
        reçoivent une réponse du plugin Bizhawk-nwa-tool, y compris
        MY_NAME_IS qui renvoie le hash name:)."""
        self._send(line)
        status, payload = self._read()
        if status != "OK":
            raise RuntimeError(f"NWA: {payload!r}")
        return payload

    def read_ranges(self, ranges):
        """ranges = [(off, size), ...] -> une seule commande CORE_READ ;
        le plugin renvoie UN bloc binaire par plage (actualReadMemory)."""
        args = ";".join(f"${o:X};${s:X}" for o, s in ranges)
        self._send(f"CORE_READ System Bus;{args}")
        out = []
        for _ in ranges:
            status, payload = self._read()
            if status != "OK":
                raise RuntimeError(f"NWA: {payload!r}")
            out.append(payload if isinstance(payload, bytes) else b"")
        return out

    def read_bytes(self, offset, size):
        # "System Bus" = domaine préféré d'EmoTracker (DefaultAddressMap) ;
        # le simulateur accepte les deux noms.
        data = self._cmd(f"CORE_READ System Bus;${offset:X};${size:X}")
        return data if isinstance(data, bytes) else b""

    def close(self):
        try:
            self.sock.close()
        except OSError:
            pass


def _watch_range(off_lo, off_hi):
    """Fusionne [off_lo, off_hi) avec la plage courante si elles se touchent."""
    if off_hi <= off_lo:
        return None
    return (off_lo, off_hi)


def compute_flag_ranges(state):
    """Plages (offset_relatif_début, offset_relatif_fin) couvrant tous les
    boutons-flag actifs — calculées depuis state.sheet (flags.json / CSV du
    Google Sheet), PAS depuis les anciennes zones codées en dur. Le watch
    lit donc exactement les octets que le web envoie à EmoTracker."""
    ranges = []
    for bid in state.order:
        b = state.buttons[bid]
        if b.get("kind") != "flag":
            continue
        off = _flag_off(b)
        if off is None:
            continue
        r = _watch_range(off, off + 1)
        if r is None:
            continue
        if ranges and r[0] <= ranges[-1][1]:
            ranges[-1] = (ranges[-1][0], max(ranges[-1][1], r[1]))
        else:
            ranges.append(r)
    return ranges


def apply_watch_to_buttons(client, state):
    """Memory watch : relit la RAM via NWA pour refléter les écritures des
    AUTRES clients (BizHawk, patchs, savestates) sur les boutons web.

    Plages lues = celles réellement utilisées par les flags de la source
    active (state.sheet / flags.json), plus la zone réservee FLAG_BASE des
    valeurs 0xXX. Les boutons sur lesquels le web vient d'agir ("dirty",
    fenêtre DIRTY_HOLD) sont ignorés : c'est le web qui ENVOIE vers
    EmoTracker, pas l'inverse, pendant le temps de propagation."""
    ranges = compute_flag_ranges(state)
    # zone valeurs 0xXX (VALUE_DEFS) : utile seulement si des boutons y vivent
    extra = _watch_range(FLAG_BASE - RAM_BASE, FLAG_BASE - RAM_BASE + 0x40)
    if extra:
        merged = sorted(ranges + [extra])
        ranges = []
        for lo, hi in merged:
            if ranges and lo <= ranges[-1][1]:
                ranges[-1] = (ranges[-1][0], max(ranges[-1][1], hi))
            else:
                ranges.append((lo, hi))
    if not ranges:
        return
    try:
        blocks = client.read_ranges([(lo, hi - lo) for lo, hi in ranges])
    except Exception:
        return
    # index global -> valeur RAM lue
    def ram_at(off):
        for (lo, hi), blk in zip(ranges, blocks):
            if isinstance(blk, bytes) and lo <= off < hi:
                return blk[off - lo]
        return None
    for bid in list(state.order):
        b = state.buttons[bid]
        if _is_dirty(b):            # envoi web récent -> pas d'écrasement
            continue
        sent = b.get("sent_at", 0)
        if sent and time.monotonic() - sent < DIRTY_HOLD:
            continue                # RAM pas encore stabilisée côté client NWA
        if b["kind"] == "address":
            off = b["value"] - 0x2000000
            v = ram_at(off)
            if v is None:
                continue
            b["ram"] = v
            if b["type"] == "Bool":
                b["on"] = v != 0
            else:
                b["count"] = v
        elif b["kind"] == "flag":
            off = _flag_off(b)
            if off is None:
                continue
            byte = ram_at(off)
            if byte is None:
                continue
            b["ram"] = byte
            on = bool(byte & b["value"])
            last = b.get("last_ram_on")
            b["last_ram_on"] = on
            if b["type"] == "Bool":
                b["on"] = on
            elif ram[off] != b["count"]:
                # Int : la RAM porte la valeur brute du compteur ; on suit
                # toute valeur externe (0x00 -> 0x01 -> 0x02 ...). Après un
                # envoi web, sent_at/DIRTY_HOLD (contrôlé plus haut) évite
                # l'effet d'écho.
                b["count"] = ram[off]


def poll_loop(state, interval=0.5):
    """Memory watch web : pousse les actions web (boutons dirty) vers la RAM
    lue par EmoTracker, lit la RAM via NWA pour la synchro inverse + heartbeat
    (ping_if_stale)."""
    while state.connected:
        c = next((cl for cl in state.clients if getattr(cl, "_is_poller", False)), None)
        if c is None:
            break
        try:
            pushed = push_buttons_to_ram(state)
            if pushed:
                state.log(f"📤 {len(pushed)} action(s) web envoyée(s) dans la RAM "
                          f"(EmoTracker les lira à son prochain watch)")
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
    args = [a for a in sys.argv[1:] if not a.startswith("-")]
    flags = {a for a in sys.argv[1:] if a.startswith("-")}
    port = int(args[0], 0) if args else 0xBEEF
    web_port = int(args[1], 0) if len(args) > 1 else 8090

    handler = Server(("127.0.0.1", port), NWASimulatorHandler)
    # RAM à 0 par défaut (tous les flags 0x00). --seed = motifs de test,
    # --savestate = autorise le chargement d'un save TMC trouvé sur disque.
    handler.ram = load_fake_ram(seed=("--seed" in flags),
                                savestate=("--savestate" in flags))
    handler.client_id = 0

    state = WebState(handler)
    # Boutons générés depuis tools/flags.json (export du Google Sheet via
    # parse_flags_csv.py) — PLUS depuis autotracking.lua.
    state.rebuild_buttons()
    state.log(f"{len(state.buttons)} boutons générés depuis "
              f"{state.sheet_source or 'flags.json'}")
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
