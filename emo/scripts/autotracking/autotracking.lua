items_codes_autotracking={}

function autotracker_started()
	print("Started Tracking")
	UD_KEY_COUNT = 0
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
		else
			item.Active = false
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
	if fusionbluecombined:getActive() then
		blueL:setActive(fusion_count_used["blueL"] + fusion_count["blueL"] + fusion_count_wall["blueL"]+fusion_count_used["blueS"] + fusion_count["blueS"] + fusion_count_wall["blueS"])
	else
		blueL:setActive(fusion_count_used["blueL"] + fusion_count["blueL"] + fusion_count_wall["blueL"])
	end	if TMC_AUTOTRACKER_DEBUG_ITEM then
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
			if fusionbluecombined:getActive() then
				count_fusion = fusion_count["blueL"] + fusion_count_used["blueL"] + fusion_count_wall["blueL"] + fusion_count["blueS"] + fusion_count_used["blueS"] + fusion_count_wall["blueS"]
			else
				count_fusion = fusion_count[code] + fusion_count_used[code] + fusion_count_wall[code]
			end
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
		item.CurrentStage = ReadU8(segment, address) / 8 - 1
	end
end
function updateBigKeys(segment, code)
	local item = Tracker:FindObjectForCode("big_key_none")
	local item2 = Tracker:FindObjectForCode("require_reward_no")
	if code == "ud_bigkey" and item.CurrentStage == 3 then
		updateToggleFlag(segment, "ud_bigkey", 0x2002eac, 0x04)
	elseif code == "dws_bigkey" and item.CurrentStage < 3 then
		if testFlag(segment, 0x2002D45, 0x02) then
			updateToggleFlag(segment, "dws_bigkey", 0x2002D45, 0x02)
		else
			updateToggleFlag(segment, "dws_bigkey", 0x2002ead, 0x04)
		end
	elseif code == "cof_bigkey"  and item.CurrentStage < 3 then
		if testFlag(segment, 0x2002D5A, 0x40) then
			updateToggleFlag(segment, "cof_bigkey", 0x2002D5A, 0x40)
		else
			updateToggleFlag(segment, "cof_bigkey", 0x2002eae, 0x04)
		end
	elseif code == "fow_bigkey"  and item.CurrentStage< 3 then
		if testFlag(segment, 0x2002D70, 0x40) then
			updateToggleFlag(segment, "fow_bigkey", 0x2002D70, 0x40)
		else
			updateToggleFlag(segment, "fow_bigkey", 0x2002eaf, 0x04)
		end
	elseif code == "tod_bigkey" and item.CurrentStage < 3  then
		if testFlag(segment, 0x2002D89, 0x10) then
			updateToggleFlag(segment, "tod_bigkey", 0x2002D89, 0x10)
		else
			updateToggleFlag(segment, "tod_bigkey", 0x2002eb0, 0x04)
		end
	elseif code == "pow_bigkey" and item.CurrentStage < 3  then
		if testFlag(segment, 0x2002DA2, 0x40) then
			updateToggleFlag(segment, "pow_bigkey", 0x2002DA2, 0x40)
		elseif testFlag(segment, 0x2002DA4, 0x04) then
			updateToggleFlag(segment, "pow_bigkey", 0x2002DA4, 0x04)
		else
			updateToggleFlag(segment, "pow_bigkey", 0x2002eb1, 0x04)
		end
	elseif code == "dhc_bigkey" and (item.CurrentStage < 3 or  item2.CurrentStage == 1)  then
		if testFlag(segment, 0x2002DBE, 0x20) then
			updateToggleFlag(segment, "dhc_bigkey", 0x2002DBE, 0x20)
		else
			updateToggleFlag(segment, "dhc_bigkey", 0x2002eb2, 0x04)
		end
	end
end

function updateSmallKeys(segment, code, address)
	local item2 = Tracker:FindObjectForCode("small_key_none")
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
		if item2.CurrentStage < 3 then
			item.AcquiredCount = DWS_KEY_COUNT + DWS_KEY_USED
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
		if item2.CurrentStage < 3 then
			item.AcquiredCount = COF_KEY_COUNT + COF_KEY_USED
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
		if item2.CurrentStage < 3 then
			item.AcquiredCount = FOW_KEY_COUNT + FOW_KEY_USED
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
		if item2.CurrentStage < 3 then
			item.AcquiredCount = TOD_KEY_COUNT + TOD_KEY_USED
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
		if item2.CurrentStage < 3 then
			item.AcquiredCount = POW_KEY_COUNT + POW_KEY_USED
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
		if item2.CurrentStage < 3 then
			item.AcquiredCount = DHC_KEY_COUNT + DHC_KEY_USED
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
		if item2.CurrentStage < 3 then
			item.AcquiredCount = RC_KEY_COUNT + RC_KEY_USED
		end
	elseif code == "ud_smallkey" and item2.CurrentStage == 3 then	
		UD_KEY_COUNT = ReadU8(segment, address)
		item.AcquiredCount = UD_KEY_COUNT + RC_KEY_USED + DHC_KEY_USED + POW_KEY_USED + TOD_KEY_USED + FOW_KEY_USED + COF_KEY_USED + DWS_KEY_USED
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
		updateSectionFlagSpecial("@Town - Cuccos/Lv 1", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 1", 1)
	end
	if count >= 2 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 2", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 2", 1)
	end
	if count >= 3 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 3", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 3", 1)
	end
	if count >= 4 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 4", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 4", 1)
	end
	if count >= 5 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 5", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 5", 1)
	end
	if count >= 6 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 6", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 6", 1)
	end
	if count >= 7 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 7", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 7", 1)
	end
	if count >= 8 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 8", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 8", 1)
	end
	if count >= 9 then
		updateSectionFlagSpecial("@Town - Cuccos/Lv 9", 0)
	else
		updateSectionFlagSpecial("@Town - Cuccos/Lv 9", 1)
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
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Left", left)
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Middle", center)
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Right", right)
	elseif count > 0 then
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Left", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Middle", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Right", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Left", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Middle", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/1 Right", 1)
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
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Left", left)
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Middle", center)
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Right", right)
	elseif count > 1 then
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Left", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Middle", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Right", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Left", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Middle", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/2 Right", 1)
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
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Left", left)
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Middle", center)
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Right", right)
	elseif count > 2 then
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Left", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Middle", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Right", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Left", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Middle", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/3 Right", 1)
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
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Left", left)
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Middle", center)
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Right", right)
	elseif count > 3 then
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Left", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Middle", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Right", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Left", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Middle", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/4 Right", 1)
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
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Left", left)
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Middle", center)
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Right", right)
	elseif count > 4 then
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Left", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Middle", 0)
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Right", 0)
	else
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Left", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Middle", 1)
		updateSectionFlagSpecial("@Town - Goron Merchant/5 Right", 1)
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
		updateToggleFlag(segment, "ocarina", 0x2002b37, 0x40)
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
		updateSectionFlag(segment, "@Hylia - Dog/Gift", 0x2002b3f, 0x20)
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
		updateToggleFlag(segment, "dws", 0x2002c9c, 0x04)

		updateToggleFlag(segment, "cof", 0x2002c9c, 0x08)
		updateToggleFlag(segment, "fow", 0x2002c9c, 0x10)
		updateToggleFlag(segment, "tod", 0x2002c9c, 0x20)
		updateToggleFlag(segment, "pow", 0x2002c9c, 0x40)
		updateToggleFlag(segment, "rc", 0x2002d02, 0x04)
		updateToggleFlag(segment, "dhc", 0x2002ca6, 0x20)
		updateSectionFlag(segment, "@DeepWoods/Green Chu", 0x2002c9c, 0x04)
		updateSectionFlag(segment, "@Cave Of Flame/Gleerok", 0x2002c9c, 0x08)
		updateSectionFlag(segment, "@Fortress/Reward", 0x2002c9c, 0x10)
		updateSectionFlag(segment, "@Droplet/Octo", 0x2002c9c, 0x20)
		updateSectionFlag(segment, "@Palace/Gyorg", 0x2002c9c, 0x40)
		updateSectionFlag(segment, "@Crypt/Reward", 0x2002d02, 0x04)
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
			updateSectionFlag(segment, "@Ruins - Golden Octo/Kill", 0x2002ca2, 0x02)
			updateSectionFlag(segment, "@Crenel - Vine Top Golden Tektite/Kill", 0x2002ca2, 0x04)
			updateSectionFlag(segment, "@Swamp - Golden Rope/Kill", 0x2002ca2, 0x08)
			updateSectionFlag(segment, "@Hills - Golden Rope/Kill", 0x2002ca2, 0x10)
			updateSectionFlag(segment, "@Castle - Golden Rope/Kill", 0x2002ca2, 0x20)
			updateSectionFlag(segment, "@Falls - Golden Tektite/Kill", 0x2002ca2, 0x40)
			updateSectionFlag(segment, "@Crenel - Below CoF Golden Tektite/Kill", 0x2002ca2, 0x80)
			updateSectionFlag(segment, "@Minish Woods - Golden Octo/Kill", 0x2002ca3, 0x01)
			updateSectionFlag(segment, "@Western Woods - Golden Octo/Kill", 0x2002ca3, 0x02)
		-- end
		--FUSIONS
		updateSectionFlag(segment, "@Clouds - Top Right Fusion/Fusion", 0x2002c81, 0x02)
		updateSectionFlag(segment, "@Clouds - Bottom Left Fusion/Fusion", 0x2002c81, 0x04)
		updateSectionFlag(segment, "@Clouds - Top Left Fusion/Fusion", 0x2002c81, 0x08)
		updateSectionFlag(segment, "@Clouds - Central Fusion/Fusion", 0x2002c81, 0x10)
		updateSectionFlag(segment, "@Clouds - Bottom Right Fusion/Fusion", 0x2002c81, 0x20)
		updateDecreaseCount(
			segment,
			"@Swamp - Fusions/Fusions",
			{{0x2002c81, 0x40}, {0x2002c81, 0x80}, {0x2002c82, 0x01}}
		)
		updateSectionFlag(segment, "@Falls - Kinstone Door Open/Fusion", 0x2002c82, 0x02)
		--CRENEL
		updateSectionFlag(segment, "@Crenel - Climb Fusion/Chest", 0x2002cd4, 0x01)
		updateSectionFlag(segment, "@Crenel - Great Fairy/Gift", 0x2002cf0, 0x01)
		updateSectionFlag(segment, "@Crenel - Mines Path Fusion/Chest", 0x2002d11, 0x08)
		updateDecreaseCount(
			segment,
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
		updateSectionFlag(segment, "@Crenel - Dig Cave/HP", 0x2002d04, 0x20)
		updateSectionFlag(segment, "@Crenel - Beanstalk Fusion/HP", 0x2002d0c, 0x08)
		updateDecreaseCount(
			segment,
			"@Crenel - Beanstalk Fusion/Items",
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
		updateSectionFlag(segment, "@Crenel - Rain Path Fusion/Chest", 0x2002d10, 0x40)
		updateDecreaseCount(segment, "@Crenel - Dojo/Chests", {{0x2002d1c, 0x02}, {0x2002d1c, 0x04}})
		updateSectionFlag(segment, "@Crenel - Dojo/HP", 0x2002d2c, 0x01)
		updateSectionFlag(segment, "@Crenel - Bridge Cave/Chest", 0x2002d23, 0x80)
		updateSectionFlag(segment, "@Crenel - Fairy Cave/HP", 0x2002d2b, 0x20)
		updateSectionFlag(segment, "@Crenel - Upper Block/Chest", 0x2002d23, 0x20)

		-- MAP MINES
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf4, 0x01)
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf3, 0x02)
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf3, 0x80)
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf3, 0x40)
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf3, 0x20)
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf3, 0x10)
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf3, 0x04)
		updateSectionFlag(segment, "@Crenel - Melari Mines - Center/Digging", 0x2002cf3, 0x08)

		--CRENEL BASE
		updateSectionFlag(segment, "@Crenel Base - Entrance Vine/Item", 0x2002cc5, 0x02)
		updateSectionFlag(segment, "@Crenel Base - West Fusion/Chest", 0x2002cd4, 0x02)
		updateSectionFlag(segment, "@Crenel Base - Minish Crack/Chest", 0x2002cde, 0x02)
		updateSectionFlag(segment, "@Crenel Base - Green Water Fusion/Chest", 0x2002d10, 0x80)
		updateSectionFlag(segment, "@Crenel Base - Water Cave/HP", 0x2002d24, 0x01)
		updateDecreaseCount(segment, "@Crenel Base - Water Cave/Chests", {{0x2002d24, 0x02}, {0x2002d24, 0x04}})
		updateDecreaseCount(segment, "@Crenel Base - Fairy Cave/Items", {{0x2002d24, 0x08}, {0x2002d24, 0x10}, {0x2002d24, 0x20}})
		updateSectionFlag(segment, "@Crenel Base - Minish Vine Hole/Chest", 0x2002d28, 0x01)

		--CASTOR WILDS
		updateSectionFlag(segment, "@Swamp - Center/Chest", 0x2002cbd, 0x10)
		updateSectionFlag(segment, "@Swamp - Underwater/Top", 0x2002cc0, 0x04)
		updateSectionFlag(segment, "@Swamp - Underwater/Top", 0x2002cc0, 0x08)
		updateSectionFlag(segment, "@Swamp - Underwater/Top", 0x2002cc0, 0x10)
		updateSectionFlag(segment, "@Swamp - Minish Mulldozer/Big Chest", 0x2002cde, 0x01)
		updateSectionFlag(segment, "@Swamp - Minish Fusion North Crack/Chest", 0x2002cde, 0x08)
		updateSectionFlag(segment, "@Swamp - Minish Fusion West Crack/Chest", 0x2002cde, 0x10)
		updateSectionFlag(segment, "@Swamp - Minish Fusion Vine Crack/Chest", 0x2002cde, 0x20)
		updateSectionFlag(segment, "@Swamp - Minish Mulldozer/Left Chest", 0x2002cf0, 0x20)
		updateDecreaseCount(segment, "@Swamp - Digging Cave/Chests", {{0x2002d04, 0x01}, {0x2002d04, 0x02}})
		updateSectionFlag(segment, "@Swamp - South Cave/Chest", 0x2002d22, 0x10)
		updateSectionFlag(segment, "@Swamp - North Cave/Chest", 0x2002d22, 0x40)
		updateSectionFlag(segment, "@Swamp - Near Waterfall Cave/HP", 0x2002d23, 0x01)
		updateSectionFlag(segment, "@Swamp - Center Cave Darknut/Chest", 0x2002d23, 0x04)
		updateSectionFlag(segment, "@Swamp - Dojo/HP", 0x2002d2b, 0x80)
		updateSectionFlag(segment, "@Swamp - Minish Fusion Water Hole/HP", 0x2002d2c, 0x10)
		updateSectionFlag(segment, "@Swamp - Minish Fusion Water Hole/Chest", 0x2002d2c, 0x20)

		--WIND RUINS
		updateDecreaseCount(segment, "@Ruins - Armos Kill/Chests", {{0x2002cc2, 0x08}, {0x2002cc2, 0x10}})
		updateSectionFlag(segment, "@Ruins - Near Dungeon Fusion/Chest", 0x2002cd2, 0x10)
		updateSectionFlag(segment, "@Ruins - Pillars Fusion/Chest", 0x2002cd4, 0x04)
		updateSectionFlag(segment, "@Ruins - Minish Home/Chest", 0x2002cde, 0x04)
		updateSectionFlag(segment, "@Ruins - Minish Crack/Chest", 0x2002cf0, 0x10)
		updateSectionFlag(segment, "@Ruins - Beanstalk Fusion/Big Chest", 0x2002d0c, 0x80)
		updateSectionFlag(segment, "@Ruins - Bomb Cave/Chest", 0x2002d22, 0x80)
		updateSectionFlag(segment, "@Ruins - Minish Cave/HP", 0x2002d2b, 0x40)

		--VALLEY
		updateSectionFlag(segment, "@Valley - Lost Woods/Chest (Left Left Left Up Up Up)", 0x2002cc7, 0x04)
		updateSectionFlag(segment, "@Valley Graveyard - Left Fusion/Chest", 0x2002cd3, 0x04)
		updateSectionFlag(segment, "@Valley Graveyard - Left Grave/HP", 0x2002d27, 0x20)
		updateSectionFlag(segment, "@Valley Graveyard - Right Fusion/Chest", 0x2002cd3, 0x08)
		updateSectionFlag(segment, "@Valley Graveyard - Right Grave Fusion/Chest", 0x2002d27, 0x40)
		updateSectionFlag(segment, "@Valley - Dampe/Gift", 0x2002ce9, 0x02)
		updateSectionFlag(segment, "@Valley - Great Fairy/Gift", 0x2002cef, 0x40)
		updateSectionFlag(segment, "@Valley - Pre Valley Fusion/Chest", 0x2002cd3, 0x20)

		--Crypt
		updateSectionFlag(segment, "@Crypt/Reward", 0x2002d02, 0x04)
		updateSectionFlag(segment, "@Crypt/Left - Item", 0x2002d12, 0x40)
		updateSectionFlag(segment, "@Crypt/Right - Item", 0x2002d12, 0x80)
		updateSectionFlag(segment, "@Crypt/Gibdo Left - Item", 0x2002d14, 0x10)
		updateSectionFlag(segment, "@Crypt/Gibdo Right - Item", 0x2002d14, 0x20)

		--Crypt map
		updateSectionFlag(segment, "@Crypt - Reward/Gift", 0x2002d02, 0x04)
		updateSectionFlag(segment, "@Crypt - Left/Item", 0x2002d12, 0x40)
		updateSectionFlag(segment, "@Crypt - Right/Item", 0x2002d12, 0x80)
		updateSectionFlag(segment, "@Crypt - Gibdo Left/Item", 0x2002d14, 0x10)
		updateSectionFlag(segment, "@Crypt - Gibdo Right/Item", 0x2002d14, 0x20)

		--TRILBY
		updateSectionFlag(segment, "@Trilby - Scrub/Item", 0x2002ca7, 0x04)
		updateSectionFlag(segment, "@Trilby - Top Fusion/Chest", 0x2002cd2, 0x40)
		updateSectionFlag(segment, "@Trilby - Middle Fusion/Chest", 0x2002cd3, 0x10)
		updateDecreaseCount(segment, "@Trilby - Dig Cave/Chests", {{0x2002d04, 0x80}, {0x2002d05, 0x02}})
		updateSectionFlag(segment, "@Trilby - Dig Cave Water Fusion/Chest", 0x2002d05, 0x01)
		updateSectionFlag(segment, "@Trilby - Bomb Cave/Chest", 0x2002d1d, 0x20)
		updateDecreaseCount(
			segment,
			"@Trilby - Puddle Fusion/Item",
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
			"@Western Woods - Top/Digging",
			{{0x2002cce, 0x08}, {0x2002cce, 0x10}, {0x2002cce, 0x20}, {0x2002cce, 0x40}, {0x2002cce, 0x80}, {0x2002ccf, 0x01}}
		)
		updateDecreaseCount(
			segment,
			"@Western Woods - Bottom/Digging",
			{{0x2002ccf, 0x02}, {0x2002ccf, 0x04}}
		)
		updateSectionFlag(segment, "@Western Woods - Fusion/Chest", 0x2002ccf, 0x10)
		updateSectionFlag(segment, "@Western Woods - Percy Fusion/Percy", 0x2002ce3, 0x80)
		updateSectionFlag(segment, "@Western Woods - Percy Fusion/Moblin", 0x2002ce4, 0x04)
		updateSectionFlag(segment, "@Western Woods - Tree Fusion/HP", 0x2002cef, 0x01)
		updateSectionFlag(segment, "@Western Woods - Beanstalk Fusion/Chest", 0x2002d0d, 0x08)
		updateDecreaseCount(
			segment,
			"@Western Woods - Beanstalk Fusion/Items",
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
		updateSectionFlag(segment, "@Castle - Moat Left/Chest", 0x2002cbe, 0x04)
		updateSectionFlag(segment, "@Castle - Moat Right/Chest", 0x2002cbe, 0x08)
		updateSectionFlag(segment, "@Castle - Dojo/HP", 0x2002d2c, 0x08)
		updateSectionFlag(segment, "@Castle - Right Fountain/Dry Fountain", 0x2002d0e, 0x10)
		updateSectionFlag(segment, "@Castle - Right Fountain/Fusion Minish Hole - Chest", 0x2002d28, 0x10)
		updateSectionFlag(segment, "@Castle - Left Fountain/Fusion Minish Hole - Chest", 0x2002d28, 0x20)

		--NORTH FIELD
		updateSectionFlag(segment, "@North Field - Dig Spot/Digging", 0x2002ccd, 0x20)
		updateSectionFlag(segment, "@North Field - Tree Fusion Top Left/Chest", 0x2002d1c, 0x10)
		updateSectionFlag(segment, "@North Field - Tree Fusion Top Right/Chest", 0x2002d1c, 0x20)
		updateSectionFlag(segment, "@North Field - Tree Fusion Bottom Left/Chest", 0x2002d1c, 0x40)
		updateSectionFlag(segment, "@North Field - Tree Fusion Bottom Right/Chest", 0x2002d1c, 0x80)
		updateSectionFlag(segment, "@North Field - Tree Fusion Center/Big Chest", 0x2002d1d, 0x01)
		updateSectionFlag(segment, "@North Field - Cave/HP", 0x2002d2b, 0x08)

		--HYRULE TOWN
		updateSectionFlag(segment, "@Town - Simulation/Chest", 0x2002c9c, 0x02)
		updateSectionFlag(segment, "@Town - Cuccos/Lv 10", 0x2002ca5, 0x80)
		UpdateCucco(segment)
		UpdateGoronShop(segment)
		updateSectionFlag(segment, "@Town - Inn Ledge/Chest", 0x2002cd5, 0x01)
		updateSectionFlag(segment, "@Town - School Roof/Chest", 0x2002cd5, 0x02)
		updateSectionFlag(segment, "@Town - School/Basement Top - Chest", 0x2002cfc, 0x40)
		updateSectionFlag(segment, "@Town - Bell/HP", 0x2002cd5, 0x20)
		updateSectionFlag(segment, "@Town - Cafe/Cafe Lady", 0x2002cd6, 0x40)
		updateSectionFlag(segment, "@Town - Inn/Pot", 0x2002ce0, 0x80)
		updateSectionFlag(segment, "@Town - Inn Backdoor/HP", 0x2002cf3, 0x01)
		updateSectionFlag(segment, "@Town - Shop/Behind Counter", 0x2002ce6, 0x08)
		updateSectionFlag(segment, "@Town - Library/Yellow Minish - Gift", 0x2002ceb, 0x01)
		updateSectionFlag(segment, "@Town - Music House/HP", 0x2002cf2, 0x10)
		updateDecreaseCount(
			segment,
			"@Town - Music House/Chest",
			{{0x2002cf2, 0x20}, {0x2002cf2, 0x40}, {0x2002cf2, 0x80}}
		)
		updateSectionFlag(segment, "@Town - Digging/Basement Left - Chest", 0x2002cfc, 0x80)
		updateDecreaseCount(segment, "@Town - Digging/Chests", {{0x2002d04, 0x04}, {0x2002d04, 0x08}, {0x2002d04, 0x10}})
		updateSectionFlag(segment, "@Town - Well Left/Chest", 0x2002cfd, 0x01)
		updateSectionFlag(segment, "@Town - Well/Bottom Chest", 0x2002cfd, 0x02)
		updateSectionFlag(segment, "@Town - Well/Pillar Chest", 0x2002cfd, 0x04)
		updateSectionFlag(segment, "@Town - Fountain/Big Chest", 0x2002cfd, 0x80)
		updateSectionFlag(segment, "@Town - Fountain/Small Chest", 0x2002cfe, 0x01)
		updateSectionFlag(segment, "@Town - Fountain/HP", 0x2002d14, 0x08)
		updateSectionFlag(segment, "@Town - Under Library/Underwater", 0x2002cfe, 0x08)
		updateSectionFlag(segment, "@Town - Under Library/Big Chest", 0x2002cfe, 0x10)
		updateSectionFlag(segment, "@Town - Under Library/Frozen Chest", 0x2002cfe, 0x20)
		updateSectionFlag(segment, "@Town - Shop/Attic Chest", 0x2002d0a, 0x80)
		updateSectionFlag(segment, "@Town - School Path/HP", 0x2002d0b, 0x40)
		updateDecreaseCount(
			segment,
			"@Town - School Path/Chests",
			{{0x2002d0b, 80}, {0x2002d0c, 0x01}, {0x2002d0c, 0x02}}
		)
		updateSectionFlag(segment, "@Town - School Path/Fusion Chest", 0x2002d11, 0x01)
		updateSectionFlag(segment, "@Town - Bakery Attic/Chest", 0x2002d13, 0x20)
		updateSectionFlag(segment, "@Town - Waterfall Fusion/Chest", 0x2002d1d, 0x40)

		--SOUTH FIELD
		updateSectionFlag(segment, "@South Field - Tingle/Gift", 0x2002ca3, 0x04)
		updateSectionFlag(segment, "@South Field - Fusion/Chest", 0x2002cd3, 0x02)
		updateSectionFlag(segment, "@South Field - Smith House/Chests", 0x2002cde, 0x40)
		updateSectionFlag(segment, "@South Field - Tree Fusion/HP", 0x2002cee, 0x80)
		updateDecreaseCount(
			segment,
			"@South Field - Puddle Fusion/Items",
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
		updateSectionFlag(segment, "@South Field - Minish Size Water Hole/HP", 0x2002d2c, 0x02)

		--VEIL FALLS
		updateSectionFlag(segment, "@Falls - Entrance/HP", 0x2002cd0, 0x01)
		updateSectionFlag(segment, "@Falls - Rock/North Dig Spot - Digging", 0x2002cd0, 0x80)
		updateSectionFlag(segment, "@Falls - Rock/Fusion - Chest", 0x2002cd3, 0x80)
		updateSectionFlag(segment, "@Falls - South Dig Spot/Digging", 0x2002cda, 0x80)
		updateSectionFlag(segment, "@Falls - Water Dig Cave Fusion/Chest", 0x2002d05, 0x04)
		updateSectionFlag(segment, "@Falls - Water Dig Cave Fusion/HP", 0x2002d05, 0x20)
		updateSectionFlag(segment, "@Falls - 1st Cave/Chest", 0x2002d25, 0x10)
		updateSectionFlag(segment, "@Falls - Cliff/Chest", 0x2002cd0, 0x02)
		updateSectionFlag(segment, "@Falls - Top Cave/Chest", 0x2002d25, 0x01)
		updateSectionFlag(segment, "@Falls - Top Cave/Bomb Wall - Chest", 0x2002d25, 0x04)
		updateDecreaseCount(
			segment,
			"@Falls - Rupee Cave/Items",
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
			"@Falls - Rupee Cave/Underwater Items",
			{{0x2002d26, 0x40}, {0x2002d26, 0x80}, {0x2002d27, 0x01}, {0x2002d27, 0x02}, {0x2002d27, 0x04}, {0x2002d27, 0x08}}
		)
		updateSectionFlag(segment, "@Falls - Waterfall Fusion/HP", 0x2002d27, 0x10)
		updateSectionFlag(segment, "@Falls - Biggoron/Mirror Shield", 0x2002cd1, 0x10)

		--VEIL FALLS SOUTH
		updateSectionFlag(segment, "@Falls Lower/HP", 0x2002cd1, 0x02)
		updateSectionFlag(segment, "@Falls Lower - Dig Cave/Left Chest", 0x2002d05, 0x08)
		updateSectionFlag(segment, "@Falls Lower - Dig Cave/Left Chest", 0x2002d05, 0x10)
		 --à verifier
		updateSectionFlag(segment, "@Falls Lower - Rock/Item 1", 0x2002cd0, 0x04)
		updateSectionFlag(segment, "@Falls Lower - Rock/Item 1", 0x2002cd0, 0x08)
		updateSectionFlag(segmemt, "@Falls Lower - Rock/Item 1", 0x2002cd0, 0x10)
		updateSectionFlag(segment, "@Falls Lower - Lon Lon - Fusion/Chest", 0x2002cd3, 0x40)

		--LON LON RANCH
		updateSectionFlag(segment, "@Lon Lon - Dig Spot/Digging", 0x2002ccb, 0x20)
		updateSectionFlag(segment, "@Lon Lon - Ranch/Pot", 0x2002ce5, 0x20)
		updateSectionFlag(segment, "@Lon Lon North - Minish Crack/Chest", 0x2002cf2, 0x04)
		updateSectionFlag(segment, "@Lon Lon - Path/Fusion Chest", 0x2002d11, 0x02)
		updateSectionFlag(segment, "@Lon Lon - Path/HP", 0x2002d13, 0x04)
		updateSectionFlag(segment, "@Lon Lon - Cave/Chest", 0x2002d1d, 0x80)
		updateSectionFlag(segment, "@Lon Lon - Cave/Secret Chest (behind bombable wall on the right)", 0x2002d1e, 0x04)
		updateSectionFlag(segment, "@Lon Lon - Puddle Fusion/Big Chest", 0x2002d1e, 0x10)
		updateSectionFlag(segment, "@Lon Lon - Goron Cave Fusion/Big Chest", 0x2002d2a, 0x40)
		updateSectionFlag(segment, "@Lon Lon - Goron Cave Fusion/Small Chest", 0x2002d2a, 0x80)

		--EASTERN HILLS
		updateSectionFlag(segment, "@Hills - Fusion/Chest", 0x2002cd2, 0x04)
		updateSectionFlag(segment, "@Hills - Farm Dig Cave/Item", 0x2002d04, 0x40)
		updateSectionFlag(segment, "@Hills - Beanstalk Fusion/HP", 0x2002d0d, 0x01)
		updateDecreaseCount(segment, "@Hills - Beanstalk Fusion/Chests", {{0x2002d0d, 0x02}, {0x2002d0d, 0x04}})
		updateSectionFlag(segment, "@Hills - Bomb Cave/Chest", 0x2002d22, 0x08)

		--LAKE HYLIA
		updateSectionFlag(segment, "@Hylia - Cape Cave - Lon Lon/HP", 0x2002ccb, 0x10)
		updateSectionFlag(segment, "@Hylia - Small Island/HP", 0x2002cbd, 0x01)
		updateSectionFlag(segment, "@Hylia - Sunken/HP", 0x2002cbd, 0x02)
		updateSectionFlag(segment, "@Hylia - Bottom/HP", 0x2002cbd, 0x04)
		updateSectionFlag(segment, "@Hylia - Crack Fusion Librari/Gift", 0x2002cf2, 0x08)
		updateSectionFlag(segment, "@Hylia - Middle Island Fusion Dig Cave/Chest", 0x2002d02, 0x40)
		updateDecreaseCount(
			segment,
			"@Hylia - Cape Cave/Chest",
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
		updateSectionFlag(segment, "@Hylia - Cape Cave/Beanstalk Fusion - HP", 0x2002d0c, 0x10)
		updateDecreaseCount(segment, "@Hylia - Cape Cave/Beanstalk Fusion - Chests", {{0x2002d0c, 0x20}, {0x2002d0c, 0x40}})
		updateSectionFlag(segment, "@Hylia - Cabin Path Fusion/Chest", 0x2002d11, 0x10)
		updateSectionFlag(segment, "@Hylia North - Minish Hole/Chest", 0x2002d2a, 0x04)
		updateSectionFlag(segment, "@Hylia - Dojo/HP", 0x2002d2c, 0x04)
		updateSectionFlag(segment, "@Hylia South - Minish Hole/Chest", 0x2002d28, 0x04)

		--MINISH WOODS
		updateSectionFlag(segment, "@Minish - Great Fairy/Gift", 0x2002cef, 0x80)
		updateSectionFlag(segment, "@Minish Woods - Post Village Fusion/Chest", 0x2002cdb, 0x08)
		updateSectionFlag(segment, "@Minish Woods - Flipper Hole/Middle Chest", 0x2002d2a, 0x08)
		updateSectionFlag(segment, "@Minish Woods - Flipper Hole/Right Chest", 0x2002d2a, 0x10)
		updateSectionFlag(segment, "@Minish Woods - Flipper Hole/Left Chest", 0x2002d2a, 0x20)
		updateSectionFlag(segment, "@Minish Woods - Flipper Hole/Left HP", 0x2002d2b, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Bomb Minish/Gift 2", 0x2002cf2, 0x01)
		updateSectionFlag(segment, "@Minish Woods - Crack Fusion/Chest", 0x2002cf0, 0x08)
		updateSectionFlag(segment, "@Minish Village/HP", 0x2002cf4, 0x04)
		updateSectionFlag(segment, "@Minish Village/Barrel House - Item", 0x2002cf5, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Minish Path Fusion/Chest", 0x2002d11, 0x04)
		updateSectionFlag(segment, "@Minish Woods - West Fusion/Chest", 0x2002cd3, 0x01)
		updateSectionFlag(segment, "@Minish Woods - Bottom/HP", 0x2002cc3, 0x10)
		updateSectionFlag(segment, "@Minish Woods - East Fusion/Chest", 0x2002cd2, 0x20)
		updateSectionFlag(segment, "@Minish Woods - South Fusion/Chest", 0x2002cd2, 0x80)
		updateDecreaseCount(segment, "@Minish Woods - Like Like Digging Cave/Chests", {{0x2002d02, 0x10}, {0x2002d02, 0x20}})
		updateSectionFlag(segment, "@Minish Woods - Top/HP", 0x2002cc3, 0x08)
		updateSectionFlag(segment, "@Minish Woods North - Fusion/Chest", 0x2002cd2, 0x08)
		updateSectionFlag(segment, "@Witch - Digging Cave/Chest", 0x2002d02, 0x08)

		--CLOUD TOPS
		updateSectionFlag(segment, "@Clouds - North West Bottom/Chest", 0x2002cd7, 0x20)
		updateDecreaseCount(segment, "@Clouds - North West Top/Chests", {{0x2002cd7, 0x40}, {0x2002cd7, 0x80}})
		updateSectionFlag(segment, "@Clouds - North West Top/Dig Spot", 0x2002cd8, 0x04)
		updateSectionFlag(segment, "@Clouds - North Shark/Kill", 0x2002cda, 0x02)
		updateSectionFlag(segment, "@Clouds - Kill Piranhas (South)/Kill", 0x2002cda, 0x08)
		updateSectionFlag(segment, "@Clouds - South Left/Chest", 0x2002cd8, 0x01)
		updateSectionFlag(segment, "@Clouds - Southeast South Digging Spot/Digging", 0x2002cd9, 0x01)
		updateSectionFlag(segment, "@Clouds - Southeast North Digging Spot/Digging", 0x2002cd8, 0x20)
		updateSectionFlag(segment, "@Clouds - South Digging Spot/Digging", 0x2002cd8, 0x80)
		updateSectionFlag(segment, "@Clouds - Center Right/Chest", 0x2002cd8, 0x02)
		updateSectionFlag(segment, "@Clouds - Center Digging Spot/Digging", 0x2002cd8, 0x10)
		updateSectionFlag(segment, "@Clouds - Center Left/Chest", 0x2002cd7, 0x10)
		updateSectionFlag(segment, "@Clouds - Free/Chest", 0x2002cd7, 0x08)
		updateSectionFlag(segment, "@Clouds - North East/Dig Spot", 0x2002cd8, 0x08)
		updateSectionFlag(segment, "@Clouds - Bottom Left Digging Spot/Digging", 0x2002cd8, 0x40)

		--Wind Tribe
		updateDecreaseCount(segment, "@Wind Tribe/1F - Chests", {{0x2002cdc, 0x20}, {0x2002cdc, 0x40}})
		updateSectionFlag(segment, "@Wind Tribe/2F - Chest", 0x2002cdc, 0x80)
		updateDecreaseCount(segment, "@Wind Tribe/3F - Chests", {{0x2002cdd, 0x01}, {0x2002cdd, 0x02}, {0x2002cdd, 0x04}})
		updateDecreaseCount(segment, "@Wind Tribe/4F - Chests", {{0x2002cdd, 0x40}, {0x2002cdd, 0x80}})
		updateSectionFlag(segment, "@Wind Tribe/2F - Gregal Gift 1", 0x2002ce8, 0x20)
		updateSectionFlag(segment, "@Wind Tribe/2F - Gregal Gift 2", 0x2002ce8, 0x40)

		--DWS
		updateSectionFlag(segment, "@DeepWoods/1F - Slug Room - Chest", 0x2002d43, 0x20)
		updateSectionFlag(segment, "@DeepWoods/2F - Chest", 0x2002d45, 0x04)
		updateSectionFlag(segment, "@DeepWoods/1F - Barrel Room - Chest", 0x2002d41, 0x08)
		updateSectionFlag(segment, "@DeepWoods/1F - West - Big Chest", 0x2002d41, 0x02)
		updateSectionFlag(segment, "@DeepWoods/1F - West Statue Puzzle - Chest", 0x2002d40, 0x80)
		updateSectionFlag(segment, "@DeepWoods/1F - East Mulldozer Fight - Item", 0x2002d42, 0x01)
		updateSectionFlag(segment, "@DeepWoods/1F - North East - Chest", 0x2002d40, 0x10)
		updateSectionFlag(segment, "@DeepWoods/B1 - Switch Room - Big Chest", 0x2002d44, 0x04)
		updateSectionFlag(segment, "@DeepWoods/B1 - Switch Room - Chest", 0x2002d44, 0x02)
		updateSectionFlag(segment, "@DeepWoods/1F - Blue Warp - HP", 0x2002d45, 0x80)
		updateDecreaseCount(segment, "@DeepWoods/1F - Blue Warp - Chests", {{0x2002d40, 0x04}, {0x2002d40, 0x08}})
		updateSectionFlag(segment, "@DeepWoods/1F - Madderpillar - Big Chest", 0x2002d3f, 0x08)
		updateSectionFlag(segment, "@DeepWoods/1F - Madderpillar - HP", 0x2002d46, 0x04)
		updateSectionFlag(segment, "@DeepWoods/B1 - West - Big Chest", 0x2002d43, 0x80)
		updateSectionFlag(segment, "@DeepWoods/Green Chu", 0x2002d44, 0x80)

		-- MAP DWS
		updateSectionFlag(segment, "@Deepwoods - 1F - Slug Room/Chest", 0x2002d43, 0x20)
		updateSectionFlag(segment, "@Deepwoods - 2F/Chest", 0x2002d45, 0x04)
		updateSectionFlag(segment, "@Deepwoods - 1F - Barrel Room/Chest", 0x2002d41, 0x08)
		updateSectionFlag(segment, "@Deepwoods - 1F - West/Big Chest", 0x2002d41, 0x02)
		updateSectionFlag(segment, "@Deepwoods - 1F - West Statue Puzzle/Chest", 0x2002d40, 0x80)
		updateSectionFlag(segment, "@Deepwoods - 1F - East Mulldozer Fight/Item", 0x2002d42, 0x01)
		updateSectionFlag(segment, "@Deepwoods - 1F - North East/Chest", 0x2002d40, 0x10)
		updateSectionFlag(segment, "@Deepwoods - B1 - Switch Room Big Chest/Big Chest", 0x2002d44, 0x04)
		updateSectionFlag(segment, "@Deepwoods - B1 - Switch Room Chest/Chest", 0x2002d44, 0x02)
		updateSectionFlag(segment, "@Deepwoods - 1F - Blue Warp/HP", 0x2002d45, 0x80)
		updateDecreaseCount(segment, "@Deepwoods - 1F - Blue Warp Chests/Chests", {{0x2002d40, 0x04}, {0x2002d40, 0x08}})
		updateSectionFlag(segment, "@Deepwoods - 1F - Madderpillar Big Chest/Big Chest", 0x2002d3f, 0x08)
		updateSectionFlag(segment, "@Deepwoods - 1F - Madderpillar/HP", 0x2002d46, 0x04)
		updateSectionFlag(segment, "@Deepwoods - B1 - West/Big Chest", 0x2002d43, 0x80)
		updateSectionFlag(segment, "@Deepwoods - Green Chu/Heart", 0x2002d44, 0x80)

		--COF
		updateSectionFlag(segment, "@Cave Of Flame/1F - Spike Beetle - Big Chest", 0x2002d5a, 0x04)
		updateDecreaseCount(
			segment,
			"@Cave Of Flame/1F - Items",
			{{0x2002d5b, 0x40}, {0x2002d5b, 0x80}, {0x2002d5c, 0x01}, {0x2002d5c, 0x02}, {0x2002d5c, 0x04}}
		)
		updateDecreaseCount(segment, "@Cave Of Flame/B1 - Hazy Room - Big Chest", {{0x2002d59, 0x02}, {0x2002d59, 0x04}})
		updateSectionFlag(segment, "@Cave Of Flame/B1 - Rollobite - Chest", 0x2002d58, 0x80)
		updateSectionFlag(segment, "@Cave Of Flame/B1 - Rollobite - Chest", 0x2002d58, 0x40)
		updateSectionFlag(segment, "@Cave Of Flame/B1 - HP", 0x2002d5b, 0x10)
		updateSectionFlag(segment, "@Cave Of Flame/B1 - Spikey Chus - Big Chest", 0x2002d57, 0x02)
		updateSectionFlag(segment, "@Cave Of Flame/B1 - Spikey Chus - Pillar Chest", 0x2002d57, 0x01)
		updateDecreaseCount(segment, "@Cave Of Flame/B2 - Pre Lava - Chests", {{0x2002d59, 0x10}, {0x2002d59, 0x20}})
		updateSectionFlag(segment, "@Cave Of Flame/B2 - Lava Room Blade - Chest", 0x2002d5a, 0x01)
		updateDecreaseCount(segment, "@Cave Of Flame/B2 - Lava Room - Chests", {{0x2002d5a, 0x80}, {0x2002d5b, 0x01}})
		updateSectionFlag(segment, "@Cave Of Flame/B2 - Lava Room - Big Chest", 0x2002d5b, 0x02)
		updateSectionFlag(segment, "@Cave Of Flame/Gleerok", 0x2002d5b, 0x04)

		-- MAP COF
		updateSectionFlag(segment, "@Cave Of Flame - 1F - Spike Beetle/Big Chest", 0x2002d5a, 0x04)
		updateDecreaseCount(
			segment,
			"@Cave Of Flame - 1F/Items",
			{{0x2002d5b, 0x40}, {0x2002d5b, 0x80}, {0x2002d5c, 0x01}, {0x2002d5c, 0x02}, {0x2002d5c, 0x04}}
		)
		updateSectionFlag(segment, "@Cave Of Flame - B1 - Hazy Room - Big Chest/Big Chest", 0x2002d59, 0x04)
		updateSectionFlag(segment, "@Cave Of Flame - B1 - Hazy Room - Big Chest/Big Chest", 0x2002d59, 0x02)
		updateSectionFlag(segment, "@Cave Of Flame - B1 - Rollobite/Chest", 0x2002d58, 0x40)
		updateSectionFlag(segment, "@Cave Of Flame - B1 - Rollobite/Chest", 0x2002d58, 0x80)
		updateSectionFlag(segment, "@Cave Of Flame - B1/HP", 0x2002d5b, 0x10)
		updateSectionFlag(segment, "@Cave Of Flame - B1 - Spikey Chus Pillar/Chest", 0x2002d57, 0x02)
		updateSectionFlag(segment, "@Cave Of Flame - B1 - Spikey Chus/Big Chest", 0x2002d57, 0x01)
		updateSectionFlag(segment, "@Cave Of Flame - B2 - Pre Lava North/Chest", 0x2002d59, 0x10)
		updateSectionFlag(segment, "@Cave Of Flame - B2 - Pre Lava North/Chest", 0x2002d59, 0x20)
		updateSectionFlag(segment, "@Cave Of Flame - B2 - Lava Room Blade/Chest", 0x2002d5a, 0x01)
		updateSectionFlag(segment, "@Cave Of Flame - B2 - Lava Room Left/Chest", 0x2002d5a, 0x80)
		updateSectionFlag(segment, "@Cave Of Flame - B2 - Lava Room Left/Chest", 0x2002d5b, 0x01)
		updateSectionFlag(segment, "@Cave Of Flame - B2 - Lava Room/Big Chest", 0x2002d5b, 0x02)
		updateSectionFlag(segment, "@Cave Of Flame - Gleerok/Heart", 0x2002d5b, 0x04)

		--FOW
		updateSectionFlag(segment, "@Fortress/Entrance 1F - Left - Chest", 0x2002d05, 0x80)
		updateSectionFlag(segment, "@Fortress/Entrance 1F - Left Wizzrobe - Chest", 0x2002d74, 0x08)
		updateSectionFlag(segment, "@Fortress/Entrance 1F - Right - Item", 0x2002d05, 0x40)
		updateDecreaseCount(segment, "@Fortress/Left 2F - Dig - Chest", {{0x2002d06, 0x01}, {0x2002d07, 0x20}})
		updateDecreaseCount(
			segment,
			"@Fortress/Left 2F - Items",
			{{0x2002d06, 0x20}, {0x2002d06, 0x40}, {0x2002d06, 0x80}, {0x2002d07, 0x01}, {0x2002d07, 0x04}, {0x2002d07, 0x08}}
		)
		updateDecreaseCount(segment, "@Fortress/Left 2F - Item Grabbable", {{0x2002d07, 0x02}})
		updateSectionFlag(segment, "@Fortress/Left 3F - Eyegore - Big Chest", 0x2002d6f, 0x10)
		updateSectionFlag(segment, "@Fortress/Left 3F - Item Drop", 0x2002d73, 0x80)
		updateDecreaseCount(segment, "@Fortress/Right 2F - Chests", {{0x2002d73, 0x20}})
		updateDecreaseCount(segment, "@Fortress/Left 3F - Switch - Chests", {{0x2002d73, 0x40}})
		updateDecreaseCount(segment, "@Fortress/Right 2F - Dig - Chest", {{0x2002d06, 0x04}, {0x2002d07, 0x40}})
		updateSectionFlag(segment, "@Fortress/Right 3F - Item Drop", 0x2002d74, 0x02)
		updateSectionFlag(segment, "@Fortress/Entrance 1F - Right - HP", 0x2002d74, 0x80)
		updateSectionFlag(segment, "@Fortress/Middle 2F - Big Chest", 0x2002d73, 0x02)
		updateSectionFlag(segment, "@Fortress/Middle 2F - Statue - Chest", 0x2002d06, 0x02)
		updateSectionFlag(segment, "@Fortress/Back 2F - Left - Big Chest", 0x2002d08, 0x01)
		updateSectionFlag(segment, "@Fortress/Back 2F - Left - Small Chest", 0x2002d08, 0x02)
		updateSectionFlag(segment, "@Fortress/Back 2F - Right Statue - Item Drop", 0x2002d71, 0x40)
		updateSectionFlag(segment, "@Fortress/Back 2F - Right Minish - Item Drop", 0x2002d08, 0x10)
		updateSectionFlag(segment, "@Fortress/Back 2F - Right Dig Room Top - Pot", 0x2002d06, 0x08)
		updateSectionFlag(segment, "@Fortress/Back 2F - Right Dig Room Bottom - Pot", 0x2002d06, 0x10)
		updateSectionFlag(segment, "@Fortress/Back 2F - Right - Big Chest", 0x2002d73, 0x04)
		updateSectionFlag(segment, "@Fortress/Mazaal", 0x2002d72, 0x04)
		updateSectionFlag(segment, "@Fortress/Reward", 0x2002d74, 0x20)

		-- MAP FOW
		updateSectionFlag(segment, "@Fortress - Entrance 1F - Left/Chest", 0x2002d05, 0x80)
		updateSectionFlag(segment, "@Fortress - Entrance 1F - Right/Rupee", 0x2002d05, 0x40)
		updateSectionFlag(segment, "@Fortress - Entrance 1F - Left Wizzrobe/Kill", 0x2002d74, 0x08)
		updateSectionFlag(segment, "@Fortress - Left 2F - Dig/Chest", 0x2002d06, 0x01)
		updateDecreaseCount(
			segment,
			"@Fortress - Left 2F - Items/Rupees",
			{{0x2002d06, 0x20}, {0x2002d06, 0x40}, {0x2002d06, 0x80}, {0x2002d07, 0x01}}
		)
		updateDecreaseCount(segment, "@Fortress - Left 2F - Item Grabbable/Rupees", {{0x2002d07, 0x04}, {0x2002d07, 0x08}})
		updateDecreaseCount(segment, "@Fortress - Left 2F - Item Grabbable/Rupees Grabbable", {{0x2002d07, 0x02}})
		updateSectionFlag(segment, "@Fortress - Left 3F - Switch/Chest", 0x2002d07, 0x20)
		updateSectionFlag(segment, "@Fortress - Left 3F - Eyegore/Kill", 0x2002d6f, 0x10)
		updateSectionFlag(segment, "@Fortress - Left 3F - Item Drop/Drop", 0x2002d73, 0x80)
		updateSectionFlag(segment, "@Fortress - Right 2F/Chest", 0x2002d73, 0x20)
		updateSectionFlag(segment, "@Fortress - Right 2F - Right/Chest", 0x2002d73, 0x40)
		updateSectionFlag(segment, "@Fortress - Right 2F - Dig/Chest", 0x2002d06, 0x04)
		updateSectionFlag(segment, "@Fortress - Right 3F - Dig/Chest", 0x2002d07, 0x40)
		updateSectionFlag(segment, "@Fortress - Right 3F - Item Drop/Drop", 0x2002d74, 0x02)
		updateSectionFlag(segment, "@Fortress - Entrance 1F - Right HP/Heart Piece", 0x2002d74, 0x80)
		updateSectionFlag(segment, "@Fortress - Middle 2F/Big Chest", 0x2002d73, 0x02)
		updateSectionFlag(segment, "@Fortress - Middle 2F - Statue/Drop", 0x2002d06, 0x02)
		updateSectionFlag(segment, "@Fortress - Back 2F - Left Big Chest/Big Chest", 0x2002d08, 0x01)
		updateSectionFlag(segment, "@Fortress - Back 2F - Left Small Chest/Chest", 0x2002d08, 0x02)
		updateSectionFlag(segment, "@Fortress - Back 2F - Right Statue/Drop", 0x2002d71, 0x40)
		updateSectionFlag(segment, "@Fortress - Back 2F - Right Minish/Drop", 0x2002d08, 0x10)
		updateSectionFlag(segment, "@Fortress - Back 2F - Right Dig Room Top/Drop", 0x2002d06, 0x08)
		updateSectionFlag(segment, "@Fortress - Back 2F - Right Dig Room Bottom/Drop", 0x2002d06, 0x10)
		updateSectionFlag(segment, "@Fortress - Back 2F - Right/Big Chest", 0x2002d73, 0x04)
		updateSectionFlag(segment, "@Fortress - Mazaal/Heart", 0x2002d72, 0x04)

		--TOD
		updateSectionFlag(segment, "@Droplet/Entrance B2 - East - Iceblock", 0x2002d8e, 0x04)
		updateSectionFlag(segment, "@Droplet/Entrance B2 - West - Iceblock", 0x2002d8d, 0x80)
		updateSectionFlag(segment, "@Droplet/Left Path B2 - Ice Madderpillar - Big Chest", 0x2002d92, 0x80)
		updateSectionFlag(segment, "@Droplet/Left Path B2 - Underwater - Pot", 0x2002d93, 0x04)
		updateSectionFlag(segment, "@Droplet/Left Path B1 - Waterfall - Big Chest", 0x2002d8b, 0x80)
		updateDecreaseCount(
			segment,
			"@Droplet/Left Path B1 - Underpass - Items",
			{{0x2002d94, 0x20}, {0x2002d94, 0x40}, {0x2002d94, 0x80}, {0x2002d95, 0x01}, {0x2002d95, 0x02}}
		)
		updateDecreaseCount(segment, "@Droplet/Right Path B2 - Underpass - Items", {{0x2002d95, 0x10}, {0x2002d95, 0x20}})
		updateDecreaseCount(segment, "@Droplet/Right Path B2 - Underpass - Items Grabbable", {{0x2002d95, 0x04}, {0x2002d95, 0x08}, {0x2002d95, 0x40}})
		updateDecreaseCount(
			segment,
			"@Droplet/Left Path B1 - Waterfall - Underwater",
			{{0x2002d96, 0x20}, {0x2002d96, 0x40}, {0x2002d96, 0x80}, {0x2002d97, 0x01}, {0x2002d97, 0x02}, {0x2002d97, 0x04}}
		)
		updateDecreaseCount(
			segment,
			"@Droplet/Left Path B2 - Waterfall - Underwater",
			{{0x2002d95, 0x80}, {0x2002d96, 0x01}, {0x2002d96, 0x02}, {0x2002d96, 0x04}, {0x2002d96, 0x08}, {0x2002d96, 0x10}}
		)
		updateSectionFlag(segment, "@Droplet/Left Path B2 - Ice Plain - Chest", 0x2002d8f, 0x08)
		updateSectionFlag(segment, "@Droplet/Left Path B2 - Ice Plain - Frozen Chest", 0x2002d8f, 0x04)
		updateSectionFlag(segment, "@Droplet/Left Path B2 - Lilypad Corner - Frozen Chest", 0x2002d93, 0x40)
		updateDecreaseCount(segment, "@Droplet/Right Path B1 - Chests", {{0x2002d8b, 0x01}, {0x2002d8b, 0x04}})
		updateSectionFlag(segment, "@Droplet/Right Path B1 - Pot", 0x2002d8b, 0x02)
		updateSectionFlag(segment, "@Droplet/Right Path B3 - Frozen Chest", 0x2002d8d, 0x10)
		updateSectionFlag(segment, "@Droplet/Right Path B1 - Blu Chu - Big Chest", 0x2002d8c, 0x80)
		updateSectionFlag(segment, "@Droplet/Right Path B2 - Frozen Chest", 0x2002d92, 0x40)
		updateSectionFlag(segment, "@Droplet/Right Path B2 - Dark Maze - Bottom Chest", 0x2002d8f, 0x80)
		updateSectionFlag(segment, "@Droplet/Right Path B2 - Dark Maze - Top Right Chest", 0x2002d8f, 0x20)
		updateSectionFlag(segment, "@Droplet/Right Path B2 - Dark Maze - Top Left Chest", 0x2002d8f, 0x40)
		updateSectionFlag(segment, "@Droplet/Right Path B2 - Mulldozers - Item Drop", 0x2002d91, 0x80)
		updateSectionFlag(segment, "@Droplet/Octo", 0x2002d8c, 0x01)

		-- MAP TOD
		updateSectionFlag(segment, "@Droplet - Entrance B2 - East/Ice Block", 0x2002d8e, 0x04)
		updateSectionFlag(segment, "@Droplet - Entrance B2 - West/Ice Block", 0x2002d8d, 0x80)
		updateSectionFlag(segment, "@Droplet - Left Path B2 - Ice Madderpillar/Chest", 0x2002d92, 0x80)
		updateSectionFlag(segment, "@Droplet - Left Path B2 - Underwater/Drop", 0x2002d93, 0x04)
		updateSectionFlag(segment, "@Droplet - Left Path B1 - Waterfall/Chest", 0x2002d8b, 0x80)
		updateDecreaseCount(
			segment,
			"@Droplet - Left Path B1 - Underpass/Rupees",
			{{0x2002d94, 0x20}, {0x2002d94, 0x40}, {0x2002d94, 0x80}, {0x2002d95, 0x01}, {0x2002d95, 0x02}}
		)
		updateDecreaseCount(
			segment,
			"@Droplet - Right Path B2 - Underpass/Rupees",
			{{0x2002d95, 0x10}, {0x2002d95, 0x20}, {0x2002d95, 0x40}}
		)
		updateDecreaseCount(segment, "@Droplet - Right Path B2 - Underpass/Rupees Grabbable", {{0x2002d95, 0x04}, {0x2002d95, 0x08}})
		updateDecreaseCount(
			segment,
			"@Droplet - Left Path B1 - Waterfall - Underwater/Rupees",
			{{0x2002d96, 0x20}, {0x2002d96, 0x40}, {0x2002d96, 0x80}, {0x2002d97, 0x01}, {0x2002d97, 0x02}, {0x2002d97, 0x04}}
		)
		updateDecreaseCount(
			segment,
			"@Droplet - Left Path B2 - Waterfall - Underwater/Rupees",
			{{0x2002d95, 0x80}, {0x2002d96, 0x01}, {0x2002d96, 0x02}, {0x2002d96, 0x04}, {0x2002d96, 0x08}, {0x2002d96, 0x10}}
		)
		updateSectionFlag(segment, "@Droplet - Left Path B2 - Ice Plain/Chest", 0x2002d8f, 0x08)
		updateSectionFlag(segment, "@Droplet - Left Path B2 - Ice Plain - Frozen/Chest", 0x2002d8f, 0x04)
		updateSectionFlag(segment, "@Droplet - Left Path B2 - Lilypad Corner/Chest", 0x2002d93, 0x40)
		updateSectionFlag(segment, "@Droplet - Right Path B1 - Ice Walkway/Chest", 0x2002d8b, 0x01)
		updateSectionFlag(segment, "@Droplet - Right Path B1 - Ice Walkway Right/Chest", 0x2002d8b, 0x04)
		updateSectionFlag(segment, "@Droplet - Right Path B1 - Pot/Drop", 0x2002d8b, 0x02)
		updateSectionFlag(segment, "@Droplet - Right Path B3 - Frozen/Chest", 0x2002d8d, 0x10)
		updateSectionFlag(segment, "@Droplet - Right Path B1 - Blu Chu/Kill", 0x2002d8c, 0x80)
		updateSectionFlag(segment, "@Droplet - Right Path B2 - Frozen/Chest", 0x2002d92, 0x40)
		updateSectionFlag(segment, "@Droplet - Right Path B2 - Dark Maze - Bottom/Chest", 0x2002d8f, 0x80)
		updateSectionFlag(segment, "@Droplet - Right Path B2 - Mulldozers/Chest", 0x2002d91, 0x80)
		updateSectionFlag(segment, "@Droplet - Right Path B2 - Dark Maze - Top Right/Chest", 0x2002d8f, 0x20)
		updateSectionFlag(segment, "@Droplet - Right Path B2 - Dark Maze - Top Left/Chest", 0x2002d8f, 0x40)
		updateSectionFlag(segment, "@Droplet - Octo/Heart", 0x2002d8c, 0x01)

		--POW

		updateSectionFlag(segment, "@Palace/1st Half 1F - Grate - Chest", 0x2002daa, 0x40)
		updateSectionFlag(segment, "@Palace/1st Half 1F - Wizzrobe - Big Chest", 0x2002daa, 0x10)
		updateSectionFlag(segment, "@Palace/1st Half 3F - Pot Puzzle - Item Drop", 0x2002da7, 0x02)
		updateDecreaseCount(
			segment,
			"@Palace/1st Half 2F - Items",
			{{0x2002da7, 0x04}, {0x2002da7, 0x08}, {0x2002da7, 0x10}, {0x2002da7, 0x20}, {0x2002da7, 0x40}}
		)
		updateSectionFlag(segment, "@Palace/1st Half 4F - Bow Moblins - Chest", 0x2002da4, 0x80)
		updateSectionFlag(segment, "@Palace/1st Half 5F - Ball And Chain Soldiers - Item Drop", 0x2002da4, 0x02)
		updateSectionFlag(segment, "@Palace/1st Half 5F - Fan Loop - Chest", 0x2002da3, 0x40)
		updateSectionFlag(segment, "@Palace/1st Half 5F - Big Chest", 0x2002da2, 0x10)
		updateSectionFlag(segment, "@Palace/2nd Half 2F - Many Rollers - Chest", 0x2002da9, 0x80)
		updateSectionFlag(segment, "@Palace/2nd Half 1F - Dark Room - Big Chest", 0x2002dab, 0x02)
		updateSectionFlag(segment, "@Palace/2nd Half 1F - Dark Room - Small Chest", 0x2002dab, 0x04)
		updateSectionFlag(segment, "@Palace/2nd Half 3F - Fire Wizzrobes - Big Chest", 0x2002da6, 0x80)
		updateSectionFlag(segment, "@Palace/2nd Half 2F - Twin Wizzrobes - Chest", 0x2002da9, 0x40)
		updateSectionFlag(segment, "@Palace/2nd Half 4F - HP", 0x2002dac, 0x01)
		updateSectionFlag(segment, "@Palace/2nd Half 4F - Switch Hit - Chest", 0x2002da5, 0x80)
		updateSectionFlag(segment, "@Palace/2nd Half 5F - Bombarossa - Chest", 0x2002da2, 0x20)
		updateSectionFlag(segment, "@Palace/2nd Half 4F - Block Maze - Chest", 0x2002da5, 0x02)
		updateSectionFlag(segment, "@Palace/2nd Half 5F - Right Side - Chest", 0x2002da2, 0x80)
		updateSectionFlag(segment, "@Palace/Gyorg", 0x2002dab, 0x20)

		-- MAP POW
		updateSectionFlag(segment, "@Palace - 1st Half 1F - Grate/Chest", 0x2002daa, 0x40)
		updateSectionFlag(segment, "@Palace - 1st Half 1F - Wizzrobe/Kill", 0x2002daa, 0x10)
		updateSectionFlag(segment, "@Palace - 1st Half 3F - Pot Puzzle/Drop", 0x2002da7, 0x02)
		updateDecreaseCount(
			segment,
			"@Palace - 1st Half 2F - Items/Rupees",
			{{0x2002da7, 0x04}, {0x2002da7, 0x08}, {0x2002da7, 0x10}, {0x2002da7, 0x20}, {0x2002da7, 0x40}}
		)
		updateSectionFlag(segment, "@Palace - 1st Half 4F - Bow Moblins/Chest", 0x2002da4, 0x80)
		updateSectionFlag(segment, "@Palace - 1st Half 5F - Ball And Chain Soldiers/Drop", 0x2002da4, 0x02)
		updateSectionFlag(segment, "@Palace - 1st Half 5F - Fan Loop/Chest", 0x2002da3, 0x40)
		updateSectionFlag(segment, "@Palace - 1st Half 5F/Big Chest", 0x2002da2, 0x10)
		updateSectionFlag(segment, "@Palace - 2nd Half 2F - Many Rollers/Chest", 0x2002da9, 0x80)
		updateSectionFlag(segment, "@Palace - 2nd Half 1F - Dark Room/Big Chest", 0x2002dab, 0x02)
		updateSectionFlag(segment, "@Palace - 2nd Half 1F - Dark Room - Small/Chest", 0x2002dab, 0x04)
		updateSectionFlag(segment, "@Palace - 2nd Half 3F - Fire Wizzrobes/Kill", 0x2002da6, 0x80)
		updateSectionFlag(segment, "@Palace - 2nd Half 2F - Twin Wizzrobes/Kill", 0x2002da9, 0x40)
		updateSectionFlag(segment, "@Palace - 2nd Half 4F/Heart Piece", 0x2002dac, 0x01)
		updateSectionFlag(segment, "@Palace - 2nd Half 4F - Switch Hit/Chest", 0x2002da5, 0x80)
		updateSectionFlag(segment, "@Palace - 2nd Half 5F - Bombarossa/Chest", 0x2002da2, 0x20)
		updateSectionFlag(segment, "@Palace - 2nd Half 4F - Block Maze/Chest", 0x2002da5, 0x02)
		updateSectionFlag(segment, "@Palace - 2nd Half 5F - Right Side/Chest", 0x2002da2, 0x80)
		updateSectionFlag(segment, "@Palace - Gyorg/Heart", 0x2002dab, 0x20)

		--DHC
		updateSectionFlag(segment, "@DHC/Sanctuary - Win", 0x2002ca6, 0x20)
		updateSectionFlag(segment, "@DHC/1F - Blade - Chest", 0x2002dc0, 0x20)
		updateSectionFlag(segment, "@DHC/B1 - Big Chest", 0x2002dc1, 0x08)
		updateSectionFlag(segment, "@DHC/B2 - King", 0x2002dc2, 0x02)
		updateSectionFlag(segment, "@DHC/1F - Throne - Big Chest", 0x2002dbf, 0x80)
		updateSectionFlag(segment, "@DHC/3F - North East - Chest", 0x2002dbb, 0x80)
		updateSectionFlag(segment, "@DHC/3F - South East - Chest", 0x2002dbc, 0x02)
		updateSectionFlag(segment, "@DHC/3F - South West - Chest", 0x2002dbc, 0x01)
		updateSectionFlag(segment, "@DHC/3F - North West - Chest", 0x2002dbb, 0x40)
		updateSectionFlag(segment, "@DHC/2F - Blue Warp - Big Chest", 0x2002dbc, 0x08)
		updateSectionFlag(segment, "@DHC/2F - Vaati - Kill", 0x2002ca6, 0x20)

		-- MAP DHC
		updateSectionFlag(segment, "@Dark Hyrule Castle - Pull the Pedestal/Win", 0x2002ca6, 0x20)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Blade/Chest", 0x2002dc0, 0x20)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Platform/Big Chest", 0x2002dc1, 0x08)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Stone King/Gift", 0x2002dc2, 0x02)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Post Throne/Big Chest", 0x2002dbf, 0x80)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Northeast Tower/Chest", 0x2002dbb, 0x80)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Southeast Tower/Chest", 0x2002dbc, 0x02)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Southwest Tower/Chest", 0x2002dbc, 0x01)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Northwest Tower/Chest", 0x2002dbb, 0x40)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Big Block/Big Chest", 0x2002dbc, 0x08)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Vaati/Kill", 0x2002ca6, 0x20)
	end
end

function updateKeys(segment)
	if not isInGame() then
		return false
	end

	InvalidateReadCaches()

	if AUTOTRACKER_ENABLE_ITEM_TRACKING then
		-- if has("big_key_shuffle") or has("big_key_vanilla") then
			updateBigKeys(segment, "ud_bigkey")
			updateBigKeys(segment, "dws_bigkey")
			updateBigKeys(segment, "cof_bigkey")
			updateBigKeys(segment, "fow_bigkey")
			updateBigKeys(segment, "tod_bigkey")
			updateBigKeys(segment, "pow_bigkey")
			updateBigKeys(segment, "dhc_bigkey")
		-- end
		updateToggleFlag(segment, "dws_map", 0x2002ead, 0x01)
		updateToggleFlag(segment, "cof_map", 0x2002eae, 0x01)
		updateToggleFlag(segment, "fow_map", 0x2002eaf, 0x01)
		updateToggleFlag(segment, "tod_map", 0x2002eb0, 0x01)
		updateToggleFlag(segment, "pow_map", 0x2002eb1, 0x01)
		updateToggleFlag(segment, "dhc_map", 0x2002eb2, 0x01)

		updateToggleFlag(segment, "dws_compass", 0x2002ead, 0x02)
		updateToggleFlag(segment, "cof_compass", 0x2002eae, 0x02)
		updateToggleFlag(segment, "fow_compass", 0x2002eaf, 0x02)
		updateToggleFlag(segment, "tod_compass", 0x2002eb0, 0x02)
		updateToggleFlag(segment, "pow_compass", 0x2002eb1, 0x02)
		updateToggleFlag(segment, "dhc_compass", 0x2002eb2, 0x02)
		-- if has("small_key_shuffle") or has("small_key_vanilla") then
			updateSmallKeys(segment, "ud_smallkey", 0x2002e9c)
			updateSmallKeys(segment, "dws_smallkey", 0x2002e9d)
			updateSmallKeys(segment, "cof_smallkey", 0x2002e9e)
			updateSmallKeys(segment, "fow_smallkey", 0x2002e9f)
			updateSmallKeys(segment, "tod_smallkey", 0x2002ea0)
			updateSmallKeys(segment, "pow_smallkey", 0x2002ea1)
			updateSmallKeys(segment, "dhc_smallkey", 0x2002ea2)
			updateSmallKeys(segment, "rc_smallkey", 0x2002ea3)
		-- end
	end
	if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
		-- Town
		updateSectionFlag(segment, "@Town - Carlov/Gift", 0x2002ea5, 0x02)
		updateSectionFlag(segment, "@Town - Shoe Shop/Gift", 0x2002ea4, 0x08)
		updateSectionFlag(segment, "@Town - Jullieta/Item", 0x2002ea4, 0x10)
		updateSectionFlag(segment, "@Town - Dr Left Attic/Gift", 0x2002ea4, 0x20)
		updateSectionFlag(segment, "@Town - Dojo/Sword", 0x2002ea5, 0x10)
		updateSectionFlag(segment, "@Town - Dojo/Green Sword", 0x2002ea5, 0x20)
		updateSectionFlag(segment, "@Town - Dojo/Boots + Sword", 0x2002ea5, 0x40)
		updateSectionFlag(segment, "@Town - Dojo/Cape + Sword", 0x2002ea5, 0x80)
		updateSectionFlag(segment, "@Town - Shop/80 Item", 0x2002ea7, 0x01)
		updateSectionFlag(segment, "@Town - Shop/300 Item", 0x2002ea7, 0x02)
		updateSectionFlag(segment, "@Town - Shop/600 Item", 0x2002ea7, 0x04)
		updateSectionFlag(segment, "@Town - Shop/600 Item 2", 0x2002ea8, 0x04)
		-- Minishwoods
		updateSectionFlag(segment, "@Minish Woods - Witch Hut/Item", 0x2002ea4, 0x04)
		updateSectionFlag(segment, "@Minish Woods - Bomb Minish/Gift 1", 0x2002ea5, 0x01)
		-- Hylia
		updateSectionFlag(segment, "@Hylia - Mayor Cabin/Item", 0x2002ea4, 0x40)
		updateSectionFlag(segment, "@Hylia - Dojo/Gift", 0x2002ea6, 0x04)
		-- Crenel
		updateSectionFlag(segment, "@Crenel - Mines/Melari", 0x2002ea4, 0x80)
		updateSectionFlag(segment, "@Crenel - Scrub/Gift", 0x2002ea5, 0x04)
		updateSectionFlag(segment, "@Crenel - Dojo/Gift", 0x2002ea6, 0x01)
		-- Castle
		updateSectionFlag(segment, "@Castle - Dojo/Gift", 0x2002ea6, 0x02)
		-- Castor Wilds
		updateSectionFlag(segment, "@Swamp - Dojo/Gift", 0x2002ea6, 0x08)
		updateSectionFlag(segment, "@Swamp - Waterfall Fusion Dojo/Gift", 0x2002ea6, 0x10)
		updateSectionFlag(segment, "@Swamp - Butterfly Fusion/Item", 0x2002ea7, 0x10)
		-- Veil Falls South
		updateSectionFlag(segment, "@Falls Lower - Waterfall Fusion Dojo/Gift", 0x2002ea6, 0x20)
		-- North Field
		updateSectionFlag(segment, "@North Field - Waterfall Fusion Dojo/Gift", 0x2002ea6, 0x40)
		-- Wind Ruins
		updateSectionFlag(segment, "@Ruins - Butterfly Fusion/Item", 0x2002ea7, 0x08)
		-- Royal Valley
		updateSectionFlag(segment, "@Valley Graveyard - Butterfly Fusion/Item", 0x2002ea7, 0x20)
		-- DHC
		updateSectionFlag(segment, "@DHC/Sanctuary - Pedestal - Item 1", 0x2002ea7, 0x80)
		updateSectionFlag(segment, "@DHC/Sanctuary - Pedestal - Item 2", 0x2002ea8, 0x01)
		updateSectionFlag(segment, "@DHC/Sanctuary - Pedestal - Item 3", 0x2002ea8, 0x02)

		-- MAP DHC
		updateSectionFlag(segment, "@Dark Hyrule Castle - Pedestal Items/Two Elements", 0x2002ea7, 0x80)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Pedestal Items/Three Elements", 0x2002ea8, 0x01)
		updateSectionFlag(segment, "@Dark Hyrule Castle - Pedestal Items/Four Elements", 0x2002ea8, 0x02)
	end
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
ScriptHost:AddMemoryWatch("Wall fusions", 0x2002c40, 0x2c, UpdateWallLocation)
ScriptHost:AddMemoryWatch("TMC Locations and Bosses", 0x2002c81, 0x200, updateLocations)
ScriptHost:AddMemoryWatch("TMC Item Data", 0x2002b30, 0x46, updateItemsFromMemorySegment)
ScriptHost:AddMemoryWatch("TMC Item Upgrades", 0x2002ae4, 0x0c, updateGearFromMemory)
ScriptHost:AddMemoryWatch("Graveyard Key", 0x2002ac0, 0x01, graveKey)
ScriptHost:AddMemoryWatch("TMC Keys", 0x2002d00, 0x200, updateKeys)
ScriptHost:AddMemoryWatch("TMC figurine", 0x2002af0, 0x01, figurine)
