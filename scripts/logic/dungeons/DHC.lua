function Sanctuary_Pedestal_Item1()
	local count_element = 0
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
	if (count_element >= 2 and function_Cached("AccessDHC") == 1) then
		return 1
	elseif (count_element >= 2 and (function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2)) then
		return 2
	else
		return 0
	end
end

function Sanctuary_Pedestal_Item2()
	local count_element = 0
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
	if (count_element >= 3 and function_Cached("AccessDHC") == 1) then
		return 1
	elseif (count_element >= 3 and (function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2)) then
		return 2
	else
		return 0
	end
end

function Sanctuary_Pedestal_Item3()
	local count_element = 0
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
	if (count_element >= 4 and function_Cached("AccessDHC") == 1) then
		return 1
	elseif (count_element >= 4 and (function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2)) then
		return 2
	else
		return 0
	end
end

function DHC_B2_King()
	if (function_Cached("AccessDHC") == 1 and function_Cached("DHCKing") == 1) then
		return 1
	elseif ((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and function_Cached("DHCKing") == 1) then
		return 2
	else
		return 0
	end
end

function DHC_B1_BigChest()
	if (function_Cached("AccessDHC") == 1) then
		return 1
	elseif (function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) then
		return 2
	else
		return 0
	end
end

function DHC_1F_Blade_Chest()
	if
		(function_Cached("AccessDHC") == 1 and function_Cached("DHCFirstCanon") == 1 and
			function_Cached("DHCBladePuzzle") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(function_Cached("DHCFirstCanon") == 1 or function_Cached("DHCFirstCanon") == 2) and
			(function_Cached("DHCBladePuzzle") == 1 or function_Cached("DHCBladePuzzle") == 2))
	 then
		return 2
	else
		return 0
	end
end

function DHC_1F_Throne_BigChest()
	if
		(function_Cached("AccessDHC") == 1 and function_Cached("DHC1stDoor") == 1 and function_Cached("DHC2ndCanon") == 1 and
			function_Cached("BombWalls") == 1 and
			function_Cached("DHCThrone") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(function_Cached("DHC1stDoor") == 1 or function_Cached("DHC1stDoor") == 2) and
			(function_Cached("DHC2ndCanon") == 1 or function_Cached("DHC2ndCanon") == 2) and
			function_Cached("BombWalls") == 1 and
			(function_Cached("DHCThrone") == 1 or function_Cached("DHCThrone") == 2))
	 then
		return 2
	else
		return 0
	end
end

function DHC_3F_NorthWest_Chest()
	if
		(function_Cached("AccessDHC") == 1 and function_Cached("DHCBlackKnight") == 1 and
			function_Cached("DHCTowerDarknuts") == 1 and
			function_Cached("HasBow") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(function_Cached("DHCBlackKnight") == 1 or function_Cached("DHCBlackKnight") == 2) and
			(function_Cached("DHCTowerDarknuts") == 1 or function_Cached("DHCTowerDarknuts") == 2) and
			function_Cached("HasBow") == 1)
	 then
		return 2
	else
		return 0
	end
end

function DHC_3F_NorthEast_Chest()
	if
		(function_Cached("AccessDHC") == 1 and function_Cached("DHCBlackKnight") == 1 and
			function_Cached("DHCTowerDarknuts") == 1 and
			function_Cached("DHCLampPuzzle") == 1 and
			function_Cached("DHCGhini") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(function_Cached("DHCBlackKnight") == 1 or function_Cached("DHCBlackKnight") == 2) and
			(function_Cached("DHCTowerDarknuts") == 1 or function_Cached("DHCTowerDarknuts") == 2) and
			function_Cached("DHCLampPuzzle") == 1 and
			(function_Cached("DHCGhini") == 1 or function_Cached("DHCGhini") == 2))
	 then
		return 2
	else
		return 0
	end
end

function DHC_3F_SouthWest_Chest()
	if
		(function_Cached("AccessDHC") == 1 and function_Cached("DHCBlackKnight") == 1 and
			function_Cached("DHCTowerDarknuts") == 1 and
			function_Cached("DHCGhini") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(function_Cached("DHCBlackKnight") == 1 or function_Cached("DHCBlackKnight") == 2) and
			(function_Cached("DHCTowerDarknuts") == 1 or function_Cached("DHCTowerDarknuts") == 2) and
			(function_Cached("DHCGhini") == 1 or function_Cached("DHCGhini") == 2))
	 then
		return 2
	else
		return 0
	end
end

function DHC_3F_SouthEast_Chest()
	if
		(function_Cached("AccessDHC") == 1 and function_Cached("DHCBlackKnight") == 1 and
			function_Cached("DHCTowerDarknuts") == 1 and
			function_Cached("DHCSwitchPuzzles") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(function_Cached("DHCBlackKnight") == 1 or function_Cached("DHCBlackKnight") == 2) and
			(function_Cached("DHCTowerDarknuts") == 1 or function_Cached("DHCTowerDarknuts") == 2) and
			(function_Cached("DHCSwitchPuzzles") == 1 or function_Cached("DHCSwitchPuzzles") == 2))
	 then
		return 2
	else
		return 0
	end
end

function DHC_2F_BlueWarp_BigChest()
	if
		(function_Cached("AccessDHC") == 1 and function_Cached("DHCBlackKnight") == 1 and function_Cached("DHCBigBlock") == 1 and
			function_Cached("CanSplit4") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(function_Cached("DHCBlackKnight") == 1 or function_Cached("DHCBlackKnight") == 2) and
			(function_Cached("DHCBigBlock") == 1 or function_Cached("DHCBigBlock") == 2) and
			function_Cached("CanSplit4") == 1)
	 then
		return 2
	else
		return 0
	end
end

function BeatVaati()
	if
		(function_Cached("AccessDHC") == 1 and
			((function_Cached("DHC1stDoor") == 1 and function_Cached("BombWalls") == 1) or function_Cached("DHCRedWarp") == 1 or
				(function_Cached("DHCBlueWarp") == 1 and (function_Cached("OverworldBlocks") == 1 or has("cape")))) and
			function_Cached("DHCBossDoor") == 1 and
			function_Cached("CanSplit4") == 1 and
			function_Cached("HasBow") == 1 and
			has("gust") and
			has("cane") and
			function_Cached("DarkRooms") == 1)
	 then
		return 1
	elseif
		((function_Cached("AccessDHC") == 1 or function_Cached("AccessDHC") == 2) and
			(((function_Cached("DHC1stDoor") == 1 or function_Cached("DHC1stDoor") == 2) and function_Cached("BombWalls") == 1) or
				function_Cached("DHCRedWarp") == 1 or
				(function_Cached("DHCBlueWarp") == 1 and (function_Cached("OverworldBlocks") == 1 or has("cape")))) and
			function_Cached("DHCBossDoor") == 1 and
			function_Cached("CanSplit4") == 1 and
			function_Cached("HasBow") == 1 and
			has("gust") and
			has("cane") and
			(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2))
	 then
		return 2
	else
		return 0
	end
end
