
function Deepwood_2F_Chest() 
	if ( DeepwoodDungeons()==1 and DeepwoodWeb()==1 ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and DeepwoodWeb()==1 ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_SlugTorches_Chest() 
	if ( DeepwoodDungeons()==1 ) then
		return 1
	elseif ( DeepwoodDungeons()==2 ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_BarrelRoom_Chest() 
	if ( DeepwoodDungeons()==1 and (Deepwood1stDoor()==1 or DeepwoodPreMadderpillar()==1) and BlowDust()==1 ) then
		return 1
	elseif ( (DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and (Deepwood1stDoor()==1 or ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 )) and ( BlowDust()==1 or BlowDust()==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_West_BigChest() 
	if ( DeepwoodDungeons()==1 and (Deepwood1stDoor()==1 or DeepwoodPreMadderpillar()==1) ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and (Deepwood1stDoor()==1 or ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 )) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_West_StatuePuzzle_Chest() 
	if ( DeepwoodDungeons()==1 and (Deepwood1stDoor()==1 or DeepwoodPreMadderpillar()==1) ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and (Deepwood1stDoor()==1 or ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 )) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_East_MulldozerFight_Item() 
	if ( DeepwoodDungeons()==1 and (Deepwood1stDoor()==1 or DeepwoodPreMadderpillar()==1) and Deepwood2ndDoor()==1 and DeepwoodMulldozers()==1 ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and (Deepwood1stDoor()==1 or ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 )) and ( Deepwood2ndDoor()==1 or Deepwood2ndDoor()==2 ) and ( DeepwoodMulldozers()==1 or DeepwoodMulldozers()==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_NorthEast_Chest() 
	if ( DeepwoodDungeons()==1 and DeepwoodPreMadderpillar()==1 and DeepwoodNWChest()==1) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) and ( DeepwoodNWChest()==1 or DeepwoodNWChest()==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_B1_SwitchRoom_BigChest() 
	if ( DeepwoodDungeons()==1 and DeepwoodPreMadderpillar()==1 ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_B1_SwitchRoom_Chest() 
	if ( DeepwoodDungeons()==1 and ((DeepwoodPreMadderpillar()==1 and has("cape")) or (Deepwood1stDoor()==1 and has("gust") ) ) ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ((( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) and has("cape")) or (Deepwood1stDoor()==1 and has("gust") ) ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_BlueWarp_HP() 
	if ( DeepwoodDungeons()==1 and DeepwoodPreMadderpillar()==1 and DeepwoodWarpSwitch()==1 ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) and ( DeepwoodWarpSwitch()==1  or  DeepwoodWarpSwitch()==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_BlueWarp_Chest() 
	if ( DeepwoodDungeons()==1 and DeepwoodPreMadderpillar()==1 and DeepwoodWarpChests()==1 ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) and ( DeepwoodWarpChests()==1  or  DeepwoodWarpChests()==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_Madderpillar_BigChest() 
    if ( DeepwoodDungeons()==1 and DeepwoodPreMadderpillar()==1 and DeepwoodMadderpillarDoor()==1 and DeepwoodMadderpillarFight()==1 ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) and ( DeepwoodMadderpillarDoor()==1 or DeepwoodMadderpillarDoor()==2 ) and ( DeepwoodMadderpillarFight()==1 or DeepwoodMadderpillarFight()==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Deepwood_1F_Madderpillar_HP() 
    if ( DeepwoodDungeons()==1 and DeepwoodMadderHP()==1 ) then
        return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ( DeepwoodMadderHP()==1 or DeepwoodMadderHP()==2 ) ) then
        return 2
	else
		return 0
	end 
end


function Deepwood_B1_West_BigChest() 
	if ( DeepwoodDungeons()==1 and ( DeepwoodRedWarp()==1 or ( ( Deepwood1stDoor()==1 or DeepwoodPreMadderpillar()==1) and has("gust") and DeepwoodBasementDoor()==1 ) ) ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and ( DeepwoodRedWarp()==1 or ( ( Deepwood1stDoor()==1 or ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 )) and has("gust") and ( DeepwoodBasementDoor()==1 or DeepwoodBasementDoor()==2 ) ) ) ) then
		return 2
	else
		return 0
	end 
end


function CompleteDeepwood() 
	if ( has("dws") ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_BossItem() 
	if ( DeepwoodDungeons()==1 and has("gust") and HasChuDamage()==1 and DeepwoodBossDoor()==1 ) then
		return 1
	elseif ( ( DeepwoodDungeons()==1 or DeepwoodDungeons()==2 ) and has("gust") and ( HasChuDamage()==1 or HasChuDamage()==2 ) and DeepwoodBossDoor()==1 ) then
		return 2
	else
		return 0
	end 
end
