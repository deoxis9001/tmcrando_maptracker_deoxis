-- Configuration ----------------------
BOW_VALUE = 0
WildsFused = 0
WildsBag = 0
CloudsFused = 0
CloudsBag = 0
KEY_STOLEN = false
---------------------------------------

print("")
print("Active Auto-Tracker Configuration")
print("")
print("Enable Item Tracking:                      ", AUTOTRACKER_ENABLE_ITEM_TRACKING)
print("Enable Location Tracking:                  ", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
if TMC_AUTOTRACKER_DEBUG then
  print("Enable Debug Logging :                   ", TMC_AUTOTRACKER_DEBUG)
  print("Enable Debug Logging items:              ", TMC_AUTOTRACKER_DEBUG_ITEM)
  print("Enable Debug Logging localisation:       ", TMC_AUTOTRACKER_DEBUG_LOCATION)
  print("Enable Debug Logging error:              ", TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND)
end
print("")

function autotracker_started()
  print("Started Tracking")
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

function updateToggleItemFromByteAndFlag(segment, code, address, flag)
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

function updateSectionChestCountFromByteAndFlag(segment, locationRef, address, flag)
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

function decreaseChestCount(segment, locationRef, chestData)
  local location = Tracker:FindObjectForCode(locationRef)
  if location then
    if location.Owner.ModifiedByUser then
      return
    end

    local cleared = 0

    for i=1, #chestData, 1 do
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

  for j=1,3,1 do
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
  elseif ReadU8 (segment, 0x2002b32) == 0x55 then
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
  if not testFlag(segment, 0x2002b34, 0x40) and not testFlag (segment, 0x2002b35, 0x01) then
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
  if ReadU8(segment,0x2002aef) == 0x00 then
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
    item.Active = true
  end
end

function updateGoldFalls(segment)
  local item = Tracker:FindObjectForCode("falls")
  if ReadU8(segment, 0x2002b58) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b59) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b5a) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b5b) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b5c) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b5d) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b5e) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b5f) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b60) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b61) == 0x6d then
    item.Active = true
  elseif ReadU8(segment, 0x2002b62) == 0x6d then
    item.Active = true
  end
end

function updateWildsUsedFixed(segment, locationData)
  local item = Tracker:FindObjectForCode("wilds")
  if item then
    WildsFused = 0
    for i=1, #locationData, 1 do
      local address = locationData[i][1]
      local flag = locationData[i][2]
      local value = ReadU8(segment,address)

      local flagTest = value & flag

      if flagTest ~= 0 then
        WildsFused = WildsFused + 1
      end
    end
    item.AcquiredCount = WildsFused + WildsBag
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

  item.AcquiredCount = WildsFused + WildsBag
  if TMC_AUTOTRACKER_DEBUG_ITEM then
	print("Wilds Obtained", WildsBag)
  end
end

function updateCloudsUsedFixed(segment, locationData)
  local item = Tracker:FindObjectForCode("clouds")
  if item then
    CloudsFused = 0
    for i=1, #locationData, 1 do
      local address = locationData[i][1]
      local flag = locationData[i][2]
      local value = ReadU8(segment,address)

      local flagTest = value & flag

      if flagTest ~= 0 then
        CloudsFused = CloudsFused + 1
      end
    end
    item.AcquiredCount = CloudsFused + CloudsBag
	if TMC_AUTOTRACKER_DEBUG_ITEM then
      print("Clouds Fused", CloudsFused)
	end
  end
end

function updateClouds(segment, code, flag)
  local item = Tracker:FindObjectForCode(code)
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
  item.AcquiredCount = CloudsBag + CloudsFused
  if TMC_AUTOTRACKER_DEBUG_ITEM then
	print("Clouds Obtained", CloudsFused)
  end
end

function updateHearts(segment, address)
  local item = Tracker:FindObjectForCode("hearts")
  if item then
    item.CurrentStage = ReadU8(segment, address)/8 - 3
  end
end
function updateBigKeys(segment, code)
  if code == "dws_bigkey" then
	  if testFlag(segment, 0x2002D45, 0x02) then
	  		updateToggleItemFromByteAndFlag(segment, "dws_bigkey", 0x2002D45, 0x02)
	  else
			updateToggleItemFromByteAndFlag(segment, "dws_bigkey", 0x2002ead, 0x04)
	  end
  elseif code == "cof_bigkey" then
	  if testFlag(segment, 0x2002D5A, 0x40) then
	  		updateToggleItemFromByteAndFlag(segment, "cof_bigkey", 0x2002D5A, 0x40)
	  else
			updateToggleItemFromByteAndFlag(segment, "cof_bigkey", 0x2002eae, 0x04)
	  end
  elseif code == "fow_bigkey" then
	  if testFlag(segment, 0x2002D70, 0x40) then
	  		updateToggleItemFromByteAndFlag(segment, "fow_bigkey", 0x2002D70, 0x40)
	  else
			updateToggleItemFromByteAndFlag(segment, "fow_bigkey", 0x2002eaf, 0x04)
	  end
  elseif code == "tod_bigkey" then
	  if testFlag(segment, 0x2002D89, 0x10) then
	  		updateToggleItemFromByteAndFlag(segment, "tod_bigkey", 0x2002D89, 0x10)
	  else
			updateToggleItemFromByteAndFlag(segment, "tod_bigkey", 0x2002eb0, 0x04)
	  end
  elseif code == "pow_bigkey" then
	  if testFlag(segment, 0x2002DA2, 0x40) then
	  		updateToggleItemFromByteAndFlag(segment, "pow_bigkey", 0x2002DA2, 0x40)
	  elseif testFlag(segment, 0x2002DA4, 0x04) then
	  		updateToggleItemFromByteAndFlag(segment, "pow_bigkey", 0x2002DA4, 0x04)
	  else
			updateToggleItemFromByteAndFlag(segment, "pow_bigkey", 0x2002eb1, 0x04)
	  end
  elseif code == "dhc_bigkey" then
	  if testFlag(segment, 0x2002DBE, 0x20) then
	  		updateToggleItemFromByteAndFlag(segment, "dhc_bigkey", 0x2002DBE, 0x20)
	  else
			updateToggleItemFromByteAndFlag(segment, "dhc_bigkey", 0x2002eb2, 0x04)
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
      item.AcquiredCount = DWS_KEY_COUNT + DWS_KEY_USED
  elseif code == "cof_smallkey" then
      COF_KEY_USED = 0
	  if testFlag(segment, 0x2002d56, 0x10) then
	COF_KEY_USED = COF_KEY_USED + 1
	  end
	  if testFlag(segment, 0x2002d57, 0x20) then
	COF_KEY_USED = COF_KEY_USED + 1
	  end
      COF_KEY_COUNT = ReadU8(segment, address)
      item.AcquiredCount = COF_KEY_COUNT + COF_KEY_USED
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
      item.AcquiredCount = FOW_KEY_COUNT + FOW_KEY_USED
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
      item.AcquiredCount = TOD_KEY_COUNT + TOD_KEY_USED
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
      item.AcquiredCount = POW_KEY_COUNT + POW_KEY_USED
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
      item.AcquiredCount = DHC_KEY_COUNT + DHC_KEY_USED
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
      item.AcquiredCount = RC_KEY_COUNT + RC_KEY_USED
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

function updateItemsFromMemorySegment(segment)
  if not isInGame() then
    return false
  end
  InvalidateReadCaches()

  if AUTOTRACKER_ENABLE_ITEM_TRACKING then

    updateToggleItemFromByteAndFlag(segment, "remote", 0x2002b34, 0x01)
    updateToggleItemFromByteAndFlag(segment, "gust", 0x2002b36, 0x04)
    updateToggleItemFromByteAndFlag(segment, "cane", 0x2002b36, 0x10)
    updateToggleItemFromByteAndFlag(segment, "mitts", 0x2002b36, 0x40)
    updateToggleItemFromByteAndFlag(segment, "cape", 0x2002b37, 0x01)
    updateToggleItemFromByteAndFlag(segment, "boots", 0x2002b37, 0x04)
    updateToggleItemFromByteAndFlag(segment, "ocarina", 0x2002b37, 0x40)
    updateToggleItemFromByteAndFlag(segment, "trophy", 0x2002b41, 0x04)
    updateToggleItemFromByteAndFlag(segment, "carlov", 0x2002b41, 0x10)
    updateToggleItemFromByteAndFlag(segment, "grip", 0x2002b43, 0x01)
    updateToggleItemFromByteAndFlag(segment, "bracelets", 0x2002b43, 0x04)
    updateToggleItemFromByteAndFlag(segment, "flippers", 0x2002b43, 0x10)
    updateToggleItemFromByteAndFlag(segment, "spinattack", 0x2002b44, 0x01)
    updateToggleItemFromByteAndFlag(segment, "rollattack", 0x2002b44, 0x04)
    updateToggleItemFromByteAndFlag(segment, "dashattack", 0x2002b44, 0x10)
    updateToggleItemFromByteAndFlag(segment, "rockbreaker", 0x2002b44, 0x40)
    updateToggleItemFromByteAndFlag(segment, "swordbeam", 0x2002b45, 0x01)
    updateToggleItemFromByteAndFlag(segment, "greatspin", 0x2002b45, 0x04)
    updateToggleItemFromByteAndFlag(segment, "downthrust", 0x2002b45, 0x10)
    updateToggleItemFromByteAndFlag(segment, "perilbeam", 0x2002b45, 0x40)
    updateToggleItemFromByteAndFlag(segment, "fastspin", 0x2002b4e, 0x40)
    updateToggleItemFromByteAndFlag(segment, "fastsplit", 0x2002b4f, 0x01)
    updateToggleItemFromByteAndFlag(segment, "longspin", 0x2002b4f, 0x04)
    updateToggleItemFromByteAndFlag(segment, "jabber", 0x2002b48, 0x40)
    updateToggleItemFromByteAndFlag(segment, "bowandfly", 0x2002b4e, 0x01)
    updateToggleItemFromByteAndFlag(segment, "mittsButterfly", 0x2002b4e, 0x04)
    updateToggleItemFromByteAndFlag(segment, "flippersButterfly", 0x2002b4e, 0x10)
    updateToggleItemFromByteAndFlag(segment, "earth", 0x2002b42, 0x01)
    updateToggleItemFromByteAndFlag(segment, "fire", 0x2002b42, 0x04)
    updateToggleItemFromByteAndFlag(segment, "water", 0x2002b42, 0x10)
    updateToggleItemFromByteAndFlag(segment, "wind", 0x2002b42, 0x40)
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
    updateGoldFalls(segment)
    updateWilds(segment, "wilds", 0x6a)
    updateClouds(segment, "clouds", 0x65)

    --updateSpin(segment)
    --updateRoll(segment)
    --updateDash(segment)
    --updateRock(segment)
    --updateBeam(segment)
    --updateGreat(segment)
    --updateDown(segment)
    --updatePeril(segment)
    --updateFast(segment)
    --updateSplit(segment)
    --updateLong(segment)

  end

  if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    updateSectionChestCountFromByteAndFlag(segment, "@Fifi/Fifi", 0x2002b3f, 0x20)
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
    updateToggleItemFromByteAndFlag(segment, "dws", 0x2002c9c, 0x04)
    updateToggleItemFromByteAndFlag(segment, "cof", 0x2002c9c, 0x08)
    updateToggleItemFromByteAndFlag(segment, "fow", 0x2002c9c, 0x10)
    updateToggleItemFromByteAndFlag(segment, "tod", 0x2002c9c, 0x20)
    updateToggleItemFromByteAndFlag(segment, "pow", 0x2002c9c, 0x40)
    updateToggleItemFromByteAndFlag(segment, "rc", 0x2002d02, 0x04)
    updateToggleItemFromByteAndFlag(segment, "dhc", 0x2002ca6, 0x20)
	updateGoldFallsUsed(segment, 0x2002c82, 0x02)
	updateWildsUsedFixed(segment, {{0x2002c81,0x40},{0x2002c81,0x80},{0x2002c82,0x01}})
	updateCloudsUsedFixed(segment, {{0x2002c81,0x02},{0x2002c81,0x04},{0x2002c81,0x08},{0x2002c81,0x10},{0x2002c81,0x20}})
  end

  if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
	  --GOLDEN
	  updateSectionChestCountFromByteAndFlag(segment, "@Wind Ruins Octo Golden/Kill Octo", 0x2002ca2, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lower Crenel Tektite Golden/Kill Tektite", 0x2002ca2, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Castor Wild Rope Golden/Kill Rope", 0x2002ca2, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Eastern Hills Rope Golden/Kill Rope", 0x2002ca2, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Hyrule Castle Rope Golden/Kill Rope", 0x2002ca2, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Tektite Golden/Kill Tektite", 0x2002ca2, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Middle Crenel Tektite Golden/Kill Tektite", 0x2002ca2, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@North Minish Woods Octo Golden/Kill Octo", 0x2002ca3, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Western Woods Octo Golden/Kill Octo", 0x2002ca3, 0x02)
	  

	  --FUSIONS
	  updateSectionChestCountFromByteAndFlag(segment, "@Top Right Fusion/Fusion", 0x2002c81, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bottom Left Fusion/Fusion", 0x2002c81, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Top Left Fusion/Fusion", 0x2002c81, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Central Fusion/Fusion", 0x2002c81, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bottom Right Fusion/Fusion", 0x2002c81, 0x20)
	  decreaseChestCount(segment, "@Crenel Heart Piece Cave/Chests", {{0x2002c81, 0x40},{0x2002c81,0x80},{0x2002c82,0x01}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Source of the Flow Cave/Fusion", 0x2002c82, 0x02)

	  --CRENEL
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Climbing Wall Chest/Wall Chest", 0x2002cd4, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Wall Fairy/Crenel Fairy", 0x2002cf0, 0x01)
	  decreaseChestCount(segment, "@Mines/Digging Spots (Melari's Mines Tab)", {{0x2002cf3,0x02},{0x2002cf3,0x04},{0x2002cf3,0x08},{0x2002cf3,0x10},{0x2002cf3,0x20},{0x2002cf3,0x40},{0x2002cf3,0x80},{0x2002cf4,0x01}})
	  decreaseChestCount(segment, "@Mines Obs/Digging Spots (Melari's Mines Tab)", {{0x2002cf3,0x02},{0x2002cf3,0x04},{0x2002cf3,0x08},{0x2002cf3,0x10},{0x2002cf3,0x20},{0x2002cf3,0x40},{0x2002cf3,0x80},{0x2002cf4,0x01}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 8/Digging Spot", 0x2002cf4, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 1/Digging Spot", 0x2002cf3, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 7/Digging Spot", 0x2002cf3, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 6/Digging Spot", 0x2002cf3, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 5/Digging Spot", 0x2002cf3, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 4/Digging Spot", 0x2002cf3, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 2/Digging Spot", 0x2002cf3, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Digging Spot 3/Digging Spot", 0x2002cf3, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Climbing Wall Cave/Crenel Climbing Wall Cave", 0x2002d04, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mt. Crenel Beanstalk/Beanstalk", 0x2002d0c, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mt. Crenel Beanstalk Rupees/Beanstalk", 0x2002d0c, 0x08)
	  decreaseChestCount(segment, "@Mt. Crenel Beanstalk Rupees/Rupees", {{0x2002d0e,0x40},{0x2002d0e,0x80},{0x2002d0f,0x01},{0x2002d0f,0x02},{0x2002d0f,0x04},{0x2002d0f,0x08},{0x2002d0f,0x10},{0x2002d0f,0x20}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Rainy Minish Path Chest/Rainy Chest", 0x2002d10, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mines/Minish Path Chest", 0x2002d11, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Melari Open/Minish Path Chest", 0x2002d11, 0x08)
	  decreaseChestCount(segment, "@Grayblade/Chests", {{0x2002d1c, 0x02},{0x2002d1c,0x04}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Mines Cave/Crenel Mines Cave", 0x2002d23, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bridge Cave/Bridge Cave", 0x2002d23, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Fairy Cave Heart Piece/Fairy Cave", 0x2002d2b, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Grayblade/Heart Piece", 0x2002d2c, 0x01)

	  --CRENEL BASE
	  updateSectionChestCountFromByteAndFlag(segment, "@Vine Rupee/Rupee", 0x2002cc5, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Base Chest/Crenel Base Chest", 0x2002cd4, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Minish Crack/Minish Crack", 0x2002cde, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Spring Water Path Chest/Spring Water Path", 0x2002d10, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Heart Piece Cave/Heart Piece", 0x2002d24, 0x01)
	  decreaseChestCount(segment, "@Crenel Heart Piece Cave/Chests", {{0x2002d24, 0x02},{0x2002d24,0x04}})
	  decreaseChestCount(segment, "@Fairy + Rupee Cave/Rupees", {{0x2002d24, 0x08},{0x2002d24,0x10},{0x2002d24,0x20}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Crenel Minish Hole/Minish Hole", 0x2002d28, 0x01)

	  --CASTOR WILDS
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Platform Chest/Platform Chest", 0x2002cbd, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Diving Spots/Top", 0x2002cc0, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Diving Spots/Middle", 0x2002cc0, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Diving Spots/Bottom", 0x2002cc0, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mulldozers/Bow Chest", 0x2002cde, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mulldozers Open/Bow Chest", 0x2002cde, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Northern Minish Crack/Minish Crack", 0x2002cde, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Western Minish Crack/Minish Crack", 0x2002cde, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Vine Minish Crack/Minish Crack", 0x2002cde, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mulldozers Open/Left Crack", 0x2002cf0, 0x20)
	  decreaseChestCount(segment, "@Castor Wilds Mitts Cave/Castor Wilds Mitts Cave", {{0x2002d04, 0x01},{0x2002d04,0x02}})
	  updateSectionChestCountFromByteAndFlag(segment, "@South Lake Cave/South Lake Cave", 0x2002d22, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@North Cave/North Cave", 0x2002d22, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northeast Lake Cave/Northeast Lake Cave", 0x2002d23, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Darknut/Darknut", 0x2002d23, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Swiftblade the First/Heart Piece", 0x2002d2b, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Water Minish Hole/Hiking is Healthy", 0x2002d2c, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wilds Water Minish Hole/Hiking Trip", 0x2002d2c, 0x20)

	  --WIND RUINS
	  decreaseChestCount(segment, "@Armos Kill/Armos", {{0x2002cc2, 0x08},{0x2002cc2,0x10}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Pre FOW Chest/Pre FOW Chest", 0x2002cd2, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@4 Pillars Chest/4 Pillars Chest", 0x2002cd4, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Hole/Minish Hole", 0x2002cde, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Crack/Chest", 0x2002cf0, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wind Ruins Beanstalk/Beanstalk", 0x2002d0c, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bombable Wall/Bombable Wall", 0x2002d22, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Wall Hole/Minish Wall Hole Heart Piece", 0x2002d2b, 0x40)

	  --VALLEY
	  updateSectionChestCountFromByteAndFlag(segment, "@Lost Woods Secret Chest/Left Left Left Up Up Up", 0x2002cc7, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northwest Grave Area/Nearby Chest", 0x2002cd3, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northeast Grave Area/Nearby Chest", 0x2002cd3, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Dampe/Dampe", 0x2002ce9, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Great Fairy/Great Fairy", 0x2002cef, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Royal Crypt/King Gustaf", 0x2002d02, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@King Gustaf/King Gustaf", 0x2002d02, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Royal Crypt/Left Path", 0x2002d12, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Left Path/Left Path", 0x2002d12, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Royal Crypt/Right Path", 0x2002d12, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Path/Right Path", 0x2002d12, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Royal Crypt/Gibdos", 0x2002d14, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Gibdos/First Gibdos", 0x2002d14, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Royal Crypt/Other Gibdos", 0x2002d14, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Gibdos/Other Gibdos", 0x2002d14, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northwest Grave Area/Northwest Grave", 0x2002d27, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northwest Grave/Northwest Grave", 0x2002d27, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northeast Grave Area/Northeast Grave", 0x2002d27, 0x40)

	  --TRILBY
	  updateSectionChestCountFromByteAndFlag(segment, "@Trilby Business Scrub/Trilby Business Scrub", 0x2002ca7, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northern Chest/Chest", 0x2002cd2, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Rocks Chest/Rocks Chest", 0x2002cd3, 0x10)
	  decreaseChestCount(segment, "@Trilby Highlands Mitts Cave/Trilby Cave", {{0x2002d04,0x80},{0x2002d05,0x02}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Trilby Highlands Fusion Cave/Fusion Digging Cave", 0x2002d05, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Trilby Highlands Bomb Wall/Trilby Highlands Bomb Wall", 0x2002d1d, 0x20)
	  decreaseChestCount(segment, "@Trilby Highlands Rupee Cave/Rupees",{{0x2002d20,0x10},{0x2002d20,0x20},{0x2002d20,0x40},{0x2002d20,0x80},{0x2002d21,0x01},{0x2002d21,0x02},{0x2002d21,0x04},{0x2002d21,0x08},{0x2002d21,0x10},{0x2002d21,0x20},{0x2002d21,0x40},{0x2002d21,0x80},{0x2002d22,0x01},{0x2002d22,0x02},{0x2002d22,0x04}})

	  --WESTERN WOOD
	  decreaseChestCount(segment, "@North Digging Spots/Buried Treasure", {{0x2002cce,0x08},{0x2002cce,0x10},{0x2002cce,0x20},{0x2002cce,0x40},{0x2002cce,0x80},{0x2002ccf,0x01}})
	  decreaseChestCount(segment, "@South Digging Spots/More Buried Treasure", {{0x2002ccf, 0x02},{0x2002ccf,0x04}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Western Wood Chest/Freestanding Chest",0x2002ccf, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Percy's House/Percy Reward", 0x2002ce3, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Percy's House/Moblin Reward", 0x2002ce4, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Western Woods Tree/Heart Piece", 0x2002cef, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Western Woods Beanstalk/Beanstalk", 0x2002d0d, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Western Woods Beanstalk Rupee/Beanstalk", 0x2002d0d, 0x08)
	  decreaseChestCount(segment, "@Western Woods Beanstalk Rupee/Rupees",{{0x2002d0d,0x10},{0x2002d0d,0x20},{0x2002d0d,0x40},{0x2002d0d,0x80},{0x2002d0e,0x01},{0x2002d0e,0x02},{0x2002d0e,0x04},{0x2002d0e,0x08},{0x2002d0f,0x40},{0x2002d0f,0x80},{0x2002d10,0x01},{0x2002d10,0x02},{0x2002d10,0x04},{0x2002d10,0x08},{0x2002d10,0x10},{0x2002d10,0x20}})

	  --GARDENS
	  decreaseChestCount(segment, "@Moat/Moat", {{0x2002cbe, 0x04},{0x2002cbe,0x08}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Grimblade/Heart Piece", 0x2002d2c, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Gardens Right Fountain/Dry Fountain", 0x2002d0e, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Gardens Right Fountain/Minish Hole", 0x2002d28, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Gardens Left Fountain/Minish Hole", 0x2002d28, 0x20)

	  --NORTH FIELD
	  updateSectionChestCountFromByteAndFlag(segment, "@North Field Digging Spot/North Field Digging Spot", 0x2002ccd, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pre Royal Valley Chest/Chest", 0x2002cd3, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Top Left Tree/Top Left Tree", 0x2002d1c, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Top Right Tree/Top Right Tree", 0x2002d1c, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bottom Left Tree/Bottom Left Tree", 0x2002d1c, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bottom Right Tree/Bottom Right Tree", 0x2002d1c, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@4 Trees Done/Center Ladder", 0x2002d1d, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@North Field Cave Heart Piece/North Field Cave Heart Piece", 0x2002d2b, 0x08)

	  --HYRULE TOWN
	  updateSectionChestCountFromByteAndFlag(segment, "@Eastern Shops/Simon's Simulations", 0x2002c9c, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Anju/Heart Piece", 0x2002ca5, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Hearth Ledge/Hearth Ledge", 0x2002cd5, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@School/Roof Chest", 0x2002cd5, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bell/Bell", 0x2002cd5, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lady Next to Cafe/Lady Next to Cafe", 0x2002cd6, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Hearth/Hearth Right Pot", 0x2002ce0, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Stockwell's Shop/Dog Food Bottle Spot", 0x2002ce6, 0x08)
	--  updateSectionChestCountFromByteAndFlag(segment, "@Stockwell's Shop/Wallet Spot (80 Rupees)", 0x2002ce6, 0x20)
	--  updateSectionChestCountFromByteAndFlag(segment, "@Stockwell's Shop/Quiver Spot (600 Rupees)", 0x2002ce6, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Library/Yellow Library Minish", 0x2002ceb, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Eastern Shops/Figurine House Heart Piece", 0x2002cf2, 0x10)
	  decreaseChestCount(segment, "@Eastern Shops/Figurine House", {{0x2002cf2, 0x20},{0x2002cf2,0x40},{0x2002cf2,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Hearth/Hearth Back Door Heart Piece", 0x2002cf3, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Hearth Back Door Heart Piece/Hearth Back Door Heart Piece", 0x2002cf3, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@School/Pull the Statue", 0x2002cfc, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Town Digging Cave/Town Basement Left", 0x2002cfc, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mayor's House Basement/Mayor's House Basement", 0x2002cfd, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Hyrule Well/Hyrule Well Bottom Chest", 0x2002cfd, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Hyrule Well/Hyrule Well Center Chest", 0x2002cfd, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Fountain/Mulldozers", 0x2002cfd, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Fountain/Small Chest", 0x2002cfe, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Flippers Cave Rupees/Under the Waterfall", 0x2002cfe, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Flippers Cave/Scissor Beetles", 0x2002cfe, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Flippers Cave Rupees/Scissor Beetles", 0x2002cfe, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Flippers Cave/Frozen Chest", 0x2002cfe, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Flippers Cave Rupees/Frozen Chest", 0x2002cfe, 0x20)
	  decreaseChestCount(segment, "@Town Digging Cave/Cave Chests", {{0x2002d04, 0x04},{0x2002d04,0x08},{0x2002d04,0x10}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Stockwell's Shop/Attic Chest", 0x2002d0a, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@School Gardens/Heart Piece", 0x2002d0b, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@School Gardens Open/Heart Piece", 0x2002d0b, 0x40)
	  decreaseChestCount(segment, "@School Gardens/Garden Chests",{{0x2002d0b,80},{0x2002d0c,0x01},{0x2002d0c,0x02}})
	  decreaseChestCount(segment, "@School Gardens Open/Garden Chests",{{0x2002d0b,80},{0x2002d0c,0x01},{0x2002d0c,0x02}})
	  updateSectionChestCountFromByteAndFlag(segment, "@School Gardens Open/Minish Path Chest", 0x2002d11, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bakery Attic Chest/Bakery Attic Chest", 0x2002d13, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Fountain/Heart Piece", 0x2002d14, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Town Waterfall/Waterfall", 0x2002d1d, 0x40)

	  --SOUTH FIELD
	  updateSectionChestCountFromByteAndFlag(segment, "@Tingle/Tingle", 0x2002ca3, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Near Link's House Chest/Chest", 0x2002cd3, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Smith's House/Intro Items", 0x2002cde, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Tree Heart Piece/Tree Heart Piece", 0x2002cee, 0x80)
	  decreaseChestCount(segment,"@Fusion Rupee Cave/Rupees", {{0x2002d1e,0x20},{0x2002d1e,0x40},{0x2002d1e,0x80},{0x2002d1f,0x01},{0x2002d1f,0x02},{0x2002d1f,0x04},{0x2002d1f,0x08},{0x2002d1f,0x10},{0x2002d1f,0x20},{0x2002d1f,0x40},{0x2002d1f,0x80},{0x2002d20,0x01},{0x2002d20,0x02},{0x2002d20,0x04},{0x2002d20,0x08}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Flippers Hole/Minish Flippers Hole", 0x2002d2c, 0x02)

	  --VEIL FALLS
	  updateSectionChestCountFromByteAndFlag(segment, "@Upper Veil Falls Heart Piece/Upper Heart Piece", 0x2002cd0, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Source of the Flow Cave/Bombable Wall Second Chest", 0x2002cd0, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@South Veil Falls Rupees/Rupee 1", 0x2002cd0, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@South Veil Falls Rupees/Rupee 2", 0x2002cd0, 0x08)
	  updateSectionChestCountFromByteAndFlag(segmemt, "@South Veil Falls Rupees/Rupee 3", 0x2002cd0, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Upper Veil Falls Rocks/Left Digging Spot", 0x2002cd0, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls North Digging Spot/North Digging Spot", 0x2002cd0, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lower Veil Falls Heart Piece/Lower Heart Piece", 0x2002cd1, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Upper Veil Falls Rocks/Right Chest", 0x2002cd3, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Rock Chest/Veil Falls Chest", 0x2002cd3, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls South Digging Spot/South Digging Spot", 0x2002cda, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Fusion Digging Cave/Chest", 0x2002d05, 0x04)
	  decreaseChestCount(segment, "@Veil Falls South Mitts Cave/Veil Falls South Mitts Cave", {{0x2002d05, 0x08},{0x2002d05,0x10}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Fusion Digging Cave/Heart Piece", 0x2002d05, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Upper Cave/Freestanding Chest", 0x2002d25, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Upper Cave Rupees/Freestanding Chest", 0x2002d25, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Upper Cave RupObs/Freestanding Chest", 0x2002d25, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Upper Cave/Bomb Wall Chest", 0x2002d25, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Upper Cave Rupees/Bomb Wall Chest", 0x2002d25, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Upper Cave RupObs/Bomb Wall Chest", 0x2002d25, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Source of the Flow Cave/Bombable Wall First Chest", 0x2002d25, 0x10)
	  decreaseChestCount(segment, "@Veil Falls Upper Cave Rupees/Downstairs Rupees", {{0x2002d25,0x20},{0x2002d25,0x40},{0x2002d25,0x80},{0x2002d26,0x01},{0x2002d26,0x02},{0x2002d26,0x04},{0x2002d26,0x08},{0x2002d26,0x10},{0x2002d26,0x20}})
	  decreaseChestCount(segment, "@Veil Falls Upper Cave RupObs/Downstairs Rupees", {{0x2002d25,0x20},{0x2002d25,0x40},{0x2002d25,0x80},{0x2002d26,0x01},{0x2002d26,0x02},{0x2002d26,0x04},{0x2002d26,0x08},{0x2002d26,0x10},{0x2002d26,0x20}})
	  decreaseChestCount(segment, "@Veil Falls Upper Cave RupObs/Underwater Rupees", {{0x2002d26,0x40},{0x2002d26,0x80},{0x2002d27,0x01},{0x2002d27,0x02},{0x2002d27,0x04},{0x2002d27,0x08}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Veil Falls Upper Waterfall/Waterfall Heart Piece", 0x2002d27, 0x10)

	  --LON LON RANCH
	  updateSectionChestCountFromByteAndFlag(segment, "@Lon Lon North Heart Piece/Lon Lon North Heart Piece", 0x2002ccb, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lon Lon Ranch Digging Spot/Digging Spot Above Tree", 0x2002ccb, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@North Ranch Chest/Chest", 0x2002cd3, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Malon's Pot/Malon's Pot", 0x2002ce5, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lon Lon Minish Crack/Lon Lon Minish Crack", 0x2002cf2, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bonk the Tree Open/Minish Path Chest", 0x2002d11, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bonk the Tree Open/Minish Path Heart Piece", 0x2002d13, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bonk the Tree/Minish Path Heart Piece", 0x2002d13, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lon Lon Cave/Lon Lon Cave", 0x2002d1d, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lon Lon Cave/Hidden Bomb Wall", 0x2002d1e, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lon Lon Dried Up Pond/Lon Lon Pond", 0x2002d1e, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Goron Quest/Big Chest", 0x2002d2a, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Goron Quest/Small Chest", 0x2002d2a, 0x80)

	  --EASTERN HILLS
	  updateSectionChestCountFromByteAndFlag(segment, "@Farm Chest/Farm Chest", 0x2002cd2, 0x04)  
	  updateSectionChestCountFromByteAndFlag(segment, "@Farm Rupee/Farm Rupee", 0x2002d04, 0x40)  
	  updateSectionChestCountFromByteAndFlag(segment, "@Eastern Hills Beanstalk/Heart Piece", 0x2002d0d, 0x01)  
	  updateSectionChestCountFromByteAndFlag(segment, "@Eastern Hills Beanstalk/Left Chest", 0x2002d0d, 0x02)   
	  updateSectionChestCountFromByteAndFlag(segment, "@Eastern Hills Beanstalk/Right Chest", 0x2002d0d, 0x04)  
	  updateSectionChestCountFromByteAndFlag(segment, "@Eastern Hills Bombable Wall/Bomb Wall", 0x2002d22, 0x08) 

	  --LAKE HYLIA
	  updateSectionChestCountFromByteAndFlag(segment, "@Hylia Cape Heart Piece/Cape Heart Piece", 0x2002cbd, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pond Heart Piece/Diving for Love", 0x2002cbd, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Hylia Southern Heart Piece/Hylia Southern Heart Piece", 0x2002cbd, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Librari/Librari", 0x2002cf2, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Middle of the Lake/Digging Cave", 0x2002d02, 0x40)
	  decreaseChestCount(segment, "@North Hylia Cape Cave/North Hylia Cape Cave", {{0x2002d02,0x80},{0x2002d03,0x02},{0x2002d03,0x04},{0x2002d03,0x08},{0x2002d03,0x10},{0x2002d03,0x20},{0x2002d03,0x40}})
	  decreaseChestCount(segment, "@Treasure Cave/Treasure Cave", {{0x2002d02,0x80},{0x2002d03,0x02},{0x2002d03,0x04},{0x2002d03,0x08},{0x2002d03,0x10},{0x2002d03,0x20},{0x2002d03,0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Treasure Cave/Beanstalk Heart Piece", 0x2002d0c, 0x10)
	  decreaseChestCount(segment, "@Treasure Cave/Beanstalk", {{0x2002d0c, 0x20},{0x2002d0c,0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Lake Cabin Open/Chest", 0x2002d11, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@North Minish Hole/North Minish Hole", 0x2002d2a, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Waveblade/Heart Piece", 0x2002d2c, 0x04)

	  --MINISH WOODS
	  updateSectionChestCountFromByteAndFlag(segment, "@Northern Heart Piece/Heart Piece", 0x2002cc3, 0x08)  
	  updateSectionChestCountFromByteAndFlag(segment, "@Shrine Heart Piece/Heart Piece", 0x2002cc3, 0x10)  
	  updateSectionChestCountFromByteAndFlag(segment, "@Cross the Pond/Chest", 0x2002cd2, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Woods Pre Stump Chest/Chest", 0x2002cd2, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pre Shrine Chest/Chest", 0x2002cd2, 0x80) 
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Woods Entrance Chest/Chest", 0x2002cd3, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Post Minish Village Chest/Wind Crest Chest", 0x2002cdb, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Woods Great Fairy/Minish Woods Great Fairy", 0x2002cef, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pre Minish Village Minish Hole/Minish Hole", 0x2002cf0, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Belari Open/2nd Item", 0x2002cf2, 0x01) 
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Village/Dock Heart Piece", 0x2002cf4, 0x04) 
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Village Open/Dock Heart Piece", 0x2002cf4, 0x04) 
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Village/Barrel", 0x2002cf5, 0x04) 
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Village Open/Barrel", 0x2002cf5, 0x04) 
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Woods North Digging Cave/Minish Woods North Digging Cave", 0x2002d02, 0x08)
	  decreaseChestCount(segment, "@Like Like Cave/Like Like Cave", {{0x2002d02, 0x10},{0x2002d02,0x20}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Village Open/Minish Path Chest", 0x2002d11, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Woods North Minish Hole/Minish Woods North Minish Hole", 0x2002d28, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Flippers Cave/Middle", 0x2002d2a, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Flippers Cave/Right", 0x2002d2a, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Flippers Cave/Left", 0x2002d2a, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Flippers Cave/Left Heart Piece", 0x2002d2b, 0x04)

	  --CLOUD TOPS
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Chest/Right Chest", 0x2002cd7, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Center Left/Center Left", 0x2002cd7, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Top Left South Chest/Top Left South Chest", 0x2002cd7, 0x20)
	  decreaseChestCount(segment, "@Top Left North Chests/Top Left North Chests", {{0x2002cd7, 0x40},{0x2002cd7,0x80}})
	  decreaseChestCount(segment, "@Top Left North Chests Obscure/Top Left North Chests", {{0x2002cd7, 0x40},{0x2002cd7,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Bottom Left Chest/Bottom Left Chest", 0x2002cd8, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Center Right/Center Right", 0x2002cd8, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Top Left North Chests Obscure/Digging Spot on the Left", 0x2002cd8, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Top Right Digging Spot/Digging Spot", 0x2002cd8, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Center Digging Spot/Digging Spot", 0x2002cd8, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southeast North Digging Spot/Digging Spot", 0x2002cd8, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bottom Left Digging Spot/Digging Spot", 0x2002cd8, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@South Digging Spot/Digging Spot", 0x2002cd8, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southeast South Digging Spot/Digging Spot", 0x2002cd9, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Kill Piranhas (North)/Kill Piranhas", 0x2002cda, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Kill Piranhas (South)/Kill Piranhas", 0x2002cda, 0x08)
	  decreaseChestCount(segment, "@Wind Tribe House Open/Early House Chests", {{0x2002cdc,0x20},{0x2002cdc,0x40},{0x2002cdc,0x80}})
	  decreaseChestCount(segment, "@Wind Tribe House Open/Later House Chests", {{0x2002cdd,0x01},{0x2002cdd,0x02},{0x2002cdd,0x04},{0x2002cdd,0x40},{0x2002cdd,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Wind Tribe House Open/Save Gregal", 0x2002ce8, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wind Tribe House Open/Gregal's Gift", 0x2002ce8, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wind Tribe House/Save Gregal", 0x2002ce8, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wind Tribe House/Gregal's Gift", 0x2002ce8, 0x40)
	  decreaseChestCount(segment, "@Wind Tribe House/House Chests", {{0x2002cdc, 0x20},{0x2002cdc,0x40},{0x2002cdc,0x80},{0x2002cdd,0x01},{0x2002cdd,0x02},{0x2002cdd,0x04},{0x2002cdd,0x40},{0x2002cdd,0x80}})

	  --DWS
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Madderpillar Chest", 0x2002d3f, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Madderpillar Chest/Madderpillar Chest", 0x2002d3f, 0x08)
	  decreaseChestCount(segment, "@DWS/Puffstool Room", {{0x2002d40, 0x04},{0x2002d40,0x08}})
	  decreaseChestCount(segment, "@Puffstool Room/Puffstool Room", {{0x2002d40, 0x04},{0x2002d40,0x08}})
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Two Lamp Chest", 0x2002d40, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Two Lamp Chest/Two Lamp", 0x2002d40, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Two Statue Room", 0x2002d40, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Two Statue Room/Two Statue Room", 0x2002d40, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/West Side Big Chest", 0x2002d41, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@West Side Big Chest/West Side Big Chest", 0x2002d41, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Barrel Room Northwest", 0x2002d41, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Barrel Room Northwest/Barrel Room Northwest", 0x2002d41, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Mulldozer Key", 0x2002d42, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mulldozer Key/Mulldozer Key", 0x2002d42, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Slug Room", 0x2002d43, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Slug Room/Slug Room", 0x2002d43, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Basement Big Chest", 0x2002d43, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Basement Big Chest/Basement Big Chest", 0x2002d43, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Basement Switch Chest", 0x2002d44, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Basement Switch Chest/Basement Switch Chest", 0x2002d44, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Basement Switch Room Big Chest", 0x2002d44, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Basement Switch Room Big Chest/Basement Switch Room Big Chest", 0x2002d44, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Green Chu", 0x2002d44, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Green Chu/Green Chu", 0x2002d44, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Upstairs Chest", 0x2002d45, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Upstairs Room/Upstairs Chest", 0x2002d45, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Blue Warp Heart Piece", 0x2002d45, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Blue Warp Heart Piece/Blue Warp Heart Piece", 0x2002d45, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DWS/Madderpillar Heart Piece", 0x2002d46, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Madderpillar Heart Piece/Madderpillar Heart Piece", 0x2002d46, 0x04)

	  --COF
	  updateSectionChestCountFromByteAndFlag(segment, "@COF/Spiny Chu Pillar Chest", 0x2002d57, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Spiny Chu Pillar Chest/Spiny Chu Pillar Chest", 0x2002d57, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF/Spiny Chu Fight", 0x2002d57, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Spiny Chu Fight/Spiny Chu Fight", 0x2002d57, 0x02)
	  decreaseChestCount(segment, "@COF/First Rollobite Room", {{0x2002d58, 0x40},{0x2002d58,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@First Rollobite Room Pillar Chest/First Rollobite Room Pillar Chest", 0x2002d58, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@First Rollobite Room Free Chest/First Rollobite Room Free Chest", 0x2002d58, 0x80)
	  decreaseChestCount(segment, "@COF/Pre Lava Basement Room", {{0x2002d59, 0x10},{0x2002d59, 0x20}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Pre Lava Basement Room Block Chest/Pre Lava Basement Room Block Chest", 0x2002d59, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pre Lava Basement Room Ledge/Pre Lava Basement Room Ledge", 0x2002d59, 0x20)
	  decreaseChestCount(segment, "@COF/Big Chest Room", {{0x2002d59, 0x02},{0x2002d59,0x04}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Big Chest Room Small Chest/Big Chest Room Small Chest", 0x2002d59, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Big Chest Room Big Chest/Big Chest Room Big Chest", 0x2002d59, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF/Blade Chest", 0x2002d5a, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF Blade Chest/Blade Chest", 0x2002d5a, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF/Spiny Beetle Fight", 0x2002d5a, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Spiny Beetle Fight/Spiny Beetle Fight", 0x2002d5a, 0x04)
	  decreaseChestCount(segment, "@COF/Lava Basement (Left,Right)", {{0x2002d5a, 0x80},{0x2002d5b, 0x01}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Lava Basement Left/Lava Basement Left", 0x2002d5a, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lava Basement Right/Lava Basement Right", 0x2002d5b, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF/Lava Basement Big Chest", 0x2002d5b, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Lava Basement Big Chest/Lava Basement Big Chest", 0x2002d5b, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF/Gleerok", 0x2002d5b, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Gleerok/Gleerok", 0x2002d5b, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF/Bombable Wall Heart Piece", 0x2002d5b, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bombable Wall Heart Piece/Bomb Wall HP", 0x2002d5b, 0x10)

	  updateSectionChestCountFromByteAndFlag(segment, "@COF Rupees/Spiny Chu Pillar Chest", 0x2002d57, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF Rupees/Spiny Chu Fight", 0x2002d57, 0x02)
	  decreaseChestCount(segment, "@COF Rupees/First Rollobite Room", {{0x2002d58, 0x40},{0x2002d58,0x80}})
	  decreaseChestCount(segment, "@COF Rupees/Pre Lava Basement Room", {{0x2002d59, 0x10},{0x2002d59, 0x20}})
	  decreaseChestCount(segment, "@COF Rupees/Big Chest Room", {{0x2002d59, 0x02},{0x2002d59,0x04}})
	  updateSectionChestCountFromByteAndFlag(segment, "@COF Rupees/Blade Chest", 0x2002d5a, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF Rupees/Spiny Beetle Fight", 0x2002d5a, 0x04)
	  decreaseChestCount(segment, "@COF Rupees/Lava Basement (Left,Right)", {{0x2002d5a, 0x80},{0x2002d5b, 0x01}})
	  updateSectionChestCountFromByteAndFlag(segment, "@COF Rupees/Lava Basement Big Chest", 0x2002d5b, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF Rupees/Gleerok", 0x2002d5b, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@COF Rupees/Bombable Wall Heart Piece", 0x2002d5b, 0x10)
	  decreaseChestCount(segment, "@COF Rupees/Rupees", {{0x2002d5b, 0x40},{0x2002d5b, 0x80},{0x2002d5c, 0x01},{0x2002d5c, 0x02},{0x2002d5c, 0x04}})
	  decreaseChestCount(segment, "@Cave of Flames Rupees/Rupees", {{0x2002d5b, 0x40},{0x2002d5b, 0x80},{0x2002d5c, 0x01},{0x2002d5c, 0x02},{0x2002d5c, 0x04}})

	  --FOW
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Entrance Far Left", 0x2002d05, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Far Left Entrance Room/Far Left Entrance Room", 0x2002d05, 0x80)
	  decreaseChestCount(segment, "@FOW/Left Side Mitts Chests", {{0x2002d06, 0x01},{0x2002d07, 0x20}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Left Side 2nd Floor Mitts Chest/Left Side 2nd Floor Mitts Chest", 0x2002d06, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Left Side 3rd Floor Mitts Chest/Left Side 3rd Floor Mitts Chest", 0x2002d07, 0x20)
	  decreaseChestCount(segment, "@FOW/Right Side Mitts Chests", {{0x2002d06, 0x04},{0x2002d07, 0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Side 2nd Floor Mitts Chest/Right Side 2nd Floor Mitts Chest", 0x2002d06, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Side 3rd Floor Mitts Chest/Right Side 3rd Floor Mitts Chest", 0x2002d07, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Center Path Switch", 0x2002d06, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Center Path Switch/Center Path Switch", 0x2002d06, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Bombable Wall Big Chest", 0x2002d08, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bombable Wall Big Chest/Bombable Wall Big Chest", 0x2002d08, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Bombable Wall Small Chest", 0x2002d08, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bombable Wall Small Chest/Bombable Wall Small Chest", 0x2002d08, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Minish Dirt Room Key Drop", 0x2002d08, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Minish Dirt Room Key Drop/Minish Dirt Room Key Drop", 0x2002d08, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Eyegores", 0x2002d6f, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Eyegores/Eyegores", 0x2002d6f, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Clone Puzzle Key Drop", 0x2002d71, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Clone Puzzle Key Drop/Clone Puzzle Key Drop", 0x2002d71, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Mazaal", 0x2002d72, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Mazaal/Mazaal", 0x2002d72, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Pedestal Chest", 0x2002d73, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pedestal Chest/Pedestal Chest", 0x2002d73, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Skull Room Chest", 0x2002d73, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Skull Room Chest/Skull Room Chest", 0x2002d73, 0x04)
	  decreaseChestCount(segment, "@FOW/Right Side Two Lever Room", {{0x2002d73, 0x20},{0x2002d73,0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Two Lever Room Left Chest/Left Chest", 0x2002d73, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Two Lever Room Right Chest/Right Chest", 0x2002d73, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Left Side Key Drop", 0x2002d73, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Left Side Key Drop/Left Side Key Drop", 0x2002d73, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Right Side Key Drop", 0x2002d74, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Side Key Drop/Right Side Key Drop", 0x2002d74, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Wizzrobe Fight", 0x2002d74, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wizzrobe Fight/Wizzrobe Fight", 0x2002d74, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/FOW Reward", 0x2002d74, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW/Right Side Heart Piece", 0x2002d74, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Side Heart Piece/Right Side Heart Piece", 0x2002d74, 0x80)

	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Entrance Big Rupee", 0x2002d05, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Entrance Rupee/Entrance Rupee", 0x2002d05, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Entrance Far Left", 0x2002d05, 0x80)
	  decreaseChestCount(segment, "@FOW Rupees/Left Side Mitts Chests", {{0x2002d06, 0x01},{0x2002d07, 0x20}})
	  decreaseChestCount(segment, "@FOW Rupees/Right Side Mitts Chests", {{0x2002d06, 0x04},{0x2002d07, 0x40}})
	  decreaseChestCount(segment, "@FOW Rupees/Left Side Rupees",{{0x2002d06, 0x20},{0x2002d06,0x40},{0x2002d06,0x80},{0x2002d07,0x01},{0x2002d07,0x02},{0x2002d07,0x04},{0x2002d07,0x08}})
	  decreaseChestCount(segment, "@Left Side Left Rupees/Left Side Left Rupees",{{0x2002d06, 0x20},{0x2002d06,0x40},{0x2002d06,0x80},{0x2002d07,0x01}})
	  decreaseChestCount(segment, "@Left Side Right Rupees/Left Side Right Rupees",{{0x2002d07,0x02},{0x2002d07,0x04},{0x2002d07,0x08}})
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Center Path Switch", 0x2002d06, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Bombable Wall Big Chest", 0x2002d08, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Bombable Wall Small Chest", 0x2002d08, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Minish Dirt Room Key Drop", 0x2002d08, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Eyegores", 0x2002d6f, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Clone Puzzle Key Drop", 0x2002d71, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Mazaal", 0x2002d72, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Pedestal Chest", 0x2002d73, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Skull Room Chest", 0x2002d73, 0x04)
	  decreaseChestCount(segment, "@FOW Rupees/Right Side Two Lever Room", {{0x2002d73, 0x20},{0x2002d73,0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Left Side Key Drop", 0x2002d73, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Right Side Key Drop", 0x2002d74, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Wizzrobe Fight", 0x2002d74, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/FOW Reward", 0x2002d74, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Rupees/Right Side Heart Piece", 0x2002d74, 0x80)

	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Entrance Far Left", 0x2002d05, 0x80)
	  decreaseChestCount(segment, "@FOW Obscure/Left Side Mitts Chests", {{0x2002d06, 0x01},{0x2002d07, 0x20}})
	  decreaseChestCount(segment, "@FOW Obscure/Right Side Mitts Chests", {{0x2002d06, 0x04},{0x2002d07, 0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Center Path Switch", 0x2002d06, 0x02)
	  decreaseChestCount(segment, "@FOW Obscure/Right Side Moldorm Pots", {{0x2002d06, 0x08},{0x2002d06,0x10}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Side Top Moldorm Pot/Moldorm Pot", 0x2002d06, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Side Left Moldorm Pot/Moldorm Pot", 0x2002d06,0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Bombable Wall Big Chest", 0x2002d08, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Bombable Wall Small Chest", 0x2002d08, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Minish Dirt Room Key Drop", 0x2002d08, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Eyegores", 0x2002d6f, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Clone Puzzle Key Drop", 0x2002d71, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Mazaal", 0x2002d72, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Pedestal Chest", 0x2002d73, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Skull Room Chest", 0x2002d73, 0x04)
	  decreaseChestCount(segment, "@FOW Obscure/Right Side Two Lever Room", {{0x2002d73, 0x20},{0x2002d73,0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Left Side Key Drop", 0x2002d73, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Right Side Key Drop", 0x2002d74, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Wizzrobe Fight", 0x2002d74, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/FOW Reward", 0x2002d74, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW Obscure/Right Side Heart Piece", 0x2002d74, 0x80)

	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Entrance Large Rupee", 0x2002d05, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Entrance Far Left", 0x2002d05, 0x80)
	  decreaseChestCount(segment, "@FOW RupObs/Left Side Mitts Chests", {{0x2002d06, 0x01},{0x2002d07, 0x20}})
	  decreaseChestCount(segment, "@FOW RupObs/Right Side Mitts Chests", {{0x2002d06, 0x04},{0x2002d07, 0x40}})
	  decreaseChestCount(segment, "@FOW RupObs/Left Side Rupees",{{0x2002d06, 0x20},{0x2002d06,0x40},{0x2002d06,0x80},{0x2002d07,0x01},{0x2002d07,0x02},{0x2002d07,0x04},{0x2002d07,0x08}})
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Center Path Switch", 0x2002d06, 0x02)
	  decreaseChestCount(segment, "@FOW RupObs/Right Side Moldorm Pots", {{0x2002d06, 0x08},{0x2002d06,0x10}})
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Bombable Wall Big Chest", 0x2002d08, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Bombable Wall Small Chest", 0x2002d08, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Minish Dirt Room Key Drop", 0x2002d08, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Eyegores", 0x2002d6f, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Clone Puzzle Key Drop", 0x2002d71, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Mazaal", 0x2002d72, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Pedestal Chest", 0x2002d73, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Skull Room Chest", 0x2002d73, 0x04)
	  decreaseChestCount(segment, "@FOW RupObs/Right Side Two Lever Room", {{0x2002d73, 0x20},{0x2002d73,0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Left Side Key Drop", 0x2002d73, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Right Side Key Drop", 0x2002d74, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Wizzrobe Fight", 0x2002d74, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/FOW Reward", 0x2002d74, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@FOW RupObs/Right Side Heart Piece", 0x2002d74, 0x80)

	  --TOD
	  decreaseChestCount(segment, "@TOD/Right Path Ice Walkway Chests", {{0x2002d8b, 0x01},{0x2002d8b,0x04}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Path Ice Walkway First Chest/Right Path Ice Walkway First Chest", 0x2002d8b, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Path Ice Walkway Second Chest/Right Path Ice Walkway Second Chest", 0x2002d8b, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Overhang Chest", 0x2002d8b, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Overhang Chest/Overhang Chest", 0x2002d8b, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Octo", 0x2002d8c, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Octo/Octo", 0x2002d8c, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Blue Chu", 0x2002d8c, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Blue Chu/Blue Chu", 0x2002d8c, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Basement Frozen Chest", 0x2002d8d, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Basement Frozen Chest/Basement Frozen Chest", 0x2002d8d, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Small Key Locked Ice Block", 0x2002d8d, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Key Locked Ice Block/Key Locked Ice Block", 0x2002d8d, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/First Ice Block", 0x2002d8e, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@First Ice Block/First Ice Block", 0x2002d8e, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Ice Puzzle Frozen Chest", 0x2002d8f, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Ice Puzzle Frozen Chest/Ice Puzzle Frozen Chest", 0x2002d8f, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Ice Puzzle Free Chest", 0x2002d8f, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Ice Puzzle Free Chest/Ice Puzzle Free Chest", 0x2002d8f, 0x08)
	  decreaseChestCount(segment, "@TOD/Dark Maze", {{0x2002d8f, 0x20},{0x2002d8f, 0x40},{0x2002d8f,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@Dark Maze Top Right/Dark Maze Top Right", 0x2002d8f, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Dark Maze Top Left/Dark Maze Top Left", 0x2002d8f, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Dark Maze Bottom/Dark Maze Bottom", 0x2002d8f, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Dark Maze Bomb Wall", 0x2002d91, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Dark Maze Bombable Wall/Dark Maze Bombable Wall", 0x2002d91, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Post Blue Chu Frozen Chest", 0x2002d92, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Post Blue Chu Frozen Chest/Post Blue Chu Frozen Chest", 0x2002d92, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Post Madderpillar Chest", 0x2002d92, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Post Madderpillar Chest/Post Madderpillar Chest", 0x2002d92, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Underwater Pot", 0x2002d93, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Underwater Pot/Underwater Pot", 0x2002d93, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD/Post Ice Puzzle Frozen Chest", 0x2002d93, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Post Ice Puzzle Frozen Chest/Post Ice Puzzle Frozen Chest", 0x2002d93, 0x40)

	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Right Path Ice Walkway Chests", 0x2002d8b, 0x05)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Overhang Chest", 0x2002d8b, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Octo", 0x2002d8c, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Blue Chu", 0x2002d8c, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Basement Frozen Chest", 0x2002d8d, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Small Key Locked Ice Block", 0x2002d8d, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/First Ice Block", 0x2002d8e, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Ice Puzzle Frozen Chest", 0x2002d8f, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Ice Puzzle Free Chest", 0x2002d8f, 0x08)
	  decreaseChestCount(segment, "@TOD Rupees/Dark Maze", {{0x2002d8f, 0x20},{0x2002d8f, 0x40},{0x2002d8f,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Dark Maze Bomb Wall", 0x2002d91, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Post Blue Chu Frozen Chest", 0x2002d92, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Post Madderpillar Chest", 0x2002d92, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Underwater Pot", 0x2002d93, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Rupees/Post Ice Puzzle Frozen Chest", 0x2002d93, 0x40)
	  decreaseChestCount(segment,"@TOD Rupees/Left Path Rupees",{{0x2002d94,0x20},{0x2002d94,0x40},{0x2002d94,0x80},{0x2002d95,0x01},{0x2002d95,0x02}})
	  decreaseChestCount(segment,"@Left Path Rupees/Left Path Rupees",{{0x2002d94,0x20},{0x2002d94,0x40},{0x2002d94,0x80},{0x2002d95,0x01},{0x2002d95,0x02}})
	  decreaseChestCount(segment, "@TOD Rupees/Right Path Rupees", {{0x2002d95,0x04,},{0x2002d95,0x08},{0x2002d95,0x10},{0x2002d95,0x20},{0x2002d95,0x40}})
	  decreaseChestCount(segment, "@Right Path Rupees/Right Path Rupees", {{0x2002d95,0x04,},{0x2002d95,0x08},{0x2002d95,0x10},{0x2002d95,0x20},{0x2002d95,0x40}})
	  decreaseChestCount(segment, "@Lower Underwater Rupees/Lower Underwater Rupees",{{0x2002d95,0x80},{0x2002d96,0x01},{0x2002d96,0x02},{0x2002d96,0x04},{0x2002d96,0x08},{0x2002d96,0x10}})
	  decreaseChestCount(segment, "@Upper Underwater Rupees/Upper Underwater Rupees",{{0x2002d96,0x20},{0x2002d96,0x40},{0x2002d96,0x80},{0x2002d97,0x01},{0x2002d97,0x02},{0x2002d97,0x04}})

	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Right Path Ice Walkway Chests", 0x2002d8b, 0x05)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Right Path Ice Walkway Pot", 0x2002d8b, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Right Path Ice Walkway Pot/Right Path Ice Walkway Pot", 0x2002d8b, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Overhang Chest", 0x2002d8b, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Octo", 0x2002d8c, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Blue Chu", 0x2002d8c, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Basement Frozen Chest", 0x2002d8d, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Small Key Locked Ice Block", 0x2002d8d, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/First Ice Block", 0x2002d8e, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Ice Puzzle Frozen Chest", 0x2002d8f, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Ice Puzzle Free Chest", 0x2002d8f, 0x08)
	  decreaseChestCount(segment, "@TOD Obscure/Dark Maze", {{0x2002d8f, 0x20},{0x2002d8f, 0x40},{0x2002d8f,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Dark Maze Bomb Wall", 0x2002d91, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Post Blue Chu Frozen Chest", 0x2002d92, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Post Madderpillar Chest", 0x2002d92, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Underwater Pot", 0x2002d93, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD Obscure/Post Ice Puzzle Frozen Chest", 0x2002d93, 0x40)

	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Right Path Ice Walkway Chests", 0x2002d8b, 0x05)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Right Path Ice Walkway Pot", 0x2002d8b, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Overhang Chest", 0x2002d8b, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Octo", 0x2002d8c, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Blue Chu", 0x2002d8c, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Basement Frozen Chest", 0x2002d8d, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Small Key Locked Ice Block", 0x2002d8d, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/First Ice Block", 0x2002d8e, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Ice Puzzle Frozen Chest", 0x2002d8f, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Ice Puzzle Free Chest", 0x2002d8f, 0x08)
	  decreaseChestCount(segment, "@TOD RupObs/Dark Maze", {{0x2002d8f, 0x20},{0x2002d8f, 0x40},{0x2002d8f,0x80}})
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Dark Maze Bomb Wall", 0x2002d91, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Post Blue Chu Frozen Chest", 0x2002d92, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Post Madderpillar Chest", 0x2002d92, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Underwater Pot", 0x2002d93, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@TOD RupObs/Post Ice Puzzle Frozen Chest", 0x2002d93, 0x40)
	  decreaseChestCount(segment, "@TOD RupObs/Left Path Rupees",{{0x2002d94,0x20},{0x2002d94,0x40},{0x2002d94,0x80},{0x2002d95,0x01},{0x2002d95,0x02}})
	  decreaseChestCount(segment, "@TOD RupObs/Right Path Rupees", {{0x2002d95,0x04},{0x2002d95,0x08},{0x2002d95,0x10},{0x2002d95,0x20},{0x2002d95,0x40}})
	  decreaseChestCount(segment, "@TOD RupObs/Lower Water Rupees",{{0x2002d95,0x80},{0x2002d96,0x01},{0x2002d96,0x02},{0x2002d96,0x04},{0x2002d96,0x08},{0x2002d96,0x10}})
	  decreaseChestCount(segment, "@TOD RupObs/Upper Water Rupees",{{0x2002d96,0x20},{0x2002d96,0x40},{0x2002d96,0x80},{0x2002d97,0x01},{0x2002d97,0x02},{0x2002d97,0x04}})

	  --POW
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Pre Big Key Door Big Chest", 0x2002da2, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pre Big Key Door Big Chest/Pre Big Key Door Big Chest", 0x2002da2, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Bombarossa Maze", 0x2002da2, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Bombarossa Maze/Bombarossa Maze", 0x2002da2, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Block Maze Detour", 0x2002da2, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Block Maze Room Detour/Block Maze Room Detour", 0x2002da2, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Spark Chest", 0x2002da3, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Spark Chest/Spark Chest", 0x2002da3, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Flail Soldiers", 0x2002da4, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Flail Soldiers/Flail Soldiers", 0x2002da4, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Moblin Archer Chest", 0x2002da4, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Moblin Archer Chest/Moblin Archer Chest", 0x2002da4, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Block Maze Room", 0x2002da5, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Block Maze Room/Block Maze Room", 0x2002da5, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Switch Chest", 0x2002da5, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Switch Chest/Switch Chest", 0x2002da5, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Fire Wizzrobe Fight", 0x2002da6, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Firerobe Fight/Firerobe Fight", 0x2002da6, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Pot Puzzle Key", 0x2002da7, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pot Puzzle Key/Pot Puzzle Key", 0x2002da7, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Twin Wizzrobe Fight", 0x2002da9, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Twin Wizzrobe Fight/Twin Wizzrobe Fight", 0x2002da9, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Roller Chest", 0x2002da9, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Roller Chest/Roller Chest", 0x2002da9, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Wizzrobe Platform Fight", 0x2002daa, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@Wizzrobe Platform Fight/Wizzrobe Platform Fight", 0x2002daa, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Firebar Grate", 0x2002daa, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Firebar Grate/Firebar Grate", 0x2002daa, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Dark Room Big", 0x2002dab, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Dark Room Big Chest/Dark Room Big Chest", 0x2002dab, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Dark Room Small", 0x2002dab, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@Dark Room Small Chest/Dark Room Small Chest", 0x2002dab, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Gyorg", 0x2002dab, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Gyorg/Gyorg", 0x2002dab, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW/Heart Piece", 0x2002dac, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Heart Piece/Heart Piece", 0x2002dac, 0x01)

	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Pre Big Key Door Big Chest", 0x2002da2, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Bombarossa Maze", 0x2002da2, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Block Maze Detour", 0x2002da2, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Spark Chest", 0x2002da3, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Flail Soldiers", 0x2002da4, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Moblin Archer Chest", 0x2002da4, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Block Maze Room", 0x2002da5, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Switch Chest", 0x2002da5, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Fire Wizzrobe Fight", 0x2002da6, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Pot Puzzle Key", 0x2002da7, 0x02)
	  decreaseChestCount(segment, "@POW Rupees/Rupees", {{0x2002da7, 0x04},{0x2002da7,0x08},{0x2002da7,0x10},{0x2002da7,0x20},{0x2002da7,0x40}})
	  decreaseChestCount(segment, "@Rupees/Rupees", {{0x2002da7, 0x04},{0x2002da7,0x08},{0x2002da7,0x10},{0x2002da7,0x20},{0x2002da7,0x40}})
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Twin Wizzrobe Fight", 0x2002da9, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Roller Chest", 0x2002da9, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Wizzrobe Platform Fight", 0x2002daa, 0x10)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Firebar Grate", 0x2002daa, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Dark Room Big", 0x2002dab, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Dark Room Small", 0x2002dab, 0x04)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Gyorg", 0x2002dab, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@POW Rupees/Heart Piece", 0x2002dac, 0x01)

	  --DHC
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Vaati", 0x2002ca6, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Vaati/Vaati", 0x2002ca6, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Northwest Tower", 0x2002dbb, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northwest Tower/Northwest Tower", 0x2002dbb, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Northeast Tower", 0x2002dbb, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northeast Tower/Northeast Tower", 0x2002dbb, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Southwest Tower", 0x2002dbc, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southwest Tower/Southwest Tower", 0x2002dbc, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Southeast Tower", 0x2002dbc, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southeast Tower/Southeast Tower", 0x2002dbc, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Big Block Chest", 0x2002dbc, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Big Block Chest/Big Block Chest", 0x2002dbc, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Post Throne Big Chest", 0x2002dbf, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Post Throne Big Chest/Post Throne Big Chest", 0x2002dbf, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Blade Chest", 0x2002dc0, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Blade Chest/Blade Chest", 0x2002dc0, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Platform Chest", 0x2002dc1, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Platform Chest/Platform Chest", 0x2002dc1, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC/Stone King", 0x2002dc2, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Stone King/Stone King", 0x2002dc2, 0x02)

	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Vaati", 0x2002ca6, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Vaati Open/Vaati", 0x2002ca6, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Northwest Tower", 0x2002dbb, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northwest Tower Open/Northwest Tower", 0x2002dbb, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Northeast Tower", 0x2002dbb, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northeast Tower Open/Northeast Tower", 0x2002dbb, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Southwest Tower", 0x2002dbc, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southwest Tower Open/Southwest Tower", 0x2002dbc, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Southeast Tower", 0x2002dbc, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southeast Tower Open/Southeast Tower", 0x2002dbc, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Big Block Chest", 0x2002dbc, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Big Block Chest Open/Big Block Chest", 0x2002dbc, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Post Throne Big Chest", 0x2002dbf, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Post Throne Big Chest Open/Post Throne Big Chest", 0x2002dbf, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Blade Chest", 0x2002dc0, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Blade Chest Open/Blade Chest", 0x2002dc0, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Platform Chest", 0x2002dc1, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Platform Chest Open/Platform Chest", 0x2002dc1, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Open/Stone King", 0x2002dc2, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Stone King Open/Stone King", 0x2002dc2, 0x02)

	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Vaati", 0x2002ca6, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Vaati Ped/Vaati", 0x2002ca6, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Northwest Tower", 0x2002dbb, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northwest Tower Ped/Northwest Tower", 0x2002dbb, 0x40)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Northeast Tower", 0x2002dbb, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Northeast Tower Ped/Northeast Tower", 0x2002dbb, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Southwest Tower", 0x2002dbc, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southwest Tower Ped/Southwest Tower", 0x2002dbc, 0x01)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Southeast Tower", 0x2002dbc, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Southeast Tower Ped/Southeast Tower", 0x2002dbc, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Big Block Chest", 0x2002dbc, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Big Block Chest Ped/Big Block Chest", 0x2002dbc, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Post Throne Big Chest", 0x2002dbf, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@Post Throne Big Chest Ped/Post Throne Big Chest", 0x2002dbf, 0x80)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Blade Chest", 0x2002dc0, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Blade Chest Ped/Blade Chest", 0x2002dc0, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Platform Chest", 0x2002dc1, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@Platform Chest Ped/Platform Chest", 0x2002dc1, 0x08)
	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Stone King", 0x2002dc2, 0x02)
	  updateSectionChestCountFromByteAndFlag(segment, "@Stone King Ped/Stone King", 0x2002dc2, 0x02)

	  updateSectionChestCountFromByteAndFlag(segment, "@DHC Fast/Win", 0x2002ca6, 0x20)
	  updateSectionChestCountFromByteAndFlag(segment, "@Pull the Pedestal/Just Win", 0x2002ca6, 0x20)
  end
end

function updateKeys(segment)
  if not isInGame() then
    return false
  end

  InvalidateReadCaches()

  if AUTOTRACKER_ENABLE_ITEM_TRACKING then
    updateBigKeys(segment, "dws_bigkey")
    updateBigKeys(segment, "cof_bigkey")
    updateBigKeys(segment, "fow_bigkey")
    updateBigKeys(segment, "tod_bigkey")
    updateBigKeys(segment, "pow_bigkey")
    updateBigKeys(segment, "dhc_bigkey")
    updateToggleItemFromByteAndFlag(segment, "dws_map", 0x2002ead, 0x01)
    updateToggleItemFromByteAndFlag(segment, "cof_map", 0x2002eae, 0x01)
    updateToggleItemFromByteAndFlag(segment, "fow_map", 0x2002eaf, 0x01)
    updateToggleItemFromByteAndFlag(segment, "tod_map", 0x2002eb0, 0x01)
    updateToggleItemFromByteAndFlag(segment, "pow_map", 0x2002eb1, 0x01)
    updateToggleItemFromByteAndFlag(segment, "dhc_map", 0x2002eb2, 0x01)
    updateToggleItemFromByteAndFlag(segment, "dws_compass", 0x2002ead, 0x02)
    updateToggleItemFromByteAndFlag(segment, "cof_compass", 0x2002eae, 0x02)
    updateToggleItemFromByteAndFlag(segment, "fow_compass", 0x2002eaf, 0x02)
    updateToggleItemFromByteAndFlag(segment, "tod_compass", 0x2002eb0, 0x02)
    updateToggleItemFromByteAndFlag(segment, "pow_compass", 0x2002eb1, 0x02)
    updateToggleItemFromByteAndFlag(segment, "dhc_compass", 0x2002eb2, 0x02)

    updateSmallKeys(segment, "dws_smallkey", 0x2002e9d)
    updateSmallKeys(segment, "cof_smallkey", 0x2002e9e)
    updateSmallKeys(segment, "fow_smallkey", 0x2002e9f)
    updateSmallKeys(segment, "tod_smallkey", 0x2002ea0)
    updateSmallKeys(segment, "pow_smallkey", 0x2002ea1)
    updateSmallKeys(segment, "dhc_smallkey", 0x2002ea2)
    updateSmallKeys(segment, "rc_smallkey", 0x2002ea3)
  end
  if AUTOTRACKER_ENABLE_LOCATION_TRACKING then
    updateSectionChestCountFromByteAndFlag(segment, "@Syrup's Hut/Witch's Item (60 Rupees)", 0x2002ea4, 0x04)
    updateSectionChestCountFromByteAndFlag(segment, "@Eastern Shops/Rem", 0x2002ea4, 0x08)
    updateSectionChestCountFromByteAndFlag(segment, "@Julietta's House/Bookshelf", 0x2002ea4, 0x10)
    updateSectionChestCountFromByteAndFlag(segment, "@Dr. Left's House/Dr. Left's House", 0x2002ea4, 0x20)
    updateSectionChestCountFromByteAndFlag(segment, "@Lake Cabin/Lake Cabin", 0x2002ea4, 0x40)
    updateSectionChestCountFromByteAndFlag(segment, "@Lake Cabin Open/Lake Cabin", 0x2002ea4, 0x40)
    updateSectionChestCountFromByteAndFlag(segment, "@Melari/Melari", 0x2002ea4, 0x80)
    updateSectionChestCountFromByteAndFlag(segment, "@Mines Obs/Melari", 0x2002ea4, 0x80)
    updateSectionChestCountFromByteAndFlag(segment, "@Melari Open/Melari", 0x2002ea4, 0x80)
    updateSectionChestCountFromByteAndFlag(segment, "@Mines/Melari", 0x2002ea4, 0x80)
    updateSectionChestCountFromByteAndFlag(segment, "@Belari/Belari", 0x2002ea5, 0x01)
    updateSectionChestCountFromByteAndFlag(segment, "@Belari Open/1st Item", 0x2002ea5, 0x01)
    updateSectionChestCountFromByteAndFlag(segment, "@Carlov/Carlov", 0x2002ea5, 0x02)
    updateSectionChestCountFromByteAndFlag(segment, "@Crenel Business Scrub/Crenel Business Scrub", 0x2002ea5, 0x04)
    updateSectionChestCountFromByteAndFlag(segment, "@Swiftblade's Dojo/Spin Attack", 0x2002ea5, 0x10)
    updateSectionChestCountFromByteAndFlag(segment, "@Swiftblade's Dojo/Rock Breaker", 0x2002ea5, 0x20)
    updateSectionChestCountFromByteAndFlag(segment, "@Swiftblade's Dojo/Dash Attack", 0x2002ea5, 0x40)
    updateSectionChestCountFromByteAndFlag(segment, "@Swiftblade's Dojo/Down Thrust", 0x2002ea5, 0x80)
    updateSectionChestCountFromByteAndFlag(segment, "@Grayblade/Grayblade", 0x2002ea6, 0x01)
    updateSectionChestCountFromByteAndFlag(segment, "@Grimblade/Grimblade", 0x2002ea6, 0x02)
    updateSectionChestCountFromByteAndFlag(segment, "@Waveblade/Waveblade", 0x2002ea6, 0x04)
    updateSectionChestCountFromByteAndFlag(segment, "@Swiftblade the First/Swiftblade the First", 0x2002ea6, 0x08)
    updateSectionChestCountFromByteAndFlag(segment, "@Waterfall/Scarblade", 0x2002ea6, 0x10)
    updateSectionChestCountFromByteAndFlag(segment, "@Lower Veil Falls Waterfall/Splitblade", 0x2002ea6, 0x20)
    updateSectionChestCountFromByteAndFlag(segment, "@North Field Waterfall/Greatblade", 0x2002ea6, 0x40)
    updateSectionChestCountFromByteAndFlag(segment, "@Stockwell's Shop/Wallet Spot (80 Rupees)", 0x2002ea7, 0x01)
    updateSectionChestCountFromByteAndFlag(segment, "@Stockwell's Shop/Boomerang Spot (300 Rupees)", 0x2002ea7, 0x02)
    updateSectionChestCountFromByteAndFlag(segment, "@Stockwell's Shop/Quiver Spot (600 Rupees)", 0x2002ea7, 0x04)
    updateSectionChestCountFromByteAndFlag(segment, "@Wind Ruins Joy Butterfly/Joy Butterfly", 0x2002ea7, 0x08)
    updateSectionChestCountFromByteAndFlag(segment, "@Castor Wilds Joy Butterfly/Joy Butterfly", 0x2002ea7, 0x10)
    updateSectionChestCountFromByteAndFlag(segment, "@Royal Valley Joy Butterfly/Joy Butterfly", 0x2002ea7, 0x20)
    updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Pedestal Two Elements", 0x2002ea7, 0x80)
    updateSectionChestCountFromByteAndFlag(segment, "@Pedestal Items/Two Elements", 0x2002ea7, 0x80)
    updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Pedestal Three Elements", 0x2002ea8, 0x01)
    updateSectionChestCountFromByteAndFlag(segment, "@Pedestal Items/Three Elements", 0x2002ea8, 0x01)
    updateSectionChestCountFromByteAndFlag(segment, "@DHC Ped/Pedestal Four Elements", 0x2002ea8, 0x02)
    updateSectionChestCountFromByteAndFlag(segment, "@Pedestal Items/Four Elements", 0x2002ea8, 0x02)
  end
end
ScriptHost:AddMemoryWatch("TMC Locations and Bosses", 0x2002c81, 0x200, updateLocations)
ScriptHost:AddMemoryWatch("TMC Item Data", 0x2002b30, 0x45, updateItemsFromMemorySegment)
ScriptHost:AddMemoryWatch("TMC Item Upgrades", 0x2002ae4, 0x0c, updateGearFromMemory)
ScriptHost:AddMemoryWatch("Graveyard Key", 0x2002ac0, 0x01, graveKey)
ScriptHost:AddMemoryWatch("TMC Keys", 0x2002d00, 0x200, updateKeys)
ScriptHost:AddMemoryWatch("TMC figurine", 0x2002af0, 0x01, figurine)
