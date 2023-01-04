function Fortress_Entrance_1F_LeftChest() 
	if ( AccessFortress()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Entrance_1F_LeftWizrobeChest() 
	if ( AccessFortress()==1 and has("mitts") and FoWWizrobes()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Entrance_1F_RightItem() 
	if ( AccessFortress()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_2F_DigChest() 
	if ( AccessFortress()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_2F_Item() 
	if ( AccessFortress()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_3F_SwitchChest() 
	if ( AccessFortress()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 and FoWDigSwitch()==1) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_3F_Eyegore_BigChest() 
	if ( AccessFortress()==1 and FoWEyeSwitch()==1 and FoWStalfosFight()==1 and FoWCloneSwitch()==1) then
		return 1
	else
		return 0
	end 
end


function Fortress_Left_3F_ItemDrop() 
	if ( AccessFortress()==1 and FoWLeftDrop()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Middle_2F_BigChest() 
	if ( AccessFortress()==1 and ( FoWEyegores()==1 or FoWBlueWarp()==1)) then
		return 1
	else
		return 0
	end 
end


function Fortress_Middle_2F_StatueChest() 
	if ( AccessFortress()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_2F_LeftChest() 
	if ( AccessFortress()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_2F_RightChest() 
	if ( AccessFortress()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_2F_DigChest() 
	if ( AccessFortress()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_3F_DigChest() 
	if ( AccessFortress()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Right_3F_ItemDrop() 
	if ( AccessFortress()==1 and FoWRightDrop()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Entrance_1F_RightHP() 
	if ( AccessFortress()==1 and FoWCloneSwitch()==1) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackLeft_BigChest() 
    if ( AccessFortress()==1 and ( FoWBlueWarp()==1 or ( FoWEyegores()==1 and FoWLeftDoor()==1 and FoWDarknut()==1 )) and BombWalls()==1 then
		return 1
	else
		return 0
	end 
end


function Fortress_BackLeft_SmallChest() 
	if ( AccessFortress()==1 and (FoWBlueWarp()==1 or (FoWEyegores()==1 and FoWLeftDoor()==1 and FoWDarknut()==+)) and BombWalls()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_Statue_ItemDrop() 
	if ( AccessFortress()==1 and ( FoWBlueWarp()==1 or FoWEyegores()==1) and FoWRightDoor()==1 and FoWCloneSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_Minish_ItemDrop() 
	if ( AccessFortress()==1 and ( FoWBlueWarp()==1 or FoWEyegores()==1) and FoWRightDoor()==1 and HasHandDamage()==1 and FoWMiddleDoor()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_DigRoom_TopPot() 
	if ( AccessFortress()==1 and (FoWBlueWarp()==1 or FoWEyegores()==1 ) and FoWRightDoor()==1 and HasHandDamage()==1 and FoWMiddleDoor()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_DigRoom_BottomPot() 
	if ( ( AccessFortress()==1 and (FoWBlueWarp()==1 or FoWEyegores()==1 ) and FoWRightDoor()==1 and HasHandDamage()==1 and FoWMiddleDoor()==1 and has("mitts") ) or (AccessFortress()==1 and FoWPot()==1) ) then
		return 1
	else
		return 0
	end 
end


function Fortress_BackRight_BigChest() 
	if ( AccessFortress()==1 and (FoWBlueWarp()==1 or FoWEyegores()==1 ) and FoWRightDoor()==1 and HasHandDamage()==1 and FoWMiddleDoor()==1 and has("mitts") and FoWLastDoor()==1 ) then
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
	if ( AccessFortress()==1 and has("mitts") and FoWBossDoor()==1 and HasMazaalDamage()==1 and HasBow()==1  ) then
		return 1
	else
		return 0
	end 
end


function Fortress_Prize() 
	if ( AccessFortress()==1 and has("mitts") and FoWBossDoor()==1 and HasMazaalDamage()==1 and HasBow()==1  ) then
		return 1
	else
		return 0
	end 
end
