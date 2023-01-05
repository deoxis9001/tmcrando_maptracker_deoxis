function Json_Dungeon_Palace_FirebarGrate() 
	if ( Palace_1stHalf_1F_GrateChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_WizzrobePlatformFight() 
	if ( Palace_1stHalf_1F_Wizrobe_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_PotPuzzleKey() 
	if ( Palace_1stHalf_3F_PotPuzzle_ItemDrop()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_Rupees() 
	if ( Palace_1stHalf_2F_Item()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_MoblinArcherChest() 
	if ( Palace_1stHalf_4F_BowMoblins_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_FlailSoldiers() 
	if ( Palace_1stHalf_5F_BallAndChainSoldiers_ItemDrop()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_SparkChest() 
	if ( Palace_1stHalf_5F_FanLoop_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_PreBigKeyDoorBigChest() 
	if ( Palace_1stHalf_5F_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_RollerChest() 
	if ( Palace_2ndHalf_2F_ManyRollers_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_DarkRoomBig() 
	if ( Palace_2ndHalf_1F_DarkRoom_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_DarkRoomSmall() 
	if ( Palace_2ndHalf_1F_DarkRoom_SmallChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_FireWizzrobeFight() 
	if ( Palace_2ndHalf_3F_FireWizrobes_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_TwinWizzrobeFight() 
	if ( Palace_2ndHalf_2F_TwinWizrobes_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_HeartPiece() 
	if ( Palace_2ndHalf_4F_HP()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_SwitchChest() 
	if ( Palace_2ndHalf_4F_SwitchHit_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_BombarossaMaze() 
	if ( Palace_2ndHalf_5F_Bombarossa_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_BlockMazeRoom() 
	if ( Palace_2ndHalf_4F_BlockMaze_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_BlockMazeDetour() 
	if ( Palace_2ndHalf_5F_RightSide_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Palace_Gyorg() 
	if ( Palace_BossItem()==1 ) then
		return 1
	else
		return 0
	end 
end