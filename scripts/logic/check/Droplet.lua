function Droplets_Entrance_B2_EastIceblock() 
	if ( TodDungeons()==1 and ToDRightBlock()==1 ) then
		return 1
	else
		return 0
	end 
end

function Droplets_Entrance_B2_WestIceblock() 
	if ( TodDungeons()==1 and ToDLeftBlock()==1 ) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B1_UnderpassItem() 
	if ( TodDungeons()==1 and ToDMainRoom()==1 ) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B1_Waterfall_BigChest() 
	if ( TodDungeons()==1 and ToDMainRoom()==1 ) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B1_Waterfall_Underwater() 
	if ( TodDungeons()==1 and ToDMainRoom()==1 and has("flippers")) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B2_Waterfall_Underwater() 
	if ( TodDungeons()==1 and has("flippers") and ( ( ToDMainRoom()==1 and ToDLeftMushroomSwitch()==1 ) or (ToDBlueWarp()==1 and ToDLeftReverse()==1 ) )) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B2_Underwater_Pot() 
	if ( TodDungeons()==1  and has("flippers")  and ( ( ToDMainRoom()==1 and ToDLeftPillars()==1 ) or ToDBlueWarp()==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B2_IceMadderpillar_BigChest() 
	if ( TodDungeons()==1 and has("gust") and ToDMadderpillars()==1 and ( ToDBlueWarp()==1 or (ToDMainRoom()==1 or ToDBasementLilySpawn()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B2_IcePlain_FrozenChest() 
	if ( TodDungeons()==1 and has("lamp") and ( ( ToDMainRoom()==1 and has("flippers") and ToDWestDoor()==1 and ToDLeftPillars()==1 ) or ( ToDBlueWarp()==1 and ( has("gust") or has("flippers") or ("cape") ) ) ) ) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B2_IcePlain_Chest() 
	if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and has("flippers") and ToDWestDoor()==1 and ToDLeftMushroomSwitch()==1 and ToDLeftPillars()==1 ) or ( ToDBlueWarp()==1 and ( has("gust") or has("flippers") or ("cape") ) ) ) ) then
		return 1
	else
		return 0
	end 
end

function Droplets_LeftPath_B2_LilypadCorner_FrozenChest() 
	if ( TodDungeons()==1 and has("gust") and has("lamp") and ( ( ToDMainRoom()==1 and ToDBasementLilySpawn()==1 ) or  ToDBlueWarp()==1 ) ) then
		return 1
	else
		return 0
	end 
end


function Droplets_RightPath_B1_1stChest() 
	if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 and ToDScissorBeetles()==1 and ToDRightIce()==1 ))) then
		return 1
	else
		return 0
	end 
end

-- function Droplets_RightPath_B1_2ndChest() -- no used
	-- if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 and ToDScissorBeetles()==1 and ToDRightIce()==1 ))) then
		-- return 1
	-- else
		-- return 0
	-- end 
-- end

function Droplets_RightPath_B1_Pot() 
	if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 and ToDScissorBeetles()==1 and ToDRightIce()==1 ))) then
		return 1
	else
		return 0
	end 
end

function Droplets_RightPath_B1_BluChu_BigChest() 
	if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 and ToDScissorBeetles()==1 and ToDRightIce()==1 )) and ToDChuDoor()==1 and HasChuDamage()==1 and has("gust") ) then
		return 1
	else
		return 0
	end 
end

function Droplets_RightPath_B3_FrozenChest() 
	if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 and ToDScissorBeetles()==1 and ToDRightIce()==1 ))) then
		return 1
	else
		return 0
	end 
end

function Droplets_RightPath_B2_FrozenChest() 
	if ( TodDungeons()==1 and has("lamp") and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 and ToDScissorBeetles()==1 and ToDRightIce()==1 ))) then
		return 1
	else
		return 0
	end 
end

function Droplets_RightPath_B2_DarkMaze_BottomChest() 
	if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 and ToDRightIce()==1 and ToDScissorBeetles()==1 and DarkRooms()==1 and ToDDarkMaze()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end

function Droplets_RightPath_B2_Mulldozers_ItemDrop() 
	if ( TodDungeons()==1 and BombWalls()==1 and ToDMulldozer()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 and ToDRightIce()==1 and ToDScissorBeetles()==1 and DarkRooms()==1 and ToDDarkMaze()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end

-- function Droplets_RightPath_B2_DarkMaze_TopRightChest() 
	-- if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 and ToDRightIce()==1 and ToDScissorBeetles()==1 and DarkRooms()==1 and ToDDarkMaze()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 ) ) ) then
		-- return 1
	-- else
		-- return 0
	-- end 
-- end

-- function Droplets_RightPath_B2_DarkMaze_TopLeftChest() 
	-- if ( TodDungeons()==1 and ( ( ToDMainRoom()==1 and ToDRightIceBlock()==1 and ToDRightIce()==1 and ToDScissorBeetles()==1 and DarkRooms()==1 and ToDDarkMaze()==1 ) or ( ToD2ndRupeePath()==1 and ToDDarkMazeReverse()==1 ) ) ) then
		-- return 1
	-- else
		-- return 0
	-- end 
-- end

function Droplets_RightPath_B2_UnderpassItem() 
	if ( TodDungeons()==1 and ToD2ndRupeePath()==1 ) then
		return 1
	else
		return 0
	end 
end

function CompleteDroplets() 
	if ( has("tod") ) then
		return 1
	else
		return 0
	end 
end

function Droplets_BossItem() 
	if ( AccessOcto()==1 and has("lamp") and ( HasSword()==1 or has("shield") ) ) then
		return 1
	else
		return 0
	end 
end

function Droplets_Prize() 
	if ( AccessOcto()==1 and has("lamp") and ( HasSword()==1 or has("shield") ) ) then
		return 1
	else
		return 0
	end 
end 