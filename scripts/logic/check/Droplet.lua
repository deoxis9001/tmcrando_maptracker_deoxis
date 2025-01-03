function Droplets_Entrance_B2_EastIceblock()
	if function_Cached("TodDungeons") == 1 and function_Cached("ToDRightBlock") == 1 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and function_Cached("ToDRightBlock") == 1
	 then
		return 2
	else
		return 0
	end
end

function Droplets_Entrance_B2_WestIceblock()
	if function_Cached("TodDungeons") == 1 and function_Cached("ToDLeftBlock") == 1 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("ToDLeftBlock") == 1 or function_Cached("ToDLeftBlock") == 2)
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B1_UnderpassItem()
	if function_Cached("TodDungeons") == 1 and function_Cached("ToDMainRoom") == 1 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2)
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B1_Waterfall_BigChest()
	if function_Cached("TodDungeons") == 1 and function_Cached("ToDMainRoom") == 1 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2)
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B1_Waterfall_Underwater()
	if (function_Cached("TodDungeons") == 1 and function_Cached("ToDMainRoom") == 1 and has("flippers")) then
		return 1
	elseif
		((function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
			has("flippers"))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B2_Waterfall_Underwater()
	if
		(function_Cached("TodDungeons") == 1 and has("flippers") and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDLeftMushroomSwitch") == 1) or
				(function_Cached("ToDLilypadEnd") == 1 and function_Cached("ToDLeftReverse") == 1)))
	 then
		return 1
	elseif
		((function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and has("flippers") and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				function_Cached("ToDLeftMushroomSwitch") == 1) or
				((function_Cached("ToDLilypadEnd") == 1 or function_Cached("ToDLilypadEnd") == 2) and
					function_Cached("ToDLeftReverse") == 1)))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B2_Underwater_Pot()
	if
		function_Cached("TodDungeons") == 1 and has("flippers") and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDLeftMushroomSwitch") == 1) or
				function_Cached("ToDLilypadEnd") == 1)
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and has("flippers") and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				function_Cached("ToDLeftMushroomSwitch") == 1) or
				(function_Cached("ToDLilypadEnd") == 1 or function_Cached("ToDLilypadEnd") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B2_IceMadderpillar_BigChest()
	if
		function_Cached("TodDungeons") == 1 and has("gust") and function_Cached("ToDMadderpillars") == 1 and
			(function_Cached("ToDLilypadEnd") == 1 or
				(function_Cached("ToDMainRoom") == 1 and function_Cached("ToDBasementLilySpawn") == 1))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and has("gust") and
			(function_Cached("ToDMadderpillars") == 1 or function_Cached("ToDMadderpillars") == 2) and
			((function_Cached("ToDLilypadEnd") == 1 or function_Cached("ToDLilypadEnd") == 2) or
				((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
					(function_Cached("ToDBasementLilySpawn") == 1 or function_Cached("ToDBasementLilySpawn") == 2)))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B2_IcePlain_FrozenChest()
	if
		function_Cached("TodDungeons") == 1 and has("lamp") and
			((function_Cached("ToDMainRoom") == 1 and has("flippers") and function_Cached("ToDWestDoor") == 1 and
				function_Cached("ToDLeftPillars") == 1) or
				(function_Cached("ToDLilypadEnd") == 1 and (has("gust") or has("flippers") or has("cape"))))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and has("lamp") and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and has("flippers") and
				(function_Cached("ToDWestDoor") == 1 or function_Cached("ToDWestDoor") == 2) and
				function_Cached("ToDLeftPillars") == 1) or
				((function_Cached("ToDLilypadEnd") == 1 or function_Cached("ToDLilypadEnd") == 2) and
					(has("gust") or has("flippers") or has("cape"))))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B2_IcePlain_Chest()
	if
		function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and has("flippers") and function_Cached("ToDWestDoor") == 1 and
				function_Cached("ToDLeftMushroomSwitch") == 1 and
				function_Cached("ToDLeftPillars") == 1) or
				(function_Cached("ToDLilypadEnd") == 1 and (has("gust") or has("flippers") or has("cape"))))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and has("flippers") and
				(function_Cached("ToDWestDoor") == 1 or function_Cached("ToDWestDoor") == 2) and
				function_Cached("ToDLeftMushroomSwitch") == 1 and
				function_Cached("ToDLeftPillars") == 1) or
				((function_Cached("ToDLilypadEnd") == 1 or function_Cached("ToDLilypadEnd") == 2) and
					(has("gust") or has("flippers") or has("cape"))))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_LeftPath_B2_LilypadCorner_FrozenChest()
	if
		function_Cached("TodDungeons") == 1 and has("gust") and has("lamp") and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDBasementLilySpawn") == 1) or
				function_Cached("ToDLilypadEnd") == 1)
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and has("gust") and has("lamp") and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDBasementLilySpawn") == 1 or function_Cached("ToDBasementLilySpawn") == 2)) or
				(function_Cached("ToDLilypadEnd") == 1 or function_Cached("ToDLilypadEnd") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B1_1stChest()
	if
		(function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1 and
					function_Cached("ToDScissorBeetles") == 1 and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 1
	elseif
		((function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2)) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1 and
					(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 2
	else
		return 0
	end
end

-- function Droplets_RightPath_B1_2ndChest() -- no used
-- if ( function_Cached("TodDungeons")==1 and ( ( function_Cached("ToDMainRoom")==1 and function_Cached("ToDRightIceBlock")==1 ) or ( function_Cached("ToD2ndRupeePath")==1 and function_Cached("ToDDarkMazeReverse")==1 and function_Cached("ToDScissorBeetles")==1 and function_Cached("ToDRightIce")==1 ))) then
-- return 1
-- else
-- return 0
-- end
-- end

function Droplets_RightPath_B1_Pot()
	if
		(function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1 and
					function_Cached("ToDScissorBeetles") == 1 and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 1
	elseif
		((function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2)) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1 and
					(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B3_FrozenChest()
	if
		(function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1 and
					function_Cached("ToDScissorBeetles") == 1 and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 1
	elseif
		((function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2)) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1 and
					(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B1_BluChu_BigChest()
	if
		function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1 and
					function_Cached("ToDScissorBeetles") == 1 and
					function_Cached("ToDRightIce") == 1)) and
			function_Cached("ToDChuDoor") == 1 and
			function_Cached("HasChuDamage") == 1 and
			has("gust")
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2)) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1 and
					(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
					function_Cached("ToDRightIce") == 1)) and
			(function_Cached("ToDChuDoor") == 1 or function_Cached("ToDChuDoor") == 2) and
			(function_Cached("HasChuDamage") == 1 or function_Cached("HasChuDamage") == 2) and
			has("gust")
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B2_FrozenChest()
	if
		(function_Cached("TodDungeons") == 1 and has("lamp") and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1 and
					function_Cached("ToDScissorBeetles") == 1 and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 1
	elseif
		((function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and has("lamp") and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2)) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1 and
					(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
					function_Cached("ToDRightIce") == 1)))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B2_DarkMaze_BottomChest()
	if
		function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1 and
				function_Cached("ToDRightIce") == 1 and
				function_Cached("ToDScissorBeetles") == 1 and
				function_Cached("DarkRooms") == 1 and
				function_Cached("ToDDarkMaze") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2) and
				function_Cached("ToDRightIce") == 1 and
				(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
				(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2) and
				function_Cached("ToDDarkMaze") == 1) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B2_Mulldozers_ItemDrop()
	if
		function_Cached("TodDungeons") == 1 and function_Cached("BombWalls") == 1 and function_Cached("ToDMulldozer") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1 and
				function_Cached("ToDRightIce") == 1 and
				function_Cached("ToDScissorBeetles") == 1 and
				function_Cached("DarkRooms") == 1 and
				function_Cached("ToDDarkMaze") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and function_Cached("BombWalls") == 1 and
			(function_Cached("ToDMulldozer") == 1 or function_Cached("ToDMulldozer") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2) and
				function_Cached("ToDRightIce") == 1 and
				(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
				(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2) and
				function_Cached("ToDDarkMaze") == 1) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B2_DarkMaze_TopRightChest()
	if
		function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1 and
				function_Cached("ToDRightIce") == 1 and
				function_Cached("ToDScissorBeetles") == 1 and
				function_Cached("DarkRooms") == 1 and
				function_Cached("ToDDarkMaze") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and function_Cached("ToDDarkMazeReverse") == 1))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2) and
				function_Cached("ToDRightIce") == 1 and
				(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
				(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2) and
				function_Cached("ToDDarkMaze") == 1) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					function_Cached("ToDDarkMazeReverse") == 1))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B2_DarkMaze_TopLeftChest()
	if
		function_Cached("TodDungeons") == 1 and
			((function_Cached("ToDMainRoom") == 1 and function_Cached("ToDRightIceBlock") == 1 and
				function_Cached("ToDRightIce") == 1 and
				function_Cached("ToDScissorBeetles") == 1 and
				function_Cached("DarkRooms") == 1 and
				function_Cached("ToDDarkMaze") == 1) or
				(function_Cached("ToD2ndRupeePath") == 1 and
					(function_Cached("ToDDarkMazeReverse") == 1 or (function_Cached("ToDDarkMazeDoor") == 1 and has("lamp")))))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2) and
				function_Cached("ToDRightIce") == 1 and
				(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
				(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2) and
				function_Cached("ToDDarkMaze") == 1) or
				((function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2) and
					(function_Cached("ToDDarkMazeReverse") == 1 or
						((function_Cached("ToDDarkMazeDoor") == 1 and function_Cached("ToDDarkMazeDoor") == 2) and has("lamp")))))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B2_UnderpassItem()
	if function_Cached("TodDungeons") == 1 and function_Cached("ToD2ndRupeePath") == 1 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("ToD2ndRupeePath") == 1 or function_Cached("ToD2ndRupeePath") == 2)
	 then
		return 2
	else
		return 0
	end
end

function Droplets_RightPath_B2_UnderpassItem1_2()
	if function_Cached("TodDungeons") == 1 and function_Cached("ToDRightRupees") == 1 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("ToDRightRupees") == 1 or function_Cached("ToDRightRupees") == 2)
	 then
		return 2
	else
		return 0
	end
end

function CompleteDroplets()
	if has("tod") then
		return 1
	else
		return 0
	end
end

function Droplets_BossItem()
	if
		function_Cached("TodDungeons") == 1 and function_Cached("AccessOcto") == 1 and has("lamp") and
			(function_Cached("HasSword") == 1 or has("shield"))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("AccessOcto") == 1 or function_Cached("AccessOcto") == 2) and
			has("lamp") and
			(function_Cached("HasSword") == 1 or has("shield"))
	 then
		return 2
	else
		return 0
	end
end

function Droplets_Prize()
	if
		function_Cached("TodDungeons") == 1 and function_Cached("AccessOcto") == 1 and has("lamp") and
			(function_Cached("HasSword") == 1 or has("shield"))
	 then
		return 1
	elseif
		(function_Cached("TodDungeons") == 1 or function_Cached("TodDungeons") == 2) and
			(function_Cached("AccessOcto") == 1 or function_Cached("AccessOcto") == 2) and
			has("lamp") and
			(function_Cached("HasSword") == 1 or has("shield"))
	 then
		return 2
	else
		return 0
	end
end
