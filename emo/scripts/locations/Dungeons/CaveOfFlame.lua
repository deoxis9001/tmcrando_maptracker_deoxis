function Json_Dungeon_CaveOfFlame_SpinyBeetleFight()
	if function_Cached("CoF_1F_SpikeBeetle_BigChest") == 1 then
		return 1
	elseif function_Cached("CoF_1F_SpikeBeetle_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_1F_SpikeBeetle_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_Rupees()
	if function_Cached("CoF_1F_Item") == 1 then
		return 1
	elseif function_Cached("CoF_1F_Item") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_1F_Item") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_BigChestRoom()
	if function_Cached("CoF_B1_HazyRoom_BigChest") == 1 then
		return 1
	elseif function_Cached("CoF_B1_HazyRoom_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B1_HazyRoom_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_FirstRollobiteRoom()
	if function_Cached("CoF_B1_Rollobite_Chest") == 1 then
		return 1
	elseif function_Cached("CoF_B1_Rollobite_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B1_Rollobite_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_BombableWallHeartPiece()
	if function_Cached("CoF_B1_HP") == 1 then
		return 1
	elseif function_Cached("CoF_B1_HP") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B1_HP") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_SpinyChuFight()
	if function_Cached("CoF_B1_SpikeyChus_BigChest") == 1 then
		return 1
	elseif function_Cached("CoF_B1_SpikeyChus_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B1_SpikeyChus_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_SpinyChuPillarChest()
	if function_Cached("CoF_B1_SpikeyChus_PillarChest") == 1 then
		return 1
	elseif function_Cached("CoF_B1_SpikeyChus_PillarChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B1_SpikeyChus_PillarChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_PreLavaBasementRoom()
	if function_Cached("CoF_B2_PreLava_Chest") == 1 then
		return 1
	elseif function_Cached("CoF_B2_PreLava_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B2_PreLava_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_BladeChest()
	if function_Cached("CoF_B2_LavaRoom_BladeChest") == 1 then
		return 1
	elseif function_Cached("CoF_B2_LavaRoom_BladeChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B2_LavaRoom_BladeChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_LavaBasement()
	if function_Cached("CoF_B2_LavaRoom_Chest") == 1 then
		return 1
	elseif function_Cached("CoF_B2_LavaRoom_Chest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B2_LavaRoom_Chest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_LavaBasementBigChest()
	if function_Cached("CoF_B2_LavaRoom_BigChest") == 1 then
		return 1
	elseif function_Cached("CoF_B2_LavaRoom_BigChest") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_B2_LavaRoom_BigChest") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_Dungeon_CaveOfFlame_Gleerok()
	if function_Cached("CoF_BossItem") == 1 then
		return 1
	elseif function_Cached("CoF_BossItem") == 2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("CoF_BossItem") == 3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
