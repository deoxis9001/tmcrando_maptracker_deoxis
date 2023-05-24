
function Preset()
	local data_preset = Tracker:FindObjectForCode("preset_01")
	if no_preset then
		setting_preset_data_cache = data_preset.CurrentStage + 1
		return 0
	end
	
	if setting_preset_data_cache~=( data_preset.CurrentStage + 1 ) then
		setting_preset_data_cache = data_preset.CurrentStage + 1
		if setting_preset_data_cache ~= 0 then
			print(setting_preset_data_title[setting_preset_data_cache])
			for i, v in pairs(setting_preset_data[setting_preset_data_title[setting_preset_data_cache]]) do
				local item = Tracker:FindObjectForCode(i)
				if  setting_preset_data_other[i]==nil then
					item.CurrentStage = v
				elseif  setting_preset_data_other[i]==1 then
					fusiongoldcombined:setActive(v)
				elseif  setting_preset_data_other[i]==2 then
					fusionredcombined:setActive(v)
				elseif  setting_preset_data_other[i]==3 then
					fusiongreencombined:setActive(v)
				elseif  setting_preset_data_other[i]==4 then
					fusionbluecombined:setActive(v)
				elseif  setting_preset_data_other[i]==5 then
					swordprogress:setActive(v)
				elseif  setting_preset_data_other[i]==6 then
					item.AcquiredCount = v
				end
			end
		end
	end
end
function UpdateFusion()
	if ( has("fusionred_vanilla") or has("fusionred_complet") ) then
		if( redflag==false or redflag==nil ) then
			fusiongreencombined:updateMax()
			redflag=true
		end
	else
		if( redflag==true or redflag==nil ) then
			fusiongreencombined:updateMax()
			redflag=false
		end
	end 
	if ( has("fusionblue_vanilla") or has("fusionblue_complet") ) then
		if( blueflag==false or blueflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			blueflag=true
		end
	else
		if( blueflag==true or blueflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			blueflag=false
		end
	end 
end
function tracker_on_accessibility_updating()
	if Cache_reset then
		has_item_data = {}
		function_data = {}
		function_count = 0
		function_data_fusion={}
		Preset()
		UpdateFusion()
	end
end
CaptureBadgeSections = {
    "@Town - Stockwell's Shop/Wallet Spot (80 Rupees)",
    "@Town - Stockwell's Shop/Boomerang Spot (300 Rupees)",
    "@Town - Stockwell's Shop/Quiver Spot (600 Rupees)",
    "@Town - Stockwell's Shop/Dog Food Bottle",
	"@Town - Eastern Shops/Figurine House Heart Piece",
	"@Town - Fountain/Heart Piece",
	"@Town - School Gardens/Heart Piece",
	"@Town - Julietta's House/Item",
	"@Hylia - Lon Lon Ranch - North Heart Piece/Heart Piece",
	"@Hylia - Cape Heart Piece/Heart Piece",
	"@Hylia - Southern/Heart Piece",
	"@Hylia - Lake Cabin/Item",
	"@Minish Woods North - Heart Piece/Heart Piece",
	"@Veil Falls - Heart Piece/Heart Piece",
	"@Veil Falls South - Rupees/Rupee 1",
	"@Veil Falls South - Rupees/Rupee 2",
	"@Veil Falls South - Rupees/Rupee 3",
    "@DeepWoods/Madderpillar Heart Piece",
    "@Deepwoods - Madderpillar Heart Piece/Heart Piece",
    "@DeepWoods/Prize",
    "@Cave Of Flame/Bombable Wall Heart Piece",
    "@Cave Of Flame - Bombable Wall/Heart Piece",
    "@Cave Of Flame/Prize",
    "@Crypt - Gibdos/First Kill",
    "@Crypt - Gibdos/Second Kill",
    "@Royal Crypt/First Gibdos",
    "@Royal Crypt/Other Gibdos",
    "@Royal Crypt/Prize",
    "@Fortress - Right Side Heart Piece/Heart Piece",
    "@Fortress - Minish Dirt Room Key/Drop",
    "@Fortress/Right Side Heart Piece",
    "@Fortress/Minish Dirt Room Key Drop",
    "@Fortress/Prize",
    "@Palace - Heart Piece/Heart Piece",
    "@Palace/Heart Piece",
    "@Palace/Prize",
    "@Droplet/Prize",
    "@Dark Hyrule Castle Entrance/Prize",
    "@Cave Of Flame Entrance/Prize",
    "@Crypt Entrance/Prize",
    "@DeepWoods Entrance/Prize",
    "@Fortress Entrance/Prize",
    "@Palace Entrance/Prize",
    "@Droplet Entrance/Prize"
}
CaptureBadgeCache = {}

function tracker_on_accessibility_updated()
    if Cache_reset then
	local info_target={}
        for _, section in pairs(CaptureBadgeSections) do
            local target = Tracker:FindObjectForCode(section)
            if not target then
                print("Failed to resolve " .. section .. ", please check for typos.")
            else
                if target.CapturedItem then
					if not info_target[target.Owner] then
						info_target[target.Owner]=true
						-- print(section,target.Owner,info_target[target.Owner])
						-- Si cette section a un CapturedItem, ajouter le badge
						if CaptureBadgeCache[target.Owner] then
							-- Si le propriétaire de la section a déjà un badge, le retirer d'abord
							target.Owner:RemoveBadge(CaptureBadgeCache[target.Owner])
						end
						CaptureBadgeCache[target.Owner] = target.Owner:AddBadge(target.CapturedItem.PotentialIcon)
						CaptureBadgeCache[target] = target.CapturedItem
					end
                elseif CaptureBadgeCache[target] then
                    -- Si cette section n'a pas de CapturedItem mais a un badge, le retirer
                    target.Owner:RemoveBadge(CaptureBadgeCache[target.Owner])
                    CaptureBadgeCache[target.Owner] = nil
                    CaptureBadgeCache[target] = nil
                end
            end
        end
    end
end




function tracker_on_begin_loading_save_file()
	no_preset=true
	print("")
	print("--	Load Save File Started	--")
	print("")
end
function tracker_on_finish_loading_save_file()
	print("")
	print("--	Load Save File Finish	--")
	print("")
end
function tracker_on_pack_ready()
	print("")
	print("--	Tracker Information	--")
	print("")
	if VERSION_ALPHA then
		print("	Type:				Alpha")
	elseif VERSION_BETA then
		print("	Type:				Beta")
	else
		print("	Type:				Official")
	end
	print("	Based on randomizer:	",VERSION_RANDO)
	print("	Create by Deoxis")
	print("	Thanks to Myth for logic")
	print("	Thanks to all the testers who gave me feedback")
	print("")
	print("--	Tracker Configuration	--")
	print("")
	print("	Tracker is ready")
	Cache_reset=true
	no_preset=false
	Preset()
	UpdateFusion()
	print("	Enable Cache :		",Cache_reset)
	if TMC_CACHE_DEBUG_FUNCTION or TMC_CACHE_DEBUG_ITEM then
		print("")
		print("--	Cache Debug Logging Configuration  --")
		print("")
		print("	Items:    		   ", TMC_CACHE_DEBUG_ITEM)
		print("	Functions:    		  ", TMC_CACHE_DEBUG_FUNCTION)
	end
	print("")
	print("--	Auto-Tracker Configuration  --")
	print("")
	print("	Enable Items:		", AUTOTRACKER_ENABLE_ITEM_TRACKING)
	print("	Enable Locations:	", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
	print("	Enable Fusions:	", AUTOTRACKER_ENABLE_FUZER_TRACKING)
	if TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND or TMC_AUTOTRACKER_DEBUG_LOCATION or TMC_AUTOTRACKER_DEBUG_ITEM then
		print("")
		print("--	Auto-Tracker Debug Logging Configuration  --")
		print("")
		print("	Items:    		   ", TMC_AUTOTRACKER_DEBUG_ITEM)
		print("	Fusions:    		  ", TMC_AUTOTRACKER_DEBUG_FUZER)
		print("	Localisations: 	   ", TMC_AUTOTRACKER_DEBUG_LOCATION)
		print("	No found localisations:", TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND)
	end
	print("")
end

function function_Cached(name)
  local f = function_data[name]
  if not f then
    f = _G[name]()
    if has("out_logic_no") then
      f = f == 2 and 0 or f
    end
    function_data[name] = f
	  if TMC_CACHE_DEBUG_FUNCTION then
		function_count = function_count + 1
		local function_count_print = string.format("%03d", function_count)
		print("Cache Function ("..function_count_print.."): ", f, name)
	  end
  end
  return f
end

function has(item, amount)
    if not has_item_data[item] then
        has_item_data[item] = Tracker:ProviderCountForCode(item) >= tonumber(amount or 1)
        if TMC_CACHE_DEBUG_ITEM then
            print("Cache Items: ", item, has_item_data[item])
        end
    end
    return has_item_data[item]
end


-- This function checks whether the player does not have a certain item
function hasnot( item )
	-- Get the item count from the tracker
	local count = Tracker:ProviderCountForCode( item )

	-- Check if the item count is 0
	return count == 0
end
