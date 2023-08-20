function Palace_1stHalf_1F_GrateChest() 
	if function_Cached("PowDungeons")==1 and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_1F_Wizrobe_BigChest() 
	if function_Cached("PowDungeons")==1 and ( has("cape") or has("bombs") or function_Cached("HasMagicBoomerang")==1 ) and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( has("cape") or has("bombs") or function_Cached("HasMagicBoomerang")==1 ) and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_2F_Item() 
	if function_Cached("PowDungeons")==1 and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1) and function_Cached("PoWRupees")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1) and function_Cached("PoWRupees")==1 then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_3F_PotPuzzle_ItemDrop() 
	if ( function_Cached("PowDungeons")==1 and function_Cached("PoWDrop")==1) then
		return 1
	elseif ( ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( function_Cached("PoWDrop")==1 or function_Cached("PoWDrop")==2 ) ) then
		return 2
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 ) ) then
		return 3
	else
		return 0
	end 
end

function Palace_1stHalf_4F_BowMoblins_Chest()
	if function_Cached("PowDungeons")==1 and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1) and function_Cached("PoWJump")==1 and function_Cached("PoW1stDoor")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1) and ( function_Cached("PoWJump")==1 or function_Cached("PoWJump")==2 ) and ( function_Cached("PoW1stDoor")==1 or function_Cached("PoW1stDoor")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_5F_BallAndChainSoldiers_ItemDrop() 
	if function_Cached("PowDungeons")==1 and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("PoWJump")==1 and function_Cached("PoW1stDoor")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and ( function_Cached("PoWJump")==1 or function_Cached("PoWJump")==2 ) and ( function_Cached("PoW1stDoor")==1 or function_Cached("PoW1stDoor")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_5F_FanLoop_Chest() 
	if function_Cached("PowDungeons")==1 and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("PoWJump")==1 and function_Cached("PoWFans")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and ( function_Cached("PoWJump")==1 or function_Cached("PoWJump")==2 ) and ( function_Cached("PoWFans")==1 or function_Cached("PoWFans")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_1stHalf_5F_BigChest() 
	if function_Cached("PowDungeons")==1 and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("PoWJump")==1 and function_Cached("PoWBigChest")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and ( function_Cached("PoWJump")==1 or function_Cached("PoWJump")==2 ) and ( function_Cached("PoWBigChest")==1 or function_Cached("PoWBigChest")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_1F_DarkRoom_BigChest() 
	if function_Cached("PowDungeons")==1 and ( function_Cached("PoW2ndHalf")==1 or (function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 )) and function_Cached("DarkRooms")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) or (function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 )) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_1F_DarkRoom_SmallChest() 
	if function_Cached("PowDungeons")==1 and ( function_Cached("PoW2ndHalf")==1 or (function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 )) and function_Cached("DarkRooms")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) or (function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 )) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_2F_ManyRollers_Chest() 
	if function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and function_Cached("PoW2ndHalf")==1 ) or (function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1) ) and function_Cached("PoWPeahatRoom")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or (function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1) ) and function_Cached("PoWPeahatRoom")==1 then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_2F_TwinWizrobes_Chest() 
	if function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoW2ndHalf")==1 ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 ) ) and function_Cached("PoWDoubleWiz")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 ) ) and ( function_Cached("PoWDoubleWiz")==1 or function_Cached("PoWDoubleWiz")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_3F_FireWizrobes_BigChest() 
	if function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoW2ndHalf")==1 ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 )) and function_Cached("PoWTribleWiz")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 )) and ( function_Cached("PoWTribleWiz")==1 or function_Cached("PoWTribleWiz")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_HP() 
	if function_Cached("PowDungeons")==1 and has("cape") and function_Cached("PoWHP")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("PoWHP")==1 or function_Cached("PoWHP")==2 ) then
		return 2
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1) and ( function_Cached("PoWJump")==1 or function_Cached("PoWJump")==2 ) and ( function_Cached("PoW1stDoor")==1 or function_Cached("PoW1stDoor")==2 ) then
		return 3
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_SwitchHit_Chest() 
	if function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoWHandRoom")==1 and has("cape") and function_Cached("PoWSwitch")==1 and function_Cached("PoW2ndHalf")==1 ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 and function_Cached("PoWSwitch")==1 and ( has("cape") or function_Cached("PoWHandRoom")==1 ) ) ) then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoWHandRoom")==1 or function_Cached("PoWHandRoom")==2 ) and has("cape") and ( function_Cached("PoWSwitch")==1 or function_Cached("PoWSwitch")==2 ) and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 and function_Cached("PoWSwitch")==1 and ( has("cape") or function_Cached("PoWHandRoom")==1 ) ) ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_5F_Bombarossa_Chest() 
	if function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoWHandRoom")==1 and has("cape") and function_Cached("PoW2ndHalf")==1 ) or function_Cached("PoWRedWarp")==1 ) and function_Cached("PoWRedWarpDoor")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoWHandRoom")==1 or function_Cached("PoWHandRoom")==2 ) and has("cape") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or function_Cached("PoWRedWarp")==1 ) and ( function_Cached("PoWRedWarpDoor")==1 or function_Cached("PoWRedWarpDoor")==2 ) and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_4F_BlockMaze_Chest() 
	if function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoWHandRoom")==1 and has("cape") and function_Cached("PoW2ndHalf")==1 ) or function_Cached("PoWRedWarp")==1 ) and function_Cached("PoWRedWarpDoor")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and function_Cached("PoWLastDoor")==1 then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoWHandRoom")==1 or function_Cached("PoWHandRoom")==2 ) and has("cape") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or function_Cached("PoWRedWarp")==1 ) and ( function_Cached("PoWRedWarpDoor")==1 or function_Cached("PoWRedWarpDoor")==2 ) and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and ( function_Cached("PoWLastDoor")==1 or function_Cached("PoWLastDoor")==2 ) then
		return 2
	else
		return 0
	end 
end

function Palace_2ndHalf_5F_RightSide_Chest() 
	if function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoWHandRoom")==1 and has("cape") and function_Cached("PoW2ndHalf")==1 ) or function_Cached("PoWRedWarp")==1 ) and function_Cached("PoWRedWarpDoor")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and function_Cached("PoWLastDoor")==1 and has("cape") then
		return 1
	elseif ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoWHandRoom")==1 or function_Cached("PoWHandRoom")==2 ) and has("cape") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or function_Cached("PoWRedWarp")==1 ) and ( function_Cached("PoWRedWarpDoor")==1 or function_Cached("PoWRedWarpDoor")==2 ) and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and ( function_Cached("PoWLastDoor")==1 or function_Cached("PoWLastDoor")==2 ) and has("cape") then
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
	if ( function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoWHandRoom")==1 and has("cape") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoWBlueWarp")==1 )) or function_Cached("PoWRedWarp")==1 ) and function_Cached("PoWRedWarpDoor")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and function_Cached("PoWLastDoor")==1 and has("cape") and function_Cached("PoWBossDoor")==1 and (function_Cached("CanDownThrust")==1 or function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 1
	elseif ( ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoWHandRoom")==1 or function_Cached("PoWHandRoom")==2 ) and has("cape") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 or function_Cached("PoWBlueWarp")==1 )) or function_Cached("PoWRedWarp")==1 ) and ( function_Cached("PoWRedWarpDoor")==1 or function_Cached("PoWRedWarpDoor")==2 ) and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and ( function_Cached("PoWLastDoor")==1 or function_Cached("PoWLastDoor")==2 ) and has("cape") and ( function_Cached("PoWBossDoor")==1 or function_Cached("PoWBossDoor")==2 ) and (function_Cached("CanDownThrust")==1 or function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Palace_Prize() 
	if ( function_Cached("PowDungeons")==1 and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoWHandRoom")==1 and has("cape") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoWBlueWarp")==1 )) or function_Cached("PoWRedWarp")==1 ) and function_Cached("PoWRedWarpDoor")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and function_Cached("PoWLastDoor")==1 and has("cape") and function_Cached("PoWBossDoor")==1 and (function_Cached("CanDownThrust")==1 or function_Cached("CanSplit2")==1 ) ) then
		return 1
	elseif ( ( function_Cached("PowDungeons")==1 or function_Cached("PowDungeons")==2 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoWHandRoom")==1 or function_Cached("PoWHandRoom")==2 ) and has("cape") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 or function_Cached("PoWBlueWarp")==1 )) or function_Cached("PoWRedWarp")==1 ) and ( function_Cached("PoWRedWarpDoor")==1 or function_Cached("PoWRedWarpDoor")==2 ) and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 and ( function_Cached("PoWLastDoor")==1 or function_Cached("PoWLastDoor")==2 ) and has("cape") and ( function_Cached("PoWBossDoor")==1 or function_Cached("PoWBossDoor")==2 ) and (function_Cached("CanDownThrust")==1 or function_Cached("CanSplit2")==1 ) ) then
		return 2
	else
		return 0
	end 
end