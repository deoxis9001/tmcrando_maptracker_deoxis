-- DirWorld="Dungeons/CaveOfFlame/"

function Json_Dungeon_CaveOfFlame_SpinyBeetleFight()
	if CoF_1F_SpikeBeetle_BigChest()==1 then
		return 1
	elseif CoF_1F_SpikeBeetle_BigChest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_1F_SpikeBeetle_BigChest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_Rupees()
	if CoF_1F_Item()==1 then
		return 1
	elseif CoF_1F_Item()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_1F_Item()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_BigChestRoom()
	if CoF_B1_HazyRoom_BigChest()==1 then
		return 1
	elseif CoF_B1_HazyRoom_BigChest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B1_HazyRoom_BigChest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_FirstRollobiteRoom()
	if CoF_B1_Rollobite_Chest()==1 then
		return 1
	elseif CoF_B1_Rollobite_Chest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B1_Rollobite_Chest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_BombableWallHeartPiece()
	if CoF_B1_HP()==1 then
		return 1
	elseif CoF_B1_HP()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B1_HP()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_SpinyChuFight()
	if CoF_B1_SpikeyChus_BigChest()==1 then
		return 1
	elseif CoF_B1_SpikeyChus_BigChest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B1_SpikeyChus_BigChest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_SpinyChuPillarChest()
	if CoF_B1_SpikeyChus_PillarChest()==1 then
		return 1
	elseif CoF_B1_SpikeyChus_PillarChest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B1_SpikeyChus_PillarChest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_PreLavaBasementRoom()
	if CoF_B2_PreLava_Chest()==1 then
		return 1
	elseif CoF_B2_PreLava_Chest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B2_PreLava_Chest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_BladeChest()
	if CoF_B2_LavaRoom_BladeChest()==1 then
		return 1
	elseif CoF_B2_LavaRoom_BladeChest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B2_LavaRoom_BladeChest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_LavaBasement()
	if CoF_B2_LavaRoom_Chest()==1 then
		return 1
	elseif CoF_B2_LavaRoom_Chest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B2_LavaRoom_Chest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_LavaBasementBigChest()
	if CoF_B2_LavaRoom_BigChest()==1 then
		return 1
	elseif CoF_B2_LavaRoom_BigChest()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_B2_LavaRoom_BigChest()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end

function Json_Dungeon_CaveOfFlame_Gleerok()
	if CoF_BossItem()==1 then
		return 1
	elseif CoF_BossItem()==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif CoF_BossItem()==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end