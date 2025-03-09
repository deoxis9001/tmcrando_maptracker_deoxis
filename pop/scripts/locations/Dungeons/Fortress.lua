function Json_Dungeon_Fortress_EntranceFarLeft()
	if function_Cached("Fortress_Entrance_1F_LeftChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Entrance_1F_LeftChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Entrance_1F_LeftChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_WizzrobeFight()
	if function_Cached("Fortress_Entrance_1F_LeftWizrobeChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Entrance_1F_LeftWizrobeChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Entrance_1F_LeftWizrobeChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_EntranceLargeRupee()
	if function_Cached("Deepwood_1F_SlugTorches_Chest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Deepwood_1F_SlugTorches_Chest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_SlugTorches_Chest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_EntranceLargeRupee()
	if function_Cached("Fortress_Entrance_1F_RightItem") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Entrance_1F_RightItem") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Entrance_1F_RightItem") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_LeftSideMittsChests()
	if function_Cached("Fortress_Left_2F_DigChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Left_2F_DigChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Left_2F_DigChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_LeftSideRupees()
	if function_Cached("Fortress_Left_2F_Item") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Left_2F_Item") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Left_2F_Item") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_LeftSideRupees5()
	if function_Cached("Fortress_Left_2F_Item5") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Left_2F_Item5") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Left_2F_Item5") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_Eyegores()
	if function_Cached("Fortress_Left_3F_Eyegore_BigChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Left_3F_Eyegore_BigChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Left_3F_Eyegore_BigChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_LeftSideKeyDrop()
	if function_Cached("Fortress_Left_3F_ItemDrop") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Left_3F_ItemDrop") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Left_3F_ItemDrop") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_RightSideTwoLeverRoom()
	if function_Cached("Fortress_Right_2F_LeftChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Right_2F_LeftChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Right_2F_LeftChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_RightSideMittsChests()
	if function_Cached("Fortress_Right_2F_DigChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Right_2F_DigChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Right_2F_DigChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_RightSideKeyDrop()
	if function_Cached("Fortress_Right_3F_ItemDrop") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Right_3F_ItemDrop") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Right_3F_ItemDrop") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_RightSideHeartPiece()
	if function_Cached("Fortress_Entrance_1F_RightHP") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Entrance_1F_RightHP") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Entrance_1F_RightHP") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_PedestalChest()
	if function_Cached("Fortress_Middle_2F_BigChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Middle_2F_BigChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Middle_2F_BigChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_CenterPathSwitch()
	if function_Cached("Fortress_Middle_2F_StatueChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Middle_2F_StatueChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Middle_2F_StatueChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_BombableWallBigChest()
	if function_Cached("Deepwood_1F_SlugTorches_Chest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Deepwood_1F_SlugTorches_Chest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Deepwood_1F_SlugTorches_Chest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_BombableWallBigChest()
	if function_Cached("Fortress_BackLeft_BigChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BackLeft_BigChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BackLeft_BigChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_BombableWallSmallChest()
	if function_Cached("Fortress_BackLeft_SmallChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BackLeft_SmallChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BackLeft_SmallChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_ClonePuzzleKeyDrop()
	if function_Cached("Fortress_BackRight_Statue_ItemDrop") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BackRight_Statue_ItemDrop") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BackRight_Statue_ItemDrop") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_MinishDirtRoomKeyDrop()
	if function_Cached("Fortress_BackRight_Minish_ItemDrop") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BackRight_Minish_ItemDrop") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BackRight_Minish_ItemDrop") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_RightSideMoldormTopPot()
	if function_Cached("Fortress_BackRight_DigRoom_TopPot") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BackRight_DigRoom_TopPot") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BackRight_DigRoom_TopPot") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_RightSideMoldormBottomPot()
	if function_Cached("Fortress_BackRight_DigRoom_BottomPot") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BackRight_DigRoom_BottomPot") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BackRight_DigRoom_BottomPot") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_SkullRoomChest()
	if function_Cached("Fortress_BackRight_BigChest") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BackRight_BigChest") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BackRight_BigChest") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_Mazaal()
	if function_Cached("Fortress_BossItem") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_BossItem") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_BossItem") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Fortress_FOWReward()
	if function_Cached("Fortress_Prize") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Fortress_Prize") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Fortress_Prize") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
