--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")

Tracker:AddItems("items/common.json")
Tracker:AddItems("items/dungeon_items.json")
Tracker:AddItems("items/keys.json")
Tracker:AddItems("items/options.json")
if (string.find(Tracker.ActiveVariantUID, "reverse")) then
	Tracker:AddLayouts("reverse/tracker.json")
	Tracker:AddLayouts("reverse/standard_broadcast.json")
else
	Tracker:AddLayouts("layouts/tracker.json")
	Tracker:AddLayouts("layouts/standard_broadcast.json")
end