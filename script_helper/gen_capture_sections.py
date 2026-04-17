
"""
Generates the CaptureBadgeSections Lua table by scanning all
emo/json/locations/*.json files for sections with "capture_item": true.
"""

import json
import os

LOCATIONS_DIR = os.path.join(os.path.dirname(__file__),"..", "emo", "json", "locations")


def collect_sections(loc_name, sections):
    """Recursively collect '@location/section' strings where capture_item is true."""
    results = []
    for section in sections:
        if section.get("capture_item") is True:
            results.append(f'  "@{loc_name}/{section["name"]}"')
        # Sections can contain nested sections
        if "sections" in section:
            results.extend(collect_sections(loc_name, section["sections"]))
    return results


def main():
    entries = []

    json_files = sorted(
        f for f in os.listdir(LOCATIONS_DIR) if f.endswith(".json")
    )

    for filename in json_files:
        path = os.path.join(LOCATIONS_DIR, filename)
        with open(path, encoding="utf-8") as f:
            try:
                data = json.load(f)
            except json.JSONDecodeError as e:
                print(f"-- WARNING: could not parse {filename}: {e}")
                continue

        for location in data:
            loc_name = location.get("name", "")
            sections = location.get("sections", [])
            entries.extend(collect_sections(loc_name, sections))

    print("CaptureBadgeSections = {")
    for i, entry in enumerate(entries):
        comma = "," if i < len(entries) - 1 else ""
        print(f"{entry}{comma}")
    print("}")


if __name__ == "__main__":
    main()
