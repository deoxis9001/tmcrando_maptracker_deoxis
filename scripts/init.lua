  --  Load configuration options up front
  ScriptHost:LoadScript("scripts/settings.lua")

  Tracker:AddItems("items/common.json")
  Tracker:AddItems("items/dungeon_items.json")
  Tracker:AddItems("items/keys.json")
  Tracker:AddItems("items/options.json")

if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
  ScriptHost:LoadScript("scripts/Logic/Common.lua")
  ScriptHost:LoadScript("scripts/Logic/PedOption.lua")
  -- MAP
  Tracker:AddMaps("maps/maps.json")
  -- OVERWORLD
  Tracker:AddLocations("locations/overworld.json")
  -- DWS
  Tracker:AddLocations("locations/Map/DWS.json")
  Tracker:AddLocations("locations/Normal/DWS.json")
  -- COF
  Tracker:AddLocations("locations/Map/COF.json")
  Tracker:AddLocations("locations/Normal/COF.json")
  Tracker:AddLocations("locations/Rupee/COF.json")
  -- FOW
  Tracker:AddLocations("locations/Map/FOW.json")
  Tracker:AddLocations("locations/Normal/FOW.json")
  Tracker:AddLocations("locations/Obscure/FOW.json")
  Tracker:AddLocations("locations/Rupee/FOW.json")
  Tracker:AddLocations("locations/RupeeObscure/FOW.json")
  -- TOD
  Tracker:AddLocations("locations/Map/TOD.json")
  Tracker:AddLocations("locations/Normal/TOD.json")
  Tracker:AddLocations("locations/Obscure/TOD.json")
  Tracker:AddLocations("locations/Rupee/TOD.json")
  Tracker:AddLocations("locations/RupeeObscure/TOD.json")
  -- RC
  Tracker:AddLocations("locations/Map/RC.json")
  Tracker:AddLocations("locations/Normal/RC.json")
  -- POW
  Tracker:AddLocations("locations/Map/POW.json")
  Tracker:AddLocations("locations/Normal/POW.json")
  Tracker:AddLocations("locations/Rupee/POW.json")
  -- POW
  Tracker:AddLocations("locations/Map/DHC.json")
  Tracker:AddLocations("locations/Normal/DHC.json")
  -- FUSION
  ---ScriptHost:LoadScript("scripts/Logic/Fusion.lua")
  --Tracker:AddLocations("locations/fusion.json")
end

Tracker:AddLayouts("layouts/tracker.json")

if (string.find(Tracker.ActiveVariantUID, "_h")) then
  Tracker:AddLayouts("layouts/standard_h_broadcast.json")
--elseif (string.find(Tracker.ActiveVariantUID, "live")) then
--  Tracker:AddLayouts("layouts/live_broadcast.json")
else
  Tracker:AddLayouts("layouts/standard_broadcast.json")
end

if _VERSION == "Lua 5.3" then
  ScriptHost:LoadScript("scripts/autotracking.lua")
else
  print("Your tracker version does not support autotracking")
end
