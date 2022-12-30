if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
    Tracker:AddMaps(JsMap.."maps.json")
	ScriptHost:LoadScript(ScriptLocations.."init.lua")
end