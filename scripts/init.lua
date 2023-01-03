ScriptHost:LoadScript("scripts/var.lua")
ScriptHost:LoadScript(ScriptSettings.."init.lua")
ScriptHost:LoadScript(ScriptItemSpec.."init.lua")
ScriptHost:LoadScript(ScriptMain.."init.lua")

function tracker_on_pack_ready()
	ScriptHost:LoadScript(ScriptLogic.."init.lua")
	if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
		ScriptHost:LoadScript(ScriptLocations.."init.lua")
	end
	ScriptHost:LoadScript(ScriptAutotracking.."init.lua")

end