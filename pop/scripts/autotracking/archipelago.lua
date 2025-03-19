ScriptHost:LoadScript(ScriptAutotracking.."item_mapping.lua")
ScriptHost:LoadScript(ScriptAutotracking.."location_mapping.lua")
--ScriptHost:LoadScript(ScriptAutotracking.."ap_slot.lua")
--ScriptHost:LoadScript(ScriptAutotracking.."flag_mapping.lua")
ScriptHost:LoadScript(ScriptAutotracking.."room_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}
heart_count = 0
heart_piece_count = 0
-- resets an item to its initial state
function resetItem(item_code, item_type)
    if item_code =="" then
            return
    end
    local obj = Tracker:FindObjectForCode(item_code)
	if obj then
		item_type = item_type or obj.Type
		if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("resetItem: resetting item %s of type %s", item_code, item_type))
		end
		if item_type == "toggle" or item_type == "toggle_badged" then
			obj.Active = false
		elseif item_type == "progressive" or item_type == "progressive_toggle" then
			obj.CurrentStage = 0
			obj.Active = false
		elseif item_type == "consumable" then
			obj.AcquiredCount = 0
		elseif item_type == "custom" then
			-- your code for your custom lua items goes here
            if item_code == "sword0" then
                sword:setActive(0)
            elseif item_code == "smithsword" then
                smithsword:setActive(false)
            elseif item_code == "greensword" then
                greensword:setActive(false)
            elseif item_code == "redsword" then
                redsword:setActive(false)
            elseif item_code == "bluesword" then
                bluesword:setActive(false)
            elseif item_code == "foursword" then
                foursword:setActive(false)
            elseif item_code == "clouds" then
                clouds:setActive(0)
            elseif item_code == "wilds" then
                wilds:setActive(0)
            elseif item_code == "falls" then
                falls:setActive(0)
            elseif item_code == "hearts" then
				heart_count = 0
				heart_piece_count = 0
				obj.CurrentStage = heart_count
            end
		elseif item_type == "static" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("resetItem: tried to reset static item %s", item_code))
		elseif item_type == "composite_toggle" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format(
				"resetItem: tried to reset composite_toggle item %s but composite_toggle cannot be accessed via lua." ..
				"Please use the respective left/right toggle item codes instead.", item_code))
		elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("resetItem: unknown item type %s for code %s", item_type, item_code))
		end
	elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
		print(string.format("resetItem: could not find item object for code %s", item_code))
	end
end

-- advances the state of an item
function incrementItem(item_code, item_type, multiplier)
	
    if item_code =="" then
            return
    end
    local obj = Tracker:FindObjectForCode(item_code)
	if obj then
		item_type = item_type or obj.Type
		if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("incrementItem: code: %s, type %s", item_code, item_type))
		end
		if item_type == "toggle" or item_type == "toggle_badged" then
			obj.Active = true
		elseif item_type == "progressive" or item_type == "progressive_toggle" then
			if obj.Active then
				obj.CurrentStage = obj.CurrentStage + 1
			else
				obj.Active = true
			end
		elseif item_type == "consumable" then
			obj.AcquiredCount = obj.AcquiredCount + obj.Increment * multiplier
		elseif item_type == "custom" then
			-- your code for your custom lua items goes here
            if item_code == "sword0" then
				local count = sword:getActive() + 1
                sword:setActive(count)
            elseif item_code == "smithsword" then
                smithsword:setActive(true)
            elseif item_code == "greensword" then
                greensword:setActive(true)
            elseif item_code == "redsword" then
                redsword:setActive(true)
            elseif item_code == "bluesword" then
                bluesword:setActive(true)
            elseif item_code == "foursword" then
                foursword:setActive(true)
            elseif item_code == "clouds" then
				local count = clouds:getActive() + 1
                clouds:setActive(count)
            elseif item_code == "wilds" then
				local count = wilds:getActive() + 1
                wilds:setActive(count)
            elseif item_code == "falls" then
				local count = falls:getActive() + 1
                falls:setActive(count)
            elseif item_code == "hearts" then
				if multiplier == 4 then
					heart_count = heart_count + 1
				elseif heart_piece_count == 4 then
					heart_count = heart_count + 1
					heart_piece_count = 0
				else
					heart_piece_count = heart_piece_count + 1
				end
				obj.CurrentStage = heart_count
            end
		elseif item_type == "static" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("incrementItem: tried to increment static item %s", item_code))
		elseif item_type == "composite_toggle" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format(
				"incrementItem: tried to increment composite_toggle item %s but composite_toggle cannot be access via lua." ..
				"Please use the respective left/right toggle item codes instead.", item_code))
		elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("incrementItem: unknown item type %s for code %s", item_type, item_code))
		end
	elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
		print(string.format("incrementItem: could not find object for code %s", item_code))
	end
end

-- apply everything needed from slot_data, called from onClear
function apply_slot_data(slot_data)
	-- put any code here that slot_data should affect (toggling setting items for example)

	if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT then
		print(string.format("called apply_slot_data"))
		print(string.format("called apply_slot_data, RupeeSpot: %s", slot_data["RupeeSpot"]))
		print(string.format("called apply_slot_data, ObscureSpot: %s", slot_data["ObscureSpot"]))
	end
	local RUPEESPOT = slot_data["RupeeSpot"]
	local OBSCURESPOT = slot_data["ObscureSpot"]
	local obj_rupees = Tracker:FindObjectForCode("rupees_off")
	local obj_obscure = Tracker:FindObjectForCode("obscure_on")
	if RUPEESPOT == 1 then
		obj_rupees.CurrentStage = 1
	else
		obj_rupees.CurrentStage = 0
	end
	if OBSCURESPOT == 1 then
		obj_obscure.CurrentStage = 1
	else
		obj_obscure.CurrentStage = 0
	end
end

-- called right after an AP slot is connected
function onClear(slot_data)
	-- use bulk update to pause logic updates until we are done resetting all items/locations
	Tracker.BulkUpdate = true	
	if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT then
		print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
	end
	CUR_INDEX = -1
	-- reset locations
	for _, mapping_entry in pairs(LOCATION_MAPPING) do
		for _, location_table in ipairs(mapping_entry) do
			if location_table then
				local location_code = location_table[1]
				if location_code then
					if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
						print(string.format("onClear: clearing location %s", location_code))
					end
					if location_code:sub(1, 1) == "@" then
						local obj = Tracker:FindObjectForCode(location_code)
						if obj then
							obj.AvailableChestCount = obj.ChestCount
						elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
							print(string.format("onClear: could not find location object for code %s", location_code))
						end
					else
						-- reset hosted item
						local item_type = location_table[2]
						resetItem(location_code, item_type)
					end
				elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
					print(string.format("onClear: skipping location_table with no location_code"))
				end
			elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
				print(string.format("onClear: skipping empty location_table"))
			end
		end
	end
	-- reset items
	for _, mapping_entry in pairs(ITEM_MAPPING) do
		for _, item_table in ipairs(mapping_entry) do
			if item_table then
				local item_code = item_table[1]
				local item_type = item_table[2]
				if item_code then
					resetItem(item_code, item_type)
				elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("onClear: skipping item_table with no item_code"))
				end
			elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
				print(string.format("onClear: skipping empty item_table"))
			end
		end
	end
	apply_slot_data(slot_data)
	LOCAL_ITEMS = {}
	GLOBAL_ITEMS = {}
	Tracker.BulkUpdate = false
	
    PLAYER_ID = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0
    if PLAYER_ID > -1 then
--        updateEvents(0, true)
--        EVENT_ID = "tmc_events_"..TEAM_NUMBER.."_"..PLAYER_ID
--        Archipelago:SetNotify({EVENT_ID})
--        Archipelago:Get({EVENT_ID})
        updateMap(0, true)
        ROOM_ID = "tmc_room_"..TEAM_NUMBER.."_"..PLAYER_ID
        Archipelago:SetNotify({ROOM_ID})
        Archipelago:Get({ROOM_ID})
        updateStatus("CLIENT_UNKNOWN", 0)
        CLIENTSTATUS = "_read_client_status_"..TEAM_NUMBER.."_"..PLAYER_ID
        Archipelago:SetNotify({CLIENTSTATUS})
        Archipelago:Get({CLIENTSTATUS})
    end
end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
	if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
		print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
	end
	if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
		return
	end
	if index <= CUR_INDEX then
		return
	end
	local is_local = player_number == Archipelago.PlayerNumber
	CUR_INDEX = index;
    if not ITEM_MAPPING[item_id]  then
        print(string.format("-----------"))
        print(string.format("%s : %s", item_id, item_name))
        print(string.format("-----------"))

        return
    elseif ITEM_MAPPING[item_id][1] =="" then
            return
    end
	local mapping_entry = ITEM_MAPPING[item_id]
	if not mapping_entry then
		if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("onItem: could not find item mapping for id %s", item_id))
		end
		return
	end
	for _, item_table in pairs(mapping_entry) do
		if item_table then
			local item_code = item_table[1]
			local item_type = item_table[2]
			local multiplier = item_table[3] or 1
			if item_code then
				incrementItem(item_code, item_type, multiplier)
				-- keep track which items we touch are local and which are global
				if is_local then
					if LOCAL_ITEMS[item_code] then
						LOCAL_ITEMS[item_code] = LOCAL_ITEMS[item_code] + 1
					else
						LOCAL_ITEMS[item_code] = 1
					end
				else
					if GLOBAL_ITEMS[item_code] then
						GLOBAL_ITEMS[item_code] = GLOBAL_ITEMS[item_code] + 1
					else
						GLOBAL_ITEMS[item_code] = 1
					end
				end
			elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
				print(string.format("onClear: skipping item_table with no item_code"))
			end
		elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("onClear: skipping empty item_table"))
		end
	end
	if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
	--	print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
	--	print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
	end
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
	if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
		print(string.format("called onLocation: %s, %s", location_id, location_name))
	end
	if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		return
	end
	local mapping_entry = LOCATION_MAPPING[location_id]
	if not mapping_entry then
		if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
			print(string.format("onLocation: could not find location mapping for id %s", location_id))
		end
		return
	end
	for _, location_table in pairs(mapping_entry) do
		if location_table then
			local location_code = location_table[1]
			if location_code then
				local obj = Tracker:FindObjectForCode(location_code)
				if obj then
					if location_code:sub(1, 1) == "@" then
						obj.AvailableChestCount = obj.AvailableChestCount - 1
					else
						-- increment hosted item
						local item_type = location_table[2]
						incrementItem(location_code, item_type)
					end
				elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
					print(string.format("onLocation: could not find object for code %s", location_code))
				end
			elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
				print(string.format("onLocation: skipping location_table with no location_code"))
			end
		elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
			print(string.format("onLocation: skipping empty location_table"))
		end
	end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
			item_player))
	end
	-- not implemented yet :(
end

-- called when a bounce message is received
function onBounce(json)
	if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
		print(string.format("called onBounce: %s", dump_table(json)))
	end
	-- your code goes here
end


function onNotify(k, v, old_value)
	if v ~= old_value then
		if k == EVENT_ID then
		    --updateEvents(v, false)
        elseif k == ROOM_ID then
            updateMap(v, false)
        elseif k == CLIENTSTATUS then
            updateStatus(_, v)
		end
	end
end

function onNotifyLaunch(k, v)
	if k == EVENT_ID then
		--updateEvents(v, false)
    elseif k == ROOM_ID then
        updateMap(v, false)
    elseif k == CLIENTSTATUS then
        updateStatus(_, v)
	end
end

function updateEvents(value, reset)
    if value ~= nil then
      if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
        print(string.format("updateEvents: Value - %s", v))
      end
      for _, event in pairs(EVENT_FLAG_MAPPING) do
        local bitmask = 2 ^ event.bit
        if reset or (value & bitmask ~= event.status) then
          event.status = value & bitmask
          for _, code in pairs(event.codes) do
            if code.setting == nil or has(code.setting) then
                Tracker:FindObjectForCode(code.code).Active = value & bitmask ~= 0
            end
          end
        end
      end
    end
end

function updateStatus(_, v)
    local status = v
    if v == 30 then
        Tracker:FindObjectForCode("dhc").Active = 1
        Tracker:FindObjectForCode("@DHC/Vaati").AvailableChestCount = 0
        Tracker:FindObjectForCode("@Dark Hyrule Castle - Vaati/Kill").AvailableChestCount = 0
    end
end

function updateMap(v, reset)
	print(string.format("updateEvents: Value - %s", v))
	print(string.format("updateEvents: reset - %s", reset))
	local hex = string.format('%02x',v)

	local hex2 = string.sub(hex,string.len(hex)-1,string.len(hex))
	local tab={}
	local tabs={}
	local tabs2={}
	local tabs3={}
	print(string.format("updateEvents: hex - %s", hex))
	print(string.format("updateEvents: hex2 - %s", hex2))
	print(string.format("updateEvents: ROOM_FLAG_MAPPING[hex2] - %s", ROOM_FLAG_MAPPING[hex2]))
	print(string.format("updateEvents: ROOM_FLAG_MAPPING_SPEC[hex] - %s", ROOM_FLAG_MAPPING_SPEC[hex]))
	print(string.format("updateEvents: ROOM_FLAG_MAPPING[00] - %s",ROOM_FLAG_MAPPING["00"]))
    --if has("op_auto_tab_on") then
	if ROOM_FLAG_MAPPING[hex2] then
       local tabs = ROOM_FLAG_MAPPING[hex2][0]
	   print(string.format("updateEvents: 1"))
       if tabs then
            for _, tab in ipairs(tabs) do
				print(string.format("updateEvents: tab - %s",tab))
                Tracker:UiHint("ActivateTab", tab)
            end
       end
	elseif ROOM_FLAG_MAPPING_SPEC[hex] then
       local tabs2 = ROOM_FLAG_MAPPING_SPEC[hex][0]
	   print(string.format("updateEvents: 2"))
       if tabs2 then
            for _, tab in ipairs(tabs2) do
                Tracker:UiHint("ActivateTab", tab)
            end
       end
	else
		local tabs3 = ROOM_FLAG_MAPPING["00"][0]
		print(string.format("updateEvents: 3"))
		if tabs3 then
			 for _, tab in ipairs(tabs3) do
				 Tracker:UiHint("ActivateTab", tab)
			 end
		end
	end
	
    --end
end





Archipelago:AddClearHandler("clear handler", onClear)
if AUTOTRACKER_ENABLE_ITEM_TRACKING then
	Archipelago:AddItemHandler("item handler", onItem)
end
if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	Archipelago:AddLocationHandler("location handler", onLocation)
end
-- Archipelago:AddScoutHandler("scout handler", onScout)
-- Archipelago:AddBouncedHandler("bounce handler", onBounce)
Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)