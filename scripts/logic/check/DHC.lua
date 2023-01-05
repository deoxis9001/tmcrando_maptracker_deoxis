function Sanctuary_Pedestal_Item1() 
	local count_element=0
	if has("water") then
		count_element = count_element + 1
	end
	if has("fire") then
		count_element = count_element + 1
	end
	if has("wind") then
		count_element = count_element + 1
	end
	if has("earth") then
		count_element = count_element + 1
	end
	if ( count_element>=2 ) then
		return 1
	else
		return 0
	end 
end

function Sanctuary_Pedestal_Item2() 
	local count_element=0
	if has("water") then
		count_element = count_element + 1
	end
	if has("fire") then
		count_element = count_element + 1
	end
	if has("wind") then
		count_element = count_element + 1
	end
	if has("earth") then
		count_element = count_element + 1
	end
	if ( count_element>=3 ) then
		return 1
	else
		return 0
	end 
end


function Sanctuary_Pedestal_Item3() 
	local count_element=0
	if has("water") then
		count_element = count_element + 1
	end
	if has("fire") then
		count_element = count_element + 1
	end
	if has("wind") then
		count_element = count_element + 1
	end
	if has("earth") then
		count_element = count_element + 1
	end
	if ( count_element>=4 ) then
		return 1
	else
		return 0
	end 
end


function DHC_B2_King() 
	if ( AccessDHC()==1 and DHCKing()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_B1_BigChest() 
	if ( AccessDHC()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_1F_Blade_Chest() 
	if ( AccessDHC()==1 and DHCFirstCanon()==1 and DHCBladePuzzle()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_1F_Throne_BigChest() 
	if ( AccessDHC()==1 and DHC1stDoor()==1 and DHC2ndCanon()==1 and BombWalls()==1 and DHCThrone()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_3F_NorthWest_Chest() 
	if ( AccessDHC()==1 and DHCBlackKnight()==1 and DHCTowerDarknuts()==1 and HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_3F_NorthEast_Chest() 
	if ( AccessDHC()==1 and DHCBlackKnight()==1 and DHCTowerDarknuts()==1 and DHCLampPuzzle()==1 and DHCGhini()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_3F_SouthWest_Chest() 
	if ( AccessDHC()==1 and DHCBlackKnight()==1 and DHCTowerDarknuts()==1 and DHCGhini()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_3F_SouthEast_Chest() 
	if ( AccessDHC()==1 and DHCBlackKnight()==1 and DHCTowerDarknuts()==1 and DHCSwitchPuzzles()==1 ) then
		return 1
	else
		return 0
	end 
end


function DHC_2F_BlueWarp_BigChest() 
	if ( AccessDHC()==1 and DHCBlackKnight()==1 and DHCBigBlock()==1 and CanSplit4()==1 ) then
		return 1
	else
		return 0
	end 
end


function BeatVaati() 
	if ( AccessDHC()==1 and ( ( DHC1stDoor()==1 and BombWalls()==1 ) or DHCRedWarp()==1 or (DHCBlueWarp()==1 and ( OverworldBlocks()==1 or has("cape") ) ) ) and DHCBossDoor()==1 and CanSplit4()==1  and HasBow()==1  and has("gust") and has ("cane") and DarkRooms()==1  ) then
		return 1
	else
		return 0
	end 
end



