ScriptHost:LoadScript(ScriptAutotracking.."room_id_fonction.lua")

items_codes_autotracking={}
items_codes_autotracking_cache={}

items_codes_autotracking_cache["POT"]={}
items_codes_autotracking_cache["POT"]["LOC_ACTIVE"]={}

items_codes_autotracking_cache["UNDERWATER"]={}
items_codes_autotracking_cache["UNDERWATER"]["LOC_ACTIVE"]={}

items_codes_autotracking_cache["DIG"]={}
items_codes_autotracking_cache["DIG"]["LOC_ACTIVE"]={}

items_codes_autotracking_cache["DWS_ENTER"]={}
items_codes_autotracking_cache["DWS_ENTER"]["COUNT"]={}
items_codes_autotracking_cache["DWS_ENTER"]["ACTIVE"]={}
items_codes_autotracking_cache["DWS_ENTER"]["SETTING"]={}

items_codes_autotracking_cache["COF_ENTER"]={}
items_codes_autotracking_cache["COF_ENTER"]["COUNT"]={}
items_codes_autotracking_cache["COF_ENTER"]["ACTIVE"]={}
items_codes_autotracking_cache["COF_ENTER"]["SETTING"]={}

items_codes_autotracking_cache["FOW_ENTER"]={}
items_codes_autotracking_cache["FOW_ENTER"]["COUNT"]={}
items_codes_autotracking_cache["FOW_ENTER"]["ACTIVE"]={}
items_codes_autotracking_cache["FOW_WARPS"]={}
items_codes_autotracking_cache["FOW_WARPS"]["SETTING"]={}

items_codes_autotracking_cache["TOD_ENTER"]={}
items_codes_autotracking_cache["TOD_ENTER"]["COUNT"]={}
items_codes_autotracking_cache["TOD_ENTER"]["ACTIVE"]={}
items_codes_autotracking_cache["TOD_ENTER"]["SETTING"]={}

items_codes_autotracking_cache["POW_ENTER"]={}
items_codes_autotracking_cache["POW_ENTER"]["COUNT"]={}
items_codes_autotracking_cache["POW_ENTER"]["ACTIVE"]={}
items_codes_autotracking_cache["POW_ENTER"]["SETTING"]={}

items_codes_autotracking_cache["DHC_ENTER"]={}
items_codes_autotracking_cache["DHC_ENTER"]["COUNT"]={}
items_codes_autotracking_cache["DHC_ENTER"]["ACTIVE"]={}
items_codes_autotracking_cache["DHC_WARPS"]={}
items_codes_autotracking_cache["DHC_WARPS"]["SETTING"]={}

items_codes_autotracking_cache["RC_ENTER"]={}
items_codes_autotracking_cache["RC_ENTER"]["COUNT"]={}
items_codes_autotracking_cache["RC_ENTER"]["ACTIVE"]={}
items_codes_autotracking_cache["RC_ENTER"]["SETTING"]={}

code_type_cache={}

function autotracker_started()
	print("Started Tracking")
	AREA = 0
	ROOM = 0
	SEED_START = 0
	code_type_cache["DWS_ENTER"] = 0
	code_type_cache["COF_ENTER"] = 0
	code_type_cache["FOW_ENTER"] = 0
	code_type_cache["FOW_WARPS"] = 0
	code_type_cache["TOD_ENTER"] = 0
	code_type_cache["POW_ENTER"] = 0
	code_type_cache["RC_ENTER"] = 0
	code_type_cache["DHC_ENTER"] = 0
	code_type_cache["POT_SPOT"] = 0
	code_type_cache["DIG_SPOT"] = 0
	code_type_cache["UNDERWATER_SPOT"] = 0
	code_type_cache["OCARINA"] = 0
	DWS_KEY_COUNT = 0
	DWS_KEY_USED = 0
	COF_KEY_COUNT = 0
	COF_KEY_USED = 0
	FOW_KEY_COUNT = 0
	FOW_KEY_USED = 0
	TOD_KEY_COUNT = 0
	TOD_KEY_USED = 0
	POW_KEY_COUNT = 0
	POW_KEY_USED = 0
	DHC_KEY_COUNT = 0
	DHC_KEY_USED = 0
	RC_KEY_COUNT = 0
	RC_KEY_USED = 0
	BOW_VALUE = 0
	WildsFused = 0
	WildsBag = 0
	CloudsFused = 0
	CloudsBag = 0
	CloudsFused = 0
	CloudsBag = 0
	RedWBag = 0
	RedVBag = 0
	RedEBag = 0
	BlueLBag = 0
	BlueSBag = 0
	GreenGBag = 0
	GreenCBag = 0
	GreenPBag = 0
	fusion_count_wall = {}
	fusion_count_used = {}
	fusion_count = {}
	fusion_count["redW"] = 0
	fusion_count["redV"] = 0
	fusion_count["redE"] = 0
	fusion_count["blueL"] = 0
	fusion_count["blueS"] = 0
	fusion_count["greenG"] = 0
	fusion_count["greenC"] = 0
	fusion_count["greenP"] = 0
	fusion_count_used["redW"] = 0
	fusion_count_used["redV"] = 0
	fusion_count_used["redE"] = 0
	fusion_count_used["blueL"] = 0
	fusion_count_used["blueS"] = 0
	fusion_count_used["greenG"] = 0
	fusion_count_used["greenC"] = 0
	fusion_count_used["greenP"] = 0
	fusion_count_wall["redW"] = 0
	fusion_count_wall["redV"] = 0
	fusion_count_wall["redE"] = 0
	fusion_count_wall["blueL"] = 0
	fusion_count_wall["blueS"] = 0
	fusion_count_wall["greenG"] = 0
	fusion_count_wall["greenC"] = 0
	fusion_count_wall["greenP"] = 0
	KEY_STOLEN = false
end

U8_READ_CACHE = 0
U8_READ_CACHE_ADDRESS = 0

function InvalidateReadCaches()
	U8_READ_CACHE_ADDRESS = 0
end

function ReadU8(segment, address)
	if U8_READ_CACHE_ADDRESS ~= address then
		U8_READ_CACHE = segment:ReadUInt8(address)
		U8_READ_CACHE_ADDRESS = address
	end
	return U8_READ_CACHE
end


function isInGame()
	return AutoTracker:ReadU8(0x2002b32) > 0x00
end

function testFlag(segment, address, flag)
	local value = ReadU8(segment, address)
	local flagTest = value & flag
	if flagTest ~= 0 then
		return true
	else
		return false
	end
end
function updateWall(segment, code, address)
	local item = Tracker:FindObjectForCode(code)
	if ReadU8(segment, address) == 0xF3 then
		item.Active = true
	elseif ReadU8(segment, address) == 0xF2 then
		item.Active = true
	else
		item.Active = false
	end
end
function updateWallUsedFixed(code, segment, locationData)
	local item1 = Tracker:FindObjectForCode("blueL")
	local item2 = Tracker:FindObjectForCode("blueS")

	if item1 or item2 then
		local fusion_count_wall_local = 0
		fusion_count_wall["blueL"] = 0
		fusion_count_wall["blueS"] = 0
		for i = 1, #locationData, 1 do
			local address = locationData[i][1]
			local flag1 = 0xF3
			local flag2 = 0xF2
			local value = ReadU8(segment, address)

			-- local flagTest1 = value & flag1

			if value == flag1 or value == flag2 then
				fusion_count_wall_local = fusion_count_wall_local + 1
				if fusion_count_wall_local % 2 == 1 then
					fusion_count_wall["blueL"] = fusion_count_wall["blueL"] + 1
				else
					fusion_count_wall["blueS"] = fusion_count_wall["blueS"] + 1
				end
			end
		end
		local count_fusion1 = fusion_count["blueL"] + fusion_count_used["blueL"] + fusion_count_wall["blueL"]
		local count_fusion2 = fusion_count["blueS"] + fusion_count_used["blueS"] + fusion_count_wall["blueS"]
		if fusionbluecombined:getActive() then
			item1.ItemState:setActive(count_fusion1 + count_fusion2)
		else
			item1.ItemState:setActive(count_fusion1)
			item2.ItemState:setActive(count_fusion2)
		end
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("blueL - wall", fusion_count_wall["blueL"])
			print("blueS - wall", fusion_count_wall["blueS"])
		end
	end
end
function updateFusion(name, segment, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_Fuser then
			print(item.Name, code, flag, value)
		end

		local flagTest = value & flag
		if items_codes_autotracking[code]==nil then
			items_codes_autotracking[code]=false
		end

		if flagTest ~= 0 and items_codes_autotracking[code] then
		  item.Active = true
		elseif flagTest ~= 0 then
		  item.Active = false
		else
		  item.Active = false
		  items_codes_autotracking[code]=true
		end
	end
end

function updateToggleFlag(segment, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			item.Active = true
		--else
			--item.Active = false
		end
	end
end


function updateToggleFlagSpec(segment, type, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			if code_type_cache[type] == 1 then
				item.Active = true
				items_codes_autotracking_cache[type]["ACTIVE"][code]=true
			else
				items_codes_autotracking_cache[type]["ACTIVE"][code]=true
			end
		--else
--			item.Active = false
		end
	end
end
function updateToggleFlagSettings(segment, type, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			if items_codes_autotracking_cache[type]==nil then
				items_codes_autotracking_cache[type]={}
			end
			if items_codes_autotracking_cache[type]["SETTING"]==nil then
				items_codes_autotracking_cache[type]["SETTING"]={}
			end
			if code_type_cache[type] == 1 then
				item.CurrentStage = 1
				items_codes_autotracking_cache[type]["SETTING"][code] = 1
			else
				items_codes_autotracking_cache[type]["SETTING"][code]= 1
			end
		--else
--			item.Active = false
		end
	end
end


function updateToggleFlagCheck(segment, type, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			code_type_cache[type] = 1 
			item.Active = true
			if items_codes_autotracking_cache[type]==nil then
				items_codes_autotracking_cache[type]={}
			end
			if items_codes_autotracking_cache[type]["ACTIVE"]==nil then
				items_codes_autotracking_cache[type]["ACTIVE"]={}
			end
			items_codes_autotracking_cache[type]["ACTIVE"][code]=true
			UPDATE(type)
		end
	end
end

function smithswordCheck(segment, code, address, flag)
	if smithsword then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(smithsword.code, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			smithsword:setActive(true)
		else
			smithsword:setActive(false)
		end
	end
end

function greenswordCheck(segment, code, address, flag)
	if greensword then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(greensword.code, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			greensword:setActive(true)
		else
			greensword:setActive(false)
		end
	end
end

function redswordCheck(segment, code, address, flag)
	if redsword then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(redsword.code, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			redsword:setActive(true)
		else
			redsword:setActive(false)
		end
	end
end

function blueswordCheck(segment, code, address, flag)
	if bluesword then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(bluesword.code, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			bluesword:setActive(true)
		else
			bluesword:setActive(false)
		end
	end
end

function fourswordCheck(segment, code, address, flag)
	if foursword then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(foursword.code, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			foursword:setActive(true)
		else
			foursword:setActive(false)
		end
	end
end

function updateSectionFlag(segment, locationRef, address, flag)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		--Don't undo what user has done
		if location.Owner.ModifiedByUser then
			return
		end

		local value = ReadU8(segment, address)

		if TMC_AUTOTRACKER_DEBUG_LOCATION then
			print(locationRef, value)
		end

		if (value & flag) ~= 0 then
			location.AvailableChestCount = 0
		else
			location.AvailableChestCount = 1
		end
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end

function updateSectionFlagSpecialCheck(segment, special, locationRef, address, flag)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		--Don't undo what user has done
		if location.Owner.ModifiedByUser then
			return
		end

		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_LOCATION then
			print(locationRef, value)
		end
		if items_codes_autotracking_cache[special]==nil then
			items_codes_autotracking_cache[special]={}
		end
		if items_codes_autotracking_cache[special]["LOC_ACTIVE"]==nil then
			items_codes_autotracking_cache[special]["LOC_ACTIVE"]={}
		end

		if (value & flag) ~= 0 then
			if special~="" then
				if code_type_cache[special] ==1 then
					location.AvailableChestCount = 0
					items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = 0
				else
					items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = 0
				end
			else
				location.AvailableChestCount = 0
				items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = 0
			end
		else
			location.AvailableChestCount = 1
			if special~="" then
				items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = 1
			end
		end
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end
function updateDecreaseCountSpecialCheck(segment, special, locationRef, chestData)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		if location.Owner.ModifiedByUser then
			return
		end

		local cleared = 0

		for i = 1, #chestData, 1 do
			local address = chestData[i][1]
			local flag = chestData[i][2]
			local value = ReadU8(segment, address)

			local flagTest = value & flag

			if flagTest ~= 0 then
				cleared = cleared + 1
			end
		end
		if items_codes_autotracking_cache[special]==nil then
			items_codes_autotracking_cache[special]={}
		end
		if items_codes_autotracking_cache[special]["LOC_ACTIVE"]==nil then
			items_codes_autotracking_cache[special]["LOC_ACTIVE"]={}
		end
		if cleared>0 then
			if special~="" then
				if code_type_cache[special] ==1 then
					location.AvailableChestCount = (#chestData - cleared)
					items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = (#chestData - cleared)
				else
					items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = (#chestData - cleared)
				end
			else
				items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = (#chestData - cleared)
				location.AvailableChestCount = (#chestData - cleared)
			end
		else
			items_codes_autotracking_cache[special]["LOC_ACTIVE"][locationRef] = (#chestData - cleared)
			location.AvailableChestCount = (#chestData - cleared)
		end
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end


function updateToggleFlagDungeons(segment, dungeons, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value & flag

		if flagTest ~= 0 then
			item.Active = true
		else
			item.Active = false
		end
	end
end
function updateSectionFlagDungeons(segment, dungeons, locationRef, address, flag)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		--Don't undo what user has done
		if location.Owner.ModifiedByUser then
			return
		end

		local value = ReadU8(segment, address)

		if TMC_AUTOTRACKER_DEBUG_LOCATION then
			print(locationRef, value)
		end

		if (value & flag) ~= 0 then
			location.AvailableChestCount = 0
		else
			location.AvailableChestCount = 1
		end
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end
function updateDecreaseCountDungeons(segment, dungeons, locationRef, chestData)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		if location.Owner.ModifiedByUser then
			return
		end

		local cleared = 0

		for i = 1, #chestData, 1 do
			local address = chestData[i][1]
			local flag = chestData[i][2]
			local value = ReadU8(segment, address)

			local flagTest = value & flag

			if flagTest ~= 0 then
				cleared = cleared + 1
			end
		end
		location.AvailableChestCount = (#chestData - cleared)
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end

function updateSectionFlagSpecial(locationRef, flag)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		--Don't undo what user has done
		if location.Owner.ModifiedByUser then
			return
		end
		location.AvailableChestCount = flag
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end

function updateDecreaseCount(segment, locationRef, chestData)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		if location.Owner.ModifiedByUser then
			return
		end

		local cleared = 0

		for i = 1, #chestData, 1 do
			local address = chestData[i][1]
			local flag = chestData[i][2]
			local value = ReadU8(segment, address)

			local flagTest = value & flag

			if flagTest ~= 0 then
				cleared = cleared + 1
			end
		end

		location.AvailableChestCount = (#chestData - cleared)
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end
function updateDecreaseCountChest(segment, locationRef, cleared)
	local location = Tracker:FindObjectForCode(locationRef)
	if location then
		if location.Owner.ModifiedByUser then
			return
		end
		location.AvailableChestCount = cleared
	elseif TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND then
		print("Location not found", locationRef)
	end
end
function updateDogFood(segment, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value or flag

		if testFlag(segment, address, 0x10) or testFlag(segment, address, 0x20) then
			item.Active = true
		else
			item.Active = false
		end
	end
end

function updateLLRKey(segment, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value or flag

		if testFlag(segment, address, 0x40) or testFlag(segment, address, 0x80) then
			item.Active = true
		else
			item.Active = false
		end
	end
end

function updateMush(segment, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		if testFlag(segment, address, 0x01) or testFlag(segment, address, 0x02) then
			item.Active = true
		else
			item.Active = false
		end
	end
end

function graveKey(segment)
	if not isInGame() then
		return false
	end
	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		graveKeyStolen(segment, "gravekey", 0x2002ac0, 0x01)
	end
end

function graveKeyStolen(segment, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value or flag

		if testFlag(segment, address, 0x01) then
			KEY_STOLEN = true
		end
	end
end

function updateGraveKey(segment, code, address, flag)
	local item = Tracker:FindObjectForCode(code)
	if item then
		local value = ReadU8(segment, address)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print(item.Name, code, flag)
		end

		local flagTest = value or flag

		if testFlag(segment, address, 0x01) or testFlag(segment, address, 0x02) then
			item.Active = true
		end
	end
end

function updateBooks(segment, code, address)
	local item = Tracker:FindObjectForCode(code)
	local booksObtained = 0
	local booksUsed = 0

	local bookFlags = {0x04, 0x10, 0x40}
	local usedBooks = {0x08, 0x20, 0x80}

	for j = 1, 3, 1 do
		if testFlag(segment, address, bookFlags[j]) == true then
			booksObtained = booksObtained + 1
		end
		if testFlag(segment, address, usedBooks[j]) == true then
			booksUsed = booksUsed + 1
		end
	end

	if item then
		item.CurrentStage = booksObtained + booksUsed
	end
end

function updateSwords(segment)
	local item = sword.InfoStage
	if ReadU8(segment, 0x2002b33) == 0x01 or ReadU8(segment, 0x2002b33) == 0x41 or ReadU8(segment, 0x2002b33) == 0x81 then
		sword:setActive(4)
	elseif ReadU8(segment, 0x2002b33) == 0x11 or ReadU8(segment, 0x2002b33) == 0x51 or ReadU8(segment, 0x2002b33) == 0x91 then
		sword:setActive(5)
	elseif ReadU8(segment, 0x2002b32) == 0x05 then
		sword:setActive(1)
	elseif ReadU8(segment, 0x2002b32) == 0x15 then
		sword:setActive(2)
	elseif ReadU8(segment, 0x2002b32) == 0x55 then
		sword:setActive(3)
	else
		sword:setActive(0)
	end
end

function updateBow(segment)
	local item = Tracker:FindObjectForCode("bow")
	if testFlag(segment, 0x2002b34, 0x04) then
		item.CurrentStage = 1
		BOW_VALUE = 1
	end
	if testFlag(segment, 0x2002b34, 0x10) then
		item.CurrentStage = 2
	end
	if not testFlag(segment, 0x2002b34, 0x04) and not testFlag(segment, 0x2002b34, 0x10) then
		item.CurrentStage = 0
		BOW_VALUE = 0
	end
end

function updateBoomerang(segment)
	local item = Tracker:FindObjectForCode("boomerang")
	if testFlag(segment, 0x2002b34, 0x40) then
		item.CurrentStage = 1
	end
	if testFlag(segment, 0x2002b35, 0x01) then
		item.CurrentStage = 2
	end
	if not testFlag(segment, 0x2002b34, 0x40) and not testFlag(segment, 0x2002b35, 0x01) then
		item.CurrentStage = 0
	end
end

function updateShield(segment)
	local item = Tracker:FindObjectForCode("shield")
	if testFlag(segment, 0x2002b35, 0x04) then
		item.CurrentStage = 1
	end
	if testFlag(segment, 0x2002b35, 0x10) then
		item.CurrentStage = 2
	end
	if not testFlag(segment, 0x2002b35, 0x10) and not testFlag(segment, 0x2002b35, 0x04) then
		item.CurrentStage = 0
	end
end

function updateLamp(segment)
	local item = Tracker:FindObjectForCode("lamp")
	if testFlag(segment, 0x2002b35, 0x40) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateBottles(segment)
	local item = Tracker:FindObjectForCode("bottle")
	local value = ReadU8(segment, 0x2002b39)
	if value == 0x01 then
		item.CurrentStage = 1
	elseif value == 0x05 then
		item.CurrentStage = 2
	elseif value == 0x15 then
		item.CurrentStage = 3
	elseif value == 0x55 then
		item.CurrentStage = 4
	else
		item.CurrentStage = 0
	end
end

function updateBeams(segment)
	local item = Tracker:FindObjectForCode("beam")

	if testFlag(segment, 0x2002b45, 0x01) then
		item.Active = true
	elseif testFlag(segment, 0x2002b45, 0x40) then
		item.Active = true
	else
		item.Active = false
	end
end

function updateBombs(segment)
	local item = Tracker:FindObjectForCode("bombs")
	if item then
		item.CurrentStage = ReadU8(segment, 0x2002aee)
	end
	if ReadU8(segment, 0x2002aee) == 0x00 then
		item.CurrentStage = 0
	end
end

function updateQuiver(segment)
	local item = Tracker:FindObjectForCode("quiver")
	if item then
		item.CurrentStage = ReadU8(segment, 0x2002aef)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Bow value =", BOW_VALUE, ReadU8(segment, 0x2002aef))
		end
	end
	if ReadU8(segment, 0x2002aef) == 0x00 then
		item.CurrentStage = 0
	end
end

function updateWallet(segment)
	local item = Tracker:FindObjectForCode("wallet")
	if item then
		item.CurrentStage = ReadU8(segment, 0x2002ae8)
	end
	if ReadU8(segment, 0x2002ae8) == 0x00 then
		item.CurrentStage = 0
	end
end

function updateScrolls(segment)
	local item = Tracker:FindObjectForCode("sevenscrolls")
	local count = 0
	if testFlag(segment, 0x2002b44, 0x01) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b44, 0x04) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b44, 0x10) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b44, 0x40) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b45, 0x01) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b45, 0x04) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b45, 0x10) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b45, 0x40) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b4e, 0x40) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b4f, 0x01) then
		count = count + 1
	end
	if testFlag(segment, 0x2002b4f, 0x04) then
		count = count + 1
	end
	item.AcquiredCount = count
end

function updateGoldFallsUsed(segment, address, flag)
	local item = Tracker:FindObjectForCode("falls")
	if testFlag(segment, address, flag) then
		falls:setActive(1)
	end
end

function updateGoldFalls(segment)
	local item = Tracker:FindObjectForCode("falls")
	if ReadU8(segment, 0x2002b58) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b59) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b5a) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b5b) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b5c) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b5d) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b5e) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b5f) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b60) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b61) == 0x6d then
		falls:setActive(1)
	elseif ReadU8(segment, 0x2002b62) == 0x6d then
		falls:setActive(1)
	end
end

function updateRedW(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		RedWBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		RedWBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		RedWBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		RedWBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		RedWBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		RedWBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		RedWBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		RedWBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		RedWBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		RedWBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		RedWBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red W in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		RedWBag = 0
	end
	fusion_count["redW"] = RedWBag
	redW:setActive(fusion_count_used["redW"] + fusion_count["redW"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Red W Obtained", RedWBag)
	end
end

function updateRedV(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		RedVBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		RedVBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		RedVBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		RedVBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		RedVBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		RedVBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		RedVBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		RedVBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		RedVBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		RedVBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		RedVBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red V in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		RedVBag = 0
	end
	fusion_count["redV"] = RedVBag
	redV:setActive(fusion_count_used["redV"] + fusion_count["redV"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Red V Obtained", RedVBag)
	end
end

function updateRedE(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		RedEBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		RedEBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		RedEBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		RedEBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		RedEBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		RedEBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		RedEBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		RedEBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		RedEBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		RedEBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		RedEBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Red E in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		RedEBag = 0
	end
	fusion_count["redE"] = RedEBag
	redE:setActive(fusion_count_used["redE"] + fusion_count["redE"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Red E Obtained", RedEBag)
	end
end

function updateBlueL(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		BlueLBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		BlueLBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		BlueLBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		BlueLBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		BlueLBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		BlueLBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		BlueLBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		BlueLBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		BlueLBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		BlueLBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		BlueLBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue L in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		BlueLBag = 0
	end
	fusion_count["blueL"] = BlueLBag
	blueL:setActive(fusion_count_used["blueL"] + fusion_count["blueL"] + fusion_count_wall["blueL"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Blue L Obtained", BlueLBag)
	end
end

function updateBlueS(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		BlueSBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		BlueSBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		BlueSBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		BlueSBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		BlueSBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		BlueSBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		BlueSBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		BlueSBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		BlueSBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		BlueSBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		BlueSBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Blue S in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		BlueSBag = 0
	end
	fusion_count["blueS"] = BlueSBag
	blueS:setActive(fusion_count_used["blueS"] + fusion_count["blueS"] + fusion_count_wall["blueS"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Blue S Obtained", BlueSBag)
	end
end

function updateGreenG(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		GreenGBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		GreenGBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		GreenGBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		GreenGBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		GreenGBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		GreenGBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		GreenGBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		GreenGBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		GreenGBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		GreenGBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		GreenGBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green G in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		GreenGBag = 0
	end
	fusion_count["greenG"] = GreenGBag
	greenG:setActive(fusion_count_used["greenG"] + fusion_count["greenG"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Green G Obtained", GreenGBag)
	end
end

function updateGreenC(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		GreenCBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		GreenCBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		GreenCBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		GreenCBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		GreenCBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		GreenCBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		GreenCBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		GreenCBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		GreenCBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		GreenCBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		GreenCBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Green C in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		GreenCBag = 0
	end
	fusion_count["greenC"] = GreenCBag
	greenC:setActive(fusion_count_used["greenC"] + fusion_count["greenC"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Green C Obtained", GreenCBag)
	end
end

function updateGreenP(segment, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		GreenPBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		GreenPBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		GreenPBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		GreenPBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		GreenPBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		GreenPBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		GreenPBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		GreenPBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		GreenPBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		GreenPBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		GreenPBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("green P in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		GreenPBag = 0
	end
	fusion_count["greenP"] = GreenPBag
	greenP:setActive(fusion_count_used["greenP"] + fusion_count["greenP"])
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Green P Obtained", GreenPBag)
	end
end
function updateFusionUsedFixed(code, segment, locationData)
	local item = Tracker:FindObjectForCode(code)
	if item then
		fusion_count_used[code] = 0
		for i = 1, #locationData, 1 do
			local address = locationData[i][1]
			local flag = locationData[i][2]
			local value = ReadU8(segment, address)

			local flagTest = value & flag

			if flagTest ~= 0 then
				fusion_count_used[code] = fusion_count_used[code] + 1
			end
		end
		if code=="blueL" or code=="blueS" then
			count_fusion = fusion_count[code] + fusion_count_used[code] + fusion_count_wall[code]
		else
			count_fusion = fusion_count[code] + fusion_count_used[code]
		end
		item.ItemState:setActive(count_fusion)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("--tracking "..code.."--")
			print("sac:", fusion_count[code])
			print("used:",fusion_count_used[code])
			print("wall:", fusion_count_wall[code])
			print("total:", count_fusion)
			print("------------------")
		end
	end
end
function updateWildsUsedFixed(segment, locationData)
	local item = Tracker:FindObjectForCode("wilds")
	if item then
		WildsFused = 0
		for i = 1, #locationData, 1 do
			local address = locationData[i][1]
			local flag = locationData[i][2]
			local value = ReadU8(segment, address)

			local flagTest = value & flag

			if flagTest ~= 0 then
				WildsFused = WildsFused + 1
			end
		end
		wilds:setActive(WildsFused + WildsBag)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds Used", WildsFused)
		end
	end
end

function updateWilds(segment, code, flag)
	local item = Tracker:FindObjectForCode(code)

	if ReadU8(segment, 0x2002b58) == flag then
		WildsBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		WildsBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		WildsBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		WildsBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		WildsBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		WildsBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		WildsBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		WildsBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		WildsBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		WildsBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		WildsBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Wilds in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		WildsBag = 0
	end
	wilds:setActive(WildsFused + WildsBag)
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Wilds Obtained", WildsBag)
	end
end

function updateCloudsUsedFixed(segment, locationData)
	local item = Tracker:FindObjectForCode("clouds")
	if item then
		CloudsFused = 0
		for i = 1, #locationData, 1 do
			local address = locationData[i][1]
			local flag = locationData[i][2]
			local value = ReadU8(segment, address)

			local flagTest = value & flag

			if flagTest ~= 0 then
				CloudsFused = CloudsFused + 1
			end
		end
		clouds:setActive(CloudsFused + CloudsBag)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds Fused", CloudsFused)
		end
	end
end

function updateClouds(segment, code, flag)
	if ReadU8(segment, 0x2002b58) == flag then
		CloudsBag = ReadU8(segment, 0x2002b6b)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b6b))
		end
	elseif ReadU8(segment, 0x2002b59) == flag then
		CloudsBag = ReadU8(segment, 0x2002b6c)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b6c))
		end
	elseif ReadU8(segment, 0x2002b5a) == flag then
		CloudsBag = ReadU8(segment, 0x2002b6d)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b6d))
		end
	elseif ReadU8(segment, 0x2002b5b) == flag then
		CloudsBag = ReadU8(segment, 0x2002b6e)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b6e))
		end
	elseif ReadU8(segment, 0x2002b5c) == flag then
		CloudsBag = ReadU8(segment, 0x2002b6f)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b6f))
		end
	elseif ReadU8(segment, 0x2002b5d) == flag then
		CloudsBag = ReadU8(segment, 0x2002b70)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b70))
		end
	elseif ReadU8(segment, 0x2002b5e) == flag then
		CloudsBag = ReadU8(segment, 0x2002b71)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b71))
		end
	elseif ReadU8(segment, 0x2002b5f) == flag then
		CloudsBag = ReadU8(segment, 0x2002b72)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b72))
		end
	elseif ReadU8(segment, 0x2002b60) == flag then
		CloudsBag = ReadU8(segment, 0x2002b73)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b73))
		end
	elseif ReadU8(segment, 0x2002b61) == flag then
		CloudsBag = ReadU8(segment, 0x2002b74)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b74))
		end
	elseif ReadU8(segment, 0x2002b62) == flag then
		CloudsBag = ReadU8(segment, 0x2002b75)
		if TMC_AUTOTRACKER_DEBUG_ITEM then
			print("Clouds in Bag", ReadU8(segment, 0x2002b75))
		end
	else
		CloudsBag = 0
	end
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Clouds in Bag", CloudsBag)
	end
	clouds:setActive(CloudsBag + CloudsFused)
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Clouds Obtained", CloudsFused)
	end
end

function updateHearts(segment, address)
	local item = Tracker:FindObjectForCode("hearts")
	if item then
		item.CurrentStage = ReadU8(segment, address) / 8 - 3
	end
end
function updateWarps(segment, type)
	local counter_warps = 0
	if type == "DWS_ENTER" then
		if testFlag(segment, 0x2002EBD, 0x01) then
			counter_warps = counter_warps + 1
		end
		if  testFlag(segment, 0x2002EBD, 0x02) then
			counter_warps = counter_warps + 2
		end
		if code_type_cache["DWS_ENTER"] == 1 then
			local item = Tracker:FindObjectForCode("dws_warps_none")
			item.CurrentStage = counter_warps
		end
		items_codes_autotracking_cache[type]["SETTING"]["dws_warps_none"] = counter_warps
	elseif type == "COF_ENTER" then
		if testFlag(segment, 0x2002EBE, 0x01) then
			counter_warps = counter_warps + 1
		end
		if  testFlag(segment, 0x2002EBE, 0x02) then
			counter_warps = counter_warps + 2
		end
		if code_type_cache["COF_ENTER"] == 1 then
			local item = Tracker:FindObjectForCode("cof_warps_none")
			item.CurrentStage = counter_warps
		end
		items_codes_autotracking_cache[type]["SETTING"]["cof_warps_none"] = counter_warps
	elseif type == "FOW_WARPS" then
		if testFlag(segment, 0x2002EBF, 0x01) then
			counter_warps = counter_warps + 1
		end
		if testFlag(segment, 0x2002EBF, 0x02) then
			counter_warps = counter_warps + 2
		end
		if FOW_WARPS == 1 then
			local item = Tracker:FindObjectForCode("fow_warps_none")
			item.CurrentStage = counter_warps
		end
		items_codes_autotracking_cache["FOW_WARPS"]["SETTING"]["fow_warps_none"] = counter_warps
	elseif type == "TOD_ENTER" then
		if testFlag(segment, 0x2002EC0, 0x01) then
			counter_warps = counter_warps + 1
		end
		if  testFlag(segment, 0x2002EC0, 0x02) then
			counter_warps = counter_warps + 2
		end
		if code_type_cache["TOD_ENTER"] == 1 then
			local item = Tracker:FindObjectForCode("tod_warps_none")
			item.CurrentStage = counter_warps
		end
		items_codes_autotracking_cache[type]["SETTING"]["tod_warps_none"] = counter_warps
	elseif type == "POW_ENTER" then
		if testFlag(segment, 0x2002EC1, 0x01) then
			counter_warps = counter_warps + 1
		end
		if  testFlag(segment, 0x2002EC1, 0x02) then
			counter_warps = counter_warps + 2
		end
		if code_type_cache["POW_ENTER"] == 1 then
			local item = Tracker:FindObjectForCode("pow_warps_none")
			item.CurrentStage = counter_warps
		end
		items_codes_autotracking_cache[type]["SETTING"]["pow_warps_none"] = counter_warps
	elseif type == "DHC_ENTER" then
		if testFlag(segment, 0x2002EC2, 0x01) then
			counter_warps = counter_warps + 1
		end
		if  testFlag(segment, 0x2002EC2, 0x02) then
			counter_warps = counter_warps + 2
		end
		if code_type_cache["DHC_WARPS"] == 1 then
			local item = Tracker:FindObjectForCode("dhc_warps_none")
			item.CurrentStage = counter_warps
		end
		items_codes_autotracking_cache[type]["SETTING"]["dhc_warps_none"] = counter_warps
	end
end
function updateBigKeys(segment, code)
	if code == "dws_bigkey" then
		if testFlag(segment, 0x2002D45, 0x02) and code_type_cache["DWS_ENTER"] == 1 then
			updateToggleFlag(segment, "dws_bigkey", 0x2002D45, 0x02)
		elseif testFlag(segment, 0x2002D45, 0x02) then
			updateToggleFlagSpec(segment, "DWS_ENTER", "dws_bigkey", 0x2002D45, 0x02)
		else
			updateToggleFlag(segment, "dws_bigkey", 0x2002ead, 0x04)
		end
	elseif code == "cof_bigkey" then
		if testFlag(segment, 0x2002D5A, 0x40) and code_type_cache["COF_ENTER"] == 1  then
			updateToggleFlag(segment,"cof_bigkey", 0x2002D5A, 0x40)
		elseif testFlag(segment, 0x2002D5A, 0x40) then
			updateToggleFlagSpec(segment, "COF_ENTER", "cof_bigkey", 0x2002D5A, 0x40)
		else
			updateToggleFlag(segment, "cof_bigkey", 0x2002eae, 0x04)
		end
	elseif code == "fow_bigkey" then
		if testFlag(segment, 0x2002D70, 0x40) and code_type_cache["FOW_ENTER"] == 1 then
			updateToggleFlag(segment, "fow_bigkey", 0x2002D70, 0x40)
		elseif testFlag(segment, 0x2002D70, 0x40) then
			updateToggleFlagSpec(segment, "FOW_ENTER", "fow_bigkey", 0x2002D70, 0x40)
		else
			updateToggleFlag(segment, "fow_bigkey", 0x2002eaf, 0x04)
		end
	elseif code == "tod_bigkey" then
		if testFlag(segment, 0x2002D89, 0x10)  and code_type_cache["TOD_ENTER"] == 1 then
			updateToggleFlag(segment, "tod_bigkey", 0x2002D89, 0x10)
		elseif testFlag(segment, 0x2002D89, 0x10)  then
			updateToggleFlagSpec(segment, "TOD_ENTER", "tod_bigkey", 0x2002D89, 0x10)
		else
			updateToggleFlag(segment, "tod_bigkey", 0x2002eb0, 0x04)
		end
	elseif code == "pow_bigkey" then
		if testFlag(segment, 0x2002DA2, 0x40)  and code_type_cache["POW_ENTER"] == 1 then
			updateToggleFlag(segment, "pow_bigkey", 0x2002DA2, 0x40)
		elseif testFlag(segment, 0x2002DA4, 0x04)  and code_type_cache["POW_ENTER"] == 1 then
			updateToggleFlag(segment, "pow_bigkey", 0x2002DA4, 0x04)
		elseif testFlag(segment, 0x2002DA2, 0x40) then
			updateToggleFlagSpec(segment, "POW_ENTER", "pow_bigkey", 0x2002DA2, 0x40)
		elseif testFlag(segment, 0x2002DA4, 0x04)  then
			updateToggleFlagSpec(segment, "POW_ENTER", "pow_bigkey", 0x2002DA4, 0x04)
		else
			updateToggleFlag(segment, "pow_bigkey", 0x2002eb1, 0x04)
		end
	elseif code == "dhc_bigkey" then
		if testFlag(segment, 0x2002DBE, 0x20)  and code_type_cache["DHC_ENTER"] == 1 then
			updateToggleFlag(segment, "dhc_bigkey", 0x2002DBE, 0x20)
		elseif testFlag(segment, 0x2002DBE, 0x20) then
			updateToggleFlagSpec(segment, "DHC_ENTER", "dhc_bigkey", 0x2002DBE, 0x20)
		else
			updateToggleFlag(segment, "dhc_bigkey", 0x2002eb2, 0x04)
		end
	end
end

function updateSmallKeys(segment, code, address)
	local item = Tracker:FindObjectForCode(code)
	if code == "dws_smallkey" then
		DWS_KEY_USED = 0
		if testFlag(segment, 0x2002d3f, 0x40) then
			DWS_KEY_USED = DWS_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d41, 0x04) then
			DWS_KEY_USED = DWS_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d43, 0x10) then
			DWS_KEY_USED = DWS_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d44, 0x20) then
			DWS_KEY_USED = DWS_KEY_USED + 1
		end
		DWS_KEY_COUNT = ReadU8(segment, address)
		if DWS_KEY_COUNT > 0 and code_type_cache["DWS_ENTER"]==1 then
			item.AcquiredCount = DWS_KEY_COUNT + DWS_KEY_USED
			items_codes_autotracking_cache["DWS_ENTER"]["COUNT"][code] = DWS_KEY_COUNT + DWS_KEY_USED
		elseif DWS_KEY_COUNT > 0 then
			item.AcquiredCount = DWS_KEY_COUNT
			items_codes_autotracking_cache["DWS_ENTER"]["COUNT"][code] = DWS_KEY_COUNT
		end
	elseif code == "cof_smallkey" then
		COF_KEY_USED = 0
		if testFlag(segment, 0x2002d56, 0x10) then
			COF_KEY_USED = COF_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d57, 0x20) then
			COF_KEY_USED = COF_KEY_USED + 1
		end
		COF_KEY_COUNT = ReadU8(segment, address)
		if COF_KEY_COUNT > 0 and code_type_cache["COF_ENTER"]==1 then
			item.AcquiredCount = COF_KEY_COUNT + COF_KEY_USED
			items_codes_autotracking_cache["COF_ENTER"]["COUNT"][code] = COF_KEY_COUNT + COF_KEY_USED
		elseif COF_KEY_COUNT > 0 then
			item.AcquiredCount = COF_KEY_COUNT
			items_codes_autotracking_cache["COF_ENTER"]["COUNT"][code] = COF_KEY_COUNT
		end
	elseif code == "fow_smallkey" then
		FOW_KEY_USED = 0
		if testFlag(segment, 0x2002d6f, 0x20) then
			FOW_KEY_USED = FOW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d71, 0x10) then
			FOW_KEY_USED = FOW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d72, 0x40) then
			FOW_KEY_USED = FOW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d72, 0x80) then
			FOW_KEY_USED = FOW_KEY_USED + 1
		end
		FOW_KEY_COUNT = ReadU8(segment, address)
		if FOW_KEY_COUNT > 0 and code_type_cache["FOW_ENTER"]==1 then
			item.AcquiredCount = FOW_KEY_COUNT + FOW_KEY_USED
			items_codes_autotracking_cache["FOW_ENTER"]["COUNT"][code] = FOW_KEY_COUNT + FOW_KEY_USED
		elseif FOW_KEY_COUNT > 0 then
			item.AcquiredCount = FOW_KEY_COUNT
			items_codes_autotracking_cache["FOW_ENTER"]["COUNT"][code] = FOW_KEY_COUNT
		end
	elseif code == "tod_smallkey" then
		TOD_KEY_USED = 0
		if testFlag(segment, 0x2002d89, 0x04) then
			TOD_KEY_USED = TOD_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d8a, 0x01) then
			TOD_KEY_USED = TOD_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d8c, 0x02) then
			TOD_KEY_USED = TOD_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d90, 0x08) then
			TOD_KEY_USED = TOD_KEY_USED + 1
		end
		TOD_KEY_COUNT = ReadU8(segment, address)
		if TOD_KEY_COUNT > 0 and code_type_cache["TOD_ENTER"]==1 then
			item.AcquiredCount = TOD_KEY_COUNT + TOD_KEY_USED
			items_codes_autotracking_cache["TOD_ENTER"]["COUNT"][code] = TOD_KEY_COUNT + TOD_KEY_USED
		elseif TOD_KEY_COUNT > 0 then
			item.AcquiredCount = TOD_KEY_COUNT
			items_codes_autotracking_cache["TOD_ENTER"]["COUNT"][code] = TOD_KEY_COUNT
		end
	elseif code == "pow_smallkey" then
		POW_KEY_USED = 0
		if testFlag(segment, 0x2002da3, 0x10) then
			POW_KEY_USED = POW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002da3, 0x80) then
			POW_KEY_USED = POW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002da5, 0x04) then
			POW_KEY_USED = POW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002da5, 0x08) then
			POW_KEY_USED = POW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002da6, 0x08) then
			POW_KEY_USED = POW_KEY_USED + 1
		end
		if testFlag(segment, 0x2002da9, 0x04) then
			POW_KEY_USED = POW_KEY_USED + 1
		end
		POW_KEY_COUNT = ReadU8(segment, address)
		items_codes_autotracking_cache["POW_ENTER"]["COUNT"][code] = POW_KEY_COUNT + POW_KEY_USED
		if POW_KEY_COUNT > 0 and code_type_cache["POW_ENTER"]==1 then
			item.AcquiredCount = POW_KEY_COUNT + POW_KEY_USED
		elseif POW_KEY_COUNT > 0 then
			item.AcquiredCount = POW_KEY_COUNT
		end
	elseif code == "dhc_smallkey" then
		DHC_KEY_USED = 0
		if testFlag(segment, 0x2002dbb, 0x20) then
			DHC_KEY_USED = DHC_KEY_USED + 1
		end
		if testFlag(segment, 0x2002dbc, 0x10) then
			DHC_KEY_USED = DHC_KEY_USED + 1
		end
		if testFlag(segment, 0x2002dbc, 0x20) then
			DHC_KEY_USED = DHC_KEY_USED + 1
		end
		if testFlag(segment, 0x2002dbc, 0x40) then
			DHC_KEY_USED = DHC_KEY_USED + 1
		end
		if testFlag(segment, 0x2002dbc, 0x80) then
			DHC_KEY_USED = DHC_KEY_USED + 1
		end
		DHC_KEY_COUNT = ReadU8(segment, address)
		items_codes_autotracking_cache["DHC_ENTER"]["COUNT"][code] = DHC_KEY_USED + DHC_KEY_COUNT
		if DHC_KEY_COUNT > 0 and code_type_cache["DHC_ENTER"]==1 then
			item.AcquiredCount = DHC_KEY_COUNT + DHC_KEY_USED
		elseif DHC_KEY_COUNT > 0 then
			item.AcquiredCount = DHC_KEY_COUNT
		end
	elseif code == "rc_smallkey" then
		RC_KEY_USED = 0
		if testFlag(segment, 0x2002d00, 0x80) then
			RC_KEY_USED = RC_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d01, 0x01) then
			RC_KEY_USED = RC_KEY_USED + 1
		end
		if testFlag(segment, 0x2002d12, 0x08) then
			RC_KEY_USED = RC_KEY_USED + 1
		end
		RC_KEY_COUNT = ReadU8(segment, address)
		items_codes_autotracking_cache["RC_ENTER"]["COUNT"][code] = RC_KEY_COUNT + RC_KEY_USED
		if RC_KEY_COUNT > 0 and code_type_cache["RC_ENTER"]==1 then
			item.AcquiredCount = RC_KEY_COUNT + RC_KEY_USED
		elseif RC_KEY_COUNT > 0 then
			item.AcquiredCount = RC_KEY_COUNT
		end
	else
		item.AcquiredCount = 0
	end
end

function updatefigurine(segment, code, address)
	local item = Tracker:FindObjectForCode(code)
	item.AcquiredCount = ReadU8(segment, address)
	if TMC_AUTOTRACKER_DEBUG_ITEM then
		print("Figurne: ", item.AcquiredCount)
	end
end
function updateSpin(segment)
	local item = Tracker:FindObjectForCode("spinattack")
	if testFlag(segment, 0x2002b44, 0x01) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateRoll(segment)
	local item = Tracker:FindObjectForCode("rollattack")
	if testFlag(segment, 0x2002b44, 0x04) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateDash(segment)
	local item = Tracker:FindObjectForCode("dashattack")
	if testFlag(segment, 0x2002b44, 0x10) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateRock(segment)
	local item = Tracker:FindObjectForCode("rockbreaker")
	if testFlag(segment, 0x2002b44, 0x40) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateBeam(segment)
	local item = Tracker:FindObjectForCode("swordbeam")
	if testFlag(segment, 0x2002b45, 0x01) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateGreat(segment)
	local item = Tracker:FindObjectForCode("greatspin")
	if testFlag(segment, 0x2002b45, 0x04) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateDown(segment)
	local item = Tracker:FindObjectForCode("downthrust")
	if testFlag(segment, 0x2002b45, 0x10) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updatePeril(segment)
	local item = Tracker:FindObjectForCode("perilbeam")
	if testFlag(segment, 0x2002b45, 0x40) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateFast(segment)
	local item = Tracker:FindObjectForCode("fastspin")
	if testFlag(segment, 0x2002b4e, 0x40) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateSplit(segment)
	local item = Tracker:FindObjectForCode("fastsplit")
	if testFlag(segment, 0x2002b4f, 0x01) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end

function updateLong(segment)
	local item = Tracker:FindObjectForCode("longspin")
	if testFlag(segment, 0x2002b4f, 0x04) then
		item.CurrentStage = 1
	else
		item.CurrentStage = 0
	end
end
function figurine(segment)
	if not isInGame() then
		return false
	end
	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		updatefigurine(segment, "figurine", 0x2002af0)
	end
end
function UpdateCucco(segment)
	local count = 0
	if testFlag(segment, 0x2002ca5, 0x08) then
		count = count + 1
	end
	if testFlag(segment, 0x2002ca5, 0x10) then
		count = count + 2
	end
	if testFlag(segment, 0x2002ca5, 0x20) then
		count = count + 4
	end
	if testFlag(segment, 0x2002ca5, 0x40) then
		count = count + 8
	end
	if count >= 1 then
		updateSectionFlagSpecial("@Town - Anju/Round 1 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 1 Gift", 1)
	end
	if count >= 2 then
		updateSectionFlagSpecial("@Town - Anju/Round 2 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 2 Gift", 1)
	end
	if count >= 3 then
		updateSectionFlagSpecial("@Town - Anju/Round 3 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 3 Gift", 1)
	end
	if count >= 4 then
		updateSectionFlagSpecial("@Town - Anju/Round 4 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 4 Gift", 1)
	end
	if count >= 5 then
		updateSectionFlagSpecial("@Town - Anju/Round 5 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 5 Gift", 1)
	end
	if count >= 6 then
		updateSectionFlagSpecial("@Town - Anju/Round 6 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 6 Gift", 1)
	end
	if count >= 7 then
		updateSectionFlagSpecial("@Town - Anju/Round 7 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 7 Gift", 1)
	end
	if count >= 8 then
		updateSectionFlagSpecial("@Town - Anju/Round 8 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 8 Gift", 1)
	end
	if count >= 9 then
		updateSectionFlagSpecial("@Town - Anju/Round 9 Gift", 0)
	else
		updateSectionFlagSpecial("@Town - Anju/Round 9 Gift", 1)
	end
end
function UpdateGoronShop(segment)
	local count = 0
	local left = 1
	local center = 1
	local right = 1
	if testFlag(segment, 0x2002ca3, 0x40) then
		count = count + 1
	end
	if testFlag(segment, 0x2002ca3, 0x80) then
		count = count + 1
	end
	if testFlag(segment, 0x2002ca4, 0x01) then
		count = count + 1
	end
	if testFlag(segment, 0x2002ca4, 0x02) then
		count = count + 1
	end
	if count == 0 then
		if testFlag(segment, 0x2002ca4, 0x04) then
			left = 0
		end
		if testFlag(segment, 0x2002ca4, 0x08) then
			center = 0
		end
		if testFlag(segment, 0x2002ca4, 0x10) then
			right = 0
		end
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Left", left)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Center and Right", (center + right))
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Right", right)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Left and Center", (center + left))
	elseif count > 0 then
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Left", 0)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Center and Right", 0)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Right", 0)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Left and Center", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Left", 1)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Center and Right", 2)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Right", 1)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 1 - Item Left and Center", 2)
	end
	if count == 1 then
		if testFlag(segment, 0x2002ca4, 0x04) then
			left = 0
		end
		if testFlag(segment, 0x2002ca4, 0x08) then
			center = 0
		end
		if testFlag(segment, 0x2002ca4, 0x10) then
			right = 0
		end
		updateSectionFlagSpecial("@Town - Goron Shop/Set 2 - Items", (left + center + right))
	elseif count > 1 then
		updateSectionFlagSpecial("@Town - Goron Shop/Set 2 - Items", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Shop/Set 2 - Items", 3)
	end
	if count == 2 then
		if testFlag(segment, 0x2002ca4, 0x04) then
			left = 0
		end
		if testFlag(segment, 0x2002ca4, 0x08) then
			center = 0
		end
		if testFlag(segment, 0x2002ca4, 0x10) then
			right = 0
		end
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Items", (left + center + right))
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Item Left", left)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Items Other", (center + right))
	elseif count > 2 then
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Items", 0)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Item Left", 0)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Items Other", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Items", 3)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Item Left", 1)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 3 - Items Other", 2)
	end
	if count == 3 then
		if testFlag(segment, 0x2002ca4, 0x04) then
			left = 0
		end
		if testFlag(segment, 0x2002ca4, 0x08) then
			center = 0
		end
		if testFlag(segment, 0x2002ca4, 0x10) then
			right = 0
		end
		updateSectionFlagSpecial("@Town - Goron Shop/Set 4 - Items", (left + center + right))
	elseif count > 3 then
		updateSectionFlagSpecial("@Town - Goron Shop/Set 4 - Items", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Shop/Set 4 - Items", 3)
	end
	if count == 4 then
		if testFlag(segment, 0x2002ca4, 0x04) then
			left = 0
		end
		if testFlag(segment, 0x2002ca4, 0x08) then
			center = 0
		end
		if testFlag(segment, 0x2002ca4, 0x10) then
			right = 0
		end
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Items", (left + center + right))
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Item Left", left)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Items Other", (center + right))
	elseif count > 4 then
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Items", 0)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Item Left", 0)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Items Other", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Items", 3)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Item Left", 1)
		updateSectionFlagSpecial("@Town - Goron Shop/Set 5 - Items Other", 2)
	end
end

function updateItemsFromMemorySegment(segment)
	if not isInGame() then
		return false
	end
	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		updateToggleFlag(segment, "remote", 0x2002b34, 0x01)
		updateToggleFlag(segment, "gust", 0x2002b36, 0x04)
		updateToggleFlag(segment, "cane", 0x2002b36, 0x10)
		updateToggleFlag(segment, "mitts", 0x2002b36, 0x40)
		updateToggleFlag(segment, "cape", 0x2002b37, 0x01)
		updateToggleFlag(segment, "boots", 0x2002b37, 0x04)
		updateToggleFlagCheck(segment, "OCARINA", "ocarina", 0x2002b37, 0x40)
		updateToggleFlag(segment, "trophy", 0x2002b41, 0x04)
		updateToggleFlag(segment, "carlov", 0x2002b41, 0x10)
		updateToggleFlag(segment, "grip", 0x2002b43, 0x01)
		updateToggleFlag(segment, "bracelets", 0x2002b43, 0x04)
		updateToggleFlag(segment, "flippers", 0x2002b43, 0x10)
		updateToggleFlag(segment, "spinattack", 0x2002b44, 0x01)
		updateToggleFlag(segment, "rollattack", 0x2002b44, 0x04)
		updateToggleFlag(segment, "dashattack", 0x2002b44, 0x10)
		updateToggleFlag(segment, "rockbreaker", 0x2002b44, 0x40)
		updateToggleFlag(segment, "swordbeam", 0x2002b45, 0x01)
		updateToggleFlag(segment, "greatspin", 0x2002b45, 0x04)
		updateToggleFlag(segment, "downthrust", 0x2002b45, 0x10)
		updateToggleFlag(segment, "perilbeam", 0x2002b45, 0x40)
		updateToggleFlag(segment, "fastspin", 0x2002b4e, 0x40)
		updateToggleFlag(segment, "fastsplit", 0x2002b4f, 0x01)
		updateToggleFlag(segment, "longspin", 0x2002b4f, 0x04)
		updateToggleFlag(segment, "jabber", 0x2002b48, 0x40)
		updateToggleFlag(segment, "bowandfly", 0x2002b4e, 0x01)
		updateToggleFlag(segment, "mittsButterfly", 0x2002b4e, 0x04)
		updateToggleFlag(segment, "flippersButterfly", 0x2002b4e, 0x10)
		updateToggleFlag(segment, "earth", 0x2002b42, 0x01)
		updateToggleFlag(segment, "fire", 0x2002b42, 0x04)
		updateToggleFlag(segment, "water", 0x2002b42, 0x10)
		updateToggleFlag(segment, "wind", 0x2002b42, 0x40)
		smithswordCheck(segment, "smithsword", 0x2002b32, 0x04)
		greenswordCheck(segment, "greensword", 0x2002b32, 0x10)
		redswordCheck(segment, "redsword", 0x2002b32, 0x40)
		blueswordCheck(segment, "bluesword", 0x2002b33, 0x01)
		fourswordCheck(segment, "foursword", 0x2002b33, 0x10)

		updateLLRKey(segment, "llrkey", 0x2002b3f, 0x40)
		updateDogFood(segment, "dogbottle", 0x2002b3f, 0x10)
		updateMush(segment, "mushroom", 0x2002b40, 0x01)
		updateBooks(segment, "books", 0x2002b40)
		updateGraveKey(segment, "gravekey", 0x2002b41, 0x01)

		updateSwords(segment)
		updateBow(segment)
		updateBoomerang(segment)
		updateShield(segment)
		updateLamp(segment)
		updateBottles(segment)
		updateScrolls(segment)
		if fusiongoldcombined:getActive() then
			updateClouds(segment, "clouds", 0x65)
		else
			updateGoldFalls(segment)
			updateWilds(segment, "wilds", 0x6a)
			updateClouds(segment, "clouds", 0x65)
		end
		-- if has("fusionred_vanilla") then
			updateRedW(segment, 0x6e)
			updateRedV(segment, 0x6f)
			updateRedE(segment, 0x70)
		-- end
		-- if has("fusionblue_vanilla") then
			updateBlueL(segment, 0x71)
			updateBlueS(segment, 0x72)
		-- end
		-- if has("fusiongreen_vanilla") then
			updateGreenG(segment, 0x74)
			updateGreenC(segment, 0x73)
			updateGreenP(segment, 0x75)
		-- end
	end

	if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		updateSectionFlag(segment, "@Hylia - Fifi/Gift", 0x2002b3f, 0x20)
	end
end

function updateGearFromMemory(segment)
	if not isInGame() then
		return false
	end

	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		updateBombs(segment)
		updateQuiver(segment)
		updateWallet(segment)
		updateHearts(segment, 0x2002aeb)
	end

	if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	end
end

function updateLocations(segment)
	if not isInGame() then
		return false
	end

	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		updateToggleFlagDungeons(segment, "DWS_ENTER", "dws", 0x2002c9c, 0x04)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Prize", 0x2002c9c, 0x04)
		updateToggleFlagDungeons(segment, "COF_ENTER", "cof", 0x2002c9c, 0x08)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Prize", 0x2002c9c, 0x08)
		updateToggleFlagDungeons(segment, "FOW_ENTER", "fow", 0x2002c9c, 0x10)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Prize", 0x2002c9c, 0x10)
		updateToggleFlagDungeons(segment, "TOD_ENTER", "tod", 0x2002c9c, 0x20)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Prize", 0x2002c9c, 0x20)
		updateToggleFlagDungeons(segment, "POW_ENTER", "pow", 0x2002c9c, 0x40)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Prize", 0x2002c9c, 0x40)
		updateToggleFlagDungeons(segment, "RC_ENTER", "rc", 0x2002d02, 0x04)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Royal Crypt/Prize", 0x2002d02, 0x04)
		updateToggleFlagDungeons(segment, "DHC_ENTER", "dhc", 0x2002ca6, 0x20)
		if has("fusiongold_vanilla") then
			if fusiongoldcombined:getActive() then
				updateCloudsUsedFixed(
					segment,
					{
						{0x2002c81, 0x02},
						{0x2002c81, 0x04},
						{0x2002c81, 0x08},
						{0x2002c81, 0x10},
						{0x2002c81, 0x20},
						{0x2002c81, 0x40},
						{0x2002c81, 0x80},
						{0x2002c82, 0x01},
						{0x2002c82, 0x02}
					}
				)
			else
				updateGoldFallsUsed(segment, 0x2002c82, 0x02)
				updateWildsUsedFixed(segment, {{0x2002c81, 0x40}, {0x2002c81, 0x80}, {0x2002c82, 0x01}})
				updateCloudsUsedFixed(
					segment,
					{{0x2002c81, 0x02}, {0x2002c81, 0x04}, {0x2002c81, 0x08}, {0x2002c81, 0x10}, {0x2002c81, 0x20}}
				)
			end
		end
	end

	if AUTOTRACKER_ENABLE_FUSER_TRACKING then
		if has("fusionred_vanilla") then
			if fusionredcombined:getActive() then
				updateFusionUsedFixed(
					"redW",
					segment,
					{
						{0x2002c82, 0x04},
						{0x2002c82, 0x08},
						{0x2002c82, 0x10},
						{0x2002c82, 0x20},
						{0x2002c82, 0x40},
						{0x2002c82, 0x80},
						{0x2002c83, 0x01},
						{0x2002c83, 0x02},
						{0x2002c83, 0x04},
						{0x2002c83, 0x08},
						{0x2002c83, 0x10},
						{0x2002c83, 0x20},
						{0x2002c83, 0x40},
						{0x2002c84, 0x01},
						{0x2002c84, 0x02},
						{0x2002c84, 0x04},
						{0x2002c83, 0x80},
						{0x2002c84, 0x08},
						{0x2002c84, 0x10},
						{0x2002c84, 0x20},
						{0x2002c84, 0x40},
						{0x2002c84, 0x80},
						{0x2002c85, 0x01},
						{0x2002c85, 0x02}
					}
				)
			else
				updateFusionUsedFixed(
					"redW",
					segment,
					{
						{0x2002c82, 0x04},
						{0x2002c82, 0x08},
						{0x2002c82, 0x10},
						{0x2002c82, 0x20},
						{0x2002c82, 0x40},
						{0x2002c82, 0x80},
						{0x2002c83, 0x01},
						{0x2002c83, 0x02},
						{0x2002c83, 0x04}
					}
				)
				updateFusionUsedFixed(
					"redV",
					segment,
					{
						{0x2002c83, 0x08},
						{0x2002c83, 0x10},
						{0x2002c83, 0x20},
						{0x2002c83, 0x40},
						{0x2002c84, 0x01},
						{0x2002c84, 0x02},
						{0x2002c84, 0x04}
					}
				)
				updateFusionUsedFixed(
					"redE",
					segment,
					{
						{0x2002c83, 0x80},
						{0x2002c84, 0x08},
						{0x2002c84, 0x10},
						{0x2002c84, 0x20},
						{0x2002c84, 0x40},
						{0x2002c84, 0x80},
						{0x2002c85, 0x01},
						{0x2002c85, 0x02}
					}
				)
			end
		end
		if has("fusionblue_vanilla") then
			if fusionbluecombined:getActive() then
				updateFusionUsedFixed(
					"blueL",
					segment,
					{
						{0x2002c85, 0x04},
						{0x2002c85, 0x08},
						{0x2002c85, 0x10},
						{0x2002c85, 0x80},
						{0x2002c86, 0x01},
						{0x2002c86, 0x10},
						{0x2002c86, 0x20},
						{0x2002c86, 0x40},
						{0x2002c87, 0x01},
						{0x2002c87, 0x02},
						{0x2002c87, 0x04},
						{0x2002c87, 0x08}
					}
				)
			else
				updateFusionUsedFixed(
					"blueL",
					segment,
					{
						{0x2002c85, 0x04},
						{0x2002c85, 0x08},
						{0x2002c85, 0x10},
						{0x2002c85, 0x80},
						{0x2002c86, 0x01},
						{0x2002c86, 0x10}
					}
				)
				updateFusionUsedFixed(
					"blueS",
					segment,
					{
						{0x2002c86, 0x20},
						{0x2002c86, 0x40},
						{0x2002c87, 0x01},
						{0x2002c87, 0x02},
						{0x2002c87, 0x04},
						{0x2002c87, 0x08}
					}
				)
			end
		end
		if has("fusiongreen_vanilla") then
			if fusiongreencombined:getActive() then
				updateFusionUsedFixed(
					"greenC",
					segment,
					{
						{0x2002c87, 0x10},
						{0x2002c87, 0x20},
						{0x2002c87, 0x40},
						{0x2002c87, 0x80},
						{0x2002c88, 0x01},
						{0x2002c88, 0x02},
						{0x2002c88, 0x04},
						{0x2002c88, 0x08},
						{0x2002c88, 0x10},
						{0x2002c88, 0x20},
						{0x2002c88, 0x40},
						{0x2002c88, 0x80},
						{0x2002c89, 0x01},
						{0x2002c89, 0x02},
						{0x2002c89, 0x04},
						{0x2002c8c, 0x10},
						{0x2002c8c, 0x80},
						{0x2002c8a, 0x80},
						{0x2002c8b, 0x01},
						{0x2002c8b, 0x02},
						{0x2002c8b, 0x04},
						{0x2002c8b, 0x08},
						{0x2002c8b, 0x10},
						{0x2002c8b, 0x20},
						{0x2002c8b, 0x40},
						{0x2002c8b, 0x80},
						{0x2002c8c, 0x01},
						{0x2002c8c, 0x02},
						{0x2002c8c, 0x04},
						{0x2002c8c, 0x08},
						{0x2002c8c, 0x40},
						{0x2002c8d, 0x02},
						{0x2002c8d, 0x10},
						{0x2002c89, 0x08},
						{0x2002c89, 0x10},
						{0x2002c89, 0x20},
						{0x2002c89, 0x40},
						{0x2002c89, 0x80},
						{0x2002c8a, 0x01},
						{0x2002c8a, 0x02},
						{0x2002c8a, 0x04},
						{0x2002c8a, 0x08},
						{0x2002c8a, 0x10},
						{0x2002c8a, 0x20},
						{0x2002c8a, 0x40},
						{0x2002c8c, 0x20},
						{0x2002c8d, 0x01},
						{0x2002c8d, 0x04},
						{0x2002c8d, 0x08}
					}
				)
			else
				updateFusionUsedFixed(
					"greenC",
					segment,
					{
						{0x2002c87, 0x10},
						{0x2002c87, 0x20},
						{0x2002c87, 0x40},
						{0x2002c87, 0x80},
						{0x2002c88, 0x01},
						{0x2002c88, 0x02},
						{0x2002c88, 0x04},
						{0x2002c88, 0x08},
						{0x2002c88, 0x10},
						{0x2002c88, 0x20},
						{0x2002c88, 0x40},
						{0x2002c88, 0x80},
						{0x2002c89, 0x01},
						{0x2002c89, 0x02},
						{0x2002c89, 0x04},
						{0x2002c8c, 0x10},
						{0x2002c8c, 0x80}
					}
				)
				updateFusionUsedFixed(
					"greenP",
					segment,
					{
						{0x2002c8a, 0x80},
						{0x2002c8b, 0x01},
						{0x2002c8b, 0x02},
						{0x2002c8b, 0x04},
						{0x2002c8b, 0x08},
						{0x2002c8b, 0x10},
						{0x2002c8b, 0x20},
						{0x2002c8b, 0x40},
						{0x2002c8b, 0x80},
						{0x2002c8c, 0x01},
						{0x2002c8c, 0x02},
						{0x2002c8c, 0x04},
						{0x2002c8c, 0x08},
						{0x2002c8c, 0x40},
						{0x2002c8d, 0x02},
						{0x2002c8d, 0x10}
					}
				)
				updateFusionUsedFixed(
					"greenG",
					segment,
					{
						{0x2002c89, 0x08},
						{0x2002c89, 0x10},
						{0x2002c89, 0x20},
						{0x2002c89, 0x40},
						{0x2002c89, 0x80},
						{0x2002c8a, 0x01},
						{0x2002c8a, 0x02},
						{0x2002c8a, 0x04},
						{0x2002c8a, 0x08},
						{0x2002c8a, 0x10},
						{0x2002c8a, 0x20},
						{0x2002c8a, 0x40},
						{0x2002c8c, 0x20},
						{0x2002c8d, 0x01},
						{0x2002c8d, 0x04},
						{0x2002c8d, 0x08}
					}
				)
			end
		end
		if has("fusionred_vanilla") then
			updateFusion("RedW", segment, "fusions0a", 0x2002c82, 0x04)
			updateFusion("RedW", segment, "fusions0b", 0x2002c82, 0x08)
			updateFusion("RedW", segment, "fusions0c", 0x2002c82, 0x10)
			updateFusion("RedW", segment, "fusions0d", 0x2002c82, 0x20)
			updateFusion("RedW", segment, "fusions0e", 0x2002c82, 0x40)
			updateFusion("RedW", segment, "fusions0f", 0x2002c82, 0x80)
			updateFusion("RedW", segment, "fusions10", 0x2002c83, 0x01)
			updateFusion("RedW", segment, "fusions11", 0x2002c83, 0x02)
			updateFusion("RedW", segment, "fusions12", 0x2002c83, 0x04)

			updateFusion("RedV", segment, "fusions13", 0x2002c83, 0x08)
			updateFusion("RedV", segment, "fusions14", 0x2002c83, 0x10)
			updateFusion("RedV", segment, "fusions15", 0x2002c83, 0x20)
			updateFusion("RedV", segment, "fusions16", 0x2002c83, 0x40)
			updateFusion("RedV", segment, "fusions18", 0x2002c84, 0x01)
			updateFusion("RedV", segment, "fusions19", 0x2002c84, 0x02)
			updateFusion("RedV", segment, "fusions1a", 0x2002c84, 0x04)

			updateFusion("RedE", segment, "fusions17", 0x2002c83, 0x80)
			updateFusion("RedE", segment, "fusions1b", 0x2002c84, 0x08)
			updateFusion("RedE", segment, "fusions1c", 0x2002c84, 0x10)
			updateFusion("RedE", segment, "fusions1d", 0x2002c84, 0x20)
			updateFusion("RedE", segment, "fusions1e", 0x2002c84, 0x40)
			updateFusion("RedE", segment, "fusions1f", 0x2002c84, 0x80)
			updateFusion("RedE", segment, "fusions20", 0x2002c85, 0x01)
			updateFusion("RedE", segment, "fusions21", 0x2002c85, 0x02)
		end
		if has("fusionblue_vanilla") then
			updateFusion("BlueL", segment, "fusions22", 0x2002c85, 0x04)
			updateFusion("BlueL", segment, "fusions23", 0x2002c85, 0x08)
			updateFusion("BlueL", segment, "fusions24", 0x2002c85, 0x10)
			updateFusion("BlueL", segment, "fusions27", 0x2002c85, 0x80)
			updateFusion("BlueL", segment, "fusions28", 0x2002c86, 0x01)
			updateFusion("BlueL", segment, "fusions2c", 0x2002c86, 0x10)

			updateFusion("BlueS", segment, "fusions2d", 0x2002c86, 0x20)
			updateFusion("BlueS", segment, "fusions2e", 0x2002c86, 0x40)
			updateFusion("BlueS", segment, "fusions30", 0x2002c87, 0x01)
			updateFusion("BlueS", segment, "fusions31", 0x2002c87, 0x02)
			updateFusion("BlueS", segment, "fusions32", 0x2002c87, 0x04)
			updateFusion("BlueS", segment, "fusions33", 0x2002c87, 0x08)
		end
		if has("fusiongreen_vanilla") then
			updateFusion("GreenC", segment, "fusions34", 0x2002c87, 0x10)
			updateFusion("GreenC", segment, "fusions35", 0x2002c87, 0x20)
			updateFusion("GreenC", segment, "fusions36", 0x2002c87, 0x40)
			updateFusion("GreenC", segment, "fusions37", 0x2002c87, 0x80)
			updateFusion("GreenC", segment, "fusions38", 0x2002c88, 0x01)
			updateFusion("GreenC", segment, "fusions39", 0x2002c88, 0x02)
			updateFusion("GreenC", segment, "fusions3a", 0x2002c88, 0x04)
			updateFusion("GreenC", segment, "fusions3b", 0x2002c88, 0x08)
			updateFusion("GreenC", segment, "fusions3c", 0x2002c88, 0x10)
			updateFusion("GreenC", segment, "fusions3d", 0x2002c88, 0x20)
			updateFusion("GreenC", segment, "fusions3e", 0x2002c88, 0x40)
			updateFusion("GreenC", segment, "fusions3f", 0x2002c88, 0x80)
			updateFusion("GreenC", segment, "fusions40", 0x2002c89, 0x01)
			updateFusion("GreenC", segment, "fusions41", 0x2002c89, 0x02)
			updateFusion("GreenC", segment, "fusions42", 0x2002c89, 0x04)
			updateFusion("GreenC", segment, "fusions5c", 0x2002c8c, 0x10)
			updateFusion("GreenC", segment, "fusions5f", 0x2002c8c, 0x80)

			updateFusion("GreenG", segment, "fusions43", 0x2002c89, 0x08)
			updateFusion("GreenG", segment, "fusions44", 0x2002c89, 0x10)
			updateFusion("GreenG", segment, "fusions45", 0x2002c89, 0x20)
			updateFusion("GreenG", segment, "fusions46", 0x2002c89, 0x40)
			updateFusion("GreenG", segment, "fusions47", 0x2002c89, 0x80)
			updateFusion("GreenG", segment, "fusions48", 0x2002c8a, 0x01)
			updateFusion("GreenG", segment, "fusions49", 0x2002c8a, 0x02)
			updateFusion("GreenG", segment, "fusions4a", 0x2002c8a, 0x04)
			updateFusion("GreenG", segment, "fusions4b", 0x2002c8a, 0x08)
			updateFusion("GreenG", segment, "fusions4c", 0x2002c8a, 0x10)
			updateFusion("GreenG", segment, "fusions4d", 0x2002c8a, 0x20)
			updateFusion("GreenG", segment, "fusions4e", 0x2002c8a, 0x40)
			updateFusion("GreenG", segment, "fusions5d", 0x2002c8c, 0x20)
			updateFusion("GreenG", segment, "fusions60", 0x2002c8d, 0x01)
			updateFusion("GreenG", segment, "fusions62", 0x2002c8d, 0x04)
			updateFusion("GreenG", segment, "fusions63", 0x2002c8d, 0x08)

			updateFusion("GreenP", segment, "fusions4f", 0x2002c8a, 0x80)
			updateFusion("GreenP", segment, "fusions50", 0x2002c8b, 0x01)
			updateFusion("GreenP", segment, "fusions51", 0x2002c8b, 0x02)
			updateFusion("GreenP", segment, "fusions52", 0x2002c8b, 0x04)
			updateFusion("GreenP", segment, "fusions53", 0x2002c8b, 0x08)
			updateFusion("GreenP", segment, "fusions54", 0x2002c8b, 0x10)
			updateFusion("GreenP", segment, "fusions55", 0x2002c8b, 0x20)
			updateFusion("GreenP", segment, "fusions56", 0x2002c8b, 0x40)
			updateFusion("GreenP", segment, "fusions57", 0x2002c8b, 0x80)
			updateFusion("GreenP", segment, "fusions58", 0x2002c8c, 0x01)
			updateFusion("GreenP", segment, "fusions59", 0x2002c8c, 0x02)
			updateFusion("GreenP", segment, "fusions5a", 0x2002c8c, 0x04)
			updateFusion("GreenP", segment, "fusions5b", 0x2002c8c, 0x08)
			updateFusion("GreenP", segment, "fusions5e", 0x2002c8c, 0x40)
			updateFusion("GreenP", segment, "fusions61", 0x2002c8d, 0x02)
			updateFusion("GreenP", segment, "fusions64", 0x2002c8d, 0x10)
		end
	end
	if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		-- if has("golden_enemy_on") then
			--GOLDEN
			updateSectionFlag(segment, "@Wind Ruins - Octo Golden/Kill", 0x2002ca2, 0x02)
			updateSectionFlag(segment, "@Crenel - Middle Tektite Golden/Kill", 0x2002ca2, 0x04)
			updateSectionFlag(segment, "@Castor Wilds - Rope Golden/Kill", 0x2002ca2, 0x08)
			updateSectionFlag(segment, "@Eastern Hills - Rope Golden/Kill", 0x2002ca2, 0x10)
			updateSectionFlag(segment, "@Castle - Rope Golden/Kill", 0x2002ca2, 0x20)
			updateSectionFlag(segment, "@Veil Falls - Tektite Golden/Kill", 0x2002ca2, 0x40)
			updateSectionFlag(segment, "@Crenel - Top Tektite Golden/Kill", 0x2002ca2, 0x80)
			updateSectionFlag(segment, "@Minish Woods North - Octo Golden/Kill", 0x2002ca3, 0x01)
			updateSectionFlag(segment, "@Western Woods - Octo Golden/Kill", 0x2002ca3, 0x02)
		-- end
		--FUSIONS
		updateSectionFlag(segment, "@Clouds - Top Right Fusion/Fusion", 0x2002c81, 0x02)
		updateSectionFlag(segment, "@Clouds - Bottom Left Fusion/Fusion", 0x2002c81, 0x04)
		updateSectionFlag(segment, "@Clouds - Top Left Fusion/Fusion", 0x2002c81, 0x08)
		updateSectionFlag(segment, "@Clouds - Central Fusion/Fusion", 0x2002c81, 0x10)
		updateSectionFlag(segment, "@Clouds - Bottom Right Fusion/Fusion", 0x2002c81, 0x20)
		updateDecreaseCount(
			segment,
			"@Castor Wilds - Fusions/Fusions",
			{{0x2002c81, 0x40}, {0x2002c81, 0x80}, {0x2002c82, 0x01}}
		)
		updateSectionFlag(segment, "@Veil Falls - Source of the Flow Cave/Fusion", 0x2002c82, 0x02)
		--CRENEL
		updateSectionFlag(segment, "@Crenel - Climbing Wall Chest/Chest", 0x2002cd4, 0x01)
		updateSectionFlag(segment, "@Crenel - Great Fairy/Gift", 0x2002cf0, 0x01)
		updateSectionFlag(segment, "@Crenel - Mines/Chest", 0x2002d11, 0x08)
		updateDecreaseCountSpecialCheck(
			segment,
			"DIG_SPOT",
			"@Crenel - Mines/Digging",
			{
				{0x2002cf3, 0x02},
				{0x2002cf3, 0x04},
				{0x2002cf3, 0x08},
				{0x2002cf3, 0x10},
				{0x2002cf3, 0x20},
				{0x2002cf3, 0x40},
				{0x2002cf3, 0x80},
				{0x2002cf4, 0x01}
			}
		)
		updateSectionFlag(segment, "@Crenel - Mitts Cave/Heart Piece", 0x2002d04, 0x20)
		updateSectionFlag(segment, "@Crenel - Beanstalk/Heart Piece", 0x2002d0c, 0x08)
		updateDecreaseCount(
			segment,
			"@Crenel - Beanstalk/Rupees",
			{
				{0x2002d0e, 0x40},
				{0x2002d0e, 0x80},
				{0x2002d0f, 0x01},
				{0x2002d0f, 0x02},
				{0x2002d0f, 0x04},
				{0x2002d0f, 0x08},
				{0x2002d0f, 0x10},
				{0x2002d0f, 0x20}
			}
		)
		updateSectionFlag(segment, "@Crenel - Rainy Minish Path Chest/Chest", 0x2002d10, 0x40)
		updateDecreaseCount(segment, "@Crenel - Dojo/Chests", {{0x2002d1c, 0x02}, {0x2002d1c, 0x04}})
		updateSectionFlag(segment, "@Crenel - Dojo/Heart Piece", 0x2002d2c, 0x01)
		updateSectionFlag(segment, "@Crenel - Bridge Cave/Chest", 0x2002d23, 0x80)
		updateSectionFlag(segment, "@Crenel - Fairy/Heart Piece", 0x2002d2b, 0x20)
		updateSectionFlag(segment, "@Crenel - Mines Cave/Chest", 0x2002d23, 0x20)

		-- MAP MINES
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 8/Digging", 0x2002cf4, 0x01)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 1/Digging", 0x2002cf3, 0x02)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 7/Digging", 0x2002cf3, 0x80)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 6/Digging", 0x2002cf3, 0x40)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 5/Digging", 0x2002cf3, 0x20)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 4/Digging", 0x2002cf3, 0x10)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 2/Digging", 0x2002cf3, 0x04)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Crenel - Mines - Digging Spot 3/Digging", 0x2002cf3, 0x08)

		--CRENEL BASE
		updateSectionFlag(segment, "@Crenel Base - Vine Rupee/Rupee", 0x2002cc5, 0x02)
		updateSectionFlag(segment, "@Crenel Base - Chest/Chest", 0x2002cd4, 0x02)
		updateSectionFlag(segment, "@Crenel Base - Minish Crack/Chest", 0x2002cde, 0x02)
		updateSectionFlag(segment, "@Crenel Base - Spring Water Path Chest/Chest", 0x2002d10, 0x80)
		updateSectionFlag(segment, "@Crenel Base - Heart Piece Cave/Heart Piece", 0x2002d24, 0x01)
		updateDecreaseCount(segment, "@Crenel Base - Heart Piece Cave/Chests", {{0x2002d24, 0x02}, {0x2002d24, 0x04}})
		updateDecreaseCount(segment, "@Crenel Base - Fairy/Rupees", {{0x2002d24, 0x08}, {0x2002d24, 0x10}, {0x2002d24, 0x20}})
		updateSectionFlag(segment, "@Crenel Base - Minish Hole/Chest", 0x2002d28, 0x01)

		--CASTOR WILDS
		updateSectionFlag(segment, "@Castor Wilds - Platform Chest/Chest", 0x2002cbd, 0x10)
		updateSectionFlagSpecialCheck(segment, "UNDERWATER_SPOT", "@Castor Wilds - Diving Spots/Diving Top", 0x2002cc0, 0x04)
		updateSectionFlagSpecialCheck(segment, "UNDERWATER_SPOT", "@Castor Wilds - Diving Spots/Diving Middle", 0x2002cc0, 0x08)
		updateSectionFlagSpecialCheck(segment, "UNDERWATER_SPOT",  "@Castor Wilds - Diving Spots/Diving Bottom", 0x2002cc0, 0x10)
		updateSectionFlag(segment, "@Castor Wilds - Mulldozers/Big Chest", 0x2002cde, 0x01)
		updateSectionFlag(segment, "@Castor Wilds - Northern Minish Crack/Chest", 0x2002cde, 0x08)
		updateSectionFlag(segment, "@Castor Wilds - Western Minish Crack/Chest", 0x2002cde, 0x10)
		updateSectionFlag(segment, "@Castor Wilds - Vine Minish Crack/Chest", 0x2002cde, 0x20)
		updateSectionFlag(segment, "@Castor Wilds - Mulldozers/Left Chest", 0x2002cf0, 0x20)
		updateDecreaseCount(segment, "@Castor Wilds - Mitts Cave/Chests", {{0x2002d04, 0x01}, {0x2002d04, 0x02}})
		updateSectionFlag(segment, "@Castor Wilds - South Lake Cave/Chest", 0x2002d22, 0x10)
		updateSectionFlag(segment, "@Castor Wilds - North Cave/Chest", 0x2002d22, 0x40)
		updateSectionFlag(segment, "@Castor Wilds - Northeast Lake Cave/Heart Piece", 0x2002d23, 0x01)
		updateSectionFlag(segment, "@Castor Wilds - Darknut/Kill", 0x2002d23, 0x04)
		updateSectionFlag(segment, "@Castor Wilds - Dojo/Heart Piece", 0x2002d2b, 0x80)
		updateSectionFlag(segment, "@Castor Wilds - Water Minish Hole/Heart Piece", 0x2002d2c, 0x10)
		updateSectionFlag(segment, "@Castor Wilds - Water Minish Hole/Chest", 0x2002d2c, 0x20)

		--WIND RUINS
		updateDecreaseCount(segment, "@Wind Ruins - Armos Kill/Chests", {{0x2002cc2, 0x08}, {0x2002cc2, 0x10}})
		updateSectionFlag(segment, "@Wind Ruins - Pre FOW/Chest", 0x2002cd2, 0x10)
		updateSectionFlag(segment, "@Wind Ruins - 4 Pillars/Chest", 0x2002cd4, 0x04)
		updateSectionFlag(segment, "@Wind Ruins - Minish Hole/Chest", 0x2002cde, 0x04)
		updateSectionFlag(segment, "@Wind Ruins - Minish Crack/Chest", 0x2002cf0, 0x10)
		updateSectionFlag(segment, "@Wind Ruins - Beanstalk/Big Chest", 0x2002d0c, 0x80)
		updateSectionFlag(segment, "@Wind Ruins - Bombable Wall/Chest", 0x2002d22, 0x80)
		updateSectionFlag(segment, "@Wind Ruins - Minish Wall Hole/Heart Piece", 0x2002d2b, 0x40)

		--VALLEY
		updateSectionFlag(segment, "@Royal Valley - Lost Woods Secret/Chest (Left Left Left Up Up Up)", 0x2002cc7, 0x04)
		updateSectionFlag(segment, "@Royal Valley - Northwest Grave/Chest", 0x2002cd3, 0x04)
		updateSectionFlag(segment, "@Royal Valley - Northwest Grave/Heart Piece", 0x2002d27, 0x20)
		updateSectionFlag(segment, "@Royal Valley - Northeast Grave/Chest", 0x2002cd3, 0x08)
		updateSectionFlag(segment, "@Royal Valley - Northeast Grave/Grave Chest", 0x2002d27, 0x40)
		updateSectionFlag(segment, "@Royal Valley - Dampe/Gift", 0x2002ce9, 0x02)
		updateSectionFlag(segment, "@Royal Valley - Great Fairy/Gift", 0x2002cef, 0x40)
		updateSectionFlag(segment, "@Pre Royal Valley - Chest/Chest", 0x2002cd3, 0x20)
		--Crypt
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Royal Crypt/King Gustaf", 0x2002d02, 0x04)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Royal Crypt/Left Path", 0x2002d12, 0x40)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Royal Crypt/Right Path", 0x2002d12, 0x80)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Royal Crypt/First Gibdos", 0x2002d14, 0x10)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Royal Crypt/Other Gibdos", 0x2002d14, 0x20)

		--Crypt map
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Crypt - King Gustaf/Gift", 0x2002d02, 0x04)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Crypt - Left Path/Chest", 0x2002d12, 0x40)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Crypt - Right Path/Chest", 0x2002d12, 0x80)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Crypt - Gibdos/First Kill", 0x2002d14, 0x10)
		updateSectionFlagDungeons(segment, "RC_ENTER", "@Crypt - Gibdos/Second Kill", 0x2002d14, 0x20)
		--TRILBY
		updateSectionFlag(segment, "@Trilby Highlands - Business Scrub/Item", 0x2002ca7, 0x04)
		updateSectionFlag(segment, "@Trilby Highlands - Northern Chest/Chest", 0x2002cd2, 0x40)
		updateSectionFlag(segment, "@Trilby Highlands - Rocks Chest/Chest", 0x2002cd3, 0x10)
		updateDecreaseCount(segment, "@Trilby Highlands - Mitts Cave/Chests", {{0x2002d04, 0x80}, {0x2002d05, 0x02}})
		updateSectionFlag(segment, "@Trilby Highlands - Fusion Mitts Cave/Chest", 0x2002d05, 0x01)
		updateSectionFlag(segment, "@Trilby Highlands - Bomb Wall/Chest", 0x2002d1d, 0x20)
		updateDecreaseCount(
			segment,
			"@Trilby Highlands - Rupee Cave/Rupees",
			{
				{0x2002d20, 0x10},
				{0x2002d20, 0x20},
				{0x2002d20, 0x40},
				{0x2002d20, 0x80},
				{0x2002d21, 0x01},
				{0x2002d21, 0x02},
				{0x2002d21, 0x04},
				{0x2002d21, 0x08},
				{0x2002d21, 0x10},
				{0x2002d21, 0x20},
				{0x2002d21, 0x40},
				{0x2002d21, 0x80},
				{0x2002d22, 0x01},
				{0x2002d22, 0x02},
				{0x2002d22, 0x04}
			}
		)

		--WESTERN WOOD
		updateDecreaseCount(
			segment,
			"@Western Woods - North Digging Spots/Buried Treasure",
			{{0x2002cce, 0x08}, {0x2002cce, 0x10}, {0x2002cce, 0x20}, {0x2002cce, 0x40}, {0x2002cce, 0x80}, {0x2002ccf, 0x01}}
		)
		updateDecreaseCount(
			segment,
			"@Western Woods - South Digging Spots/Buried Treasure",
			{{0x2002ccf, 0x02}, {0x2002ccf, 0x04}}
		)
		updateSectionFlag(segment, "@Western Woods - Chest/Freestanding Chest", 0x2002ccf, 0x10)
		updateSectionFlag(segment, "@Western Woods - Percy's House/Percy Reward", 0x2002ce3, 0x80)
		updateSectionFlag(segment, "@Western Woods - Percy's House/Moblin Reward", 0x2002ce4, 0x04)
		updateSectionFlag(segment, "@Western Woods - Tree/Heart Piece", 0x2002cef, 0x01)
		updateSectionFlag(segment, "@Western Woods - Beanstalk/Chest", 0x2002d0d, 0x08)
		updateDecreaseCount(
			segment,
			"@Western Woods - Beanstalk/Rupees",
			{
				{0x2002d0d, 0x10},
				{0x2002d0d, 0x20},
				{0x2002d0d, 0x40},
				{0x2002d0d, 0x80},
				{0x2002d0e, 0x01},
				{0x2002d0e, 0x02},
				{0x2002d0e, 0x04},
				{0x2002d0e, 0x08},
				{0x2002d0f, 0x40},
				{0x2002d0f, 0x80},
				{0x2002d10, 0x01},
				{0x2002d10, 0x02},
				{0x2002d10, 0x04},
				{0x2002d10, 0x08},
				{0x2002d10, 0x10},
				{0x2002d10, 0x20}
			}
		)

		--Castle
		updateSectionFlag(segment, "@Castle - Moat/Left Chest", 0x2002cbe, 0x04)
		updateSectionFlag(segment, "@Castle - Moat/Right Chest", 0x2002cbe, 0x08)
		updateSectionFlag(segment, "@Castle - Dojo/Heart Piece", 0x2002d2c, 0x08)
		updateSectionFlag(segment, "@Castle - Right Fountain/Dry Fountain", 0x2002d0e, 0x10)
		updateSectionFlag(segment, "@Castle - Right Fountain/Minish Hole", 0x2002d28, 0x10)
		updateSectionFlag(segment, "@Castle - Left Fountain/Minish Hole", 0x2002d28, 0x20)

		--NORTH FIELD
		updateSectionFlag(segment, "@North Field - Digging Spot/Digging", 0x2002ccd, 0x20)
		updateSectionFlag(segment, "@North Field - Top Left Tree/Chest", 0x2002d1c, 0x10)
		updateSectionFlag(segment, "@North Field - Top Right Tree/Chest", 0x2002d1c, 0x20)
		updateSectionFlag(segment, "@North Field - Bottom Left Tree/Chest", 0x2002d1c, 0x40)
		updateSectionFlag(segment, "@North Field - Bottom Right Tree/Chest", 0x2002d1c, 0x80)
		updateSectionFlag(segment, "@North Field - Tingle Chest/Big Chest", 0x2002d1d, 0x01)
		updateSectionFlag(segment, "@North Field - Cave/Heart Piece", 0x2002d2b, 0x08)

		--HYRULE TOWN
		updateSectionFlag(segment, "@Town - Eastern Shops/Simon's Simulations", 0x2002c9c, 0x02)
		updateSectionFlag(segment, "@Town - Anju/Round 10 Gift", 0x2002ca5, 0x80)
		UpdateCucco(segment)
		UpdateGoronShop(segment)
		updateSectionFlag(segment, "@Town - Hearth Ledge/Chest", 0x2002cd5, 0x01)
		updateSectionFlag(segment, "@Town - School/Roof Chest", 0x2002cd5, 0x02)
		updateSectionFlag(segment, "@Town - School/Pull the Statue", 0x2002cfc, 0x40)
		updateSectionFlag(segment, "@Town - Bell/Heart Piece", 0x2002cd5, 0x20)
		updateSectionFlag(segment, "@Town - Cafe/Lady Next to Cafe - Gift", 0x2002cd6, 0x40)
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Town - Inn/Right Pot", 0x2002ce0, 0x80)
		updateSectionFlag(segment, "@Town - Inn/Back Door - Heart Piece", 0x2002cf3, 0x01)
		updateSectionFlag(segment, "@Town - Stockwell's Shop/Dog Food Bottle", 0x2002ce6, 0x08)
		updateSectionFlag(segment, "@Town - Library/Yellow Minish - Gift", 0x2002ceb, 0x01)
		updateSectionFlag(segment, "@Town - Eastern Shops/Figurine House Heart Piece", 0x2002cf2, 0x10)
		updateDecreaseCount(
			segment,
			"@Town - Eastern Shops/Figurine House",
			{{0x2002cf2, 0x20}, {0x2002cf2, 0x40}, {0x2002cf2, 0x80}}
		)
		updateSectionFlag(segment, "@Town - Digging Cave/Basement Left - Chest", 0x2002cfc, 0x80)
		updateDecreaseCount(segment, "@Town - Digging Cave/Chests", {{0x2002d04, 0x04}, {0x2002d04, 0x08}, {0x2002d04, 0x10}})
		updateSectionFlag(segment, "@Town - Mayor's House Basement/Chest", 0x2002cfd, 0x01)
		updateSectionFlag(segment, "@Town - Hyrule Well/Bottom Chest", 0x2002cfd, 0x02)
		updateSectionFlag(segment, "@Town - Hyrule Well/Center Chest", 0x2002cfd, 0x04)
		updateSectionFlag(segment, "@Town - Fountain/Mulldozers", 0x2002cfd, 0x80)
		updateSectionFlag(segment, "@Town - Fountain/Chest", 0x2002cfe, 0x01)
		updateSectionFlag(segment, "@Town - Fountain/Heart Piece", 0x2002d14, 0x08)
		updateSectionFlag(segment, "@Town - Flippers Cave/Under the Waterfall", 0x2002cfe, 0x08)
		updateSectionFlag(segment, "@Town - Flippers Cave/Scissor Beetles", 0x2002cfe, 0x10)
		updateSectionFlag(segment, "@Town - Flippers Cave/Frozen Chest", 0x2002cfe, 0x20)
		updateSectionFlag(segment, "@Town - Stockwell's Shop/Attic Chest", 0x2002d0a, 0x80)
		updateSectionFlag(segment, "@Town - School Gardens/Heart Piece", 0x2002d0b, 0x40)
		updateDecreaseCount(
			segment,
			"@Town - School Gardens/Garden Chests",
			{{0x2002d0b, 80}, {0x2002d0c, 0x01}, {0x2002d0c, 0x02}}
		)
		updateSectionFlag(segment, "@Town - School Gardens/Minish Path Chest", 0x2002d11, 0x01)
		updateSectionFlag(segment, "@Town - Bakery Attic/Chest", 0x2002d13, 0x20)
		updateSectionFlag(segment, "@Town - Waterfall/Waterfall", 0x2002d1d, 0x40)

		--SOUTH FIELD
		updateSectionFlag(segment, "@South Field - Tingle/Gift", 0x2002ca3, 0x04)
		updateSectionFlag(segment, "@South Field - Near Link's House Chest/Chest", 0x2002cd3, 0x02)
		updateSectionFlag(segment, "@South Field - Smith's House/Chests", 0x2002cde, 0x40)
		updateSectionFlag(segment, "@South Field - Tree Heart Piece/Heart Piece", 0x2002cee, 0x80)
		updateDecreaseCount(
			segment,
			"@South Field - Rupee Cave/Rupees",
			{
				{0x2002d1e, 0x20},
				{0x2002d1e, 0x40},
				{0x2002d1e, 0x80},
				{0x2002d1f, 0x01},
				{0x2002d1f, 0x02},
				{0x2002d1f, 0x04},
				{0x2002d1f, 0x08},
				{0x2002d1f, 0x10},
				{0x2002d1f, 0x20},
				{0x2002d1f, 0x40},
				{0x2002d1f, 0x80},
				{0x2002d20, 0x01},
				{0x2002d20, 0x02},
				{0x2002d20, 0x04},
				{0x2002d20, 0x08}
			}
		)
		updateSectionFlag(segment, "@South Field - Minish Flippers Hole/Heart Piece", 0x2002d2c, 0x02)

		--VEIL FALLS
		updateSectionFlag(segment, "@Veil Falls - Heart Piece/Heart Piece", 0x2002cd0, 0x01)
		updateSectionFlag(segment, "@Veil Falls - Upper Rocks/Digging", 0x2002cd0, 0x80)
		updateSectionFlag(segment, "@Veil Falls - Upper Rocks/Chest", 0x2002cd3, 0x80)
		updateSectionFlag(segment, "@Veil Falls - South Digging Spot/Digging", 0x2002cda, 0x80)
		updateSectionFlag(segment, "@Veil Falls - Mitts Cave/Chest", 0x2002d05, 0x04)
		updateSectionFlag(segment, "@Veil Falls - Mitts Cave/Heart Piece", 0x2002d05, 0x20)
		updateSectionFlag(segment, "@Veil Falls - Source of the Flow Cave/Bombable Wall First Chest", 0x2002d25, 0x10)
		updateSectionFlag(segment, "@Veil Falls - Source of the Flow Cave/Bombable Wall Second Chest", 0x2002cd0, 0x02)
		updateSectionFlag(segment, "@Veil Falls - Upper Cave/Freestanding Chest", 0x2002d25, 0x01)
		updateSectionFlag(segment, "@Veil Falls - Upper Cave/Bomb Wall Chest", 0x2002d25, 0x04)
		updateDecreaseCount(
			segment,
			"@Veil Falls - Upper Cave/Downstairs Rupees",
			{
				{0x2002d25, 0x20},
				{0x2002d25, 0x40},
				{0x2002d25, 0x80},
				{0x2002d26, 0x01},
				{0x2002d26, 0x02},
				{0x2002d26, 0x04},
				{0x2002d26, 0x08},
				{0x2002d26, 0x10},
				{0x2002d26, 0x20}
			}
		)
		updateDecreaseCount(
			segment,
			"@Veil Falls - Upper Cave/Underwater Rupees",
			{{0x2002d26, 0x40}, {0x2002d26, 0x80}, {0x2002d27, 0x01}, {0x2002d27, 0x02}, {0x2002d27, 0x04}, {0x2002d27, 0x08}}
		)
		updateSectionFlag(segment, "@Veil Falls - Upper Waterfall/Heart Piece", 0x2002d27, 0x10)

		--VEIL FALLS SOUTH
		updateSectionFlag(segment, "@Veil Falls South - Heart Piece/Heart Piece", 0x2002cd1, 0x02)
		updateSectionFlag(segment, "@Veil Falls South - Mitts Cave/Left Chest", 0x2002d05, 0x08) --à verifier
		updateSectionFlag(segment, "@Veil Falls South - Mitts Cave/Right Chest", 0x2002d05, 0x10)
		 --à verifier
		updateSectionFlag(segment, "@Veil Falls South - Rupees/Rupee 1", 0x2002cd0, 0x04)
		updateSectionFlag(segment, "@Veil Falls South - Rupees/Rupee 2", 0x2002cd0, 0x08)
		updateSectionFlag(segmemt, "@Veil Falls South - Rupees/Rupee 3", 0x2002cd0, 0x10)
		updateSectionFlag(segment, "@Veil Falls South - North Ranch Chest/Chest", 0x2002cd3, 0x40)

		--LON LON RANCH
		updateSectionFlag(segment, "@Lon Lon Ranch - Digging Spot/Digging (Above Tree)", 0x2002ccb, 0x20)
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Lon Lon Ranch - Malon's Pot/Pot", 0x2002ce5, 0x20)
		updateSectionFlag(segment, "@Lon Lon Ranch - Minish Crack/Chest", 0x2002cf2, 0x04)
		updateSectionFlag(segment, "@Lon Lon Ranch - Bonk the Tree/Chest", 0x2002d11, 0x02)
		updateSectionFlag(segment, "@Lon Lon Ranch - Bonk the Tree/Heart Piece", 0x2002d13, 0x04)
		updateSectionFlag(segment, "@Lon Lon Ranch - Cave/Chest", 0x2002d1d, 0x80)
		updateSectionFlag(segment, "@Lon Lon Ranch - Cave/Hidden Chest (Bomb Wall)", 0x2002d1e, 0x04)
		updateSectionFlag(segment, "@Lon Lon Ranch - Dried Up Pond/Big Chest", 0x2002d1e, 0x10)
		updateSectionFlag(segment, "@Lon Lon Ranch - Goron Quest/Big Chest", 0x2002d2a, 0x40)
		updateSectionFlag(segment, "@Lon Lon Ranch - Goron Quest/Chest", 0x2002d2a, 0x80)

		--EASTERN HILLS
		updateSectionFlag(segment, "@Eastern Hills - Farm/Chest", 0x2002cd2, 0x04)
		updateSectionFlag(segment, "@Eastern Hills - Mitts Cave/Rupee", 0x2002d04, 0x40)
		updateSectionFlag(segment, "@Eastern Hills - Beanstalk/Heart Piece", 0x2002d0d, 0x01)
		updateDecreaseCount(segment, "@Eastern Hills - Beanstalk/Chests", {{0x2002d0d, 0x02}, {0x2002d0d, 0x04}})
		updateSectionFlag(segment, "@Eastern Hills - Bombable Wall/Chest", 0x2002d22, 0x08)

		--LAKE HYLIA
		updateSectionFlag(segment, "@Hylia - Lon Lon Ranch - North Heart Piece/Heart Piece", 0x2002ccb, 0x10)
		updateSectionFlag(segment, "@Hylia - Cape Heart Piece/Heart Piece", 0x2002cbd, 0x01)
		updateSectionFlagSpecialCheck(segment, "UNDERWATER_SPOT", "@Hylia - Pond Heart Piece/Diving", 0x2002cbd, 0x02)
		updateSectionFlag(segment, "@Hylia - Southern/Heart Piece", 0x2002cbd, 0x04)
		updateSectionFlag(segment, "@Hylia - Librari/Gift", 0x2002cf2, 0x08)
		updateSectionFlag(segment, "@Hylia - Middle Island Cave/Chest", 0x2002d02, 0x40)
		updateDecreaseCount(
			segment,
			"@Hylia - Treasure Cave/Chest",
			{
				{0x2002d02, 0x80},
				{0x2002d03, 0x02},
				{0x2002d03, 0x04},
				{0x2002d03, 0x08},
				{0x2002d03, 0x10},
				{0x2002d03, 0x20},
				{0x2002d03, 0x40}
			}
		)
		updateSectionFlag(segment, "@Hylia - Treasure Cave/Beanstalk - Heart Piece", 0x2002d0c, 0x10)
		updateDecreaseCount(segment, "@Hylia - Treasure Cave/Beanstalk - Chest", {{0x2002d0c, 0x20}, {0x2002d0c, 0x40}})
		updateSectionFlag(segment, "@Hylia - Lake Cabin/Chest", 0x2002d11, 0x10)
		updateSectionFlag(segment, "@Hylia - North Minish Hole/Chest", 0x2002d2a, 0x04)
		updateSectionFlag(segment, "@Hylia - Dojo/Heart Piece", 0x2002d2c, 0x04)
		updateSectionFlag(segment, "@Hylia - Minish Woods - North Minish Hole/Chest", 0x2002d28, 0x04)
		--MINISH WOODS
		updateSectionFlag(segment, "@Minish Woods - Great Fairy/Gift", 0x2002cef, 0x80)
		updateSectionFlag(segment, "@Minish Woods - Post Minish Village/Chest", 0x2002cdb, 0x08)
		updateSectionFlag(segment, "@Minish Woods - Minish Flippers Cave/Middle Chest", 0x2002d2a, 0x08)
		updateSectionFlag(segment, "@Minish Woods - Minish Flippers Cave/Right Chest", 0x2002d2a, 0x10)
		updateSectionFlag(segment, "@Minish Woods - Minish Flippers Cave/Left Chest", 0x2002d2a, 0x20)
		updateSectionFlag(segment, "@Minish Woods - Minish Flippers Cave/Left Heart Piece", 0x2002d2b, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Belari/Gift 2nd Item", 0x2002cf2, 0x01)
		updateSectionFlag(segment, "@Minish Woods - Pre Minish Village - Minish Hole/Chest", 0x2002cf0, 0x08)
		updateSectionFlag(segment, "@Minish Woods - Minish Village/Heart Piece", 0x2002cf4, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Minish Village/Barrel", 0x2002cf5, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Minish Village/Chest", 0x2002d11, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Entrance/Chest", 0x2002cd3, 0x01)
		updateSectionFlag(segment, "@Minish Woods - Shrine Heart Piece/Heart Piece", 0x2002cc3, 0x10)
		updateSectionFlag(segment, "@Minish Woods - Pre Stump Chest/Chest", 0x2002cd2, 0x20)
		updateSectionFlag(segment, "@Minish Woods - Pre Shrine Chest/Chest", 0x2002cd2, 0x80)
		updateSectionFlag(segment, "@Minish Woods North - Heart Piece/Heart Piece", 0x2002cc3, 0x08)
		updateSectionFlag(segment, "@Minish Woods North - Cross the Pond/Chest", 0x2002cd2, 0x08)
		updateSectionFlag(segment, "@Minish Woods North - Mitts Cave/Chest", 0x2002d02, 0x08)
		updateDecreaseCount(segment, "@Minish Woods - Like Like Cave/Chests", {{0x2002d02, 0x10}, {0x2002d02, 0x20}})
		--CLOUD TOPS
		updateSectionFlag(segment, "@Clouds - Top Left South Chest/Chest", 0x2002cd7, 0x20)
		updateDecreaseCount(segment, "@Clouds - Top Left North Chests/Chests", {{0x2002cd7, 0x40}, {0x2002cd7, 0x80}})
		updateSectionFlagSpecialCheck(segment,"DIG_SPOT", "@Clouds - Top Left North Chests/Digging", 0x2002cd8, 0x04)
		updateSectionFlag(segment, "@Clouds - Kill Piranhas (North)/Kill", 0x2002cda, 0x02)
		updateSectionFlag(segment, "@Clouds - Kill Piranhas (South)/Kill", 0x2002cda, 0x08)
		updateSectionFlag(segment, "@Clouds - Bottom Left Chest/Chest", 0x2002cd8, 0x01)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Clouds - Southeast South Digging Spot/Digging", 0x2002cd9, 0x01)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Clouds - Southeast North Digging Spot/Digging", 0x2002cd8, 0x20)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Clouds - South Digging Spot/Digging", 0x2002cd8, 0x80)
		updateSectionFlag(segment, "@Clouds - Center Right/Chest", 0x2002cd8, 0x02)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Clouds - Center Digging Spot/Digging", 0x2002cd8, 0x10)
		updateSectionFlag(segment, "@Clouds - Center Left/Chest", 0x2002cd7, 0x10)
		updateSectionFlag(segment, "@Clouds - Right Chest/Chest", 0x2002cd7, 0x08)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Clouds - Top Right Digging Spot/Digging", 0x2002cd8, 0x08)
		updateSectionFlagSpecialCheck(segment, "DIG_SPOT", "@Clouds - Bottom Left Digging Spot/Digging", 0x2002cd8, 0x40)

		--Wind Tribe
		updateDecreaseCount(segment, "@Wind Tribe House/1F Chests", {{0x2002cdc, 0x20}, {0x2002cdc, 0x40}})
		updateSectionFlag(segment, "@Wind Tribe House/2F Chest", 0x2002cdc, 0x80)
		updateDecreaseCount(segment, "@Wind Tribe House/3F Chests", {{0x2002cdd, 0x01}, {0x2002cdd, 0x02}, {0x2002cdd, 0x04}})
		updateDecreaseCount(segment, "@Wind Tribe House/4F Chests", {{0x2002cdd, 0x40}, {0x2002cdd, 0x80}})
		updateSectionFlag(segment, "@Wind Tribe House/2F Save Gregal", 0x2002ce8, 0x20)
		updateSectionFlag(segment, "@Wind Tribe House/2F Gregal's Gift", 0x2002ce8, 0x40)

		--DWS
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Slug Room", 0x2002d43, 0x20)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Upstairs Chest", 0x2002d45, 0x04)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Barrel Room Northwest", 0x2002d41, 0x08)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/West Side Big Chest", 0x2002d41, 0x02)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Two Statue Room", 0x2002d40, 0x80)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Mulldozer Key", 0x2002d42, 0x01)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Two Lamp Chest", 0x2002d40, 0x10)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Basement Switch Big Chest", 0x2002d44, 0x04)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Basement Switch Chest", 0x2002d44, 0x02)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Blue Warp Heart Piece", 0x2002d45, 0x80)
		updateDecreaseCountDungeons(segment, "DWS_ENTER", "@DeepWoods/Puffstool Room", {{0x2002d40, 0x04}, {0x2002d40, 0x08}})
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Madderpillar Chest", 0x2002d3f, 0x08)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Madderpillar Heart Piece", 0x2002d46, 0x04)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Basement Big Chest", 0x2002d43, 0x80)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@DeepWoods/Green Chu", 0x2002d44, 0x80)

		-- MAP DWS
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Slug Room/Chest", 0x2002d43, 0x20)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Upstairs Room/Chest", 0x2002d45, 0x04)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Barrel Room Northwest/Chest", 0x2002d41, 0x08)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - West Side/Big Chest", 0x2002d41, 0x02)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Two Statue Room/Chest", 0x2002d40, 0x80)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Mulldozer Key/Kill", 0x2002d42, 0x01)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Two Lamp/Chest", 0x2002d40, 0x10)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Basement Switch Room Big Chest/Big Chest", 0x2002d44, 0x04)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Basement Switch Room Chest/Chest", 0x2002d44, 0x02)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Blue Warp/Heart Piece", 0x2002d45, 0x80)
		updateDecreaseCountDungeons(segment, "DWS_ENTER", "@Deepwoods - Puffstool Room/Chest", {{0x2002d40, 0x04}, {0x2002d40, 0x08}})
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Madderpillar Fight/Kill", 0x2002d3f, 0x08)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Madderpillar Heart Piece/Heart Piece", 0x2002d46, 0x04)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Basement Big Chest/Big Chest", 0x2002d43, 0x80)
		updateSectionFlagDungeons(segment, "DWS_ENTER", "@Deepwoods - Green Chu/Heart", 0x2002d44, 0x80)

		-- COF
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Spiny Beetle Fight", 0x2002d5a, 0x04)
		updateDecreaseCountDungeons(
			segment, "COF_ENTER",
			"@Cave Of Flame/Rupees",
			{{0x2002d5b, 0x40}, {0x2002d5b, 0x80}, {0x2002d5c, 0x01}, {0x2002d5c, 0x02}, {0x2002d5c, 0x04}}
		)
		updateDecreaseCountDungeons(segment, "COF_ENTER", "@Cave Of Flame/Big Chest Room", {{0x2002d59, 0x02}, {0x2002d59, 0x04}})
		updateDecreaseCountDungeons(segment, "COF_ENTER", "@Cave Of Flame/First Rollobite Room", {{0x2002d58, 0x40}, {0x2002d58, 0x80}})
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Bombable Wall Heart Piece", 0x2002d5b, 0x10)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Spiny Chu Fight", 0x2002d57, 0x02)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Spiny Chu Pillar Chest", 0x2002d57, 0x01)
		updateDecreaseCountDungeons(segment, "COF_ENTER", "@Cave Of Flame/Pre Lava Basement Room", {{0x2002d59, 0x10}, {0x2002d59, 0x20}})
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Blade Chest", 0x2002d5a, 0x01)
		updateDecreaseCountDungeons(segment, "COF_ENTER", "@Cave Of Flame/Lava Basement (Left,Right)", {{0x2002d5a, 0x80}, {0x2002d5b, 0x01}})
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Lava Basement Big Chest", 0x2002d5b, 0x02)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame/Gleerok", 0x2002d5b, 0x04)

		-- MAP COF
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Spiny Beetle Fight/Kill", 0x2002d5a, 0x04)
		updateDecreaseCountDungeons(
			segment, "COF_ENTER",
			"@Cave Of Flame - Rupees/Rupees",
			{{0x2002d5b, 0x40}, {0x2002d5b, 0x80}, {0x2002d5c, 0x01}, {0x2002d5c, 0x02}, {0x2002d5c, 0x04}}
		)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Big Chest Room Big Chest/Big Chest", 0x2002d59, 0x04)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Big Chest Room Chest/Chest", 0x2002d59, 0x02)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - First Rollobite Room Pillar/Chest", 0x2002d58, 0x40)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - First Rollobite Room/Chest", 0x2002d58, 0x80)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Bombable Wall/Heart Piece", 0x2002d5b, 0x10)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Spiny Chu Fight/Kill", 0x2002d57, 0x02)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Spiny Chu Pillar Chest/Chest", 0x2002d57, 0x01)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Pre Lava Basement Room Block Chest/Chest", 0x2002d59, 0x10)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Pre Lava Basement Room Ledge/Chest", 0x2002d59, 0x20)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Blade Chest/Chest", 0x2002d5a, 0x01)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Lava Basement Left/Chest", 0x2002d5a, 0x80)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Lava Basement Right/Chest", 0x2002d5b, 0x01)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Lava Basement Big Chest/Big Chest", 0x2002d5b, 0x02)
		updateSectionFlagDungeons(segment, "COF_ENTER", "@Cave Of Flame - Gleerok/Heart", 0x2002d5b, 0x04)

		--FOW
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Entrance Far Left", 0x2002d05, 0x80)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Wizzrobe Fight", 0x2002d74, 0x08)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Entrance Large Rupee", 0x2002d05, 0x40)
		updateDecreaseCountDungeons(segment, "FOW_ENTER", "@Fortress/Left Side Mitts Chests", {{0x2002d06, 0x01}, {0x2002d07, 0x20}})
		updateDecreaseCountDungeons(
			segment, "FOW_ENTER",
			"@Fortress/Left Side Rupees",
			{{0x2002d06, 0x20}, {0x2002d06, 0x40}, {0x2002d06, 0x80}, {0x2002d07, 0x01}, {0x2002d07, 0x04}, {0x2002d07, 0x08}}
		)
		updateDecreaseCountDungeons(segment, "FOW_ENTER", "@Fortress/Left Side Rupees Grabbable", {{0x2002d07, 0x02}})
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Eyegores", 0x2002d6f, 0x10)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Left Side Key Drop", 0x2002d73, 0x80)
		updateDecreaseCountDungeons(segment, "FOW_ENTER", "@Fortress/Right Side Two Lever Room", {{0x2002d73, 0x20}, {0x2002d73, 0x40}})
		updateDecreaseCountDungeons(segment, "FOW_ENTER", "@Fortress/Right Side Mitts Chests", {{0x2002d06, 0x04}, {0x2002d07, 0x40}})
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Right Side Key Drop", 0x2002d74, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Right Side Heart Piece", 0x2002d74, 0x80)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Pedestal Chest", 0x2002d73, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Center Path Switch", 0x2002d06, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Bombable Wall Big Chest", 0x2002d08, 0x01)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Bombable Wall Small Chest", 0x2002d08, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Clone Puzzle Key Drop", 0x2002d71, 0x40)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Minish Dirt Room Key Drop", 0x2002d08, 0x10)
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Fortress/Right Side Moldorm Top Pot", 0x2002d06, 0x08)
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Fortress/Right Side Moldorm Bottom Pot", 0x2002d06, 0x10)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Skull Room Chest", 0x2002d73, 0x04)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/Mazaal", 0x2002d72, 0x04)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress/FOW Reward", 0x2002d74, 0x20)

		-- MAP FOW
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Far Left Entrance Room/Chest", 0x2002d05, 0x80)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Entrance Rupee/Rupee", 0x2002d05, 0x40)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Wizzrobe Fight/Kill", 0x2002d74, 0x08)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Left Side 2nd Floor Mitts/Chest", 0x2002d06, 0x01)
		updateDecreaseCountDungeons(
			segment, "FOW_ENTER",
			"@Fortress - Left Side Left Rupees/Rupees",
			{{0x2002d06, 0x20}, {0x2002d06, 0x40}, {0x2002d06, 0x80}, {0x2002d07, 0x01}}
		)
		updateDecreaseCountDungeons(segment, "FOW_ENTER", "@Fortress - Left Side Right Rupees/Rupees", {{0x2002d07, 0x04}, {0x2002d07, 0x08}})
		updateDecreaseCountDungeons(segment, "FOW_ENTER", "@Fortress - Left Side Right Rupees/Rupees Grabbable", {{0x2002d07, 0x02}})
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Left Side 3rd Floor Mitts/Chest", 0x2002d07, 0x20)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Eyegores/Kill", 0x2002d6f, 0x10)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Left Side Key/Drop", 0x2002d73, 0x80)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Two Lever Room Left/Chest", 0x2002d73, 0x20)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Two Lever Room Right/Chest", 0x2002d73, 0x40)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Right Side 2nd Floor Mitts/Chest", 0x2002d06, 0x04)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Right Side 3rd Floor Mitts/Chest", 0x2002d07, 0x40)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Right Side Key/Drop", 0x2002d74, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Right Side Heart Piece/Heart Piece", 0x2002d74, 0x80)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Pedestal/Big Chest", 0x2002d73, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Center Path Switch/Drop", 0x2002d06, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Bombable Wall Big Chest/Big Chest", 0x2002d08, 0x01)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Bombable Wall Chest/Chest", 0x2002d08, 0x02)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Clone Puzzle Key/Drop", 0x2002d71, 0x40)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Minish Dirt Room Key/Drop", 0x2002d08, 0x10)
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Fortress - Right Side Top Moldorm Pot/Drop", 0x2002d06, 0x08)
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Fortress - Right Side Left Moldorm Pot/Drop", 0x2002d06, 0x10)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Skull Room/Big Chest", 0x2002d73, 0x04)
		updateSectionFlagDungeons(segment, "FOW_ENTER", "@Fortress - Mazaal/Heart", 0x2002d72, 0x04)
		--TOD
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/First Ice Block", 0x2002d8e, 0x04)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Locked Ice Block", 0x2002d8d, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Post Madderpillar Chest", 0x2002d92, 0x80)
		updateSectionFlagSpecialCheck(segment, "UNDERWATER_SPOT", "@Droplet/Underwater Pot", 0x2002d93, 0x04)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Overhang Chest", 0x2002d8b, 0x80)
		updateDecreaseCountDungeons(
			segment, "TOD_ENTER",
			"@Droplet/Left Path Rupees",
			{{0x2002d94, 0x20}, {0x2002d94, 0x40}, {0x2002d94, 0x80}, {0x2002d95, 0x01}, {0x2002d95, 0x02}}
		)
		updateDecreaseCountDungeons(segment, "TOD_ENTER", "@Droplet/Right Path Rupees", {{0x2002d95, 0x10}, {0x2002d95, 0x20}, {0x2002d95, 0x40}})
		updateDecreaseCountDungeons(segment, "TOD_ENTER", "@Droplet/Right Path Rupees Grabbable", {{0x2002d95, 0x04}, {0x2002d95, 0x08}})
		updateDecreaseCountDungeons(
			segment, "TOD_ENTER",
			"@Droplet/Upper Water Rupees",
			{{0x2002d96, 0x20}, {0x2002d96, 0x40}, {0x2002d96, 0x80}, {0x2002d97, 0x01}, {0x2002d97, 0x02}, {0x2002d97, 0x04}}
		)
		updateDecreaseCountDungeons(
			segment, "TOD_ENTER",
			"@Droplet/Lower Water Rupees",
			{{0x2002d95, 0x80}, {0x2002d96, 0x01}, {0x2002d96, 0x02}, {0x2002d96, 0x04}, {0x2002d96, 0x08}, {0x2002d96, 0x10}}
		)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Ice Puzzle Free Chest", 0x2002d8f, 0x08)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Ice Puzzle Frozen Chest", 0x2002d8f, 0x04)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Post Ice Puzzle Frozen Chest", 0x2002d93, 0x40)
		updateDecreaseCountDungeons(segment, "TOD_ENTER", "@Droplet/Right Path Ice Walkway Chests", {{0x2002d8b, 0x01}, {0x2002d8b, 0x04}})
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Droplet/Right Path Ice Walkway Pot", 0x2002d8b, 0x02)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Basement Frozen Chest", 0x2002d8d, 0x10)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Blue Chu", 0x2002d8c, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Post Blue Chu Frozen Chest", 0x2002d92, 0x40)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Dark Maze Bottom/Chest", 0x2002d8f, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Dark Maze Top Right", 0x2002d8f, 0x20)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Dark Maze Top Left", 0x2002d8f, 0x40)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Dark Maze Bomb Wall", 0x2002d91, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet/Octo", 0x2002d8c, 0x01)

		-- MAP TOD
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - First Ice Block/Ice Block", 0x2002d8e, 0x04)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Key Locked Ice Block/Ice Block", 0x2002d8d, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Post Madderpillar/Chest", 0x2002d92, 0x80)
		updateSectionFlagSpecialCheck(segment, "UNDERWATER_SPOT", "@Droplet - Underwater Pot/Drop", 0x2002d93, 0x04)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Overhang/Chest", 0x2002d8b, 0x80)
		updateDecreaseCountDungeons(
			segment, "TOD_ENTER",
			"@Droplet - Left Path/Rupees",
			{{0x2002d94, 0x20}, {0x2002d94, 0x40}, {0x2002d94, 0x80}, {0x2002d95, 0x01}, {0x2002d95, 0x02}}
		)
		updateDecreaseCountDungeons(
			segment, "TOD_ENTER",
			"@Droplet - Right Path/Rupees",
			{{0x2002d95, 0x10}, {0x2002d95, 0x20}, {0x2002d95, 0x40}}
		)
		updateDecreaseCountDungeons(segment, "TOD_ENTER", "@Droplet - Right Path/Rupees Grabbable", {{0x2002d95, 0x04}, {0x2002d95, 0x08}})
		updateDecreaseCountDungeons(
			segment, "TOD_ENTER",
			"@Droplet - Upper Underwater/Rupees",
			{{0x2002d96, 0x20}, {0x2002d96, 0x40}, {0x2002d96, 0x80}, {0x2002d97, 0x01}, {0x2002d97, 0x02}, {0x2002d97, 0x04}}
		)
		updateDecreaseCountDungeons(
			segment, "TOD_ENTER",
			"@Droplet - Lower Underwater/Rupees",
			{{0x2002d95, 0x80}, {0x2002d96, 0x01}, {0x2002d96, 0x02}, {0x2002d96, 0x04}, {0x2002d96, 0x08}, {0x2002d96, 0x10}}
		)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Ice Puzzle/Chest", 0x2002d8f, 0x08)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Ice Puzzle Frozen/Chest", 0x2002d8f, 0x04)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Post Ice Puzzle/Chest", 0x2002d93, 0x40)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Right Path Ice Walkway First/Chest", 0x2002d8b, 0x01)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Right Path Ice Walkway Second/Chest", 0x2002d8b, 0x04)
		updateSectionFlagSpecialCheck(segment, "POT_SPOT", "@Droplet - Right Path Ice Walkway Pot/Drop", 0x2002d8b, 0x02)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Basement Frozen/Chest", 0x2002d8d, 0x10)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Blue Chu/Kill", 0x2002d8c, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Post Blue Chu Frozen/Chest", 0x2002d92, 0x40)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Dark Maze Bottom/Chest", 0x2002d8f, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Dark Maze Bombable Wall/Chest", 0x2002d91, 0x80)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Dark Maze Top Right/Chest", 0x2002d8f, 0x20)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Dark Maze Top Left/Chest", 0x2002d8f, 0x40)
		updateSectionFlagDungeons(segment, "TOD_ENTER", "@Droplet - Octo/Heart", 0x2002d8c, 0x01)
		--POW

		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Firebar Grate", 0x2002daa, 0x40)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Wizzrobe Platform Fight", 0x2002daa, 0x10)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Pot Puzzle Key", 0x2002da7, 0x02)
		updateDecreaseCountDungeons(
			segment, "POW_ENTER",
			"@Palace/Rupees",
			{{0x2002da7, 0x04}, {0x2002da7, 0x08}, {0x2002da7, 0x10}, {0x2002da7, 0x20}, {0x2002da7, 0x40}}
		)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Moblin Archer Chest", 0x2002da4, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Flail Soldiers", 0x2002da4, 0x02)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Spark Chest", 0x2002da3, 0x40)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Pre Big Key Door Big Chest", 0x2002da2, 0x10)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Roller Chest", 0x2002da9, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Dark Room Big", 0x2002dab, 0x02)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Dark Room Small", 0x2002dab, 0x04)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Fire Wizzrobe Fight", 0x2002da6, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Twin Wizzrobe Fight", 0x2002da9, 0x40)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Heart Piece", 0x2002dac, 0x01)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Switch Chest", 0x2002da5, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Bombarossa Maze", 0x2002da2, 0x20)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Block Maze Room", 0x2002da5, 0x02)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Block Maze Detour", 0x2002da2, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace/Gyorg", 0x2002dab, 0x20)

		-- MAP POW
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Firebar Grate/Chest", 0x2002daa, 0x40)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Wizzrobe Platform Fight/Kill", 0x2002daa, 0x10)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Pot Puzzle Key/Drop", 0x2002da7, 0x02)
		updateDecreaseCountDungeons(
			segment, "POW_ENTER",
			"@Palace - Rupees/Rupees",
			{{0x2002da7, 0x04}, {0x2002da7, 0x08}, {0x2002da7, 0x10}, {0x2002da7, 0x20}, {0x2002da7, 0x40}}
		)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Moblin Archer Chest/Chest", 0x2002da4, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Flail Soldiers/Drop", 0x2002da4, 0x02)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Spark/Chest", 0x2002da3, 0x40)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Pre Big Key Door/Big Chest", 0x2002da2, 0x10)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Roller/Chest", 0x2002da9, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Dark Room Big Chest/Big Chest", 0x2002dab, 0x02)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Dark Room Chest/Chest", 0x2002dab, 0x04)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Firerobe Fight/Kill", 0x2002da6, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Twin Wizzrobe Fight/Kill", 0x2002da9, 0x40)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Heart Piece/Heart Piece", 0x2002dac, 0x01)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Switch/Chest", 0x2002da5, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Bombarossa Maze/Chest", 0x2002da2, 0x20)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Block Maze Room/Chest", 0x2002da5, 0x02)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Block Maze Room Detour/Chest", 0x2002da2, 0x80)
		updateSectionFlagDungeons(segment, "POW_ENTER", "@Palace - Gyorg/Heart", 0x2002dab, 0x20)
		--DHC
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Win", 0x2002ca6, 0x20)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Blade Chest", 0x2002dc0, 0x20)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Platform Chest", 0x2002dc1, 0x08)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Stone King", 0x2002dc2, 0x02)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Post Throne Big Chest", 0x2002dbf, 0x80)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Northeast Tower", 0x2002dbb, 0x80)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Southeast Tower", 0x2002dbc, 0x02)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Southwest Tower", 0x2002dbc, 0x01)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Northwest Tower", 0x2002dbb, 0x40)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Big Block Chest", 0x2002dbc, 0x08)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@DHC/Vaati", 0x2002ca6, 0x20)

		-- MAP DHC
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Pull the Pedestal/Win", 0x2002ca6, 0x20)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Blade/Chest", 0x2002dc0, 0x20)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Platform/Big Chest", 0x2002dc1, 0x08)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Stone King/Gift", 0x2002dc2, 0x02)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Post Throne/Big Chest", 0x2002dbf, 0x80)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Northeast Tower/Chest", 0x2002dbb, 0x80)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Southeast Tower/Chest", 0x2002dbc, 0x02)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Southwest Tower/Chest", 0x2002dbc, 0x01)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Northwest Tower/Chest", 0x2002dbb, 0x40)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Big Block/Big Chest", 0x2002dbc, 0x08)
		updateSectionFlagDungeons(segment, "DHC_ENTER", "@Dark Hyrule Castle - Vaati/Kill", 0x2002ca6, 0x20)
		SEED_START=1
	end
end

function updateKeys(segment)
	if not isInGame() then
		return false
	end

	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		updateBigKeys(segment, "dws_bigkey")
		updateToggleFlagSpec(segment, "DWS_ENTER", "dws_map", 0x2002ead, 0x01)
		updateToggleFlagSpec(segment, "DWS_ENTER", "dws_compass", 0x2002ead, 0x02)
		updateWarps(segment, "DWS_ENTER")
		updateSmallKeys(segment, "dws_smallkey", 0x2002e9d)
		updateBigKeys(segment, "cof_bigkey")
		updateToggleFlagSpec(segment, "COF_ENTER", "cof_map", 0x2002eae, 0x01)
		updateToggleFlagSpec(segment, "COF_ENTER", "cof_compass", 0x2002eae, 0x02)
		updateWarps(segment, "COF_ENTER")
		updateSmallKeys(segment, "cof_smallkey", 0x2002e9e)
		updateBigKeys(segment, "fow_bigkey")
		updateToggleFlagSpec(segment, "FOW_ENTER", "fow_map", 0x2002eaf, 0x01)
		updateToggleFlagSpec(segment, "FOW_ENTER", "fow_compass", 0x2002eaf, 0x02)
		updateWarps(segment, "FOW_WARPS")
		updateSmallKeys(segment, "fow_smallkey", 0x2002e9f)
		updateBigKeys(segment, "tod_bigkey")
		updateToggleFlagSpec(segment, "TOD_ENTER", "tod_map", 0x2002eb0, 0x01)
		updateToggleFlagSpec(segment, "TOD_ENTER", "tod_compass", 0x2002eb0, 0x02)
		updateWarps(segment, "TOD_ENTER")
		updateSmallKeys(segment, "tod_smallkey", 0x2002ea0)
		updateBigKeys(segment, "pow_bigkey")
		updateToggleFlagSpec(segment, "POW_ENTER", "pow_map", 0x2002eb1, 0x01)
		updateToggleFlagSpec(segment, "POW_ENTER", "pow_compass", 0x2002eb1, 0x02)
		updateWarps(segment, "POW_ENTER")
		updateSmallKeys(segment, "pow_smallkey", 0x2002ea1)
		updateBigKeys(segment, "dhc_bigkey")
		updateToggleFlagSpec(segment, "DHC_ENTER", "dhc_map", 0x2002eb2, 0x01)
		updateToggleFlagSpec(segment, "DHC_ENTER", "dhc_compass", 0x2002eb2, 0x02)
		updateWarps(segment, "DHC_WARPS")
		updateSmallKeys(segment, "dhc_smallkey", 0x2002ea2)
		updateSmallKeys(segment, "rc_smallkey", 0x2002ea3)
	end
	if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		-- Town
		updateSectionFlag(segment, "@Town - Carlov/Gift", 0x2002ea5, 0x02)
		updateSectionFlag(segment, "@Town - Eastern Shops/Rem", 0x2002ea4, 0x08)
		updateSectionFlag(segment, "@Town - Julietta's House/Item", 0x2002ea4, 0x10)
		updateSectionFlag(segment, "@Town - Dr. Left's House/Item", 0x2002ea4, 0x20)
		updateSectionFlag(segment, "@Town - Swiftblade's Dojo/Spin Attack", 0x2002ea5, 0x10)
		updateSectionFlag(segment, "@Town - Swiftblade's Dojo/Rock Breaker", 0x2002ea5, 0x20)
		updateSectionFlag(segment, "@Town - Swiftblade's Dojo/Dash Attack", 0x2002ea5, 0x40)
		updateSectionFlag(segment, "@Town - Swiftblade's Dojo/Down Thrust", 0x2002ea5, 0x80)
		updateSectionFlag(segment, "@Town - Stockwell's Shop/Wallet Spot (80 Rupees)", 0x2002ea7, 0x01)
		updateSectionFlag(segment, "@Town - Stockwell's Shop/Boomerang Spot (300 Rupees)", 0x2002ea7, 0x02)
		updateSectionFlag(segment, "@Town - Stockwell's Shop/Quiver Spot (600 Rupees)", 0x2002ea7, 0x04)
		-- Minishwoods
		updateSectionFlag(segment, "@Minish Woods North - Syrup's Hut/Item (60 Rupees)", 0x2002ea4, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Belari/Gift 1st Item", 0x2002ea5, 0x01)
		-- Hylia
		updateSectionFlag(segment, "@Hylia - Lake Cabin/Item", 0x2002ea4, 0x40)
		updateSectionFlag(segment, "@Hylia - Dojo/Waveblade", 0x2002ea6, 0x04)
		-- Crenel
		updateSectionFlag(segment, "@Crenel - Mines/Melari", 0x2002ea4, 0x80)
		updateSectionFlag(segment, "@Crenel - Business Scrub/Scrub", 0x2002ea5, 0x04)
		updateSectionFlag(segment, "@Crenel - Dojo/Grayblade", 0x2002ea6, 0x01)
		-- Castle
		updateSectionFlag(segment, "@Castle - Dojo/Grimblade", 0x2002ea6, 0x02)
		-- Castor Wilds
		updateSectionFlag(segment, "@Castor Wilds - Dojo/Swiftblade", 0x2002ea6, 0x08)
		updateSectionFlag(segment, "@Castor Wilds - Dojo Waterfall/Scarblade", 0x2002ea6, 0x10)
		updateSectionFlag(segment, "@Castor Wilds - Joy Butterfly/Joy Butterfly", 0x2002ea7, 0x10)
		-- Veil Falls South
		updateSectionFlag(segment, "@Veil Falls South - Dojo Waterfall/Splitblade", 0x2002ea6, 0x20)
		-- North Field
		updateSectionFlag(segment, "@North Field - Dojo Waterfall/Greatblade", 0x2002ea6, 0x40)
		-- Wind Ruins
		updateSectionFlag(segment, "@Wind Ruins - Joy Butterfly/Joy Butterfly", 0x2002ea7, 0x08)
		-- Royal Valley
		updateSectionFlag(segment, "@Royal Valley - Joy Butterfly/Joy Butterfly", 0x2002ea7, 0x20)
		-- DHC
		updateSectionFlag(segment, "@DHC/Pedestal Two Elements", 0x2002ea7, 0x80)
		updateSectionFlag(segment, "@DHC/Pedestal Three Elements", 0x2002ea8, 0x01)
		updateSectionFlag(segment, "@DHC/Pedestal Four Elements", 0x2002ea8, 0x02)

		-- MAP DHC
		updateSectionFlag(segment, "@Dark Hyrule Castle - Pedestal Items/Two Elements", 0x2002ea7, 0x80)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Pedestal Items/Three Elements", 0x2002ea8, 0x01)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Pedestal Items/Four Elements", 0x2002ea8, 0x02)
	end
end
function crest(segment)
	if not isInGame() then
		return false
	end
	InvalidateReadCaches()
	updateToggleFlagSettings(segment, "OCARINA", "crenelwindcrest_no", 0x2002a83, 0x01)
	updateToggleFlagSettings(segment, "OCARINA", "fallswindcrest_no", 0x2002a83, 0x02)
	updateToggleFlagSettings(segment, "OCARINA", "cloudwindcrest_no", 0x2002a83, 0x04)
--	updateToggleFlagSettings(segment, "OCARINA", "townwindcrest_no", 0x2002a83, 0x08) - no used
	updateToggleFlagSettings(segment, "OCARINA", "lakewindcrest_no", 0x2002a83, 0x10)
	updateToggleFlagSettings(segment, "OCARINA", "swampwindcrest_no", 0x2002a83, 0x20)
	updateToggleFlagSettings(segment, "OCARINA", "shfwindcrest_no", 0x2002a83, 0x30)
	updateToggleFlagSettings(segment, "OCARINA", "minishwindcrest_no", 0x2002a83, 0x40)
end
function UpdateWallLocation(segment)
	if AUTOTRACKER_ENABLE_FUSER_TRACKING then
		 --eenie
		updateWall(segment, "fusions29", 0x2002c40)
		 --Trilby
		updateWall(segment, "fusions25", 0x2002c67)
		 --Hills
		updateWall(segment, "fusions2b", 0x2002c68)
		 --Crenel
		updateWall(segment, "fusions2f", 0x2002c69)
		 --Minishwoods
		updateWall(segment, "fusions26", 0x2002c6a)
		 --hylia
		updateWall(segment, "fusions2a", 0x2002c6b)
		if has("fusionblue_vanilla") then
			updateWallUsedFixed("blueL", segment, {{0x2002c40}, {0x2002c67}, {0x2002c68}, {0x2002c69}, {0x2002c6a}, {0x2002c6b}})
		end
	end
end

function UPDATE(code)
	--items_codes_autotracking_cache
	print(string.format("[MAP][INFO] code - %s", code))
	if items_codes_autotracking_cache[code] then
		if items_codes_autotracking_cache[code]["COUNT"] then
			for k, v in pairs(items_codes_autotracking_cache[code]["COUNT"]) do
				
				print(string.format("[MAP][INFO] k - %s", k))
				print(string.format("[MAP][INFO] v - %s", v))
				local item = Tracker:FindObjectForCode(k)
				item.AcquiredCount = v
			end
		end
		if items_codes_autotracking_cache[code]["ACTIVE"] then
			for k, v in pairs(items_codes_autotracking_cache[code]["ACTIVE"]) do
				print(string.format("[MAP][INFO] k - %s", k))
				print(string.format("[MAP][INFO] v - %s", v))
				local item = Tracker:FindObjectForCode(k)
				item.Active = v
			end
		end
		if items_codes_autotracking_cache[code]["SETTING"] then
			for k, v in pairs(items_codes_autotracking_cache[code]["SETTING"]) do
				print(string.format("[MAP][INFO] k - %s", k))
				print(string.format("[MAP][INFO] v - %s", v))
				local item = Tracker:FindObjectForCode(k)
				item.CurrentStage = v
			end
		end
		if items_codes_autotracking_cache[code]["LOC_ACTIVE"] then
			for k, v in pairs(items_codes_autotracking_cache[code]["LOC_ACTIVE"]) do
				print(string.format("[MAP][INFO] k - %s", k))
				print(string.format("[MAP][INFO] v - %s", v))
				local location = Tracker:FindObjectForCode(k)
				location.AvailableChestCount = v
			end
		end
	end
end
function area(segment)
	if not isInGame() then
		return false
	end
	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		if ReadU8(segment, 0x03000BF4) then
			local hex1 = ReadU8(segment, 0x03000BF4)
			local hex1 = string.upper(string.format('%02x',hex1))
			local hex2 = ReadU8(segment, 0x03000BF5)
			local hex2 = string.upper(string.format('%02x',hex2))
			print(string.format("[MAP][INFO] hex2 - %s", hex2))
			local hex = hex2..hex1
			AUTOTRACKING_dungeons=hex
			print(string.format("[MAP][INFO] hex - %s", hex))
			--local hex = string.upper(string.format('%04x',hex))
			--local hex = string.upper(string.format('%04s',hex))
			print(string.format("[MAP][INFO] hex - %s", hex))
			print(string.format("[MAP][INFO] ROOM_FLAG_MAPPING_SPEC[%s][1] - %s", hex,ROOM_FLAG_MAPPING_SPEC[hex][1]))
			for _, flag_room in pairs(ROOM_FLAG_MAPPING_SPEC[hex][1]) do
				print(string.format("[MAP][INFO] flag_room - %s", flag_room))
				if ( flag_room == "POT_SPOT" ) then
					code_type_cache["POT_SPOT"]  = 1
					UPDATE(flag_room)
				elseif ( flag_room == "UNDERWATER_SPOT" ) then
					local item = Tracker:FindObjectForCode("flippers")
					if item.Active then					
						code_type_cache["UNDERWATER_SPOT"]  = 1
						UPDATE(flag_room)
					end
				elseif ( flag_room == "DIG_SPOT" ) then
					local item = Tracker:FindObjectForCode("mitts")
					if item.Active then
						code_type_cache["DIG_SPOT"]  = 1
						UPDATE(flag_room)
					end
				elseif ( flag_room == "DWS_ENTER" ) then
					code_type_cache["DWS_ENTER"] = 1
					AUTOTRACKING_dungeons="dws_none"
					UPDATE(flag_room)
				elseif ( flag_room == "COF_ENTER" ) then
					code_type_cache["COF_ENTER"] = 1
					AUTOTRACKING_dungeons="cof_none"
					UPDATE(flag_room)
				elseif ( flag_room == "FOW_ENTER" ) then
					code_type_cache["FOW_ENTER"] = 1
					AUTOTRACKING_dungeons="fow_none"
					UPDATE(flag_room)
				elseif ( flag_room == "FOW_WARPS" ) then
					code_type_cache["FOW_WARPS"] = 1
					UPDATE(flag_room)
				elseif ( flag_room == "TOD_ENTER" ) then
					code_type_cache["TOD_ENTER"] = 1
					AUTOTRACKING_dungeons="tod_none"
					UPDATE(flag_room)
				elseif ( flag_room == "POW_ENTER" ) then
					code_type_cache["POW_ENTER"] = 1
					AUTOTRACKING_dungeons="pow_none"
					UPDATE(flag_room)
				elseif ( flag_room == "RC_ENTER" ) then
					code_type_cache["RC_ENTER"] = 1
					AUTOTRACKING_dungeons="crypt_none"
					UPDATE(flag_room)
				elseif ( flag_room == "DHC_WARPS" ) then
					code_type_cache["DHC_WARPS"] = 1
					UPDATE(flag_room)
				elseif ( flag_room == "DHC_ENTER" ) then
					code_type_cache["DHC_ENTER"] = 1
					AUTOTRACKING_dungeons="dhc_none"
					UPDATE(flag_room)
				elseif ( flag_room == "DHC_ENTRANCE" ) then
					AUTOTRACKING_dungeons="dhc_none"
				end
				if code_type_cache["ENTRANCE_IN_DWS"] == 1 and AUTOTRACKING_dungeons~=hex then
					local item = Tracker:FindObjectForCode(AUTOTRACKING_dungeons)
					item.CurrentStage = 1
				elseif AUTOTRACKING_dungeons~=AUTOTRACKING_dungeons_last then
					code_type_cache["ENTRANCE_IN_DWS"] = 0
				end
				if code_type_cache["ENTRANCE_IN_COF"] == 1 and AUTOTRACKING_dungeons~=hex then
					local item = Tracker:FindObjectForCode(AUTOTRACKING_dungeons)
					item.CurrentStage = 2
				elseif AUTOTRACKING_dungeons~=AUTOTRACKING_dungeons_last then
					code_type_cache["ENTRANCE_IN_COF"] = 0
				end
				if code_type_cache["ENTRANCE_IN_FOW"] == 1 and AUTOTRACKING_dungeons~=hex then
					local item = Tracker:FindObjectForCode(AUTOTRACKING_dungeons)
					item.CurrentStage = 3
				elseif AUTOTRACKING_dungeons~=AUTOTRACKING_dungeons_last then
					code_type_cache["ENTRANCE_IN_FOW"] = 0
				end
				if code_type_cache["ENTRANCE_IN_RC"] == 1 and AUTOTRACKING_dungeons~=hex then
					local item = Tracker:FindObjectForCode(AUTOTRACKING_dungeons)
					item.CurrentStage = 5
				elseif AUTOTRACKING_dungeons~=AUTOTRACKING_dungeons_last then
					code_type_cache["ENTRANCE_IN_RC"] = 0
				end
				if code_type_cache["ENTRANCE_IN_TOD"] == 1 and AUTOTRACKING_dungeons~=hex then
					local item = Tracker:FindObjectForCode(AUTOTRACKING_dungeons)
					item.CurrentStage = 4
				elseif AUTOTRACKING_dungeons~=AUTOTRACKING_dungeons_last then
					code_type_cache["ENTRANCE_IN_TOD"] = 0
				end
				if code_type_cache["ENTRANCE_IN_POW"] == 1 and AUTOTRACKING_dungeons~=hex then
					local item = Tracker:FindObjectForCode(AUTOTRACKING_dungeons)
					item.CurrentStage = 6
				elseif AUTOTRACKING_dungeons~=AUTOTRACKING_dungeons_last then
					code_type_cache["ENTRANCE_IN_POW"] = 0
				end
				if code_type_cache["ENTRANCE_IN_DHC"] == 1 and AUTOTRACKING_dungeons~=hex then
					local item = Tracker:FindObjectForCode(AUTOTRACKING_dungeons)
					item.CurrentStage = 7
				elseif AUTOTRACKING_dungeons~=AUTOTRACKING_dungeons_last then
					code_type_cache["ENTRANCE_IN_DHC"] = 0
				end
				if flag_room == "ENTRANCE_IN_DWS" then
					code_type_cache["ENTRANCE_IN_DWS"] = 1
				end
				if flag_room == "ENTRANCE_IN_COF" then
					code_type_cache["ENTRANCE_IN_COF"] = 1
				end
				if flag_room == "ENTRANCE_IN_FOW" then
					code_type_cache["ENTRANCE_IN_FOW"] = 1
				end
				if flag_room == "ENTRANCE_IN_RC" then
					code_type_cache["ENTRANCE_IN_RC"] = 1
				end
				if flag_room == "ENTRANCE_IN_TOD" then
					code_type_cache["ENTRANCE_IN_TOD"] = 1
				end
				if flag_room == "ENTRANCE_IN_POW" then
					code_type_cache["ENTRANCE_IN_POW"] = 1
				end
				if flag_room == "ENTRANCE_IN_DHC" then
					code_type_cache["ENTRANCE_IN_DHC"] = 1
				end
			end
		end
		AUTOTRACKING_dungeons_last=hex
		print(string.format("[MAP][INFO] AUTOTRACKING_dungeons  - %s", AUTOTRACKING_dungeons))
		print(string.format("[MAP][INFO] code_type_cache[\"ENTRANCE_IN_DWS\"]  - %s", code_type_cache["ENTRANCE_IN_DWS"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"ENTRANCE_IN_COF\"]  - %s", code_type_cache["ENTRANCE_IN_COF"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"ENTRANCE_IN_FOW\"]  - %s", code_type_cache["ENTRANCE_IN_FOW"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"ENTRANCE_IN_RC\"]  - %s", code_type_cache["ENTRANCE_IN_RC"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"ENTRANCE_IN_TOD\"]  - %s", code_type_cache["ENTRANCE_IN_TOD"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"ENTRANCE_IN_POW\"]  - %s", code_type_cache["ENTRANCE_IN_POW"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"ENTRANCE_IN_DHC\"]  - %s", code_type_cache["ENTRANCE_IN_DHC"] ))

		print(string.format("[MAP][INFO] code_type_cache[\"POT_SPOT\"]  - %s", code_type_cache["POT_SPOT"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"UNDERWATER_SPOT\"]  - %s", code_type_cache["UNDERWATER_SPOT"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"DIG_SPOT\"]  - %s", code_type_cache["DIG_SPOT"] ))
		print(string.format("[MAP][INFO] code_type_cache[\"DWS_ENTER\"] - %s", code_type_cache["DWS_ENTER"]))
		print(string.format("[MAP][INFO] code_type_cache[\"COF_ENTER\"] - %s", code_type_cache["COF_ENTER"]))
		print(string.format("[MAP][INFO] code_type_cache[\"FOW_ENTER\"] - %s", code_type_cache["FOW_ENTER"]))
		print(string.format("[MAP][INFO] code_type_cache[\"FOW_WARPS\"] - %s", code_type_cache["FOW_WARPS"]))
		print(string.format("[MAP][INFO] code_type_cache[\"TOD_ENTER\"] - %s", code_type_cache["TOD_ENTER"]))
		print(string.format("[MAP][INFO] code_type_cache[\"POW_ENTER\"] - %s", code_type_cache["POW_ENTER"]))
		print(string.format("[MAP][INFO] code_type_cache[\"RC_ENTER\"] - %s", code_type_cache["RC_ENTER"]))
		print(string.format("[MAP][INFO] code_type_cache[\"DHC_ENTER\"] - %s", code_type_cache["DHC_ENTER"]))
		print(string.format("[MAP][INFO] code_type_cache[\"OCARINA\"] - %s", code_type_cache["OCARINA"]))
	end
end
ScriptHost:AddMemoryWatch("Wall fusions", 0x2002c40, 0x2c, UpdateWallLocation)
ScriptHost:AddMemoryWatch("TMC Locations and Bosses", 0x2002c81, 0x200, updateLocations)
ScriptHost:AddMemoryWatch("TMC Item Data", 0x2002b30, 0x46, updateItemsFromMemorySegment)
ScriptHost:AddMemoryWatch("TMC Item Upgrades", 0x2002ae4, 0x0c, updateGearFromMemory)
ScriptHost:AddMemoryWatch("Graveyard Key", 0x2002ac0, 0x01, graveKey)
ScriptHost:AddMemoryWatch("TMC Keys", 0x2002d00, 0x200, updateKeys)
ScriptHost:AddMemoryWatch("TMC figurine", 0x2002af0, 0x01, figurine)
ScriptHost:AddMemoryWatch("TMC CREST", 0x2002a83, 0x01, crest)
ScriptHost:AddMemoryWatch("area", 0x03000BF4, 0x02, area,1)
--10CF
