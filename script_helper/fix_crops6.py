#!/usr/bin/env python3
import json
import copy
import os
from PIL import Image, ImageDraw

BASE_DIR = r"d:\git\emotracker\BetaTmcrTrackerDeoxis"

# Crop definitions: (left, top, width, height)
NEW_CROPS = {
    "castle":       (990,  128,  670, 352),
    "clouds":       (1980, 128,  1421, 1309),
    "crenel":       (0,    0,    670, 1118),
    "falls":        (1661, 0,    319, 800),
    "hills":        (1661, 1440, 319, 668),
    "hylia":        (2140, 799,  511, 638),
    "lonlon":       (1661, 799,  479, 641),
    "minishwoods":  (1980, 1437, 671, 671),
    "northfield":   (990,  480,  671, 531),
    "ruins":        (0,    1757, 670, 351),
    "southfield":   (990,  1659, 671, 448),
    "swamp":        (0,    1118, 670, 640),
    "town":         (990,  1011, 671, 639),
    "trilby":       (671,  799,  319, 630),
    "valley":       (670,  128,  319, 672),
    "westernwoods": (671,  1420, 319, 688),
}

# Map from JSON filename to (map_name, crop_x, crop_y)
REGION_FILE_MAP = {
    "Castle.json":           ("map_castle",       990,  128),
    "Clouds.json":           ("map_clouds",       1980, 128),
    "Crenel.json":           ("map_crenel",       0,    0),
    "CrenelBase.json":       ("map_crenel",       0,    0),
    "Falls.json":            ("map_falls",        1661, 0),
    "FallsLower.json":       ("map_falls",        1661, 0),
    "Hills.json":            ("map_hills",        1661, 1440),
    "Hylia.json":            ("map_hylia",        2140, 799),
    "LonLon.json":           ("map_lonlon",       1661, 799),
    "MinishWoods.json":      ("map_minishwoods",  1980, 1437),
    "NorthField.json":       ("map_northfield",   990,  480),
    "Ruins.json":            ("map_ruins",        0,    1757),
    "SouthField.json":       ("map_southfield",   990,  1659),
    "Swamp.json":            ("map_swamp",        0,    1118),
    "Town.json":             ("map_town",         990,  1010),
    "Trilby.json":           ("map_trilby",       671,  799),
    "Valley.json":           ("map_valley",       671,  128),
    "WesternWoods.json":     ("map_westernwoods", 671,  1420),
    # Dungeons.json : chaque location a plusieurs positions → tout géré via OVERRIDES
    "Dungeons.json":         ("map_castle",       990,  128),
}

# ==============================================================================
# MASQUES TRANSPARENTS
# Zones rendues transparentes dans l'image après le crop.
# Format : { "crop_name": [(ow_x1, ow_y1, ow_x2, ow_y2), ...] }
# Coordonnées overworld. None = jusqu'au bord de l'image cropée.
# ==============================================================================
CROP_MASKS = {
    "clouds": [
        (1980, 798, 2651, None),  # Zone sol : x=[1980→2777], y=[800→bas]
    ],
}

# ==============================================================================
# CAS PARTICULIERS
# Certaines locations doivent aller sur une map différente de leur fichier,
# ou ont plusieurs positions overworld pointant vers des maps différentes.
#
# Format par entrée (dans l'ordre des positions overworld "map": "map") :
#   ("map_name", crop_x, crop_y)     → auto : region_x = overworld_x - crop_x
#   ("map_name", "manual", x, y)     → manuel : coordonnées directes sur la map
#   None                             → ignorer cette position overworld
# ==============================================================================

# Les 8 positions overworld partagées par toutes les locations régulières de Dungeons.json
# (chaque position = entrée d'un donjon sur l'overworld, dans l'ordre des entrées "map")
_DUNGEON_ALL_POSITIONS = [
    ("map_hylia",       2140, 799),   # pos 1 : TOD  (2337, 1060)  → x=197,  y=260
    ("map_clouds",      1980, 128),   # pos 2 : POW  (2304, 245)   → x=324,  y=117
    ("map_ruins",       0,    1757),  # pos 3 : FOW  (591,  1777)  → x=591,  y=20
    ("map_crenel",      0,    0),     # pos 4 : COF  (325,  233)   → x=325,  y=233
    ("map_valley",      670,  128),   # pos 5 : Crypt(830,  165)   → x=160,  y=37
    ("map_minishwoods", 1980, 1437),  # pos 6 : DWS  (2284, 1842)  → x=304,  y=405
    ("map_castle",      990,  128),   # pos 7 : DHC  (1326, 164)   → x=336,  y=36
    ("map_castle",      990,  128),   # pos 8 : DHC  (1060, 188)   → x=70,   y=60
]

OVERRIDES = {

    "Dungeons.json": {
        # Locations régulières — 8 positions overworld chacune (toutes les entrées possibles)
        "Cave Of Flame": _DUNGEON_ALL_POSITIONS,
        "Crypt":         _DUNGEON_ALL_POSITIONS,
        "DeepWoods":     _DUNGEON_ALL_POSITIONS,
        "Fortress":      _DUNGEON_ALL_POSITIONS,
        "Palace":        _DUNGEON_ALL_POSITIONS,
        "Droplet":       _DUNGEON_ALL_POSITIONS,
        "DHC":           _DUNGEON_ALL_POSITIONS,
        # Entrées spécifiques — une position chacune
        "Droplet Entrance":            [("map_hylia",       2140, 799)],   # x=197,  y=260
        "Palace Entrance":             [("map_clouds",      1980, 128)],   # x=324,  y=117
        "Fortress Entrance":           [("map_ruins",       0,    1757)],  # x=591,  y=20
        "Cave Of Flame Entrance":      [("map_crenel",      0,    0)],     # x=325,  y=233
        "Crypt Entrance":              [("map_valley",      670,  128)],   # x=160,  y=37
        "Deepwoods Entrance":          [("map_minishwoods", 1980, 1437)],  # x=304,  y=405
        "Dark Hyrule Castle Entrance": [
            ("map_castle", 990, 128),  # pos 1 : (1326, 164) → x=336, y=36
            ("map_castle", 990, 128),  # pos 2 : (1060, 188) → x=70,  y=60
        ],
    },

    "FallsLower.json": {
        "Falls Lower - Lon Lon - Fusion": [
            ("map_lonlon", 1661, 799),    # x=112, y=26
        ],
    },

    "Hylia.json": {
        # Géographiquement dans la zone LonLon, pas Hylia
        "Hylia - Cape Cave - Lon Lon": [
            ("map_lonlon", 1661, 799),          # x=356, y=78
        ],
        # En dehors du crop Hylia (y=1480 hors bounds), appartient à MinishWoods
        "Hylia South - Minish Hole": [
            ("map_minishwoods", 1980, 1437),    # x=634, y=43
        ],
    },

    "Valley.json": {
        # overworld x=1059 est dans la colonne NorthField (x=990-1661), pas Valley
        "Valley - Pre Valley Fusion": [
            ("map_northfield", 990, 480),       # x=69, y=47
        ],
    },

    "Clouds.json": {
        # pos 1 (x=2305, y=360) → map_clouds : x=325, y=232
        # pos 2 (x=1379, y=1826) → map_southfield : x=389, y=167
        "Wind Tribe": [
            ("map_clouds",     1980, 128),
            ("map_southfield", 990,  1659),
        ],
    },
}


# ==============================================================================
# SCRIPT
# ==============================================================================

def apply_override(overworld_entries, override_list):
    """Génère les nouvelles entrées region selon les overrides."""
    new_entries = []
    for i, ml in enumerate(overworld_entries):
        if i >= len(override_list):
            break
        rule = override_list[i]
        if rule is None:
            continue
        map_name = rule[0]
        if rule[1] == "manual":
            entry = copy.deepcopy(ml)
            entry["map"] = map_name
            entry["x"] = rule[2]
            entry["y"] = rule[3]
        else:
            crop_x, crop_y = rule[1], rule[2]
            entry = copy.deepcopy(ml)
            entry["map"] = map_name
            entry["x"] = ml["x"] - crop_x
            entry["y"] = ml["y"] - crop_y
        new_entries.append(entry)
    return new_entries


# Collecte de toutes les maps region à nettoyer (standard + overrides)
ALL_REGION_MAP_NAMES = set(v[0] for v in REGION_FILE_MAP.values())
for file_overrides in OVERRIDES.values():
    for loc_entries in file_overrides.values():
        for entry in loc_entries:
            if entry is not None:
                ALL_REGION_MAP_NAMES.add(entry[0])

# Step 1: Crop new PNGs
overworld_path = os.path.join(BASE_DIR, "images", "maps", "overworld.png")
overworld_img = Image.open(overworld_path)
out_dir = os.path.join(BASE_DIR, "images", "maps", "overworld")
os.makedirs(out_dir, exist_ok=True)

for region, (x, y, w, h) in NEW_CROPS.items():
    cropped = overworld_img.crop((x, y, x + w, y + h))

    # Appliquer les masques transparents
    if region in CROP_MASKS:
        cropped = cropped.convert("RGBA")
        draw = ImageDraw.Draw(cropped)
        for (ow_x1, ow_y1, ow_x2, ow_y2) in CROP_MASKS[region]:
            left   = max(0, ow_x1 - x)
            top    = max(0, ow_y1 - y)
            right  = (ow_x2 - x) if ow_x2 is not None else w
            bottom = (ow_y2 - y) if ow_y2 is not None else h
            right  = min(right, w)
            bottom = min(bottom, h)
            if left < right and top < bottom:
                draw.rectangle([left, top, right - 1, bottom - 1], fill=(0, 0, 0, 0))
                print(f"  Transparent mask ({ow_x1},{ow_y1})-({ow_x2},{ow_y2})"
                      f" → image ({left},{top})-({right},{bottom}) in {region}.png")

    out_path = os.path.join(out_dir, f"{region}.png")
    cropped.save(out_path)
    print(f"Saved {region}.png ({w}x{h})")

# Step 2: Update JSON files in both emo and pop
for prefix in ["emo", "pop"]:
    for filename, (map_name, ox, oy) in REGION_FILE_MAP.items():
        path = os.path.join(BASE_DIR, prefix, "json", "locations", filename)
        if not os.path.exists(path):
            print(f"Skipping {prefix}/{filename} (not found)")
            continue

        with open(path, "r", encoding="utf-8") as f:
            data = json.load(f)

        file_overrides = OVERRIDES.get(filename, {})
        modified = False

        for loc in data:
            if "map_locations" not in loc:
                continue

            loc_name = loc.get("name", "")

            # Supprimer les entrées region existantes (standard + overrides)
            maps_to_remove = {map_name}
            if loc_name in file_overrides:
                for entry in file_overrides[loc_name]:
                    if entry is not None:
                        maps_to_remove.add(entry[0])
            loc["map_locations"] = [ml for ml in loc["map_locations"] if ml["map"] not in maps_to_remove]

            overworld_entries = [ml for ml in loc["map_locations"] if ml["map"] == "map"]

            if loc_name in file_overrides:
                new_entries = apply_override(overworld_entries, file_overrides[loc_name])
            else:
                new_entries = []
                for ml in overworld_entries:
                    entry = copy.deepcopy(ml)
                    entry["map"] = map_name
                    entry["x"] = ml["x"] - ox
                    entry["y"] = ml["y"] - oy
                    new_entries.append(entry)

            if new_entries:
                loc["map_locations"].extend(new_entries)
                modified = True

        if modified:
            with open(path, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=2, ensure_ascii=False)
            print(f"Updated {prefix}/json/locations/{filename}")

print("Done!")
