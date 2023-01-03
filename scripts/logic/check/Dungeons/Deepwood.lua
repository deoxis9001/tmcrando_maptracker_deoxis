
function Deepwood_2F_Chest() 
	if ( AccessDeepwood()==1 and DeepwoodWeb()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_SlugTorches_Chest() 
	if ( AccessDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_BarrelRoom_Chest() 
	if ( AccessDeepwood()==1 and (Deepwood1stDoor()==1 or DeepwoodBlueWarp()==1) and BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_West_BigChest() 
	if ( AccessDeepwood()==1 and (Deepwood1stDoor()==1 or DeepwoodBlueWarp()==1) ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_West_StatuePuzzle_Chest() 
	if ( AccessDeepwood()==1 and (Deepwood1stDoor()==1 or DeepwoodBlueWarp()==1) ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_East_MulldozerFight_Item() 
	if ( AccessDeepwood()==1 and (Deepwood1stDoor()==1 or DeepwoodBlueWarp()==1) and Deepwood2ndDoor()==1 and DeepwoodMulldozers()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_NorthEast_Chest() 
	if ( AccessDeepwood()==1 and DeepwoodBlueWarp()==1 and DeepwoodNWChest()==1) then
		return 1
	else
		return 0
	end 
end


function Deepwood_B1_SwitchRoom_BigChest() 
	if ( AccessDeepwood()==1 and DeepwoodBlueWarp()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_B1_SwitchRoom_Chest() 
	if ( AccessDeepwood()==1 and ((DeepwoodBlueWarp()==1 and has("cape")) or (Deepwood1stDoor()==1 and has("gust") ) ) ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_BlueWarp_HP() 
	if ( AccessDeepwood()==1 and DeepwoodBlueWarp()==1 and DeepwoodWarpSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_BlueWarp_Chest() 
	if ( AccessDeepwood()==1 and DeepwoodBlueWarp()==1 and DeepwoodWarpSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_Madderpillar_BigChest() 
    if ( AccessDeepwood()==1 and DeepwoodBlueWarp()==1 and DeepwoodMadderpillarDoor()==1 and DeepwoodMadderpillarFight()==1 ) then
		return 1
	else
		return 0
	end 
end


function Deepwood_1F_Madderpillar_HP() 
    if ( AccessDeepwood()==1 and DeepwoodBlueWarp()==1 and DeepwoodMadderpillarDoor()==1 and DeepwoodWeb()==1 ) then
        return 1
	else
		return 0
	end 
end


function Deepwood_B1_West_BigChest() 
	if ( AccessDeepwood()==1 and ( ( ( Deepwood1stDoor()==1 or DeepwoodBlueWarp()==1) and has("gust") and DeepwoodBasementDoor()==1 ) or DeepwoodRedWarp()==1) ) then
		return 1
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
	if ( AccessDeepwood()==1 and has("gust") and HasChuDamage()==1 and DeepwoodBossDoor()==1 ) then
		return 1
	else
		return 0
	end 
end
