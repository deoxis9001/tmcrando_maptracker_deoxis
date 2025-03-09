function Json_Dungeon_Deepwood_SlugRoom()
	if function_Cached("Deepwood_1F_SlugTorches_Chest") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_SlugTorches_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_SlugTorches_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_UpstairsChest()
	if function_Cached("Deepwood_2F_Chest") == 1 then
		return 1
	elseif function_Cached("Deepwood_2F_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_2F_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_BarrelRoomNorthwest()
	if function_Cached("Deepwood_1F_BarrelRoom_Chest") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_BarrelRoom_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_BarrelRoom_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_WestSideBigChest()
	if function_Cached("Deepwood_1F_West_BigChest") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_West_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_West_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_TwoStatueRoom()
	if function_Cached("Deepwood_1F_West_StatuePuzzle_Chest") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_West_StatuePuzzle_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_West_StatuePuzzle_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_MulldozerKey()
	if function_Cached("Deepwood_1F_East_MulldozerFight_Item") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_East_MulldozerFight_Item") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_East_MulldozerFight_Item") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_TwoLampChest()
	if function_Cached("Deepwood_1F_NorthEast_Chest") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_NorthEast_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_NorthEast_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_BasementSwitchRoomBigChest()
	if function_Cached("Deepwood_B1_SwitchRoom_BigChest") == 1 then
		return 1
	elseif function_Cached("Deepwood_B1_SwitchRoom_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_B1_SwitchRoom_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_BasementSwitchChest()
	if function_Cached("Deepwood_B1_SwitchRoom_Chest") == 1 then
		return 1
	elseif function_Cached("Deepwood_B1_SwitchRoom_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_B1_SwitchRoom_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_BlueWarpHeartPiece()
	if function_Cached("Deepwood_1F_BlueWarp_HP") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_BlueWarp_HP") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_BlueWarp_HP") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_PuffstoolRoom()
	if function_Cached("Deepwood_1F_BlueWarp_Chest") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_BlueWarp_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_BlueWarp_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_MadderpillarChest()
	if function_Cached("Deepwood_1F_Madderpillar_BigChest") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_Madderpillar_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_Madderpillar_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_MadderpillarHeartPiece()
	if function_Cached("Deepwood_1F_Madderpillar_HP") == 1 then
		return 1
	elseif function_Cached("Deepwood_1F_Madderpillar_HP") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_Madderpillar_HP") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_BasementBigChest()
	if function_Cached("Deepwood_B1_West_BigChest") == 1 then
		return 1
	elseif function_Cached("Deepwood_B1_West_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_B1_West_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_Deepwood_GreenChu()
	if function_Cached("Deepwood_BossItem") == 1 then
		return 1
	elseif function_Cached("Deepwood_BossItem") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_BossItem") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
