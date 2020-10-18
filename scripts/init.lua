--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")

Tracker:AddItems("items/common.json")
Tracker:AddItems("items/dungeon_items.json")
Tracker:AddItems("items/keys.json")
Tracker:AddItems("items/options.json")

if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
    ScriptHost:LoadScript("scripts/logic_common.lua")
    Tracker:AddMaps("maps/maps.json")
    Tracker:AddLocations("locations/overworld.json")
    Tracker:AddLocations("locations/dungeons.json")
    Tracker:AddLocations("locations/advanced.json")
end

Tracker:AddLayouts("layouts/tracker.json")

if (string.find(Tracker.ActiveVariantUID, "_H")) then
    Tracker:AddLayouts("layouts/standard_h_broadcast.json")
elseif (string.find(Tracker.ActiveVariantUID, "live")) then
    Tracker:AddLayouts("layouts/live_broadcast.json")
else
    Tracker:AddLayouts("layouts/standard_broadcast.json")
end

if _VERSION == "Lua 5.3" then
  ScriptHost:LoadScript("scripts/autotracking.lua")
else
  print("Your tracker version does not support autotracking")
end
