function Json_Dungeon_Droplet_FirstIceBlock()
	if function_Cached("Droplets_Entrance_B2_EastIceblock") == 1 then
		return 1
	elseif function_Cached("Droplets_Entrance_B2_EastIceblock") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_Entrance_B2_EastIceblock") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_LockedIceBlock()
	if function_Cached("Droplets_Entrance_B2_WestIceblock") == 1 then
		return 1
	elseif function_Cached("Droplets_Entrance_B2_WestIceblock") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_Entrance_B2_WestIceblock") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_PostMadderpillarChest()
	if function_Cached("Droplets_LeftPath_B2_IceMadderpillar_BigChest") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B2_IceMadderpillar_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B2_IceMadderpillar_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_UnderwaterPot()
	if function_Cached("Droplets_LeftPath_B2_Underwater_Pot") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B2_Underwater_Pot") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B2_Underwater_Pot") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_OverhangChest()
	if function_Cached("Droplets_LeftPath_B1_Waterfall_BigChest") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B1_Waterfall_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B1_Waterfall_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_LeftPathRupees()
	if function_Cached("Droplets_LeftPath_B1_UnderpassItem") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B1_UnderpassItem") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B1_UnderpassItem") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_RightPathRupees()
	if function_Cached("Droplets_RightPath_B2_UnderpassItem") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B2_UnderpassItem") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B2_UnderpassItem") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_RightPathRupees1_2()
	if function_Cached("Droplets_RightPath_B2_UnderpassItem1_2") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B2_UnderpassItem1_2") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B2_UnderpassItem1_2") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_UpperWaterRupees()
	if function_Cached("Droplets_LeftPath_B1_Waterfall_Underwater") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B1_Waterfall_Underwater") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B1_Waterfall_Underwater") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_LowerWaterRupees()
	if function_Cached("Droplets_LeftPath_B2_Waterfall_Underwater") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B2_Waterfall_Underwater") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B2_Waterfall_Underwater") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_IcePuzzleFreeChest()
	if function_Cached("Droplets_LeftPath_B2_IcePlain_Chest") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B2_IcePlain_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B2_IcePlain_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_IcePuzzleFrozenChest()
	if function_Cached("Droplets_LeftPath_B2_IcePlain_FrozenChest") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B2_IcePlain_FrozenChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B2_IcePlain_FrozenChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_PostIcePuzzleFrozenChest()
	if function_Cached("Droplets_LeftPath_B2_LilypadCorner_FrozenChest") == 1 then
		return 1
	elseif function_Cached("Droplets_LeftPath_B2_LilypadCorner_FrozenChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_LeftPath_B2_LilypadCorner_FrozenChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_RightPathIceWalkwayChests()
	if function_Cached("Droplets_RightPath_B1_1stChest") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B1_1stChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B1_1stChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_RightPathIceWalkwayPot()
	if function_Cached("Droplets_RightPath_B1_Pot") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B1_Pot") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B1_Pot") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_BasementFrozenChest()
	if function_Cached("Droplets_RightPath_B3_FrozenChest") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B3_FrozenChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B3_FrozenChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_BlueChu()
	if function_Cached("Droplets_RightPath_B1_BluChu_BigChest") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B1_BluChu_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B1_BluChu_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_PostBlueChuFrozenChest()
	if function_Cached("Droplets_RightPath_B2_FrozenChest") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B2_FrozenChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B2_FrozenChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_DarkMazeBottomChest()
	if function_Cached("Droplets_RightPath_B2_DarkMaze_BottomChest") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B2_DarkMaze_BottomChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B2_DarkMaze_BottomChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplets_DarkMazeTopRightChest()
	if function_Cached("Droplets_RightPath_B2_DarkMaze_TopRightChest") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B2_DarkMaze_TopRightChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B2_DarkMaze_TopRightChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplets_DarkMazeTopLeftChest()
	if function_Cached("Droplets_RightPath_B2_DarkMaze_TopLeftChest") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B2_DarkMaze_TopLeftChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B2_DarkMaze_TopLeftChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_DarkMazeBombWall()
	if function_Cached("Droplets_RightPath_B2_Mulldozers_ItemDrop") == 1 then
		return 1
	elseif function_Cached("Droplets_RightPath_B2_Mulldozers_ItemDrop") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_RightPath_B2_Mulldozers_ItemDrop") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Droplet_Octo()
	if function_Cached("Droplets_BossItem") == 1 then
		return 1
	elseif function_Cached("Droplets_BossItem") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Droplets_BossItem") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
