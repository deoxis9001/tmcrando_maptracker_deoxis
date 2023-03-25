function Palace_1stHalf_1F_GrateChest() 
	if PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_1F_Wizrobe_BigChest() 
	if PowDungeons()==1 and ( has("cape") or has("bombs") or HasMagicBoomerang()==1 ) and ( CanSplit3()==1 or CanSplit4()==1 ) then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( has("cape") or has("bombs") or HasMagicBoomerang()==1 ) and ( CanSplit3()==1 or CanSplit4()==1 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_2F_Item() 
	if PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1) and PoWRupees()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and has("cape") and ( CanSplit3()==1 or CanSplit4()==1) and PoWRupees()==1 then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_3F_PotPuzzle_ItemDrop() 
	if ( PowDungeons()==1 and PoWDrop()==1) then
		return 1
	elseif ( ( PowDungeons()==1 or PowDungeons()==2 ) and PoWDrop()==1) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_4F_BowMoblins_Chest()
	if PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1) and PoWJump()==1 and PoW1stDoor()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and has("cape") and ( CanSplit3()==1 or CanSplit4()==1) and ( PoWJump()==1 or PoWJump()==2 ) and ( PoW1stDoor()==1 or PoW1stDoor()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_5F_BallAndChainSoldiers_ItemDrop() 
	if PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoW1stDoor()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and ( PoWJump()==1 or PoWJump()==2 ) and ( PoW1stDoor()==1 or PoW1stDoor()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_5F_FanLoop_Chest() 
	if PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoWFans()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and ( PoWJump()==1 or PoWJump()==2 ) and ( PoWFans()==1 or PoWFans()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_5F_BigChest() 
	if PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoWBigChest()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and ( PoWJump()==1 or PoWJump()==2 ) and ( PoWBigChest()==1 or PoWBigChest()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_1F_DarkRoom_BigChest() 
	if PowDungeons()==1 and ( PoW2ndHalf()==1 or (PoWRedWarp()==1 and OverworldBlocks()==1 )) and DarkRooms()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) or (PoWRedWarp()==1 and OverworldBlocks()==1 )) and ( DarkRooms()==1 or DarkRooms()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_1F_DarkRoom_SmallChest() 
	if PowDungeons()==1 and ( PoW2ndHalf()==1 or (PoWRedWarp()==1 and OverworldBlocks()==1 )) and DarkRooms()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) or (PoWRedWarp()==1 and OverworldBlocks()==1 )) and ( DarkRooms()==1 or DarkRooms()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_2F_ManyRollers_Chest() 
	if PowDungeons()==1 and ( ( DarkRooms()==1 and PoW2ndHalf()==1 ) or (PoWRedWarp()==1 and OverworldBlocks()==1) ) and PoWPeahatRoom()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) ) or (PoWRedWarp()==1 and OverworldBlocks()==1) ) and PoWPeahatRoom()==1 then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_2F_TwinWizrobes_Chest() 
	if PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoW2ndHalf()==1 ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 ) ) and PoWDoubleWiz()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 ) ) and ( PoWDoubleWiz()==1 or PoWDoubleWiz()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_3F_FireWizrobes_BigChest() 
	if PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoW2ndHalf()==1 ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 )) and PoWTribleWiz()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 )) and ( PoWTribleWiz()==1 or PoWTribleWiz()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_HP() 
	if PowDungeons()==1 and has("cape") and PoWHP()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and has("cape") and ( PoWHP()==1 or PoWHP()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_SwitchHit_Chest() 
	if PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and PoWSwitch()==1 and PoW2ndHalf()==1 ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 and PoWSwitch()==1 and ( has("cape") or PoWHandRoom()==1 ) ) ) then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoWHandRoom()==1 or PoWHandRoom()==2 ) and has("cape") and PoWSwitch()==1 and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 and PoWSwitch()==1 and ( has("cape") or PoWHandRoom()==1 ) ) ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_5F_Bombarossa_Chest() 
	if PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and PoW2ndHalf()==1 ) or PoWRedWarp()==1 ) and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoWHandRoom()==1 or PoWHandRoom()==2 ) and has("cape") and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) ) or PoWRedWarp()==1 ) and ( PoWRedWarpDoor()==1 or PoWRedWarpDoor()==2 ) and BombWalls()==1 and OverworldBlocks()==1 then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_BlockMaze_Chest() 
	if PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and PoW2ndHalf()==1 ) or PoWRedWarp()==1 ) and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoWHandRoom()==1 or PoWHandRoom()==2 ) and has("cape") and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) ) or PoWRedWarp()==1 ) and ( PoWRedWarpDoor()==1 or PoWRedWarpDoor()==2 ) and BombWalls()==1 and OverworldBlocks()==1 and ( PoWLastDoor()==1 or PoWLastDoor()==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_5F_RightSide_Chest() 
	if PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and PoW2ndHalf()==1 ) or PoWRedWarp()==1 ) and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 and has("cape") then
		return 1
	elseif ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoWHandRoom()==1 or PoWHandRoom()==2 ) and has("cape") and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) ) or PoWRedWarp()==1 ) and ( PoWRedWarpDoor()==1 or PoWRedWarpDoor()==2 ) and BombWalls()==1 and OverworldBlocks()==1 and ( PoWLastDoor()==1 or PoWLastDoor()==2 ) and has("cape") then
		return 2
	else
		return 0
	end 
end

function CompletePalace()
	if has("pow" ) then 
		return 1
	else
		return 0
	end 
end

function Palace_BossItem() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or PoWRedWarp()==1 ) and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 and has("cape") and PoWBossDoor()==1 and (CanDownThrust()==1 or CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) ) then
		return 1
	elseif ( ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoWHandRoom()==1 or PoWHandRoom()==2 ) and has("cape") and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 or PoWBlueWarp()==1 )) or PoWRedWarp()==1 ) and ( PoWRedWarpDoor()==1 or PoWRedWarpDoor()==2 ) and BombWalls()==1 and OverworldBlocks()==1 and ( PoWLastDoor()==1 or PoWLastDoor()==2 ) and has("cape") and ( PoWBossDoor()==1 or PoWBossDoor()==2 ) and (CanDownThrust()==1 or CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Palace_Prize() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or PoWRedWarp()==1 ) and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 and has("cape") and PoWBossDoor()==1 and (CanDownThrust()==1 or CanSplit2()==1 ) ) then
		return 1
	elseif ( ( PowDungeons()==1 or PowDungeons()==2 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoWHandRoom()==1 or PoWHandRoom()==2 ) and has("cape") and ( PoW2ndHalf()==1 or PoW2ndHalf()==2 or PoWBlueWarp()==1 )) or PoWRedWarp()==1 ) and ( PoWRedWarpDoor()==1 or PoWRedWarpDoor()==2 ) and BombWalls()==1 and OverworldBlocks()==1 and ( PoWLastDoor()==1 or PoWLastDoor()==2 ) and has("cape") and ( PoWBossDoor()==1 or PoWBossDoor()==2 ) and (CanDownThrust()==1 or CanSplit2()==1 ) ) then
		return 2
	else
		return 0
	end 
end