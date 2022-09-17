if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
    ScriptHost:LoadScript("scripts/logic/common.lua")
    Tracker:AddMaps("maps/maps.json")
    Tracker:AddLocations("locations/overworld.json")
    Tracker:AddLocations("locations/dungeons.json")
    Tracker:AddLocations("locations/advanced.json")
    Tracker:AddLocations("locations/fusion.json")
end