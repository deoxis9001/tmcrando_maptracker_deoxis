local vanilla_captures = {
  ["@DeepWoods/Prize"] = "",
  ["@Cave Of Flame/Prize"] = "",
  ["@Royal Crypt/Prize"] = "",
  ["@Fortress/Prize"] = "",
  ["@Palace/Prize"] = "",
  ["@Droplet/Prize"] = "",
  ["@Dark Hyrule Castle Entrance/Prize"] = "allelement",
  ["@Cave Of Flame Entrance/Prize"] = "allelement",
  ["@Crypt Entrance/Prize"] = "allelement",
  ["@DeepWoods Entrance/Prize"] = "allelement",
  ["@Fortress Entrance/Prize"] = "allelement",
  ["@Palace Entrance/Prize"] = "allelement",
  ["@Droplet Entrance/Prize"] = "allelement"
}
function update_vanilla_captures()
  for location, item in pairs(vanilla_captures) do
    local location_object = Tracker:FindObjectForCode(location)
    local item_object = Tracker:FindObjectForCode(item)
    if location_object then
      if item_object then
        location_object.CapturedItem = item_object
      else
        location_object.CapturedItem = nil
      end
    end
  end
end
local link_captures = {
  ["dws_dws"] = {
    ["@DeepWoods/Prize"] = "@DeepWoods Entrance/Prize"
  },
  ["dws_cof"] = {
    ["@DeepWoods/Prize"] = "@Cave Of Flame Entrance/Prize"
  },
  ["dws_fow"] = {
    ["@DeepWoods/Prize"] = "@Fortress Entrance/Prize"
  },
  ["dws_tod"] = {
    ["@DeepWoods/Prize"] = "@Droplet Entrance/Prize"
  },
  ["dws_crypt"] = {
    ["@DeepWoods/Prize"] = "@Crypt Entrance/Prize"
  },
  ["dws_pow"] = {
    ["@DeepWoods/Prize"] = "@Palace Entrance/Prize"
  },
  ["dws_dhc"] = {
    ["@DeepWoods/Prize"] = "@Dark Hyrule Castle Entrance/Prize"
  },
  ["cof_dws"] = {
    ["@Cave Of Flame/Prize"] = "@DeepWoods Entrance/Prize"
  },
  ["cof_cof"] = {
    ["@Cave Of Flame/Prize"] = "@Cave Of Flame Entrance/Prize"
  },
  ["cof_fow"] = {
    ["@Cave Of Flame/Prize"] = "@Fortress Entrance/Prize"
  },
  ["cof_tod"] = {
    ["@Cave Of Flame/Prize"] = "@Droplet Entrance/Prize"
  },
  ["cof_crypt"] = {
    ["@Cave Of Flame/Prize"] = "@Crypt Entrance/Prize"
  },
  ["cof_pow"] = {
    ["@Cave Of Flame/Prize"] = "@Palace Entrance/Prize"
  },
  ["cof_dhc"] = {
    ["@Cave Of Flame/Prize"] = "@Dark Hyrule Castle Entrance/Prize"
  },
  ["fow_dws"] = {
    ["@Fortress/Prize"] = "@DeepWoods Entrance/Prize"
  },
  ["fow_cof"] = {
    ["@Fortress/Prize"] = "@Cave Of Flame Entrance/Prize"
  },
  ["fow_fow"] = {
    ["@Fortress/Prize"] = "@Fortress Entrance/Prize"
  },
  ["fow_tod"] = {
    ["@Fortress/Prize"] = "@Droplet Entrance/Prize"
  },
  ["fow_crypt"] = {
    ["@Fortress/Prize"] = "@Crypt Entrance/Prize"
  },
  ["fow_pow"] = {
    ["@Fortress/Prize"] = "@Palace Entrance/Prize"
  },
  ["fow_dhc"] = {
    ["@Fortress/Prize"] = "@Dark Hyrule Castle Entrance/Prize"
  },
  ["tod_dws"] = {
    ["@Droplet/Prize"] = "@DeepWoods Entrance/Prize"
  },
  ["tod_cof"] = {
    ["@Droplet/Prize"] = "@Cave Of Flame Entrance/Prize"
  },
  ["tod_fow"] = {
    ["@Droplet/Prize"] = "@Fortress Entrance/Prize"
  },
  ["tod_tod"] = {
    ["@Droplet/Prize"] = "@Droplet Entrance/Prize"
  },
  ["tod_crypt"] = {
    ["@Droplet/Prize"] = "@Crypt Entrance/Prize"
  },
  ["tod_pow"] = {
    ["@Droplet/Prize"] = "@Palace Entrance/Prize"
  },
  ["tod_dhc"] = {
    ["@Droplet/Prize"] = "@Dark Hyrule Castle Entrance/Prize"
  },
  ["crypt_dws"] = {
    ["@Royal Crypt/Prize"] = "@DeepWoods Entrance/Prize"
  },
  ["crypt_cof"] = {
    ["@Royal Crypt/Prize"] = "@Cave Of Flame Entrance/Prize"
  },
  ["crypt_fow"] = {
    ["@Royal Crypt/Prize"] = "@Fortress Entrance/Prize"
  },
  ["crypt_tod"] = {
    ["@Royal Crypt/Prize"] = "@Droplet Entrance/Prize"
  },
  ["crypt_crypt"] = {
    ["@Royal Crypt/Prize"] = "@Crypt Entrance/Prize"
  },
  ["crypt_pow"] = {
    ["@Royal Crypt/Prize"] = "@Palace Entrance/Prize"
  },
  ["crypt_dhc"] = {
    ["@Royal Crypt/Prize"] = "@Dark Hyrule Castle Entrance/Prize"
  },
  ["pow_dws"] = {
    ["@Palace/Prize"] = "@DeepWoods Entrance/Prize"
  },
  ["pow_cof"] = {
    ["@Palace/Prize"] = "@Cave Of Flame Entrance/Prize"
  },
  ["pow_fow"] = {
    ["@Palace/Prize"] = "@Fortress Entrance/Prize"
  },
  ["pow_tod"] = {
    ["@Palace/Prize"] = "@Droplet Entrance/Prize"
  },
  ["pow_crypt"] = {
    ["@Palace/Prize"] = "@Crypt Entrance/Prize"
  },
  ["pow_pow"] = {
    ["@Palace/Prize"] = "@Palace Entrance/Prize"
  },
  ["pow_dhc"] = {
    ["@Palace/Prize"] = "@Dark Hyrule Castle Entrance/Prize"
  }
}
link_captures_cache = {}
local link_captures_cached = {}
function update_link_captures()
  for setting, captures in pairs(link_captures) do
    local has_setting = has(setting)
    for location, item in pairs(captures) do
      local location_object = Tracker:FindObjectForCode(location)
      local item_object = Tracker:FindObjectForCode(item)
      if link_captures_cache[setting] ~= has_setting then
        link_captures_cache[setting] = has_setting
        if has_setting then
          if location_object then
            if item_object then
              location_object.CapturedItem = item_object.CapturedItem
            elseif item_object.CapturedItem ~= nil then
              print("Item Inconnu", item)
              location_object.CapturedItem = nil
            end
          else
            print("location Inconnu", location)
          end
        end
      end
    end
  end
end
function Version_custom(Version1, Version2, Version3, Version4)
  -- print(Version1,"=",setting_preset_version_customV2[0])
  -- print(Version2,"=",setting_preset_version_customV2[1])
  -- print(Version3,"=",setting_preset_version_customV2[2])
  -- print(Version4,"=",setting_preset_version_customV2[3])
  if Version1 == setting_preset_version_customV2[0] then
    if Version2 == setting_preset_version_customV2[1] then
      if Version3 == setting_preset_version_customV2[2] then
        if Version4 == setting_preset_version_customV2[3] then
          return true
        end
      end
    end
  end
  return false
end
function Preset()
  local data_preset = Tracker:FindObjectForCode("preset_01")
  if no_preset then
    setting_preset_data_cache = data_preset.CurrentStage + 1
    return 0
  end
  if setting_preset_data_cache ~= (data_preset.CurrentStage + 1) then
    setting_preset_data_cache = data_preset.CurrentStage + 1
    if setting_preset_data_cache ~= 0 then
      if Version_custom(0, 0, 0, 4) or setting_preset_data_title[setting_preset_data_cache] ~= "Custom" then
        print(setting_preset_data_title[setting_preset_data_cache])
      else
        print("Please update your override of custom.lua")
        return 0
      end
      for i, v in pairs(setting_preset_data[setting_preset_data_title[setting_preset_data_cache]]) do
        local item = Tracker:FindObjectForCode(i)
        if item then
          if setting_preset_data_other[i] == nil then
            item.CurrentStage = v
          elseif setting_preset_data_other[i] == 1 then
            fusiongoldcombined:setActive(v)
          elseif setting_preset_data_other[i] == 2 then
            fusionredcombined:setActive(v)
          elseif setting_preset_data_other[i] == 3 then
            fusiongreencombined:setActive(v)
          elseif setting_preset_data_other[i] == 4 then
            fusionbluecombined:setActive(v)
          elseif setting_preset_data_other[i] == 5 then
            swordprogress:setActive(v)
          elseif setting_preset_data_other[i] == 6 then
            item.AcquiredCount = v
          end
        else
          print("error", i)
        end
      end
    end
  end
end
function UpdateFusion()
  if (has("fusionred_vanilla") or has("fusionred_complet")) then
    if (redflag == false or redflag == nil) then
      fusiongreencombined:updateMax()
      redflag = true
    end
  else
    if (redflag == true or redflag == nil) then
      fusiongreencombined:updateMax()
      redflag = false
    end
  end
  if (has("fusionblue_vanilla") or has("fusionblue_complet")) then
    if (blueflag == false or blueflag == nil) then
      fusionredcombined:updateMax()
      fusiongreencombined:updateMax()
      blueflag = true
    end
  else
    if (blueflag == true or blueflag == nil) then
      fusionredcombined:updateMax()
      fusiongreencombined:updateMax()
      blueflag = false
    end
  end
end
function tracker_on_accessibility_updating()
  if Cache_reset then
    has_item_data = {}
    function_data = {}
    function_count = 0
    function_data_fusion = {}
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
function captureBadge()
  if Cache_reset then
    local info_target = {}
    for _, section in pairs(CaptureBadgeSections) do
      local target = Tracker:FindObjectForCode(section)
      if not target then
        print("Failed to resolve " .. section .. ", please check for typos.")
      else
        if target.CapturedItem then
          if not info_target[target.Owner] then
            info_target[target.Owner] = true
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
function tracker_on_accessibility_updated()
  update_link_captures()
  captureBadge()
end

function tracker_on_begin_loading_save_file()
  no_preset = true
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
  if no_preset == nil then
    no_preset = false
  end
  if not no_preset then
    update_vanilla_captures()
  end
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
  print("	Based on randomizer:	", VERSION_RANDO)
  print("	Create by Deoxis")
  print("	Thanks to Myth for logic")
  print("	Thanks to all the testers who gave me feedback")
  print("")
  print("--	Tracker Configuration	--")
  print("")
  print("	Tracker is ready")
  Cache_reset = true
  no_preset = false
  Preset()
  UpdateFusion()
  captureBadge()
  print("	Enable Cache :		", Cache_reset)
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
  print("	Enable Fusions:	", AUTOTRACKER_ENABLE_FUSER_TRACKING)
  if TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND or TMC_AUTOTRACKER_DEBUG_LOCATION or TMC_AUTOTRACKER_DEBUG_ITEM then
    print("")
    print("--	Auto-Tracker Debug Logging Configuration  --")
    print("")
    print("	Items:    		   ", TMC_AUTOTRACKER_DEBUG_ITEM)
    print("	Fusions:    		  ", TMC_AUTOTRACKER_DEBUG_FUSER)
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
      print("Cache Function (" .. function_count_print .. "): ", f, name)
    end
  end
  return f
end

function has(item, amount)
  if has_item_data[item] == nil then
    has_item_data[item] = Tracker:ProviderCountForCode(item) >= tonumber(amount or 1)
    if TMC_CACHE_DEBUG_ITEM then
      print("Cache Items: ", item, has_item_data[item])
    end
  end
  if has_item_data_dev[item] then
    if TMC_CACHE_DEBUG_ITEM then
      print("Cache dev Items: ", item, has_item_data_dev[item])
    end
    has_item_data[item] = has_item_data_dev[item]
  end
  return has_item_data[item]
end

-- This function checks whether the player does not have a certain item
function hasnot(item)
  -- Get the item count from the tracker
  local count = Tracker:ProviderCountForCode(item)

  -- Check if the item count is 0
  return count == 0
end
