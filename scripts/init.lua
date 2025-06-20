------------------------------------------------------------------
-- do not touch these variables 
------------------------------------------------------------------
ScriptSettings="scripts/settings/"
ScriptLogicCommon="scripts/logic/common/"
ScriptLogicDungeons="scripts/logic/dungeons/"
ScriptLogicOverworld="scripts/logic/overworld/"
ScriptLogic="scripts/logic/"
ScriptPreset="scripts/preset/"
JsLayouts="layouts/"
JsItems="items/"
JsMap="maps/"
if PopVersion then
	Tracker.BulkUpdate = true
	TrackerSoftwareType="pop/"
else
	TrackerSoftwareType="emo/"

end
	Script=TrackerSoftwareType.."scripts/"
	ScriptItemSpec=TrackerSoftwareType.."scripts/item_spec/"
	ScriptLocations=TrackerSoftwareType.."scripts/locations/"
	JsLocations=TrackerSoftwareType.."json/locations/"
	ScriptAutotracking=TrackerSoftwareType.."scripts/autotracking/"
	ScriptLuaConnector=TrackerSoftwareType.."scripts/Luaconnetor/"

has_item_data={}
has_item_data_dev={}
function_data = {}
has_item_option_dev={}
function_data_fusion={}
setting_preset_data_other={}
setting_preset_data_other["fusiongoldcombined"]=1
setting_preset_data_other["fusionredcombined"]=2
setting_preset_data_other["fusiongreencombined"]=3
setting_preset_data_other["fusionbluecombined"]=4
setting_preset_data_other["progressiveitems"]=5
setting_preset_data_other["figurine_option"]=6
setting_preset_data_title={}
setting_preset_data={}
setting_preset_data_cache=-1


--Activate the cache reset
Cache_reset=false
function_count = 0
cache_number=0  
------------------------------------------------------------------
-- Configuration options for scripted systems in this pack
------------------------------------------------------------------
AUTOTRACKER_ENABLE_ITEM_TRACKING = true
AUTOTRACKER_ENABLE_LOCATION_TRACKING = true
AUTOTRACKER_ENABLE_FUSER_TRACKING = true
VERSION_ALPHA = false
VERSION_BETA = false
VERSION_RANDO = "1.0.0RC2"
------------------------------------------------------------------
-- Configuration Debug options
------------------------------------------------------------------
TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND = false
TMC_AUTOTRACKER_DEBUG_LOCATION = false
TMC_AUTOTRACKER_DEBUG_Fuser = false
TMC_AUTOTRACKER_DEBUG_ITEM = false
TMC_AUTOTRACKER_DEBUG_ITEM_NOFOUND = false
TMC_AUTOTRACKER_DEBUG_EVENT = false
TMC_AUTOTRACKER_DEBUG_SLOT = false
TMC_AUTOTRACKER_DEBUG_RESET = false
TMC_CACHE_DEBUG_FUNCTION = false
TMC_CACHE_DEBUG_ITEM = false



------------------------------------------------------------------
-- Logic Pack
------------------------------------------------------------------
ScriptHost:LoadScript(ScriptPreset.."init.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Function.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Access.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Beam.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."CaveOfFlame.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Common.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."DarkHyruleCastle.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Deepwood.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Droplet.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Elements.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."FortressOfWind.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Fusion.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Overworld.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Openworld.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."PalaceOfWind.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Settings.lua")
ScriptHost:LoadScript(ScriptLogicCommon.."Sword.lua")

ScriptHost:LoadScript(ScriptLogicDungeons.."CaveOfFlame.lua")
ScriptHost:LoadScript(ScriptLogicDungeons.."Crypt.lua")
ScriptHost:LoadScript(ScriptLogicDungeons.."Deepwood.lua")
ScriptHost:LoadScript(ScriptLogicDungeons.."DHC.lua")
ScriptHost:LoadScript(ScriptLogicDungeons.."Droplet.lua")
ScriptHost:LoadScript(ScriptLogicDungeons.."Fortress.lua")
ScriptHost:LoadScript(ScriptLogicDungeons.."Palace.lua")

ScriptHost:LoadScript(ScriptLogicOverworld.."Castle.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Clouds.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Crenel.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."CrenelBase.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Falls.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."FallsLower.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Hills.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Hylia.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."LonLon.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."MinishWoods.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."NorthField.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Ruins.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."SouthField.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Swamp.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Town.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Trilby.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."Valley.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."WesternWoods.lua")
ScriptHost:LoadScript(ScriptLogicOverworld.."WindTribe.lua")


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
local figurine10 = FigurineButton("Figurine +/- 10","figurine10",10,"images/options/main/requirements/figurine10.png")
local figurine50 = FigurineButton("Figurine +/- 50","figurine50",50,"images/options/main/requirements/figurine50.png")
local figurinemax = FigurineButton("Figurine +/- 136","figurinemax",136,"images/options/main/requirements/figurineMax.png")
smithsword = ToggleItem("Smith's Sword","smithsword","images/items/Smith's Sword.png")
greensword = ToggleItem("White Sword","greensword","images/items/Green Sword.png")
redsword = ToggleItem("Red Sword","redsword","images/items/Red Sword.png")
bluesword = ToggleItem("Blue Sword","bluesword","images/items/Blue Sword.png")
foursword = ToggleItem("Four Sword","foursword","images/items/Four Sword.png")
sword = SwordProgress("Progressive Sword","sword0")
clouds = Kinstone("Kinstone Clouds","clouds","images/items/Kinstone Clouds Half.png","images/items/Kinstone Clouds Half.png",5,0)
falls = Kinstone("Kinstone Veil Falls","falls","images/items/Kinstone Falls Half.png",nil,1,0)
wilds = Kinstone("Kinstone Swamp","wilds","images/items/Kinstone Wilds Half.png",nil,3,0)
blueL = Kinstone("Kingstone Blue L","blueL","images/items/KinstoneBlueL.png","images/items/KinstoneBlueL.png",18,0)
blueS = Kinstone("Kingstone Blue S","blueS","images/items/KinstoneBlueS.png",nil,24,0)
redE = Kinstone("Kingstone Red E","redE","images/items/KinstoneRedE.png",nil,9,0)
redV = Kinstone("Kingstone Red V","redV","images/items/KinstoneRedV.png",nil,7,0)
redW = Kinstone("Kingstone Red W","redW","images/items/KinstoneRedW.png","images/items/KinstoneRedW.png",9,0)
greenG = Kinstone("Kingstone Green G","greenG","images/items/KinstoneGreenG.png",nil,49,0)
greenC = Kinstone("Kingstone Green C","greenC","images/items/KinstoneGreenC.png","images/items/KinstoneGreenC.png",17,0)
greenP = Kinstone("Kingstone Green P","greenP","images/items/KinstoneGreenP.png",nil,16,0)
fusiongoldcombined = KinstoneOptions("This converts the different shaped Golden Kinstones into a single Golden shape. 9 of these are shuffled into the world, the locations of the fusions are not shuffled and all ask for the same shape.", "fusiongoldcombined","images/options/world/fusions/gold_combined_on.png","images/options/world/fusions/gold_combined_off.png",0)
fusionredcombined = KinstoneOptions("This converts the different shaped Red Kinstones into a single Red shape. The locations of the fusions are not shuffled and all ask for the same shape.", "fusionredcombined","images/options/world/fusions/red_combined_on.png","images/options/world/fusions/red_combined_off.png",1)
fusiongreencombined = KinstoneOptions("This converts the different shaped Green Kinstones into a single Green shape. The locations of the fusions are not shuffled and all ask for the same shape.", "fusiongreencombined","images/options/world/fusions/green_combined_on.png","images/options/world/fusions/green_combined_off.png",2)
fusionbluecombined = KinstoneOptions("This converts the different shaped Blue Kinstones into a single Blue shape. The locations of the fusions are not shuffled and all ask for the same shape.", "fusionbluecombined","images/options/world/fusions/blue_combined_on.png","images/options/world/fusions/blue_combined_off.png",3)
swordprogress = SwordOptions("Some item upgrades are treated as completely independent items by the game.","progressiveitems","images/options/item_pool/progressive_on.png","images/options/item_pool/progressive_off.png")

------------------------------------------------------------------
-- Managed Item in this pack
------------------------------------------------------------------
if(VERSION_ALPHA==true) then
	Tracker:AddItems(JsItems.."version/alpha.json")
elseif(VERSION_BETA==true) then
	Tracker:AddItems(JsItems.."version/beta.json")
end 

Tracker:AddItems(JsItems.."items/common.json")
Tracker:AddItems(JsItems.."items/fusion.json")

Tracker:AddItems(JsItems.."dungeons/items.json")
Tracker:AddItems(JsItems.."dungeons/keys.json")
Tracker:AddItems(JsItems.."options/settings.json")

Preset()
------------------------------------------------------------------
-- Managed Item in this pack
------------------------------------------------------------------
if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
	if PopVersion then
		Tracker:AddMaps(JsMap.."mapspop.json")
	else
		Tracker:AddMaps(JsMap.."maps.json")
	end
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/CaveOfFlame.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Crypt.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Deepwood.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Fortress.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Droplet.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/Palace.lua")
	ScriptHost:LoadScript(ScriptLocations.."Dungeons/DHC.lua")
	ScriptHost:LoadScript(ScriptLocations.."Castle.lua")
	ScriptHost:LoadScript(ScriptLocations.."Clouds.lua")
	ScriptHost:LoadScript(ScriptLocations.."Crenel.lua")
	ScriptHost:LoadScript(ScriptLocations.."CrenelBase.lua")
	ScriptHost:LoadScript(ScriptLocations.."Falls.lua")
	ScriptHost:LoadScript(ScriptLocations.."FallsLower.lua")
	ScriptHost:LoadScript(ScriptLocations.."General.lua")
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
	ScriptHost:LoadScript(ScriptLocations.."Fusion.lua")


	Tracker:AddLocations(JsLocations.."Castle.json")
	Tracker:AddLocations(JsLocations.."Clouds.json")
	Tracker:AddLocations(JsLocations.."Crenel.json")
	Tracker:AddLocations(JsLocations.."Mines.json")
	Tracker:AddLocations(JsLocations.."CrenelBase.json")
	Tracker:AddLocations(JsLocations.."Falls.json")
	Tracker:AddLocations(JsLocations.."FallsLower.json")
	Tracker:AddLocations(JsLocations.."General.json")
	Tracker:AddLocations(JsLocations.."Hills.json")
	Tracker:AddLocations(JsLocations.."Hylia.json")
	Tracker:AddLocations(JsLocations.."LonLon.json")
	Tracker:AddLocations(JsLocations.."MinishWoods.json")
	Tracker:AddLocations(JsLocations.."NorthField.json")
	Tracker:AddLocations(JsLocations.."Ruins.json")
	Tracker:AddLocations(JsLocations.."SouthHyruleField.json")
	Tracker:AddLocations(JsLocations.."Swamp.json")
	Tracker:AddLocations(JsLocations.."Town.json")
	Tracker:AddLocations(JsLocations.."Trilby.json")
	Tracker:AddLocations(JsLocations.."Valley.json")
	Tracker:AddLocations(JsLocations.."WesternWoods.json")

	Tracker:AddLocations(JsLocations.."Dungeons.json")
	Tracker:AddLocations(JsLocations.."Maps.json")
end
if (string.find(Tracker.ActiveVariantUID, "AP")) then
	has_item_data_dev["spec"] = {}

-- has_item_data_dev["dungeonser_off"] = true
-- has_item_data_dev["dungeonser_on"] = false

-- has_item_data_dev["open_wind_tribe_no"] = true
-- has_item_data_dev["open_wind_tribe_yes"] = false

-- has_item_data_dev["open_tingle_no"] = true
-- has_item_data_dev["open_tingle_yes"] = false

-- has_item_data_dev["open_library_no"] = true
-- has_item_data_dev["open_library_yes"] = false

-- has_item_data_dev["dws_none"] = false
-- has_item_data_dev["dws_dws"] = true
-- has_item_data_dev["dws_cof"] = false
-- has_item_data_dev["dws_fow"] = false
-- has_item_data_dev["dws_tod"] = false
-- has_item_data_dev["dws_crypt"] = false
-- has_item_data_dev["dws_pow"] = false
-- has_item_data_dev["dws_dhc"] = false

-- has_item_data_dev["cof_none"] = false
-- has_item_data_dev["cof_dws"] = false
-- has_item_data_dev["cof_cof"] = true
-- has_item_data_dev["cof_fow"] = false
-- has_item_data_dev["cof_tod"] = false
-- has_item_data_dev["cof_crypt"] = false
-- has_item_data_dev["cof_pow"] = false
-- has_item_data_dev["cof_dhc"] = false

-- has_item_data_dev["fow_none"] = false
-- has_item_data_dev["fow_dws"] = false
-- has_item_data_dev["fow_cof"] = false
-- has_item_data_dev["fow_fow"] = true
-- has_item_data_dev["fow_tod"] = false
-- has_item_data_dev["fow_crypt"] = false
-- has_item_data_dev["fow_pow"] = false
-- has_item_data_dev["fow_dhc"] = false

-- has_item_data_dev["tod_none"] = false
-- has_item_data_dev["tod_dws"] = false
-- has_item_data_dev["tod_cof"] = false
-- has_item_data_dev["tod_fow"] = false
-- has_item_data_dev["tod_tod"] = true
-- has_item_data_dev["tod_crypt"] = false
-- has_item_data_dev["tod_pow"] = false
-- has_item_data_dev["tod_dhc"] = false

-- has_item_data_dev["crypt_none"] = false
-- has_item_data_dev["crypt_dws"] = false
-- has_item_data_dev["crypt_cof"] = false
-- has_item_data_dev["crypt_fow"] = false
-- has_item_data_dev["crypt_tod"] = false
-- has_item_data_dev["crypt_crypt"] = true
-- has_item_data_dev["crypt_pow"] = false
-- has_item_data_dev["crypt_dhc"] = false

-- has_item_data_dev["pow_none"] = false
-- has_item_data_dev["pow_dws"] = false
-- has_item_data_dev["pow_cof"] = false
-- has_item_data_dev["pow_fow"] = false
-- has_item_data_dev["pow_tod"] = false
-- has_item_data_dev["pow_crypt"] = false
-- has_item_data_dev["pow_pow"] = true
-- has_item_data_dev["pow_dhc"] = false

-- has_item_data_dev["dhc_none"] = false
-- has_item_data_dev["dhc_dws"] = false
-- has_item_data_dev["dhc_cof"] = false
-- has_item_data_dev["dhc_fow"] = false
-- has_item_data_dev["dhc_tod"] = false
-- has_item_data_dev["dhc_crypt"] = false
-- has_item_data_dev["dhc_pow"] = false
-- has_item_data_dev["dhc_dhc"] = true

-- has_item_data_dev["dhc_open"] = false
-- has_item_data_dev["spec"]["dhc_open"] = {}
-- has_item_data_dev["spec"]["dhc_open"]["desactive"] = true
-- has_item_data_dev["spec"]["dhc_open"]["name"] = "dhc_closed"
-- has_item_data_dev["spec"]["dhc_open"]["def"] = 0

-- has_item_data_dev["biggoron_none"] = true
-- has_item_data_dev["biggoron_shield"] = false
-- has_item_data_dev["biggoron_mirror"] = false

-- has_item_data_dev["golden_enemy_off"] = true
-- has_item_data_dev["golden_enemy_on"] = false

-- has_item_data_dev["goron_eu"] = true
-- has_item_data_dev["goron_jp"] = false

	if PopVersion then
		Tracker:AddLayouts(JsLayouts.."AP_trackerPOP.json")
	else
		Tracker:AddLayouts(JsLayouts.."AP_tracker.json")
	end
else
	if PopVersion then
		Tracker:AddLayouts(JsLayouts.."trackerPOP.json")
	else
		Tracker:AddLayouts(JsLayouts.."tracker.json")
	end
end
if (string.find(Tracker.ActiveVariantUID, "_h")) then
	Tracker:AddLayouts(JsLayouts.."standard_h_broadcast.json")
else
	Tracker:AddLayouts(JsLayouts.."standard_broadcast.json")
end

------------------------------------------------------------------
-- Autotracking
------------------------------------------------------------------
if PopVersion then
	ScriptHost:LoadScript(Script.."autotracking.lua")
elseif _VERSION == "Lua 5.3"  then
	ScriptHost:LoadScript(ScriptAutotracking.."autotracking_testing.lua")
else
	print("Your tracker version does not support autotracking")
end
if PopVersion then
	ScriptHost:AddWatchForCode("accessibilityUpdating","*", tracker_on_accessibility_updating)
	tracker_on_pack_ready() 
	Tracker.BulkUpdate = false
end
