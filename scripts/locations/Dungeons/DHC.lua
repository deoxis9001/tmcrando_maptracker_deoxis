function Json_Dungeon_DHC_Win() 
	if function_Cached("AccessDHC")==1 then
		return 1
	elseif function_Cached("AccessDHC")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end

function Json_Dungeon_DHC_PedestalTwoElements() 
	if function_Cached("Sanctuary_Pedestal_Item1")==1 then
		return 1
	elseif function_Cached("Sanctuary_Pedestal_Item1")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Sanctuary_Pedestal_Item1")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PedestalThreeElements() 
	if function_Cached("Sanctuary_Pedestal_Item2")==1 then
		return 1
	elseif function_Cached("Sanctuary_Pedestal_Item2")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Sanctuary_Pedestal_Item2")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PedestalFourElements() 
	if function_Cached("Sanctuary_Pedestal_Item3")==1 then
		return 1
	elseif function_Cached("Sanctuary_Pedestal_Item3")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Sanctuary_Pedestal_Item3")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_BladeChest() 
	if function_Cached("DHC_1F_Blade_Chest")==1 then
		return 1
	elseif function_Cached("DHC_1F_Blade_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_1F_Blade_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PlatformChest() 
	if function_Cached("DHC_B1_BigChest")==1 then
		return 1
	elseif function_Cached("DHC_B1_BigChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_B1_BigChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_StoneKing() 
	if function_Cached("DHC_B2_King")==1 then
		return 1
	elseif function_Cached("DHC_B2_King")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_B2_King")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PostThroneBigChest() 
	if function_Cached("DHC_1F_Throne_BigChest")==1 then
		return 1
	elseif function_Cached("DHC_1F_Throne_BigChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_1F_Throne_BigChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_NortheastTower() 
	if function_Cached("DHC_3F_NorthEast_Chest")==1 then
		return 1
	elseif function_Cached("DHC_3F_NorthEast_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_3F_NorthEast_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_SoutheastTower() 
	if function_Cached("DHC_3F_SouthEast_Chest")==1 then
		return 1
	elseif function_Cached("DHC_3F_SouthEast_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_3F_SouthEast_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_SouthwestTower() 
	if function_Cached("DHC_3F_SouthWest_Chest")==1 then
		return 1
	elseif function_Cached("DHC_3F_SouthWest_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_3F_SouthWest_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_NorthwestTower() 
	if function_Cached("DHC_3F_NorthWest_Chest")==1 then
		return 1
	elseif function_Cached("DHC_3F_NorthWest_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_3F_NorthWest_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_BigBlockChest() 
	if function_Cached("DHC_2F_BlueWarp_BigChest")==1 then
		return 1
	elseif function_Cached("DHC_2F_BlueWarp_BigChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("DHC_2F_BlueWarp_BigChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end


function Json_Dungeon_DHC_Vaati() 
	if function_Cached("BeatVaati")==1 then
		return 1
	elseif function_Cached("BeatVaati")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("BeatVaati")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

