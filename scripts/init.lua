ScriptItemSpec="scripts/item_spec/"
ScriptSettings="scripts/settings/"
ScriptLogic="scripts/logic/"
ScriptMain="scripts/main/"
ScriptAutotracking="scripts/autotracking/"

JsLayouts="layouts/"
JsItems="items/"
JsMap="maps/"

ScriptLocations="scripts/locations/"
JsLocations="locations/"

------------------------------------------------------------------
-- Configuration options for scripted systems in this pack
------------------------------------------------------------------
AUTOTRACKER_ENABLE_ITEM_TRACKING = true
AUTOTRACKER_ENABLE_LOCATION_TRACKING = true
AUTOTRACKER_ENABLE_FUZER_TRACKING = true
TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND = true
TMC_AUTOTRACKER_DEBUG_LOCATION = false
TMC_AUTOTRACKER_DEBUG_FUZER = false
TMC_AUTOTRACKER_DEBUG_ITEM = false
VERSION_ALPHA = true
VERSION_BETA = true
if TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND == true or TMC_AUTOTRACKER_DEBUG_LOCATION == true or TMC_AUTOTRACKER_DEBUG_ITEM == true then
	TMC_AUTOTRACKER_DEBUG = true
else
	TMC_AUTOTRACKER_DEBUG = false
end
------------------------------------------------------------------
-- Logic Pack
------------------------------------------------------------------
ScriptHost:LoadScript(ScriptLogic.."Access.lua")
ScriptHost:LoadScript(ScriptLogic.."Fusion.lua")
ScriptHost:LoadScript(ScriptLogic.."Common.lua")
ScriptHost:LoadScript(ScriptLogic.."CaveOfFlame.lua")
ScriptHost:LoadScript(ScriptLogic.."DarkHyruleCastle.lua")
ScriptHost:LoadScript(ScriptLogic.."Deepwood.lua")
ScriptHost:LoadScript(ScriptLogic.."Droplet.lua")
ScriptHost:LoadScript(ScriptLogic.."FortressOfWind.lua")
ScriptHost:LoadScript(ScriptLogic.."PalaceOfWind.lua")
ScriptHost:LoadScript(ScriptLogic.."Overworld.lua")
ScriptHost:LoadScript(ScriptLogic.."check/Logic.lua")
ScriptHost:LoadScript(ScriptLogic.."check/CaveOfFlame.lua")
ScriptHost:LoadScript(ScriptLogic.."check/Crypt.lua")
ScriptHost:LoadScript(ScriptLogic.."check/Deepwood.lua")
ScriptHost:LoadScript(ScriptLogic.."check/Fortress.lua")
ScriptHost:LoadScript(ScriptLogic.."check/Droplet.lua")
ScriptHost:LoadScript(ScriptLogic.."check/Palace.lua")
ScriptHost:LoadScript(ScriptLogic.."check/DHC.lua")
------------------------------------------------------------------
-- Script Item for scripted systems in this pack
------------------------------------------------------------------
ScriptHost:LoadScript(ScriptItemSpec.."class.lua")
ScriptHost:LoadScript(ScriptItemSpec.."custom_item.lua")
ScriptHost:LoadScript(ScriptItemSpec.."figurine.lua")
ScriptHost:LoadScript(ScriptItemSpec.."SwordToggle.lua")
ScriptHost:LoadScript(ScriptItemSpec.."SwordProgress.lua")
ScriptHost:LoadScript(ScriptItemSpec.."SwordOptions.lua")
ScriptHost:LoadScript(ScriptItemSpec.."Kinstone.lua")
ScriptHost:LoadScript(ScriptItemSpec.."KinstoneOptions.lua")
local figurine10 = FigurineButton("figurine plus 10","figurine10",10,"images/options/dhc_requirements/figurine10.png")
local figurine50 = FigurineButton("figurine plus 50","figurine50",50,"images/options/dhc_requirements/figurine50.png")
local figurinemax = FigurineButton("figurine plus 136","figurinemax",136,"images/options/dhc_requirements/figurineMax.png")
smithsword = ToggleItem("Smith's Sword","smithsword","images/items/Smith's Sword.png")
greensword = ToggleItem("Smith's Sword","greensword","images/items/Green Sword.png")
redsword = ToggleItem("Smith's Sword","redsword","images/items/Red Sword.png")
bluesword = ToggleItem("Smith's Sword","bluesword","images/items/Blue Sword.png")
foursword = ToggleItem("Smith's Sword","foursword","images/items/Four Sword.png")
sword = SwordProgress("progression sword","sword0")
clouds = Kinstone("clouds","clouds","images/items/Kinstone Clouds Half.png","images/items/Kinstone Clouds Half.png",5,0)
falls = Kinstone("falls","falls","images/items/Kinstone Falls Half.png",nil,1,0)
wilds = Kinstone("wilds","wilds","images/items/Kinstone Wilds Half.png",nil,3,0)
blueL = Kinstone("blueL","blueL","images/items/KinstoneBlueL.png","images/items/KinstoneBlueL.png",9,0)
blueS = Kinstone("blueS","blueS","images/items/KinstoneBlueS.png",nil,9,0)
redE = Kinstone("redE","redE","images/items/KinstoneRedE.png",nil,9,0)
redV = Kinstone("redV","redV","images/items/KinstoneRedV.png",nil,7,0)
redW = Kinstone("redW","redW","images/items/KinstoneRedW.png","images/items/KinstoneRedW.png",9,0)
greenG = Kinstone("greenG","greenG","images/items/KinstoneGreenG.png",nil,16,0)
greenC = Kinstone("greenC","greenC","images/items/KinstoneGreenC.png","images/items/KinstoneGreenC.png",17,0)
greenP = Kinstone("greenP","greenP","images/items/KinstoneGreenP.png",nil,16,0)
fusiongoldcombined = KinstoneOptions("fusiongoldcombined", "fusiongoldcombined","images/options/fusions_settings/gold_combined_on.png","images/options/fusions_settings/gold_combined_off.png",0)
fusionredcombined = KinstoneOptions("fusionredcombined", "fusionredcombined","images/options/fusions_settings/red_combined_on.png","images/options/fusions_settings/red_combined_off.png",1)
fusiongreencombined = KinstoneOptions("fusiongreencombined", "fusiongreencombined","images/options/fusions_settings/green_combined_on.png","images/options/fusions_settings/green_combined_off.png",2)
fusionbluecombined = KinstoneOptions("fusionbluecombined", "fusionbluecombined","images/options/fusions_settings/blue_combined_on.png","images/options/fusions_settings/blue_combined_off.png",3)
swordprogress = SwordOptions("swordoptions","progressiveitems","images/options/weapons_settings/progressive_on.png","images/options/weapons_settings/progressive_off.png")
------------------------------------------------------------------
-- Managed Item in this pack
------------------------------------------------------------------

Tracker:AddItems(JsItems.."common.json")
Tracker:AddItems(JsItems.."dungeon_items.json")
Tracker:AddItems(JsItems.."keys.json")
Tracker:AddItems(JsItems.."options.json")
Tracker:AddItems(JsItems.."fusion.json")

if(VERSION_ALPHA==true) then
	Tracker:AddItems(JsItems.."alpha.json")
elseif(VERSION_BETA==true) then
	Tracker:AddItems(JsItems.."beta.json")
end 
------------------------------------------------------------------
-- Managed Item in this pack
------------------------------------------------------------------
if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
    Tracker:AddMaps(JsMap.."maps.json")
	ScriptHost:LoadScript(ScriptLocations.."Castle.lua")
	ScriptHost:LoadScript(ScriptLocations.."Clouds.lua")
	ScriptHost:LoadScript(ScriptLocations.."Crenel.lua")
	ScriptHost:LoadScript(ScriptLocations.."CrenelBase.lua")
	ScriptHost:LoadScript(ScriptLocations.."Falls.lua")
	ScriptHost:LoadScript(ScriptLocations.."FallsLower.lua")
	ScriptHost:LoadScript(ScriptLocations.."Hills.lua")
	ScriptHost:LoadScript(ScriptLocations.."Hylia.lua")
	ScriptHost:LoadScript(ScriptLocations.."LonLon.lua")
	ScriptHost:LoadScript(ScriptLocations.."MinishWoods.lua")
	ScriptHost:LoadScript(ScriptLocations.."NorthField.lua")
	ScriptHost:LoadScript(ScriptLocations.."Ruins.lua")
	ScriptHost:LoadScript(ScriptLocations.."SouthHyruleField.lua")
	ScriptHost:LoadScript(ScriptLocations.."Swamp.lua")
	ScriptHost:LoadScript(ScriptLocations.."Town.lua")
	ScriptHost:LoadScript(ScriptLocations.."Trilby.lua")
	ScriptHost:LoadScript(ScriptLocations.."Valley.lua")
	ScriptHost:LoadScript(ScriptLocations.."WesternWoods.lua")
	ScriptHost:LoadScript(ScriptLocations.."General.lua")

	ScriptHost:LoadScript(ScriptLocations.."Dungeons/CaveOfFlame.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Crypt.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Deepwood.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Fortress.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Droplet.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Palace.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/DHC.lua")
	Tracker:AddLocations(JsLocations.."Dungeons.json")
	Tracker:AddLocations(JsLocations.."Maps.json")

end
	Tracker:AddLayouts(JsLayouts.."tracker.json")
if (string.find(Tracker.ActiveVariantUID, "_h")) then
    Tracker:AddLayouts(JsLayouts.."standard_h_broadcast.json")
else
    Tracker:AddLayouts(JsLayouts.."standard_broadcast.json")
end
------------------------------------------------------------------
-- Autotracking
------------------------------------------------------------------

if _VERSION == "Lua 5.3" then
  ScriptHost:LoadScript(ScriptAutotracking.."autotracking.lua")
else
  print("Your tracker version does not support autotracking")
end

