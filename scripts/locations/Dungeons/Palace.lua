function Json_Dungeon_Palace_FirebarGrate() 
	if function_Cached("Palace_1stHalf_1F_GrateChest")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_1F_GrateChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_1F_GrateChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_WizzrobePlatformFight() 
	if function_Cached("Palace_1stHalf_1F_Wizrobe_BigChest")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_1F_Wizrobe_BigChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_1F_Wizrobe_BigChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_PotPuzzleKey() 
	if function_Cached("Palace_1stHalf_3F_PotPuzzle_ItemDrop")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_3F_PotPuzzle_ItemDrop")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_3F_PotPuzzle_ItemDrop")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_Rupees() 
	if function_Cached("Palace_1stHalf_2F_Item")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_2F_Item")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_2F_Item")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_MoblinArcherChest() 
	if function_Cached("Palace_1stHalf_4F_BowMoblins_Chest")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_4F_BowMoblins_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_4F_BowMoblins_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_FlailSoldiers() 
	if function_Cached("Palace_1stHalf_5F_BallAndChainSoldiers_ItemDrop")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_5F_BallAndChainSoldiers_ItemDrop")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_5F_BallAndChainSoldiers_ItemDrop")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_SparkChest() 
	if function_Cached("Palace_1stHalf_5F_FanLoop_Chest")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_5F_FanLoop_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_5F_FanLoop_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_PreBigKeyDoorBigChest() 
	if function_Cached("Palace_1stHalf_5F_BigChest")==1 then
		return 1
	elseif function_Cached("Palace_1stHalf_5F_BigChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_1stHalf_5F_BigChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_RollerChest() 
	if function_Cached("Palace_2ndHalf_2F_ManyRollers_Chest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_2F_ManyRollers_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_2F_ManyRollers_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_DarkRoomBig() 
	if function_Cached("Palace_2ndHalf_1F_DarkRoom_BigChest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_1F_DarkRoom_BigChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_1F_DarkRoom_BigChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_DarkRoomSmall() 
	if function_Cached("Palace_2ndHalf_1F_DarkRoom_SmallChest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_1F_DarkRoom_SmallChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_1F_DarkRoom_SmallChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_FireWizzrobeFight() 
	if function_Cached("Palace_2ndHalf_3F_FireWizrobes_BigChest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_3F_FireWizrobes_BigChest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_3F_FireWizrobes_BigChest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_TwinWizzrobeFight() 
	if function_Cached("Palace_2ndHalf_2F_TwinWizrobes_Chest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_2F_TwinWizrobes_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_2F_TwinWizrobes_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_HeartPiece() 
	if function_Cached("Palace_2ndHalf_4F_HP")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_4F_HP")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_4F_HP")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_SwitchChest() 
	if function_Cached("Palace_2ndHalf_4F_SwitchHit_Chest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_4F_SwitchHit_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_4F_SwitchHit_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_BombarossaMaze() 
	if function_Cached("Palace_2ndHalf_5F_Bombarossa_Chest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_5F_Bombarossa_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_5F_Bombarossa_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_BlockMazeRoom() 
	if function_Cached("Palace_2ndHalf_4F_BlockMaze_Chest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_4F_BlockMaze_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_4F_BlockMaze_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_BlockMazeDetour() 
	if function_Cached("Palace_2ndHalf_5F_RightSide_Chest")==1 then
		return 1
	elseif function_Cached("Palace_2ndHalf_5F_RightSide_Chest")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_2ndHalf_5F_RightSide_Chest")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end

function Json_Dungeon_Palace_Gyorg() 
	if function_Cached("Palace_BossItem")==1 then
		return 1
	elseif function_Cached("Palace_BossItem")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif function_Cached("Palace_BossItem")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end