function GrimbladeDojo()
  if Sword1()==1 and has("lamp") then
    return 1
  else
    return 0
  end
end
function mapX()
	return 1610
end
function mapy()
	return 360
end
-- function updateSectionChestCountFromByteAndFlag(segment, locationRef, address, flag)
    -- local location = Tracker:FindObjectForCode(locationRef)
            -- location.AvailableChestCount = 0
        -- else
            -- location.AvailableChestCount = 1
-- end