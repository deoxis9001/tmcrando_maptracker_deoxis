ScriptHost:LoadScript(ScriptAutotracking.."item_mapping.lua")
ScriptHost:LoadScript(ScriptAutotracking.."location_mapping.lua")
ScriptHost:LoadScript(ScriptAutotracking.."room_mapping.lua")
ScriptHost:LoadScript(ScriptAutotracking.."events_mapping.lua")
ScriptHost:LoadScript(ScriptAutotracking.."slots_data_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}
heart_count = 0
heart_piece_count = 0
bombag_count = 0
bombs_count = 0
spin_setting_count = 0
-- resets an item to its initial state
function resetItem(item_code, item_type)
    if item_code =="" then
            return
    end
    local obj = Tracker:FindObjectForCode(item_code)
	if obj then
		item_type = item_type or obj.Type
		if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
			print(string.format("[RESET][ITEM][INFO] item_code :%s", item_code))
				print(string.format("[RESET][ITEM][INFO] item_type :%s", item_type))
		end
		if item_type == "toggle" or item_type == "toggle_badged" then
			obj.Active = false
			if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
				print(string.format("[RESET][ITEM][INFO] %s.Active : %s", item_code,obj.Active))
			end
		elseif item_type == "progressive" or item_type == "progressive_toggle" then
			obj.CurrentStage = 0
			obj.Active = false
			if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
				print(string.format("[RESET][ITEM][INFO] %s.CurrentStage : %s", item_code,obj.CurrentStage))
				print(string.format("[RESET][ITEM][INFO] %s.Active : %s", item_code,obj.Active))
			end
		elseif item_type == "consumable" then
			obj.AcquiredCount = 0
			if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
				print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,obj.AcquiredCount))
			end
		elseif item_type == "spin" then
			obj.Active=0
			spin_setting_count = 0
		elseif item_type == "custom" then
			-- your code for your custom lua items goes here
            if item_code == "sword0" then
                sword:setActive(0)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,sword:getActive()))
				end
            elseif item_code == "smithsword" then
                smithsword:setActive(false)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,smithsword:getActive()))
				end
            elseif item_code == "greensword" then
                greensword:setActive(false)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,greensword:getActive()))
				end
            elseif item_code == "redsword" then
                redsword:setActive(false)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,redsword:getActive()))
				end
            elseif item_code == "bluesword" then
                bluesword:setActive(false)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,bluesword:getActive()))
				end
            elseif item_code == "foursword" then
                foursword:setActive(false)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,foursword:getActive()))
				end
            elseif item_code == "clouds" then
                clouds:setActive(0)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,clouds:getActive()))
				end
            elseif item_code == "wilds" then
                wilds:setActive(0)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,wilds:getActive()))
				end
            elseif item_code == "falls" then
                falls:setActive(0)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s : %s", item_code,falls:getActive()))
				end
            elseif item_code == "hearts" then
				heart_count = 0
				heart_piece_count = 0
				obj.CurrentStage = heart_count
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s.heart_count : %s", item_code,heart_count))
					print(string.format("[RESET][ITEM][INFO] %s.heart_piece_count : %s", item_code,heart_piece_count))
					print(string.format("[RESET][ITEM][INFO] %s.CurrentStage : %s", item_code,obj.CurrentStage))
				end
			elseif item_code == "bombs" then
				bombs_count = 0
				bombag_count = 0
				obj.Active = 0
				obj.CurrentStage = 0
				Tracker:FindObjectForCode("remote").Active=0
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][INFO] %s.bombs_count : %s", item_code,bombs_count))
					print(string.format("[RESET][ITEM][INFO] %s.bombag_count : %s", item_code,bombag_count))
					print(string.format("[RESET][ITEM][INFO] %s.Active : %s", item_code,obj.Active))
					print(string.format("[RESET][ITEM][INFO] %s.CurrentStage : %s", item_code,obj.CurrentStage))
				end
            end
		elseif item_type == "static" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
			print(string.format("[RESET][ITEM][INFO] static item %s", item_code))
		elseif item_type == "composite_toggle" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
			print(string.format("[RESET][ITEM][INFO] composite_toggle item %s", item_code))
			print(string.format("[RESET][ITEM][INFO] composite_toggle cannot be accessed via lua"))
			print(string.format("[RESET][ITEM][INFO] Please use the respective left/right toggle item codes insteads"))

		elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
			print(string.format("[RESET][ITEM][UNKNOWN] item type %s for code %s", item_type, item_code))
		end
	elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
		print(string.format("[RESET][ITEM][NOFOUND] Item: %s", item_code))
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
			print(string.format("[ITEM][INCREMENT] item_code :%s", item_code))
			print(string.format("[ITEM][INCREMENT] item_type :%s", item_type))
		end
		if item_type == "toggle" or item_type == "toggle_badged" then
			obj.Active = true
			if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
				print(string.format("[ITEM][INCREMENT] %s.Active : %s", item_code,obj.Active))
			end
		elseif item_type == "progressive" or item_type == "progressive_toggle" then
			if obj.Active then
				obj.CurrentStage = obj.CurrentStage + 1
			else
				obj.Active = true
			end
			if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
				print(string.format("[ITEM][INCREMENT] %s.CurrentStage : %s", item_code,obj.CurrentStage))
				print(string.format("[ITEM][INCREMENT] %s.Active : %s", item_code,obj.Active))
			end
		elseif item_type == "consumable" then
			obj.AcquiredCount = obj.AcquiredCount + obj.Increment * multiplier
			if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
				print(string.format("[ITEM][INCREMENT] %s.AcquiredCount : %s", item_code,obj.AcquiredCount))
				print(string.format("[ITEM][INCREMENT] %s.Increment : %s", item_code,obj.AcquiredCount))
				print(string.format("[ITEM][INCREMENT] %s.multiplier : %s", item_code,multiplier))
			end
		elseif item_type == "spin" then
			if item_code == "spinattack" then
				if spin_setting_count==0 then
					Tracker:FindObjectForCode("spinattack").Active=true
					spin_setting_count=1
				elseif  spin_setting_count == 2 then
					if Tracker:FindObjectForCode("greatspin").Active then
						Tracker:FindObjectForCode("longspin").Active = true
					else
						Tracker:FindObjectForCode("greatspin").Active = true
					end
				elseif  spin_setting_count == 3 then
					Tracker:FindObjectForCode("fastspin").Active  = true
				elseif  spin_setting_count == 4 then
					Tracker:FindObjectForCode("fastsplit").Active  = true
				end
			end
			if item_code == "greatspin" then
				if spin_setting_count~=0 then
					if Tracker:FindObjectForCode("greatspin").Active then
						Tracker:FindObjectForCode("longspin").Active = true
					else
						Tracker:FindObjectForCode("greatspin").Active =true
					end
				else
					Tracker:FindObjectForCode("spinattack").Active = true
					spin_setting_count=2
				end
			end
			if item_code == "longspin" then
				if spin_setting_count~=0 then
					if Tracker:FindObjectForCode("greatspin").Active then
						Tracker:FindObjectForCode("longspin").Active = true
					else
						Tracker:FindObjectForCode("greatspin").Active =true
					end
				else
					Tracker:FindObjectForCode("spinattack").Active=true
					spin_setting_count=2
				end
			end
			if item_code == "fastspin" then
				if spin_setting_count~=0 then
					Tracker:FindObjectForCode("fastspin").Active = true
				else
					Tracker:FindObjectForCode("spinattack").Active=true
					spin_setting_count=3
				end
			end
			if item_code == "fastsplit" then
				if spin_setting_count~=0 then
					Tracker:FindObjectForCode("fastsplit").Active = true
				else
					Tracker:FindObjectForCode("spinattack").Active = true
					spin_setting_count=4
				end
			end
			if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
				print(string.format("[ITEM][INCREMENT] item_code :%s", item_code))
				print(string.format("[ITEM][INCREMENT] spin_setting_count :%s", spin_setting_count))
				print(string.format("[ITEM][INCREMENT] spinattack :%s", Tracker:FindObjectForCode("spinattack").Active))
				print(string.format("[ITEM][INCREMENT] greatspin :%s", Tracker:FindObjectForCode("greatspin").Active))
				print(string.format("[ITEM][INCREMENT] longspin :%s", Tracker:FindObjectForCode("longspin").Active))
				print(string.format("[ITEM][INCREMENT] fastspin :%s", Tracker:FindObjectForCode("fastspin").Active))
				print(string.format("[ITEM][INCREMENT] fastsplit :%s", Tracker:FindObjectForCode("fastsplit").Active))
			end
		elseif item_type == "custom" then
			-- your code for your custom lua items goes here
            if item_code == "sword0" then
				local count = sword:getActive() + 1
                sword:setActive(count)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,sword:getActive()))
				end
            elseif item_code == "smithsword" then
                smithsword:setActive(true)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,smithsword:getActive()))
				end
            elseif item_code == "greensword" then
                greensword:setActive(true)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,greensword:getActive()))
				end
            elseif item_code == "redsword" then
                redsword:setActive(true)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,redsword:getActive()))
				end
            elseif item_code == "bluesword" then
                bluesword:setActive(true)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,bluesword:getActive()))
				end
            elseif item_code == "foursword" then
                foursword:setActive(true)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,foursword:getActive()))
				end
            elseif item_code == "clouds" then
				local count = clouds:getActive() + 1
                clouds:setActive(count)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,clouds:getActive()))
				end
            elseif item_code == "wilds" then
				local count = wilds:getActive() + 1
                wilds:setActive(count)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,wilds:getActive()))
				end
            elseif item_code == "falls" then
				local count = falls:getActive() + 1
                falls:setActive(count)
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] %s : %s", item_code,falls:getActive()))
				end
            elseif item_code == "hearts" then
				if multiplier == 4 then
					heart_count = heart_count + 1
				else
					heart_piece_count = heart_piece_count + 1
					if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
						print(string.format("[ITEM][INCREMENT] heart_piece_count: %s", heart_piece_count))
					end
				   if heart_piece_count == 4 then
						heart_count = heart_count + 1
						heart_piece_count = 0
				   end
				   if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					   print(string.format("[ITEM][INCREMENT] heart_count: %s", heart_count))
				   end
				end
				obj.CurrentStage = heart_count
			elseif item_code == "bombs" then
				if multiplier == 3 then
					bombag_count = bombag_count + 1
				else
					if bombs_count == 1 then
						Tracker:FindObjectForCode("remote").Active=1
					else
						bombs_count = 1
					end
				end
				if bombs_count == 1 then
					obj.CurrentStage = bombag_count + bombs_count
				end
				if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
					print(string.format("[ITEM][INCREMENT] bombag_count: %s", bombag_count))
					print(string.format("[ITEM][INCREMENT] bombs_count: %s", bombs_count))
					print(string.format("[ITEM][INCREMENT] %s.Active: %s", item_code,obj.Active))
					print(string.format("[ITEM][INCREMENT] %s.CurrentStage: %s", item_code,obj.CurrentStage))
					print(string.format("[ITEM][INCREMENT] remote.Active: %s",Tracker:FindObjectForCode("remote").Active))
				end
			end
		elseif item_type == "static" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("[ITEM][INCREMENT] static item %s", item_code))
		elseif item_type == "composite_toggle" and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("[ITEM][INCREMENT] composite_toggle item %s", item_code))
			print(string.format("[ITEM][INCREMENT] composite_toggle cannot be accessed via lua"))
			print(string.format("[ITEM][INCREMENT] Please use the respective left/right toggle item codes insteads"))

		elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("[ITEM][INCREMENT][UNKNOWN] item type %s for code %s", item_type, item_code))
		end
	elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
		print(string.format("[ITEM][INCREMENT][NOFOUND] Item: %s", item_code))
		print(string.format("----- ITEM -----"))
	end
end

-- apply everything needed from slot_data, called from onClear
function apply_slot_data(slot_data)
	-- put any code here that slot_data should affect (toggling setting items for example)
	if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
		print(string.format("----- SLOT DATA -----"))
	end
	for slots_data_key, slots_data_entry in pairs(slot_data) do
		if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
			print(string.format(" /---  ---  ---\\ "))
			print(string.format("[SLOT DATA][INFO] slots_data_key: %s", slots_data_key))
			print(string.format("[SLOT DATA][INFO] slots_data_entry: %s", slots_data_entry))
		end
		if SLOTS_DATA_MAPPING[slots_data_key]~=nil then
			if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
				print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key]))
				print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][1]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][1]))
				print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][2]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][2]))
				print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][3]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][3]))
			end
			if SLOTS_DATA_MAPPING[slots_data_key][1] then
				local obj = Tracker:FindObjectForCode(SLOTS_DATA_MAPPING[slots_data_key][1])
				local setting = Tracker:FindObjectForCode("auto_setting_no")
				if obj and setting and setting.CurrentStage == 1 then
					if SLOTS_DATA_MAPPING[slots_data_key][2] == "INT" then
						if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
							print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][3][1]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][3][1]))
							print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][3][2]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][3][2]))
						end
						if slots_data_entry>=SLOTS_DATA_MAPPING[slots_data_key][3][1] and slots_data_entry<=SLOTS_DATA_MAPPING[slots_data_key][3][2] then
							obj.CurrentStage = slots_data_entry
						elseif slots_data_entry > SLOTS_DATA_MAPPING[slots_data_key][3][2] then
							obj.CurrentStage = SLOTS_DATA_MAPPING[slots_data_key][3][2]
						elseif slots_data_entry < SLOTS_DATA_MAPPING[slots_data_key][3][1] then
							obj.CurrentStage = SLOTS_DATA_MAPPING[slots_data_key][3][1]
						end
					elseif SLOTS_DATA_MAPPING[slots_data_key][2] == "OPT" then
						slots_data_entry = slots_data_entry + 1
						if SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry] then
							if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
								print(string.format("[SLOT DATA][INFO] slots_data_entry + 1: %s", slots_data_entry))
								print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][3][%s]: %s", slots_data_key, slots_data_entry, SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry]))
							end
							obj.CurrentStage = SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry]
						else
							obj.CurrentStage = 0
						end
					elseif SLOTS_DATA_MAPPING[slots_data_key][2] == "BOOL" then
						if slots_data_entry==true then
							slots_data_entry=2
						else
							slots_data_entry=1
						end 
						if SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry] then
							if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
								print(string.format("[SLOT DATA][INFO] slots_data_entry + 1: %s", slots_data_entry))
								print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][3][%s]: %s", slots_data_key, slots_data_entry, SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry]))
							end
							obj.CurrentStage = SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry]
						else
							obj.CurrentStage = 0
						end
					elseif SLOTS_DATA_MAPPING[slots_data_key][2] == "KIN" then
						slots_data_entry = slots_data_entry + 1
						if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
							print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][1]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][1]))
							print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][2]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][2]))
							print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][3]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][3]))
							print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][3][%s]: %s", slots_data_key, slots_data_entry, SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry]))
							print(string.format("[SLOT DATA][INFO] SLOTS_DATA_MAPPING[%s][4]: %s", slots_data_key, SLOTS_DATA_MAPPING[slots_data_key][4]))
						end
						local obj_combined = Tracker:FindObjectForCode(SLOTS_DATA_MAPPING[slots_data_key][4])
						if SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry]==3 then
							obj.CurrentStage = 1
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusiongoldcombined" then
								--fusiongoldcombined:setActive(1)
							end
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusionredcombined" then
								--fusionredcombined:setActive(1)
							end
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusiongreencombined" then
								--fusiongreencombined:setActive(1)
							end
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusionbluecombined" then
								--fusionbluecombined:setActive(1)
							end
						else
							obj.CurrentStage = SLOTS_DATA_MAPPING[slots_data_key][3][slots_data_entry]
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusiongoldcombined" then
								--fusiongoldcombined:setActive(1)
							end
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusionredcombined" then
								--fusionredcombined:setActive(1)
							end
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusiongreencombined" then
								--fusiongreencombined:setActive(1)
							end
							if SLOTS_DATA_MAPPING[slots_data_key][4] == "fusionbluecombined" then
								--fusionbluecombined:setActive(1)
							end
						end
					end
				end
			end
		end
		if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
			print(string.format(" \\---  ---  ---/ "))
		end
	end
	if AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
		print(string.format("----- SLOT DATA -----"))
	end
end

-- called right after an AP slot is connected
function onClear(slot_data)
	-- use bulk update to pause logic updates until we are done resetting all items/locations
	Tracker.BulkUpdate = true	
	if AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
		print(string.format("----- RESET -----"))
	end
	CUR_INDEX = -1
	-- reset locations
	for _, mapping_entry in pairs(LOCATION_MAPPING) do
		for _, location_table in ipairs(mapping_entry) do
			if location_table then
				local location_code = location_table[1]
				if location_code then
					if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
						print(string.format("[RESET][LOCATION][INFO] location_code: %s", location_code))
					end
					if location_code:sub(1, 1) == "@" then
						local obj = Tracker:FindObjectForCode(location_code)
						if obj then
							obj.AvailableChestCount = obj.ChestCount
							if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
								print(string.format("[RESET][LOCATION][INFO] %s.AvailableChestCount: %s", location_code,obj.AvailableChestCount))
							end
						elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
							print(string.format("[RESET][LOCATION][NOFOUND] location_code %s", location_code))
						end
					else
						-- reset hosted item
						local item_type = location_table[2]
						resetItem(location_code, item_type)
					end
				elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][LOCATION][NOFOUND] location_code"))
				end
			elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION  and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
				print(string.format("[RESET][LOCATION][EMPTY] location_table"))
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
				elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM  and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
					print(string.format("[RESET][ITEM][NOFOUND] no item_code"))
				end
			elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM  and AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
				print(string.format("[RESET][ITEM][EMPTY] item_table"))
			end
		end
	end
	apply_slot_data(slot_data)
	LOCAL_ITEMS = {}
	GLOBAL_ITEMS = {}
	ITEMS_ID ={}
    PLAYER_ID = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0
    if PLAYER_ID > -1 then
		for _, event_name in pairs(EVENTS_FLAG_MAPPING) do
			if event_name[1]~=nil then
				ITEMS_ID[event_name[1]] = "tmc_"..event_name[1].."_"..TEAM_NUMBER.."_"..PLAYER_ID
				updateEvents(event_name[2],0, true)
				Archipelago:SetNotify({ITEMS_ID[event_name[1]]})
				Archipelago:Get({ITEMS_ID[event_name[1]]})
			end
		end
        updateMap(0, true)
        ROOM_ID = "tmc_room_"..TEAM_NUMBER.."_"..PLAYER_ID
        Archipelago:SetNotify({ROOM_ID})
        Archipelago:Get({ROOM_ID})
        updateStatus("CLIENT_UNKNOWN", 0)
        CLIENTSTATUS = "_read_client_status_"..TEAM_NUMBER.."_"..PLAYER_ID
        Archipelago:SetNotify({CLIENTSTATUS})
        Archipelago:Get({CLIENTSTATUS})
    end
	if AP_AUTOTRACKER_ENABLE_DEBUG_RESET then
		print(string.format("----- RESET -----"))
	end
	Tracker.BulkUpdate = false
end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
	if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
		print(string.format("----- ITEM -----"))
		print(string.format("[ITEM][INFO] index :%s", index))
		print(string.format("[ITEM][INFO] item_id :%s", item_id))
		print(string.format("[ITEM][INFO] item_name :%s", item_name))
		print(string.format("[ITEM][INFO] player_number :%s", player_number))
		print(string.format("[ITEM][INFO] CUR_INDEX :%s", CUR_INDEX))

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
		if not AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM_NOFOUND  then
			print(string.format("----- ITEM -----"))
		end
		if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM or AP_AUTOTRACKER_ENABLE_DEBUG_ITEM_NOFOUND  then
			print(string.format("[ITEM][NOFOUND] %s : %s", item_id, item_name))
		end
		if not AP_AUTOTRACKER_ENABLE_DEBUG_ITEM and AP_AUTOTRACKER_ENABLE_DEBUG_ITEM_NOFOUND  then
			print(string.format("----- ITEM -----"))
		end

        return
    elseif ITEM_MAPPING[item_id][1] =="" then
            return
    end
	local mapping_entry = ITEM_MAPPING[item_id]
	if not mapping_entry then
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
				print(string.format("[ITEM][NOFOUND] item_code"))
			end
		elseif AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
			print(string.format("[ITEM][EMPTY] item_table"))
		end
	end
	if AP_AUTOTRACKER_ENABLE_DEBUG_ITEM then
		print(string.format("----- ITEM -----"))
	end
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
	if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
		print(string.format("----- LOCATION -----"))
		print(string.format("[LOCATION][INFO] location_id :%s", location_id))
		print(string.format("[LOCATION][INFO] location_name :%s", location_name))
	end
	if not AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		return
	end
	local mapping_entry = LOCATION_MAPPING[location_id]
	if not mapping_entry then
		if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
			print(string.format("[LOCATION][NOFOUND] location_id :%s", location_id))
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
					print(string.format("[LOCATION][NOFOUND] location_code :%s", location_code))
				end
			elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
				print(string.format("[LOCATION][NOFOUND] location_table"))
			end
		elseif AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
			print(string.format("[LOCATION][EMPTY] location_table"))
		end
	end
	if AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION then
		print(string.format("----- LOCATION -----"))
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
		if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
			print(string.format("----- EVENT -----"))
			print(string.format("[EVENT][INFO] k - %s", k))
			print(string.format("[EVENT][INFO] v - %s", v))
		end
		if k == ROOM_ID then
			updateMap(v, false)
		elseif k == CLIENTSTATUS then
			updateStatus(_, v)
		else
			for _, event_name in pairs(EVENTS_FLAG_MAPPING) do
				if 	ITEMS_ID[event_name[1]] == k then
					if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
						print(string.format("[EVENT][INFO] ITEMS_ID[event_name[1]] - %s", ITEMS_ID[event_name[1]]))
						print(string.format("[EVENT][INFO] event_name[2] - %s", event_name[2]))
					end
					updateEvents(event_name[2], v, false)
				end
			end
		end
		if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
			print(string.format("----- EVENT -----"))
		end
	end
end

function onNotifyLaunch(k, v)
	if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
		print(string.format("----- EVENT -----"))
		print(string.format("[EVENT][INFO] k - %s", k))
		print(string.format("[EVENT][INFO] v - %s", v))
	end
	if k == ROOM_ID then
        updateMap(v, false)
    elseif k == CLIENTSTATUS then
        updateStatus(_, v)
	else
		for _, event_name in pairs(EVENTS_FLAG_MAPPING) do
			if 	ITEMS_ID[event_name[1]] == k then
				if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
					print(string.format("[EVENT][INFO] ITEMS_ID[event_name[1]] - %s", ITEMS_ID[event_name[1]]))
					print(string.format("[EVENT][INFO] event_name[2] - %s", event_name[2]))
				end
				updateEvents(event_name[2], v, false)
			end
		end
	end
	if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
		print(string.format("----- EVENT -----"))
	end
end

function updateEvents(key, value, reset)
    if value ~= nil then
		if key ~= nil then
			if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
				print(string.format("----- EVENT function-----"))
				print(string.format("[EVENT][INFO] key - %s", key))
				print(string.format("[EVENT][INFO] Value - %s", value))
			end
			if key:sub(1, 1) == "@" then
				local obj = Tracker:FindObjectForCode(key)
				if reset then
					obj.AvailableChestCount = obj.ChestCount
					if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
						print(string.format("[EVENT][INFO] %s.AvailableChestCount - %s", key, obj.AvailableChestCount))
					end
				elseif obj then
					obj.AvailableChestCount = obj.AvailableChestCount - value
					if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
						print(string.format("[EVENT][INFO] %s.AvailableChestCount - %s", key, obj.AvailableChestCount))
					end
				end
			else
				local obj = Tracker:FindObjectForCode(key)
				if obj then
					obj.Active = value
				end
			end
			if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
				print(string.format("----- EVENT function -----"))
			end
		end
	end
end

function updateStatus(_, v)
    local status = v
	if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
		print(string.format("----- STATUS -----"))
		print(string.format("[STATUS][INFO] Value - %s", v))
		print(string.format("----- STATUS -----"))
	end
    if v == 30 then
        Tracker:FindObjectForCode("dhc").Active = 1
        Tracker:FindObjectForCode("@DHC/Vaati").AvailableChestCount = 0
        Tracker:FindObjectForCode("@DHC/Win").AvailableChestCount = 0
        Tracker:FindObjectForCode("@Dark Hyrule Castle - Pull the Pedestal/Win").AvailableChestCount = 0
        Tracker:FindObjectForCode("@Dark Hyrule Castle - Vaati/Kill").AvailableChestCount = 0
    end
end

function updateMap(v, reset)
	if v ~= nil then
		local tab_auto = Tracker:FindObjectForCode("auto_tab_no")
		if tab_auto and tab_auto.CurrentStage == 0 then
			return
		end
		local hex = string.upper(string.format('%04x',v))

		local hex2 = string.upper(string.sub(hex,string.len(hex)-1,string.len(hex)))
		local tab={}
		local tabs={}
		local tabs2={}
		local tabs3={}
		
		if AP_AUTOTRACKER_ENABLE_DEBUG_EVENT then
			print(string.format("----- MAP -----"))
			print(string.format("[MAP][INFO] Value - %s", v))
			print(string.format("[MAP][INFO] reset - %s", reset))
			print(string.format("[MAP][INFO] hex - %s", hex))
			print(string.format("[MAP][INFO] hex2 - %s", hex2))
			print(string.format("[MAP][INFO] ROOM_FLAG_MAPPING[hex2] - %s", ROOM_FLAG_MAPPING[hex2]))
			print(string.format("[MAP][INFO] ROOM_FLAG_MAPPING_SPEC[hex] - %s", ROOM_FLAG_MAPPING_SPEC[hex]))
			print(string.format("[MAP][INFO] ROOM_FLAG_MAPPING[00] - %s",ROOM_FLAG_MAPPING["00"]))
			print(string.format("----- MAP -----"))
		end
		if ROOM_FLAG_MAPPING_SPEC[hex] then
			local tabs2 = ROOM_FLAG_MAPPING_SPEC[hex][0]
			local number_tab = 0
			if tabs2 then
				for _, tab in ipairs(tabs2) do
					if tab_auto and tab_auto.CurrentStage == 2 then
						if number_tab <= 1 then
							print(string.format("----- TAB -----"))
							print(string.format("[TAB][INFO] tab - %s", tab))
							print(string.format("[TAB][INFO] number_tab - %s", number_tab))
							print(string.format("----- TAB -----"))
							Tracker:UiHint("ActivateTab", tab)
							number_tab = number_tab + 1
						else
							print(string.format("----- TAB -----"))
							print(string.format("[TAB][INFO] tab - Dungeon", tab))
							print(string.format("[TAB][INFO] number_tab - %s", number_tab))
							print(string.format("----- TAB -----"))
							Tracker:UiHint("ActivateTab", "Dungeon")
						end
					else
						Tracker:UiHint("ActivateTab", tab)
					end
				end
			end
		elseif ROOM_FLAG_MAPPING[hex2] then
			local tabs = ROOM_FLAG_MAPPING[hex2][0]
			local number_tab = 0
			if tabs then
				for _, tab in ipairs(tabs) do
					if tab_auto and tab_auto.CurrentStage == 2 then
						if number_tab <= 1 then
							print(string.format("----- TAB -----"))
							print(string.format("[TAB][INFO] tab - %s", tab))
							print(string.format("[TAB][INFO] number_tab - %s", number_tab))
							print(string.format("----- TAB -----"))
							Tracker:UiHint("ActivateTab", tab)
							number_tab = number_tab + 1
						else
							print(string.format("----- TAB -----"))
							print(string.format("[TAB][INFO] tab - Dungeon", tab))
							print(string.format("[TAB][INFO] number_tab - %s", number_tab))
							print(string.format("----- TAB -----"))
							Tracker:UiHint("ActivateTab", "Dungeon")
						end
					else
						Tracker:UiHint("ActivateTab", tab)
					end
				end
			end
		else
			local tabs3 = ROOM_FLAG_MAPPING["00"][0]
			local number_tab = 0
			if tabs3 then
				for _, tab in ipairs(tabs3) do
					if tab_auto and tab_auto.CurrentStage == 2 then
						if number_tab <= 1 then
							print(string.format("----- TAB -----"))
							print(string.format("[TAB][INFO] tab - %s", tab))
							print(string.format("[TAB][INFO] number_tab - %s", number_tab))
							print(string.format("----- TAB -----"))
							Tracker:UiHint("ActivateTab", tab)
							number_tab = number_tab + 1
						else
							print(string.format("----- TAB -----"))
							print(string.format("[TAB][INFO] tab - Dungeon", tab))
							print(string.format("[TAB][INFO] number_tab - %s", number_tab))
							print(string.format("----- TAB -----"))
							Tracker:UiHint("ActivateTab", "Dungeon")
						end
					else
						Tracker:UiHint("ActivateTab", tab)
					end
				end
			end
		end
	end
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