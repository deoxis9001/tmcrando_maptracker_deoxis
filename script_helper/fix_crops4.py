#!/usr/bin/env python3
import json
import copy
import os
from PIL import Image

BASE_DIR = r"d:\git\emotracker\BetaTmcrTrackerDeoxis"

# New crop definitions: (left, top, width, height)
NEW_CROPS = {
    "castle": (990, 128, 670, 352),
    "crenel": (0, 0, 670, 1118),
    # "crenel": (0, 0, 670, 795),
    # "crenelbase":   (0,    795,  670, 323),
    "falls":        (1661, 0,    319, 800),
    "hylia":        (2140, 800,  501, 637),
    "hills": (1661, 1440, 319, 668),
    "lonlon":       (1661, 800,  479, 640),
    "minishwoods":  (1980, 1437, 671, 671),
    "northfield":   (990,  480,  671, 531),
    "ruins": (0, 1757, 670, 351),
    "southfield":   (990,  1659, 671, 448),
    "swamp":        (0,    1118, 670, 640),
    
    
    "town": (990, 1011, 671, 639),
    
    "valley": (670, 128, 319, 672),
    "trilby": (671, 799, 319, 630),
    "westernwoods": (671, 1420, 319, 688),
    "clouds":       (2651, 0,    750, 1370),
}

# Map from JSON filename to (map_name, crop_x, crop_y)
REGION_FILE_MAP = {
    "Castle.json":           ("map_castle",      990, 128),
    "Crenel.json":           ("map_crenel",  0,    0),
    "CrenelBase.json":       ("map_crenel",  0,    0),
    "Falls.json":            ("map_falls",       1661, 0),
    "Hylia.json":            ("map_hylia",       2140, 800),
    "Hills.json":            ("map_hills",       1661, 1440),
    "LonLon.json":           ("map_lonlon",      1661, 800),
    "MinishWoods.json":      ("map_minishwoods", 1980, 1437),
    "NorthField.json":       ("map_northfield",  990,  480),
    "SouthField.json":       ("map_southfield",  990,  1659),
    "Swamp.json":            ("map_swamp",       0,    1120),
    "Ruins.json":            ("map_ruins",       0,    1757),
    "Valley.json":           ("map_valley",      671,  128),
    "Trilby.json":           ("map_trilby",      671,  799),
    "WesternWoods.json":     ("map_westernwoods",   671,  1420),
    "Town.json":             ("map_town",        990,  1010),
    "Clouds.json":           ("map_clouds",      2651, 0),
}

# Step 1: Crop new PNGs
overworld_path = os.path.join(BASE_DIR, "images", "maps", "overworld.png")
overworld_img = Image.open(overworld_path)
out_dir = os.path.join(BASE_DIR, "images", "maps", "overworld")
os.makedirs(out_dir, exist_ok=True)

for region, (x, y, w, h) in NEW_CROPS.items():
    cropped = overworld_img.crop((x, y, x + w, y + h))
    out_path = os.path.join(out_dir, f"{region}.png")
    cropped.save(out_path)
    print(f"Saved {region}.png ({w}x{h})")

# ==============================================================================
# CAS PARTICULIERS
# Certaines locations doivent aller sur une map différente de leur fichier,
# ou ont plusieurs positions overworld pointant vers des maps différentes.
#
# Format par entrée :
#   ("map_name", crop_x, crop_y)        → auto : region_x = overworld_x - crop_x
#   ("map_name", "manual", x, y)        → manuel : coordonnées directes sur la map
#   None                                → ignorer cette position overworld
#
# La liste correspond aux entrées overworld ("map": "map") dans l'ordre d'apparition.
# Si la liste est plus courte que le nombre d'entrées overworld, le reste est ignoré.
# ==============================================================================
OVERRIDES = {
    "Hylia.json": {
        # Géographiquement dans la zone LonLon, pas Hylia
        "Hylia - Cape Cave - Lon Lon": [
            ("map_lonlon", 1661, 800),       # x=2017-1661=356, y=878-800=78
        ],
        # En dehors du crop Hylia (y=1480 >= crop bottom), appartient à MinishWoods
        "Hylia South - Minish Hole": [
            ("map_minishwoods", 1980, 1437), # x=2614-1980=634, y=1480-1437=43
        ],
    },
    "Valley.json": {
        # overworld x=1059 est dans la colonne NorthField (x=990-1661), pas Valley
        "Valley - Pre Valley Fusion": [
            ("map_northfield", 990, 480),    # x=1059-990=69, y=527-480=47
        ],
    },
    "Clouds.json": {
        # pos 1 (x=2305, y=360) : hors du crop clouds (crop commence à x=2651)
        #   → coordonnées manuelles à ajuster si besoin
        # pos 2 (x=1379, y=1826) : zone SouthField
        "Wind Tribe": [
            ("map_clouds", "manual", 0, 360),  # TODO: ajuster x (placeholder=0)
            ("map_southfield", 990, 1659),      # x=1379-990=389, y=1826-1659=167
        ],
    },
}

# Collecte de tous les noms de maps region pour nettoyage
ALL_REGION_MAP_NAMES = set(v[0] for v in REGION_FILE_MAP.values())
# Ajouter les maps des overrides
for file_overrides in OVERRIDES.values():
    for loc_entries in file_overrides.values():
        for entry in loc_entries:
            if entry is not None:
                ALL_REGION_MAP_NAMES.add(entry[0])


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
            # Coordonnées manuelles : copier la structure overworld, changer map/x/y
            entry = copy.deepcopy(ml)
            entry["map"] = map_name
            entry["x"] = rule[2]
            entry["y"] = rule[3]
        else:
            # Auto-calcul depuis les coords overworld
            crop_x, crop_y = rule[1], rule[2]
            entry = copy.deepcopy(ml)
            entry["map"] = map_name
            entry["x"] = ml["x"] - crop_x
            entry["y"] = ml["y"] - crop_y
        new_entries.append(entry)
    return new_entries


# Step 2: Update JSON files in both emo and pop
for prefix in ["emo", "pop"]:
    for filename, (map_name, ox, oy) in REGION_FILE_MAP.items():
        path = os.path.join(BASE_DIR, prefix, "json", "locations", filename)
        if not os.path.exists(path):
            print(f"Skipping {prefix}/{filename} (not found)")
            continue

        with open(path, 'r', encoding='utf-8') as f:
            data = json.load(f)

        file_overrides = OVERRIDES.get(filename, {})
        modified = False

        for loc in data:
            if "map_locations" not in loc:
                continue

            loc_name = loc.get("name", "")

            # Supprimer toutes les entrées region existantes pour ce fichier
            # (inclut les maps des overrides pour éviter les doublons)
            maps_to_remove = {map_name}
            if loc_name in file_overrides:
                for entry in file_overrides[loc_name]:
                    if entry is not None:
                        maps_to_remove.add(entry[0])
            loc["map_locations"] = [ml for ml in loc["map_locations"] if ml["map"] not in maps_to_remove]

            # Entrées overworld de base
            overworld_entries = [ml for ml in loc["map_locations"] if ml["map"] == "map"]

            if loc_name in file_overrides:
                # Cas particulier
                new_entries = apply_override(overworld_entries, file_overrides[loc_name])
            else:
                # Calcul automatique standard
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
            with open(path, 'w', encoding='utf-8') as f:
                json.dump(data, f, indent=2, ensure_ascii=False)
            print(f"Updated {prefix}/json/locations/{filename}")

print("Done!")
