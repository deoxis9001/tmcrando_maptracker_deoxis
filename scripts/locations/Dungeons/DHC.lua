function Json_Dungeon_DHC_Win() 
	if ( AccessDHC()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_DHC_PedestalTwoElements() 
	if ( Sanctuary_Pedestal_Item1()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PedestalThreeElements() 
	if ( Sanctuary_Pedestal_Item2()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PedestalFourElements() 
	if ( Sanctuary_Pedestal_Item3()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_BladeChest() 
	if ( DHC_1F_Blade_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PlatformChest() 
	if ( DHC_B1_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_StoneKing() 
	if ( DHC_B2_King()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_PostThroneBigChest() 
	if ( DHC_1F_Throne_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_NortheastTower() 
	if ( DHC_3F_NorthEast_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_SoutheastTower() 
	if ( DHC_3F_SouthEast_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_SouthwestTower() 
	if ( DHC_3F_SouthWest_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_NorthwestTower() 
	if ( DHC_3F_NorthWest_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_BigBlockChest() 
	if ( DHC_2F_BlueWarp_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Dungeon_DHC_Vaati() 
	if ( BeatVaati()==1 ) then
		return 1
	else
		return 0
	end 
end

