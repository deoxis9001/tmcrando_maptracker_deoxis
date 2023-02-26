function Fortress_Entrance_1F_LeftChest() 
	if ( FowDungeons()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Entrance_1F_LeftWizrobeChest() 
	if ( FowDungeons()==1 and has("mitts") and FoWWizrobes()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Entrance_1F_RightItem() 
	if ( FowDungeons()==1 and FoWEntranceRupee()==1) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_2F_DigChest() 
	if ( FowDungeons()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_2F_Item() 
	if ( FowDungeons()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 ) then
		return 1
	else
		return 0
	end 
end
function Fortress_Left_2F_Item5() 
	if ( FowDungeons()==1 and FoWLeftRupee()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_3F_SwitchChest() -- pas utiliser sur le tracker
	if ( FowDungeons()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 and FoWDigSwitch()==1) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_3F_Eyegore_BigChest() 
	if ( FowDungeons()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 and FoWCloneSwitch()==1) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_3F_ItemDrop() 
	if ( FowDungeons()==1 and FoWLeftDrop()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Middle_2F_BigChest() 
	if ( FowDungeons()==1 and ( FoWEyegores()==1 or ( FoWBlueWarp()==1 and FoWDarknut()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Middle_2F_StatueChest() 
	if ( FowDungeons()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_2F_LeftChest() 
	if ( FowDungeons()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_2F_RightChest()  -- pas utiliser sur le tracker
	if ( FowDungeons()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_2F_DigChest() 
	if ( FowDungeons()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_3F_DigChest()   -- pas utiliser sur le tracker
	if ( FowDungeons()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_3F_ItemDrop() 
	if ( FowDungeons()==1 and FoWRightDrop()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Entrance_1F_RightHP() 
	if ( FowDungeons()==1 and FoWHP()==1) then
		return 1
	else
		return 0
	end 
end

function Fortress_BackLeft_BigChest() 
    if ( FowDungeons()==1 and ( ( FoWBlueWarp()==1 and FoWDarknut()==1 ) or ( FoWEyegores()==1 and FoWLeftDoor()==1 and FoWDarknut()==1 )) and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackLeft_SmallChest() 
	if ( FowDungeons()==1 and ( ( FoWBlueWarp()==1 and FoWDarknut()==1 ) or (FoWEyegores()==1 and FoWLeftDoor()==1 and FoWDarknut()==1)) and BombWalls()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_Statue_ItemDrop() 
	if ( FowDungeons()==1 and ( ( FoWBlueWarp()==1 and FoWDarknut()==1 ) or FoWEyegores()==1) and FoWRightDoor()==1 and FoWStatueCloneSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_Minish_ItemDrop() 
	if ( FowDungeons()==1 and ( ( FoWBlueWarp()==1 and FoWDarknut()==1 ) or FoWEyegores()==1) and FoWRightDoor()==1 and HasDamageSource()==1 and FoWMiddleDoor()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_DigRoom_TopPot() 
	if ( FowDungeons()==1 and ( ( FoWBlueWarp()==1 and FoWDarknut()==1 ) or FoWEyegores()==1 ) and FoWRightDoor()==1 and FoWMiddleDoor()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_DigRoom_BottomPot() 
	if ( ( FowDungeons()==1 and ( ( FoWBlueWarp()==1 and FoWDarknut()==1 ) or FoWEyegores()==1 ) and FoWRightDoor()==1 and HasDamageSource()==1 and FoWMiddleDoor()==1 and has("mitts") ) or (FowDungeons()==1 and FoWPot()==1) ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_BigChest() 
	if ( FowDungeons()==1 and ( ( FoWBlueWarp()==1 and FoWDarknut()==1 ) or FoWEyegores()==1 ) and FoWRightDoor()==1  and FoWMiddleDoor()==1 and has("mitts") and FoWLastDoor()==1 ) then
		return 1
	else
		return 0
	end 
end


function CompleteFortress() 
	if ( has("fow") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BossItem() 
	if ( FowDungeons()==1 and has("mitts") and FoWBossDoor()==1 and HasMazaalDamage()==1 and HasBow()==1  ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Prize() 
	if ( FowDungeons()==1 and has("mitts") and FoWBossDoor()==1 and HasMazaalDamage()==1 and HasBow()==1  ) then
		return 1
	else
		return 0
	end 
end
