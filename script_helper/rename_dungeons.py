"""Script pour renommer les sections Fortress/Palace/Droplet dans Maps.json, autotracking.lua, location_mapping.lua
Applique les remplacements du plus long au plus court pour éviter les collisions.
"""

# Mapping: old location name -> new location name (Maps.json "name" fields)
FORTRESS_RENAMES = {
    "Fortress - Far Left Entrance Room": "Fortress - Entrance 1F - Left",
    "Fortress - Wizzrobe Fight": "Fortress - Entrance 1F - Left Wizzrobe",
    "Fortress - Entrance Rupee": "Fortress - Entrance 1F - Right",
    "Fortress - Left Side 2nd Floor Mitts": "Fortress - Left 2F - Dig",
    "Fortress - Left Side Left Rupees": "Fortress - Left 2F - Items",
    "Fortress - Left Side Right Rupees": "Fortress - Left 2F - Item Grabbable",
    "Fortress - Left Side 3rd Floor Mitts": "Fortress - Left 3F - Switch",
    "Fortress - Eyegores": "Fortress - Left 3F - Eyegore",
    "Fortress - Left Side Key": "Fortress - Left 3F - Item Drop",
    "Fortress - Pedestal": "Fortress - Middle 2F",
    "Fortress - Center Path Switch": "Fortress - Middle 2F - Statue",
    "Fortress - Two Lever Room Left": "Fortress - Right 2F",
    "Fortress - Two Lever Room Right": "Fortress - Right 2F - Right",
    "Fortress - Right Side 2nd Floor Mitts": "Fortress - Right 2F - Dig",
    "Fortress - Right Side 3rd Floor Mitts": "Fortress - Right 3F - Dig",
    "Fortress - Right Side Key": "Fortress - Right 3F - Item Drop",
    "Fortress - Right Side Heart Piece": "Fortress - Entrance 1F - Right HP",
    "Fortress - Bombable Wall Big Chest": "Fortress - Back 2F - Left Big Chest",
    "Fortress - Bombable Wall Chest": "Fortress - Back 2F - Left Small Chest",
    "Fortress - Clone Puzzle Key": "Fortress - Back 2F - Right Statue",
    "Fortress - Minish Dirt Room Key": "Fortress - Back 2F - Right Minish",
    "Fortress - Right Side Top Moldorm Pot": "Fortress - Back 2F - Right Dig Room Top",
    "Fortress - Right Side Left Moldorm Pot": "Fortress - Back 2F - Right Dig Room Bottom",
    "Fortress - Skull Room": "Fortress - Back 2F - Right",
}

DROPLET_RENAMES = {
    "Droplet - First Ice Block": "Droplet - Entrance B2 - East",
    "Droplet - Key Locked Ice Block": "Droplet - Entrance B2 - West",
    "Droplet - Left Path": "Droplet - Left Path B1 - Underpass",
    "Droplet - Overhang": "Droplet - Left Path B1 - Waterfall",
    "Droplet - Upper Underwater": "Droplet - Left Path B1 - Waterfall - Underwater",
    "Droplet - Lower Underwater": "Droplet - Left Path B2 - Waterfall - Underwater",
    "Droplet - Underwater Pot": "Droplet - Left Path B2 - Underwater",
    "Droplet - Post Madderpillar": "Droplet - Left Path B2 - Ice Madderpillar",
    "Droplet - Ice Puzzle Frozen": "Droplet - Left Path B2 - Ice Plain - Frozen",
    "Droplet - Ice Puzzle": "Droplet - Left Path B2 - Ice Plain",
    "Droplet - Post Ice Puzzle": "Droplet - Left Path B2 - Lilypad Corner",
    "Droplet - Right Path Ice Walkway First": "Droplet - Right Path B1 - Ice Walkway",
    "Droplet - Right Path Ice Walkway Second": "Droplet - Right Path B1 - Ice Walkway Right",
    "Droplet - Right Path Ice Walkway Pot": "Droplet - Right Path B1 - Pot",
    "Droplet - Basement Frozen": "Droplet - Right Path B3 - Frozen",
    "Droplet - Blue Chu": "Droplet - Right Path B1 - Blu Chu",
    "Droplet - Post Blue Chu Frozen": "Droplet - Right Path B2 - Frozen",
    "Droplet - Dark Maze Bottom": "Droplet - Right Path B2 - Dark Maze - Bottom",
    "Droplet - Dark Maze Bombable Wall": "Droplet - Right Path B2 - Mulldozers",
    "Droplet - Dark Maze Top Right": "Droplet - Right Path B2 - Dark Maze - Top Right",
    "Droplet - Dark Maze Top Left": "Droplet - Right Path B2 - Dark Maze - Top Left",
    "Droplet - Right Path": "Droplet - Right Path B2 - Underpass",
}

PALACE_RENAMES = {
    "Palace - Firebar Grate": "Palace - 1st Half 1F - Grate",
    "Palace - Wizzrobe Platform Fight": "Palace - 1st Half 1F - Wizzrobe",
    "Palace - Rupees": "Palace - 1st Half 2F - Items",
    "Palace - Pot Puzzle Key": "Palace - 1st Half 3F - Pot Puzzle",
    "Palace - Moblin Archer Chest": "Palace - 1st Half 4F - Bow Moblins",
    "Palace - Flail Soldiers": "Palace - 1st Half 5F - Ball And Chain Soldiers",
    "Palace - Spark": "Palace - 1st Half 5F - Fan Loop",
    "Palace - Pre Big Key Door": "Palace - 1st Half 5F",
    "Palace - Dark Room Big Chest": "Palace - 2nd Half 1F - Dark Room",
    "Palace - Dark Room Chest": "Palace - 2nd Half 1F - Dark Room - Small",
    "Palace - Roller": "Palace - 2nd Half 2F - Many Rollers",
    "Palace - Twin Wizzrobe Fight": "Palace - 2nd Half 2F - Twin Wizzrobes",
    "Palace - Firerobe Fight": "Palace - 2nd Half 3F - Fire Wizzrobes",
    "Palace - Heart Piece": "Palace - 2nd Half 4F",
    "Palace - Switch": "Palace - 2nd Half 4F - Switch Hit",
    "Palace - Bombarossa Maze": "Palace - 2nd Half 5F - Bombarossa",
    "Palace - Block Maze Room Detour": "Palace - 2nd Half 5F - Right Side",  # MUST be before "Block Maze Room"
    "Palace - Block Maze Room": "Palace - 2nd Half 4F - Block Maze",
}

ALL_RENAMES = {}
ALL_RENAMES.update(FORTRESS_RENAMES)
ALL_RENAMES.update(DROPLET_RENAMES)
ALL_RENAMES.update(PALACE_RENAMES)

# No section renames needed - section names in Maps.json stay as-is (Rupees, etc.)
# The autotracking references must match the Maps.json section names exactly.
SECTION_RENAMES = {}


def apply_renames_sorted(text, renames):
    """Apply renames sorted by key length (longest first) to avoid substring collisions."""
    for old in sorted(renames.keys(), key=len, reverse=True):
        new = renames[old]
        text = text.replace(old, new)
    return text


def process_file(filepath, loc_renames, sec_renames=None):
    """Process a file: first apply location renames, then section renames."""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        new_content = apply_renames_sorted(content, loc_renames)
        if sec_renames:
            new_content = apply_renames_sorted(new_content, sec_renames)
        if new_content != content:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"  Updated {filepath}")
        else:
            print(f"  No changes in {filepath}")
    except FileNotFoundError:
        print(f"  NOT FOUND: {filepath}")


BASE = r"d:\git\emotracker\BetaTmcrTrackerDeoxis"

print("=== Renaming Maps.json location names ===")
maps_files = [
    f"{BASE}/emo/json/locations/Maps.json",
    f"{BASE}/pop/json/locations/Maps.json",
]
# For Maps.json: rename "name": "Old Name" -> "name": "New Name"
maps_loc_renames = {f'"name": "{old}"': f'"name": "{new}"' for old, new in ALL_RENAMES.items()}
for f in maps_files:
    process_file(f, maps_loc_renames)

print("\n=== Renaming autotracking.lua map section references ===")
# Pass 1: "@OldName/" -> "@NewName/"
lua_loc_renames = {f"@{old}/": f"@{new}/" for old, new in ALL_RENAMES.items()}
# Pass 2: rename section names
lua_sec_renames = {f'"@{k}"': f'"@{v}"' for k, v in SECTION_RENAMES.items()}

autotracking_files = [
    f"{BASE}/emo/scripts/autotracking/autotracking.lua",
    f"{BASE}/emo/scripts/autotracking/autotracking_testing.lua",
    f"{BASE}/pop/scripts/Luaconnetor/autotracking.lua",
    f"{BASE}/pop/scripts/Luaconnetor/autotracking_testing.lua",
]
for f in autotracking_files:
    process_file(f, lua_loc_renames, lua_sec_renames)

print("\n=== Renaming location_mapping.lua map references ===")
# Pass 1: {"@OldName/ -> {"@NewName/
mapping_loc_renames = {f'"@{old}/': f'"@{new}/' for old, new in ALL_RENAMES.items()}
# Pass 2: rename section names (full string with closing quote)
mapping_sec_renames = {f'"@{k}"': f'"@{v}"' for k, v in SECTION_RENAMES.items()}

mapping_files = [
    f"{BASE}/pop/scripts/autotracking/location_mapping.lua",
]
for f in mapping_files:
    process_file(f, mapping_loc_renames, mapping_sec_renames)

print("\nDone!")
