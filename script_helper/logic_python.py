#!/usr/bin/env python3
"""
logic_python.py
Lit defauld.logic, parse les blocs !ifdef/!else/!endif, et génère les fichiers
Lua dans scripts/logic_new/ :

  common/{HelperName}.lua   -- 1 fichier par helper
  common/init.lua           -- ScriptHost:LoadScript(ScriptLogicCommon.."*.lua")
  overworld/{ZoneName}.lua  -- toutes les fonctions de la zone
  dungeons/{ZoneName}.lua   -- idem pour les donjons

Logique multi-branches :
  !ifdef OPENWORLD_ON           --> if has("openworld_on") then return 1
      Func; Helper;; <vide>
  !else
      Func; Helper;; (|A, B)    --> elseif ( A or B ) then return 1
  !endif                            else return 0

Usage:
  python logic_python.py                   # apercu
  python logic_python.py --area Castle     # seulement Castle
  python logic_python.py --list            # liste brute
  python logic_python.py --apply           # ecrit dans scripts/logic_new/
  python logic_python.py --apply --yes     # sans confirmation
"""

import re
import sys
import difflib
from pathlib import Path

# ──────────────── Paths ──────────────────────────────────────────────────────
ROOT       = Path(__file__).resolve().parent.parent
LOGIC_FILE = Path(__file__).resolve().parent / "defauld.logic"
OUT_ROOT   = ROOT / "scripts" / "logic_new"

# ──────────────── Items.X -> Lua has() ───────────────────────────────────────
ITEM_TO_LUA: dict[str, str] = {
    "Items.Flippers":        'has("flippers")',
    "Items.RocsCape":        'has("cape")',
    "Items.MoleMitts":       'has("mitts")',
    "Items.Bombs":           'has("bombs")',
    "Items.BombBag":         'has("bombs")',
    "Items.Bombs10":         'has("bombs")',
    "Items.Bombs30":         'has("bombs30")',
    "Items.Bow":             'has("bow")',
    "Items.LightBow":        'has("lights")',
    "Items.Lantern":         'has("lamp")',
    "Items.GustJar":         'has("gust")',
    "Items.PacciCane":       'has("cane")',
    "Items.CaneOfPacci":     'has("cane")',
    "Items.GripRing":        'has("grip")',
    "Items.PegasusBoots":    'has("boots")',
    "Items.SpinAttack":      'has("spinattack")',
    "Items.PowerBracelets":  'has("bracelets")',
    "Items.Shield":          'has("shield")',
    "Items.MirrorShield":    'has("mirrorshield")',
    "Items.SwordBeam":       'has("swordbeam")',
    "Items.Boomerang":       'has("boomerang")',
    "Items.MagicBoomerang":  'has("magicboomerang")',
    "Items.Ocarina":         'has("ocarina")',
    "Items.LonLonKey":       'has("lonlonkey")',
    "Items.WakeUpMushroom":  'has("mushroom")',
    "Items.DogFoodBottle":   'has("dogfood")',
    "Items.RedBook":         'has("book1")',
    "Items.GreenBook":       'has("book2")',
    "Items.BlueBook":        'has("book3")',
    # Swords
    "Items.SmithSword":      'has("smithsword")',
    "Items.GreenSword":      'has("greensword")',
    "Items.RedSword":        'has("redsword")',
    "Items.BlueSword":       'has("bluesword")',
    "Items.FourSword":       'has("foursword")',
    # Elements
    "Items.EarthElement":    'has("earth")',
    "Items.FireElement":     'has("fire")',
    "Items.WaterElement":    'has("water")',
    "Items.WindElement":     'has("wind")',
    # Misc
    "Items.Wallet":          'has("wallet")',
    "Items.RollAttack":      'has("rollattack")',
    "Items.RockBreaker":     'has("rockbreaker")',
    "Items.TingleTrophy":    'has("open_tingle_yes")',
    # Big keys (by dungeon ID)
    "Items.BigKey.0x18":     'has("dws_bigkey")',
    "Items.BigKey.0x19":     'has("cof_bigkey")',
    "Items.BigKey.0x1A":     'has("fow_bigkey")',
    "Items.BigKey.0x1B":     'has("tod_bigkey")',
    "Items.BigKey.0x1C":     'has("pow_bigkey")',
    "Items.BigKey.0x1D":     'has("dhc_bigkey")',
    "Items.BigKey.0x1E":     'has("ud_bigkey")',
    # Small keys (single key check, count>=2 handled by + operator)
    "Items.SmallKey.0x18":   'has("dws_smallkey")',
    "Items.SmallKey.0x19":   'has("cof_smallkey")',
    "Items.SmallKey.0x1C":   'has("pow_smallkey")',
    "Items.SmallKey.0x1D":   'has("dhc_smallkey")',
    "Items.SmallKey.0x1E":   'has("ud_smallkey")',
    # Progressive items — 0x00=Swords, 0x01=Bow/LightArrow, 0x02=Boomerang,
    #                      0x03=Shield/Mirror, 0x04=SpinAttack levels
    "Items.ProgressiveItem.0x00": 'has("smithsword")',   # any sword (level 1+)
    "Items.ProgressiveItem.0x01": 'has("bow")',
    "Items.ProgressiveItem.0x02": 'has("boomerang")',
    "Items.ProgressiveItem.0x03": 'has("shield")',
    "Items.ProgressiveItem.0x04": 'has("spinattack")',
    # Sword techniques
    "Items.DashAttack":      'has("dashattack")',
    "Items.DownThrust":      'has("downthrust")',
    "Items.FastSpin":        'has("fastspin")',
    "Items.FastSplit":       'has("fastsplit")',
    "Items.GreatSpin":       'has("greatspin")',
    "Items.LongSpin":        'has("longspin")',
    "Items.PerilBeam":       'has("perilbeam")',
    # Other items
    "Items.CarlovMedal":     'has("carlov")',
    "Items.GraveyardKey":    'has("gravekey")',
    "Items.JabberNut":       'has("jabber")',
    "Items.LightArrow":      'has("lights")',
    "Items.Kinstone.GoldenFalls": 'has("falls")',
    # Reward/drops — not trackable access items; skip
    "Items.Shells.100":      None,
    "Items.Rupee100":        None,
    "Items.Rupee200":        None,
    "Items.Untyped.0xFF":    None,
}

# ──────────────── Zones -> sous-dossier ──────────────────────────────────────
DUNGEON_ZONES = {
    "DHC", "DarkHyruleCastle",
    "DeepwoodShrine", "DWS",
    "CaveOfFlames", "CaveOfFlame", "CoF",
    "FortressOfWinds", "FortressOfWind", "FoW",
    "TempleOfDroplets", "TempleOfDroplet", "ToD",
    "RoyalCrypt", "Crypt", "RC",
    "PalaceOfWinds", "PalaceOfWind", "PoW",
}

# ──────────────── Logic Parser (arbre) ───────────────────────────────────────

def tokenize(expr: str) -> list[str]:
    tokens: list[str] = []
    i = 0
    while i < len(expr):
        c = expr[i]
        if c in "()":
            tokens.append(c); i += 1
        elif c in "|&":
            tokens.append(c); i += 1
        elif c == ',':
            tokens.append(','); i += 1
        elif c in ' \t\n':
            i += 1
        else:
            j = i
            while j < len(expr) and expr[j] not in " \t\n(),":
                j += 1
            tokens.append(expr[i:j]); i = j
    return tokens


class Parser:
    def __init__(self, tokens: list[str]):
        self.tokens = tokens
        self.pos    = 0

    def peek(self) -> str | None:
        return self.tokens[self.pos] if self.pos < len(self.tokens) else None

    def consume(self, expected: str | None = None) -> str:
        tok = self.tokens[self.pos]
        if expected and tok != expected:
            raise ValueError(f"Expected '{expected}', got '{tok}'")
        self.pos += 1
        return tok

    def parse_expr(self) -> object:
        if self.peek() == "(":
            self.consume("(")
            op   = self.consume()
            args = []
            while self.peek() != ")":
                if self.peek() == ",":
                    self.consume(","); continue
                args.append(self.parse_expr())
            self.consume(")")
            return (op, args)
        return self.consume()

    def parse_top(self) -> object:
        terms = []
        while self.pos < len(self.tokens):
            if self.peek() == ",":
                self.consume(","); continue
            terms.append(self.parse_expr())
        if len(terms) == 1:
            return terms[0]
        return ("&", terms)


def parse_logic(s: str) -> object | None:
    s = s.strip()
    if not s:
        return None
    toks = tokenize(s)
    return Parser(toks).parse_top() if toks else None


# ──────────────── Arbre -> condition Lua (niveau 1) ──────────────────────────

SKIP_NODES   = {"Helpers.Hundo"}
ALWAYS_FALSE = {"Helpers.Inaccessible"}
UNKNOWN_ITEMS: set[str] = set()


def tree_to_lua(node: object) -> str | None:
    if node is None:
        return None
    if isinstance(node, str):
        if node in SKIP_NODES:
            return None
        if node in ALWAYS_FALSE:
            return "false"
        if node.startswith("Items."):
            # Strip count suffix e.g. Items.X:2 -> Items.X
            base = node.split(":")[0]
            for key in (node, base):
                if key in ITEM_TO_LUA:
                    lua = ITEM_TO_LUA[key]
                    return None if lua is None else lua
            # Dynamic patterns
            if base.startswith("Items.Fusion.0x"):
                slot = base[len("Items.Fusion.0x"):].lower()
                return f'has("fusions{slot}")'
            if base.startswith("Items.Bottle"):
                return 'has("bottle")'
            if base.startswith("Items.SmallKey."):
                dungeon_hex = base[len("Items.SmallKey.0x"):].lower()
                return f'has("???_smallkey_{dungeon_hex}")'
            if base in ("Items.Untyped.0xFF", "Items.Entrance.0x01",
                        "Items.Entrance.0x02", "Items.Entrance.0x03",
                        "Items.Entrance.0x04", "Items.Entrance.0x05",
                        "Items.Entrance.0x06"):
                return None  # internal/untracked
            UNKNOWN_ITEMS.add(node)
            return f'has("???_{node[6:]}")'
        if node.startswith(("Helpers.", "Locations.")):
            name = node.split(".", 1)[1]
            return f'function_Cached("{name}")==1'
        return None

    op, args = node

    if op == "|":
        ch = [c for c in (tree_to_lua(a) for a in args) if c is not None]
        if not ch:   return None
        if len(ch) == 1: return ch[0]
        return "( " + " or ".join(ch) + " )"

    if op in ("&", ","):
        ch = [c for c in (tree_to_lua(a) for a in args) if c is not None]
        if not ch:   return None
        if len(ch) == 1: return ch[0]
        return "( " + " and ".join(ch) + " )"

    if op == "+":
        return f'-- TODO count: {args}'

    return None


def lua_condition(logic_str: str) -> str | None:
    return tree_to_lua(parse_logic(logic_str))


# ──────────────── Lecture defauld.logic avec ifdef/else/endif ────────────────

_LOC_RE = re.compile(r'^([A-Za-z_][A-Za-z0-9_]*)\b')

# Branch = (condition_lua: str|None, logic_str: str)
#   condition_lua = None  -> pas de condition (else de tête ou sans ifdef)
#   condition_lua = str   -> e.g. 'has("openworld_on")'

def parse_logic_file(path: Path) -> list[tuple[str, str, list[tuple]]]:
    """
    Retourne [(name, type, branches), ...]
    branches = [(condition_lua, logic_str), ...]
    """
    # Stack: [(ifdef_type, define_name, in_else), ...]
    stack: list[tuple[str, str, bool]] = []

    entries: dict[tuple[str, str], list[tuple]] = {}
    order:   list[tuple[str, str]]              = []

    def current_condition() -> str | None:
        if not stack:
            return None
        # Top-level else = condition implicite (pas besoin de la repeter)
        if len(stack) == 1 and stack[0][2]:
            return None
        conditions = []
        for ifdef_type, define, in_else in stack:
            lua_has = f'has("{define.lower()}")'
            if ifdef_type == "ifdef":
                cond = f"not {lua_has}" if in_else else lua_has
            else:   # ifndef
                cond = lua_has if in_else else f"not {lua_has}"
            conditions.append(cond)
        if len(conditions) == 1:
            return conditions[0]
        return "( " + " and ".join(conditions) + " )"

    with open(path, encoding="utf-8", errors="replace") as f:
        for raw in f:
            line = raw.strip()
            if not line:
                continue

            # -- Directives de controle de flux --
            if line.startswith("!ifdef"):
                m = re.match(r'!ifdef\s+-\s+(\S+)', line)
                if m:
                    stack.append(("ifdef", m.group(1), False))
                continue

            if line.startswith("!ifndef"):
                m = re.match(r'!ifndef\s+-\s+(\S+)', line)
                if m:
                    stack.append(("ifndef", m.group(1), False))
                continue

            if line.startswith("!else"):
                if stack:
                    t, d, _ = stack[-1]
                    stack[-1] = (t, d, True)
                continue

            if line.startswith("!endif"):
                if stack:
                    stack.pop()
                continue

            if line.startswith("#") or line.startswith("!"):
                continue

            if ";" not in line:
                continue

            m = _LOC_RE.match(line)
            if not m:
                continue

            name   = m.group(1)
            fields = [x.strip() for x in line.split(";")]
            if len(fields) < 4:
                continue

            clean_f1 = re.sub(r'`[^`]*`', '', fields[1]).strip()
            raw_type = clean_f1.split()[0] if clean_f1 else ""

            KNOWN_TYPES = {"Helper", "Any", "Dungeon", "Music", "Unshuffled",
                           "OverworldConstraint", "DungeonConstraint", "DungeonEntrance",
                           "Boss", "AnyChest"}
            # 4-field entries without a type keyword: Name; Address; Logic; Item
            if len(fields) == 4 and raw_type not in KNOWN_TYPES:
                logic_idx = 2
            else:
                logic_idx = 3

            if len(fields) <= logic_idx:
                continue
            logic = re.sub(r'\s*#.*$', '', fields[logic_idx]).strip()
            if not raw_type:
                raw_type = "Any"
            cond     = current_condition()

            key = (name, raw_type)
            if key not in entries:
                order.append(key)
                entries[key] = []

            entries[key].append((cond, logic))

    return [(name, t, entries[(name, t)]) for name, t in order]


# ──────────────── Génération fonction Lua multi-branches ─────────────────────

def generate_function(name: str, branches: list[tuple]) -> str:
    """
    Génère la fonction Lua en tenant compte de toutes les branches conditionnelles.

    Règle par branche (cond, logic) :
      cond non-None, logic vide  -> if [cond] then return 1
      cond non-None, logic plein -> if [cond] and [lua_logic] then return 1
      cond None,     logic vide  -> return 1  (toujours accessible)
      cond None,     logic plein -> if [lua_logic] then return 1
    """
    lines = [f"function {name}()"]

    first_if = True

    for cond, logic_str in branches:
        lua_logic = lua_condition(logic_str)

        # Condition Lua complete de cette branche
        if cond is not None and lua_logic is not None:
            full_cond = f"( {cond} ) and ( {lua_logic} )"
        elif cond is not None:
            full_cond = cond
        elif lua_logic is not None:
            full_cond = lua_logic
        else:
            # pas de condition + pas de logique = toujours vrai
            lines.append("\treturn 1")
            lines.append("end")
            return "\n".join(lines)

        keyword = "if" if first_if else "elseif"
        lines.append(f"\t{keyword} ( {full_cond} ) then")
        lines.append("\t\treturn 1")
        first_if = False

    if not first_if:
        lines.append("\telse")
        lines.append("\t\treturn 0")
        lines.append("\tend")
    else:
        # Aucune branche n'a produit de condition -> jamais accessible
        lines.append("\treturn 0")

    lines.append("end")
    return "\n".join(lines)


# ──────────────── Routage vers sous-dossier/fichier ──────────────────────────

def route(name: str, loc_type: str) -> tuple[str, str]:
    """
    ("common", name)       -> common/{name}.lua      (helpers)
    ("dungeons", prefix)   -> dungeons/{prefix}.lua
    ("overworld", prefix)  -> overworld/{prefix}.lua
    """
    if loc_type == "Helper":
        return ("common", name)
    prefix = name.split("_")[0]
    if prefix in DUNGEON_ZONES:
        return ("dungeons", prefix)
    return ("overworld", prefix)


# ──────────────── Lecture fonctions Lua existantes ───────────────────────────

_FUNC_RE = re.compile(
    r'^(function\s+(\w+)\s*\(\).*?^end)',
    re.MULTILINE | re.DOTALL
)


def read_lua_functions(path: Path) -> dict[str, str]:
    if not path.exists():
        return {}
    return {m.group(2): m.group(1) for m in _FUNC_RE.finditer(path.read_text(encoding="utf-8"))}


def find_existing_func(name: str, subdir: str) -> tuple[Path | None, str]:
    """Cherche une fonction dans scripts/logic/{subdir}/*.lua"""
    src_dir = ROOT / "scripts" / "logic" / subdir
    if not src_dir.exists():
        return None, ""
    for p in src_dir.glob("*.lua"):
        funcs = read_lua_functions(p)
        if name in funcs:
            return p, funcs[name]
    return None, ""


# ──────────────── Couleurs console ───────────────────────────────────────────

C = "\033[96m"; G = "\033[92m"; R = "\033[91m"
Y = "\033[93m"; B = "\033[1m";  X = "\033[0m"


def color_diff(old: str, new: str, label: str) -> str:
    diff = list(difflib.unified_diff(
        old.splitlines(keepends=True), new.splitlines(keepends=True),
        fromfile=f"{label} (existant)", tofile=f"{label} (logic_new)",
        lineterm="",
    ))
    if not diff:
        return ""
    out = []
    for line in diff:
        if line.startswith(("+++", "---")): out.append(B + line + X)
        elif line.startswith("+"):           out.append(G + line + X)
        elif line.startswith("-"):           out.append(R + line + X)
        elif line.startswith("@@"):          out.append(C + line + X)
        else:                                out.append(line)
    return "\n".join(out)


# ──────────────── Main ───────────────────────────────────────────────────────

def main():
    import argparse
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument("--area",  help="Zone uniquement (ex: Castle, SouthField)")
    ap.add_argument("--apply", action="store_true",
                    help="Ecrire dans scripts/logic_new/")
    ap.add_argument("--yes",   action="store_true",
                    help="Sans confirmation")
    ap.add_argument("--list",  action="store_true",
                    help="Afficher la logique brute de chaque entree")
    args = ap.parse_args()

    if not LOGIC_FILE.exists():
        print(f"{R}Fichier introuvable : {LOGIC_FILE}{X}"); sys.exit(1)

    print(f"{B}Lecture de {LOGIC_FILE.name}...{X}")
    all_entries = parse_logic_file(LOGIC_FILE)
    print(f"  -> {len(all_entries)} entrees\n")

    # Filtre zone (pas les helpers quand --area est specifie)
    if args.area:
        all_entries = [e for e in all_entries if e[0].startswith(args.area)]

    # ── Mode liste brute ──────────────────────────────────────────────────────
    if args.list:
        for name, loc_type, branches in all_entries:
            subdir, fname = route(name, loc_type)
            print(f"{C}{name}{X}  [{subdir}/{fname}.lua]  type={loc_type}")
            for i, (cond, logic) in enumerate(branches):
                tag = f"branch[{i}]"
                print(f"  {tag} cond  : {cond or '(aucune)'}")
                print(f"  {tag} logic : {logic or '(aucune)'}")
                lua = lua_condition(logic)
                print(f"  {tag} lua   : {lua or 'return 1'}")
            print()
        if UNKNOWN_ITEMS:
            print(f"{R}Items sans mapping ITEM_TO_LUA :{X}")
            for it in sorted(UNKNOWN_ITEMS): print(f"  {it}")
        return

    # ── Groupement par fichier de sortie ──────────────────────────────────────
    # (subdir, fname) -> [(name, branches, generated_func)]
    groups: dict[tuple[str, str], list[tuple]] = {}
    for name, loc_type, branches in all_entries:
        subdir, fname = route(name, loc_type)
        gen = generate_function(name, branches)
        groups.setdefault((subdir, fname), []).append((name, branches, gen))

    if not groups:
        print(f"{Y}Aucune entree trouvee.{X}"); return

    # ── Comparaison avec l'existant ───────────────────────────────────────────
    files_to_write: dict[tuple[str, str], str] = {}

    for (subdir, fname), locs in sorted(groups.items()):
        print(f"{B}{'-'*70}{X}")
        print(f"{B}logic_new/{subdir}/{fname}.lua{X}")

        diff_count = 0
        blocks: list[str] = []

        for name, branches, generated in locs:
            blocks.append(generated)
            _, current = find_existing_func(name, subdir)
            # Aussi chercher dans common/ pour les helpers
            if not current and subdir == "common":
                _, current = find_existing_func(name, "common")

            nc = re.sub(r'\s+', ' ', current).strip()
            ng = re.sub(r'\s+', ' ', generated).strip()

            if not current:
                print(f"  {Y}[NOUVEAU]{X} {name}")
                for cond, logic in branches:
                    print(f"    cond={cond or 'none'}  logic={logic or 'vide'}")
                diff_count += 1
            elif nc != ng:
                print(f"\n  {R}[DIFF]{X} {name}")
                for cond, logic in branches:
                    print(f"    cond={cond or 'none'}  logic={logic or 'vide'}")
                print(color_diff(current, generated, name))
                diff_count += 1

        if diff_count == 0:
            print(f"  {G}OK - identique{X}")

        files_to_write[(subdir, fname)] = "\n\n".join(blocks) + "\n"

    # ── common/init.lua ───────────────────────────────────────────────────────
    INIT = (
        '-- Auto-generated by logic_python.py\n'
        'ScriptHost:LoadScript(ScriptLogicCommon.."*.lua")\n'
    )
    files_to_write[("common", "_init")] = INIT
    print(f"\n{B}common/init.lua{X}  (wildcard loader)")

    # ── Items inconnus ────────────────────────────────────────────────────────
    if UNKNOWN_ITEMS:
        print(f"\n{R}Items sans mapping ITEM_TO_LUA :{X}")
        for it in sorted(UNKNOWN_ITEMS): print(f"  {it}")

    total_funcs = sum(len(v) for v in groups.values())
    total_files = len(files_to_write)
    print(f"\n{B}-> {total_funcs} fonction(s) dans {total_files} fichier(s) -> scripts/logic_new/{X}")

    # ── Application ──────────────────────────────────────────────────────────
    if not args.apply:
        print(f"{Y}Mode apercu - ajouter --apply pour ecrire dans scripts/logic_new/.{X}")
        return

    if not args.yes:
        rep = input(f"\n{B}Ecrire dans scripts/logic_new/ ? [o/N] {X}").strip().lower()
        if rep not in ("o", "oui", "y", "yes"):
            print("Annule."); return

    for (subdir, fname), content in files_to_write.items():
        out = OUT_ROOT / subdir / ("init.lua" if fname == "_init" else f"{fname}.lua")
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(content, encoding="utf-8")
        print(f"{G}Ecrit : scripts/logic_new/{subdir}/{out.name}{X}")

    print(f"\n{G}Termine - deplacez les fichiers un par un depuis scripts/logic_new/.{X}")


if __name__ == "__main__":
    main()
