local vanilla_captures = {
  ["@DeepWoods/Reward"] = "allelement",
  ["@Cave Of Flame/Reward"] = "allelement",
  ["@Crypt/Reward"] = "allelement",
  ["@Fortress/Reward"] = "allelement",
  ["@Palace/Reward"] = "allelement",
  ["@Droplet/Reward"] = "allelement",
  ["@Dark Hyrule Castle Entrance/Reward"] = "allelement",
  ["@Cave Of Flame Entrance/Reward"] = "allelement",
  ["@Crypt Entrance/Reward"] = "allelement",
  ["@DeepWoods Entrance/Reward"] = "allelement",
  ["@Fortress Entrance/Reward"] = "allelement",
  ["@Palace Entrance/Reward"] = "allelement",
  ["@Droplet Entrance/Reward"] = "allelement"
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
    ["@DeepWoods/Reward"] = "@DeepWoods Entrance/Reward"
  },
  ["dws_cof"] = {
    ["@DeepWoods/Reward"] = "@Cave Of Flame Entrance/Reward"
  },
  ["dws_fow"] = {
    ["@DeepWoods/Reward"] = "@Fortress Entrance/Reward"
  },
  ["dws_tod"] = {
    ["@DeepWoods/Reward"] = "@Droplet Entrance/Reward"
  },
  ["dws_crypt"] = {
    ["@DeepWoods/Reward"] = "@Crypt Entrance/Reward"
  },
  ["dws_pow"] = {
    ["@DeepWoods/Reward"] = "@Palace Entrance/Reward"
  },
  ["dws_dhc"] = {
    ["@DeepWoods/Reward"] = "@Dark Hyrule Castle Entrance/Reward"
  },
  ["cof_dws"] = {
    ["@Cave Of Flame/Reward"] = "@DeepWoods Entrance/Reward"
  },
  ["cof_cof"] = {
    ["@Cave Of Flame/Reward"] = "@Cave Of Flame Entrance/Reward"
  },
  ["cof_fow"] = {
    ["@Cave Of Flame/Reward"] = "@Fortress Entrance/Reward"
  },
  ["cof_tod"] = {
    ["@Cave Of Flame/Reward"] = "@Droplet Entrance/Reward"
  },
  ["cof_crypt"] = {
    ["@Cave Of Flame/Reward"] = "@Crypt Entrance/Reward"
  },
  ["cof_pow"] = {
    ["@Cave Of Flame/Reward"] = "@Palace Entrance/Reward"
  },
  ["cof_dhc"] = {
    ["@Cave Of Flame/Reward"] = "@Dark Hyrule Castle Entrance/Reward"
  },
  ["fow_dws"] = {
    ["@Fortress/Reward"] = "@DeepWoods Entrance/Reward"
  },
  ["fow_cof"] = {
    ["@Fortress/Reward"] = "@Cave Of Flame Entrance/Reward"
  },
  ["fow_fow"] = {
    ["@Fortress/Reward"] = "@Fortress Entrance/Reward"
  },
  ["fow_tod"] = {
    ["@Fortress/Reward"] = "@Droplet Entrance/Reward"
  },
  ["fow_crypt"] = {
    ["@Fortress/Reward"] = "@Crypt Entrance/Reward"
  },
  ["fow_pow"] = {
    ["@Fortress/Reward"] = "@Palace Entrance/Reward"
  },
  ["fow_dhc"] = {
    ["@Fortress/Reward"] = "@Dark Hyrule Castle Entrance/Reward"
  },
  ["tod_dws"] = {
    ["@Droplet/Reward"] = "@DeepWoods Entrance/Reward"
  },
  ["tod_cof"] = {
    ["@Droplet/Reward"] = "@Cave Of Flame Entrance/Reward"
  },
  ["tod_fow"] = {
    ["@Droplet/Reward"] = "@Fortress Entrance/Reward"
  },
  ["tod_tod"] = {
    ["@Droplet/Reward"] = "@Droplet Entrance/Reward"
  },
  ["tod_crypt"] = {
    ["@Droplet/Reward"] = "@Crypt Entrance/Reward"
  },
  ["tod_pow"] = {
    ["@Droplet/Reward"] = "@Palace Entrance/Reward"
  },
  ["tod_dhc"] = {
    ["@Droplet/Reward"] = "@Dark Hyrule Castle Entrance/Reward"
  },
  ["crypt_dws"] = {
    ["@Crypt/Reward"] = "@DeepWoods Entrance/Reward"
  },
  ["crypt_cof"] = {
    ["@Crypt/Reward"] = "@Cave Of Flame Entrance/Reward"
  },
  ["crypt_fow"] = {
    ["@Crypt/Reward"] = "@Fortress Entrance/Reward"
  },
  ["crypt_tod"] = {
    ["@Crypt/Reward"] = "@Droplet Entrance/Reward"
  },
  ["crypt_crypt"] = {
    ["@Crypt/Reward"] = "@Crypt Entrance/Reward"
  },
  ["crypt_pow"] = {
    ["@Crypt/Reward"] = "@Palace Entrance/Reward"
  },
  ["crypt_dhc"] = {
    ["@Crypt/Reward"] = "@Dark Hyrule Castle Entrance/Reward"
  },
  ["pow_dws"] = {
    ["@Palace/Reward"] = "@DeepWoods Entrance/Reward"
  },
  ["pow_cof"] = {
    ["@Palace/Reward"] = "@Cave Of Flame Entrance/Reward"
  },
  ["pow_fow"] = {
    ["@Palace/Reward"] = "@Fortress Entrance/Reward"
  },
  ["pow_tod"] = {
    ["@Palace/Reward"] = "@Droplet Entrance/Reward"
  },
  ["pow_crypt"] = {
    ["@Palace/Reward"] = "@Crypt Entrance/Reward"
  },
  ["pow_pow"] = {
    ["@Palace/Reward"] = "@Palace Entrance/Reward"
  },
  ["pow_dhc"] = {
    ["@Palace/Reward"] = "@Dark Hyrule Castle Entrance/Reward"
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
function tracker_on_accessibility_updating_section(locationCheck)
  cache_number = cache_number + 1
  if cache_number > 100000000 then
    return 0
  end
  if Cache_reset then
    has_item_data = {}
    function_data = {}
    function_count = 0
    function_data_fusion = {}
    Preset()
    UpdateFusion()
  end
end
function tracker_on_accessibility_updating()
  cache_number = cache_number + 1
  if cache_number > 100000000 then
    return 0
  end
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
  "@Cave Of Flame/B1 - HP",
  "@Cave Of Flame/Reward",
  "@Crypt/Gibdo Left - Item",
  "@Crypt/Gibdo Right - Item",
  "@Crypt/Reward",
  "@DeepWoods/1F - Madderpillar - HP",
  "@DeepWoods/Reward",
  "@Fortress/Entrance 1F - Right - HP",
  "@Fortress/Back 2F - Right Minish - Item Drop",
  "@Fortress/Reward",
  "@Palace/1st Half 3F - Pot Puzzle - Item Drop",
  "@Palace/2nd Half 4F - HP",
  "@Palace/Reward",
  "@Droplet/Reward",
  "@Dark Hyrule Castle Entrance/Reward",
  "@Droplet Entrance/Reward",
  "@Palace Entrance/Reward",
  "@Fortress Entrance/Reward",
  "@Cave Of Flame Entrance/Reward",
  "@Crypt Entrance/Reward",
  "@Deepwoods Entrance/Reward",
  "@Falls - Entrance/HP",
  "@Falls Lower - Rock/Item 1",
  "@Falls Lower - Rock/Item 2",
  "@Falls Lower - Rock/Item 3",
  "@Hylia - Cape Cave - Lon Lon/HP",
  "@Hylia - Mayor Cabin/Item",
  "@Hylia - Bottom/HP",
  "@Hylia - Small Island/HP",
  "@Crypt - Gibdo Left/Item",
  "@Crypt - Gibdo Right/Item",
  "@Deepwoods - 1F - Madderpillar/HP",
  "@Fortress - Right Side Heart Piece/Heart Piece",
  "@Fortress - Minish Dirt Room Key/Drop",
  "@Palace - Pot Puzzle Key/Drop",
  "@Palace - Heart Piece/Heart Piece",
  "@Minish Woods - Top/HP",
  "@Town - Shop/80 Item",
  "@Town - Shop/300 Item",
  "@Town - Shop/600 Item",
  "@Town - Shop/600 Item 2",
  "@Town - Shop/Behind Counter",
  "@Town - School Path/HP",
  "@Town - Jullieta/Item",
  "@Town - Fountain/HP",
  "@Town - Music House/HP",
  "@Town - Goron Merchant/1 Right",
  "@Town - Goron Merchant/1 Middle",
  "@Town - Goron Merchant/1 Left",
  "@Town - Goron Merchant/2 Right",
  "@Town - Goron Merchant/2 Middle",
  "@Town - Goron Merchant/2 Left",
  "@Town - Goron Merchant/3 Right",
  "@Town - Goron Merchant/3 Middle",
  "@Town - Goron Merchant/3 Left",
  "@Town - Goron Merchant/4 Right",
  "@Town - Goron Merchant/4 Middle",
  "@Town - Goron Merchant/4 Left",
  "@Town - Goron Merchant/5 Right",
  "@Town - Goron Merchant/5 Middle",
  "@Town - Goron Merchant/5 Left"
}
CaptureBadgeSections = {}
CaptureBadgeCache = {}
function captureBadge()
  if Cache_reset and not Cache_reset then
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
  if not PopVersion then
  update_link_captures()
  end
  --captureBadge()
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
  if not PopVersion then
    if not no_preset then
      update_vanilla_captures()
    end
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
  if not PopVersion then
    --captureBadge()
  end
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

function exists(table,indices)
  test=table
  for i = 1,#indices
  do
      index=indices[i]
      if test[index]~=nil
      then
          test=test[index]
      else
          return false
      end
  end
  return true
end

function has(item, amount)
  if has_item_data_dev["spec"]~= nil then
    if has_item_data_dev["spec"][item] ~= nil then
      if has_item_data_dev["spec"][item]["desactive"] ~= nil then
        if has_item_data_dev["spec"][item]["name"] ~= nil then
          if has_item_data_dev["spec"][item]["def"] ~= nil then
            if hassetting(item) then
              Tracker:FindObjectForCode(has_item_data_dev["spec"][item]["name"]).CurrentStage = has_item_data_dev["spec"][item]["def"]
            end
          end
        end
      end
    end
  end
  if has_item_data_dev[item]~=nil then
    if TMC_CACHE_DEBUG_ITEM then
      print("Cache dev Items: ", item, has_item_data_dev[item])
    end
    has_item_data[item] = has_item_data_dev[item]
  end
  if has_item_data[item] == nil then
    has_item_data[item] = Tracker:ProviderCountForCode(item) >= tonumber(amount or 1)
    if TMC_CACHE_DEBUG_ITEM then
      print("Cache Items: ", item, has_item_data[item])
    end
  end
  return has_item_data[item]
end

function hassetting(item, amount)
  if has_item_data[item] == nil then
    has_item_data[item] = Tracker:ProviderCountForCode(item) >= tonumber(amount or 1)
    if TMC_CACHE_DEBUG_ITEM then
      print("Cache Items: ", item, has_item_data[item])
    end
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
