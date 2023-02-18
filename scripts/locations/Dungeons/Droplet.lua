function Json_Dungeon_Droplet_FirstIceBlock()
	if ( Droplets_Entrance_B2_EastIceblock()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_LockedIceBlock()
	if ( Droplets_Entrance_B2_WestIceblock()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_PostMadderpillarChest()
	if ( Droplets_LeftPath_B2_IceMadderpillar_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_UnderwaterPot()
	if ( Droplets_LeftPath_B2_Underwater_Pot()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_OverhangChest()
	if ( Droplets_LeftPath_B1_Waterfall_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_LeftPathRupees()
	if ( Droplets_LeftPath_B1_UnderpassItem()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_RightPathRupees()
	if ( Droplets_RightPath_B2_UnderpassItem()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_RightPathRupees1_2()
	if ( Droplets_RightPath_B2_UnderpassItem1_2()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_UpperWaterRupees()
	if ( Droplets_LeftPath_B1_Waterfall_Underwater()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_LowerWaterRupees()
	if ( Droplets_LeftPath_B2_Waterfall_Underwater()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_IcePuzzleFreeChest()
	if ( Droplets_LeftPath_B2_IcePlain_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_IcePuzzleFrozenChest()
	if ( Droplets_LeftPath_B2_IcePlain_FrozenChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_PostIcePuzzleFrozenChest()
	if ( Droplets_LeftPath_B2_LilypadCorner_FrozenChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_RightPathIceWalkwayChests()
	if ( Droplets_RightPath_B1_1stChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_RightPathIceWalkwayPot()
	if ( Droplets_RightPath_B1_Pot()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_BasementFrozenChest()
	if ( Droplets_RightPath_B3_FrozenChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_BlueChu()
	if ( Droplets_RightPath_B1_BluChu_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_PostBlueChuFrozenChest()
	if ( Droplets_RightPath_B2_FrozenChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_DarkMaze()
	if ( Droplets_RightPath_B2_DarkMaze_BottomChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_DarkMazeBombWall()
	if ( Droplets_RightPath_B2_Mulldozers_ItemDrop()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Dungeon_Droplet_Octo()
	if ( Droplets_BossItem()==1 ) then
		return 1
	else
		return 0
	end 
end