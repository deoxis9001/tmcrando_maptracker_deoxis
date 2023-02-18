function Palace_1stHalf_1F_GrateChest() 
	if ( PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1)  and PoWPreKeyDoor()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_1stHalf_1F_Wizrobe_BigChest() 
	if ( PowDungeons()==1 and ( has("cape") or has("bombs") or HasMagicBoomerang()==1 ) and ( CanSplit3()==1 or CanSplit4()==1)  and PoWPreKeyDoor()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_1stHalf_2F_Item() 
	if ( PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or  CanSplit4()==1)  and PoWRupees()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_1stHalf_3F_PotPuzzle_ItemDrop() 
	if ( ( PowDungeons()==1 and PoWDrop()==1)) then
		return 1
	else
		return 0
	end 
end

function Palace_1stHalf_4F_BowMoblins_Chest() 
	if ( PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1)  and PoWJump()==1 and PoWPostKeyDoor()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_1stHalf_5F_BallAndChainSoldiers_ItemDrop() 
	if ( PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoWPostKeyDoor()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_1stHalf_5F_FanLoop_Chest() 
	if ( PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoWFans()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_1stHalf_5F_BigChest() 
	if ( PowDungeons()==1 and has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoWBigChest()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_1F_DarkRoom_BigChest() 
	if ( PowDungeons()==1 and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 or (PoWRedWarp()==1 and OverworldBlocks()==1 )) and DarkRooms()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_1F_DarkRoom_SmallChest() 
	if ( PowDungeons()==1 and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 or (PoWRedWarp()==1 and OverworldBlocks()==1 )) and DarkRooms()==1) then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_2F_ManyRollers_Chest() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and (PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or (PoWRedWarp()==1 and OverworldBlocks()==1) ) and PoWPeahatRoom()==1 ) then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_2F_TwinWizrobes_Chest() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or ( PoWRedWarp()==1 and OverworldBlocks()==1 )) and PoWDoubleWiz()==1 )  then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_3F_FireWizrobes_BigChest() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or ( PoWRedWarp()==1 and OverworldBlocks()==1 )) and PoWTribleWiz()==1 )  then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_HP() 
	if ( PowDungeons()==1 and has("cape") and PoWHP()==1 )  then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_SwitchHit_Chest() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and PoWSwitch()==1 and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or ( PoWRedWarp()==1 and OverworldBlocks()==1 and PoWSwitch()==1 and ( has("cape") or PoWHandRoom()==1 ) ) ) )  then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_5F_Bombarossa_Chest() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or  PoWRedWarp()==1 )  and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 )  then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_BlockMaze_Chest() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or  PoWRedWarp()==1 )  and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 )  then
		return 1
	else
		return 0
	end 
end

function Palace_2ndHalf_5F_RightSide_Chest() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or  PoWRedWarp()==1 )  and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 and has("cape"))  then
		return 1
	else
		return 0
	end 
end

function CompletePalace()
	if has("pow") then 
		return 1
	else
		return 0
	end 
end

function Palace_BossItem() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or  PoWRedWarp()==1 )  and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 and has("cape") and PoWBossDoor()==1 and (CanDownThrust()==1 or CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ))  then
		return 1
	else
		return 0
	end 
end

function Palace_Prize() 
	if ( PowDungeons()==1 and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and has("cape") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) or  PoWRedWarp()==1 )  and PoWRedWarpDoor()==1 and BombWalls()==1 and OverworldBlocks()==1 and PoWLastDoor()==1 and has("cape") and PoWBossDoor()==1 and (CanDownThrust()==1 or CanSplit2()==1 ))  then
		return 1
	else
		return 0
	end 
end