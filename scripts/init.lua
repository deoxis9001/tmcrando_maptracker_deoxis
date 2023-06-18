------------------------------------------------------------------
-- do not touch these variables 
------------------------------------------------------------------
ScriptItemSpec="scripts/item_spec/"
ScriptSettings="scripts/settings/"
ScriptLogic="scripts/logic/"
ScriptPreset="scripts/preset/"
ScriptMain="scripts/main/"
ScriptAutotracking="scripts/autotracking/"

JsLayouts="layouts/"
JsItems="items/"
JsMap="maps/"

ScriptLocations="scripts/locations/"
JsLocations="locations/"

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
has_item_data_dev['small_key_out_on']=true
has_item_data_dev['beam_out_on']=true
has_item_data_dev['damage_source_out_on']=true
has_item_data_dev['fusiongold_out_on']=true
has_item_data_dev['fusionred_out_on']=true
has_item_data_dev['fusionblue_out_on']=true
has_item_data_dev['fusiongreen_out_on']=true

has_item_data_dev['grabbable_out_on']=true
has_item_data_dev['blowdust_out_on']=true
has_item_data_dev['crenelmushroom_out_on']=true
has_item_data_dev['lightarrowbreak_out_on']=true
has_item_data_dev['bobombs_out_on']=true
has_item_data_dev['likelike_out_on']=true
has_item_data_dev['guardskip_out_on']=true
has_item_data_dev['crenelbeam_out_on']=true
has_item_data_dev['downstrikebeetle_out_on']=true
has_item_data_dev['darkrooms_out_on']=true

has_item_data_dev['capeextension_out_on']=true
has_item_data_dev['lakeminish_out_on']=true
has_item_data_dev['cabinswim_out_on']=true
has_item_data_dev['cloudskill_out_on']=true
has_item_data_dev['powjump_out_on']=true
has_item_data_dev['powpotpuzzleool_out_on']=true
has_item_data_dev['dhccanonhit_out_on']=true
has_item_data_dev['dhcbladepuzzleshuffle_out_on']=true
has_item_data_dev['dhcswitchhit_out_on']=true
has_item_data_dev['fowpot_out_on']=true

--Activate the cache reset
Cache_reset=false
function_count = 0

------------------------------------------------------------------
-- Configuration options for scripted systems in this pack
------------------------------------------------------------------
AUTOTRACKER_ENABLE_ITEM_TRACKING = true
AUTOTRACKER_ENABLE_LOCATION_TRACKING = true
AUTOTRACKER_ENABLE_FUZER_TRACKING = true
VERSION_ALPHA = false
VERSION_BETA = false
VERSION_RANDO = "1.0.0"
------------------------------------------------------------------
-- Configuration Debug options
------------------------------------------------------------------
TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND = false
TMC_AUTOTRACKER_DEBUG_LOCATION = false
TMC_AUTOTRACKER_DEBUG_FUZER = false
TMC_AUTOTRACKER_DEBUG_ITEM = false
TMC_CACHE_DEBUG_FUNCTION = false
TMC_CACHE_DEBUG_ITEM = false



------------------------------------------------------------------
-- Logic Pack
------------------------------------------------------------------
ScriptHost:LoadScript(ScriptPreset.."init.lua")
ScriptHost:LoadScript(ScriptLogic.."Function.lua")
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
local figurine10 = FigurineButton("Figurine +/- 10","figurine10",10,"images/options/dhc_requirements/figurine10.png")
local figurine50 = FigurineButton("Figurine +/- 50","figurine50",50,"images/options/dhc_requirements/figurine50.png")
local figurinemax = FigurineButton("Figurine +/- 136","figurinemax",136,"images/options/dhc_requirements/figurineMax.png")
smithsword = ToggleItem("Smith's Sword","smithsword","images/items/Smith's Sword.png")
greensword = ToggleItem("White Sword","greensword","images/items/Green Sword.png")
redsword = ToggleItem("Red Sword","redsword","images/items/Red Sword.png")
bluesword = ToggleItem("Blue Sword","bluesword","images/items/Blue Sword.png")
foursword = ToggleItem("Four Sword","foursword","images/items/Four Sword.png")
sword = SwordProgress("Progressive Sword","sword0")
clouds = Kinstone("Kinstone Clouds","clouds","images/items/Kinstone Clouds Half.png","images/items/Kinstone Clouds Half.png",5,0)
falls = Kinstone("Kinstone Viel Fall","falls","images/items/Kinstone Falls Half.png",nil,1,0)
wilds = Kinstone("Kinstone Swamp","wilds","images/items/Kinstone Wilds Half.png",nil,3,0)
blueL = Kinstone("Kingstone Blue L","blueL","images/items/KinstoneBlueL.png","images/items/KinstoneBlueL.png",18,0)
blueS = Kinstone("Kingstone Blue S","blueS","images/items/KinstoneBlueS.png",nil,24,0)
redE = Kinstone("Kingstone Red E","redE","images/items/KinstoneRedE.png",nil,9,0)
redV = Kinstone("Kingstone Red V","redV","images/items/KinstoneRedV.png",nil,7,0)
redW = Kinstone("Kingstone Red W","redW","images/items/KinstoneRedW.png","images/items/KinstoneRedW.png",9,0)
greenG = Kinstone("Kingstone Green G","greenG","images/items/KinstoneGreenG.png",nil,49,0)
greenC = Kinstone("Kingstone Green C","greenC","images/items/KinstoneGreenC.png","images/items/KinstoneGreenC.png",17,0)
greenP = Kinstone("Kingstone Green P","greenP","images/items/KinstoneGreenP.png",nil,16,0)
fusiongoldcombined = KinstoneOptions("This converts the different shaped Golden Kinstones into a single Golden shape. 9 of these are shuffled into the world, the locations of the fusions are not shuffled and all ask for the same shape.", "fusiongoldcombined","images/options/fusions_settings/gold_combined_on.png","images/options/fusions_settings/gold_combined_off.png",0)
fusionredcombined = KinstoneOptions("This converts the different shaped Red Kinstones into a single Red shape. The locations of the fusions are not shuffled and all ask for the same shape.", "fusionredcombined","images/options/fusions_settings/red_combined_on.png","images/options/fusions_settings/red_combined_off.png",1)
fusiongreencombined = KinstoneOptions("This converts the different shaped Green Kinstones into a single Green shape. The locations of the fusions are not shuffled and all ask for the same shape.", "fusiongreencombined","images/options/fusions_settings/green_combined_on.png","images/options/fusions_settings/green_combined_off.png",2)
fusionbluecombined = KinstoneOptions("This converts the different shaped Blue Kinstones into a single Blue shape. The locations of the fusions are not shuffled and all ask for the same shape.", "fusionbluecombined","images/options/fusions_settings/blue_combined_on.png","images/options/fusions_settings/blue_combined_off.png",3)
swordprogress = SwordOptions("Some item upgrades are treated as completely independent items by the game.","progressiveitems","images/options/weapons_settings/progressive_on.png","images/options/weapons_settings/progressive_off.png")


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
Tracker:AddItems(JsItems.."options/dhc_requirements.json")
Tracker:AddItems(JsItems.."options/fusions_settings.json")
Tracker:AddItems(JsItems.."options/locations_settings.json")
Tracker:AddItems(JsItems.."options/logic_settings.json")
Tracker:AddItems(JsItems.."options/shuffle_donjon.json")
Tracker:AddItems(JsItems.."options/weapons_settings.json")
Tracker:AddItems(JsItems.."options/world_settings/settings.json")
Tracker:AddItems(JsItems.."options/world_settings/warps_settings.json")
Tracker:AddItems(JsItems.."options/world_settings/wind_crest_settings.json")

Preset()
------------------------------------------------------------------
-- Managed Item in this pack
------------------------------------------------------------------
if not (string.find(Tracker.ActiveVariantUID, "items_only")) then
	Tracker:AddMaps(JsMap.."maps.json")
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

