function Fortress_Entrance_1F_LeftChest() 
	if ( function_Cached("FowDungeons")==1 and has("mitts") ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Entrance_1F_LeftWizrobeChest() 
	if ( function_Cached("FowDungeons")==1 and has("mitts") and function_Cached("FoWWizrobes")==1 ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and has("mitts") and ( function_Cached("FoWWizrobes")==1 or function_Cached("FoWWizrobes")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Entrance_1F_RightItem() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWEntranceRupee")==1) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( function_Cached("FoWEntranceRupee")==1 or function_Cached("FoWEntranceRupee")==2) ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Left_2F_DigChest() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWEyeSwitch")==1 and function_Cached("FoWStalfosFight")==1 and has("mitts") ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and function_Cached("FoWEyeSwitch")==1 and ( function_Cached("FoWStalfosFight")==1 or function_Cached("FoWStalfosFight")==2 ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Left_2F_Item() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWEyeSwitch")==1 and function_Cached("FoWStalfosFight")==1 ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and function_Cached("FoWEyeSwitch")==1 and ( function_Cached("FoWStalfosFight")==1 or function_Cached("FoWStalfosFight")==2 ) ) then
		return 2
	else
		return 0
	end 
end
function Fortress_Left_2F_Item5() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWLeftRupee")==1 ) then
		return 1
	elseif ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( function_Cached("FoWLeftRupee")==1 or function_Cached("FoWLeftRupee")==2 ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Left_3F_SwitchChest() -- pas utiliser sur le tracker
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWEyeSwitch")==1 and function_Cached("FoWStalfosFight")==1 and function_Cached("FoWDigSwitch")==1) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and function_Cached("FoWEyeSwitch")==1 and ( function_Cached("FoWStalfosFight")==1 or function_Cached("FoWStalfosFight")==2 ) and function_Cached("FoWDigSwitch")==1) then
		return 2
	else
		return 0
	end 
end


function Fortress_Left_3F_Eyegore_BigChest() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWEyeSwitch")==1 and function_Cached("FoWStalfosFight")==1 and function_Cached("FoWCloneSwitch")==1) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and function_Cached("FoWEyeSwitch")==1 and ( function_Cached("FoWStalfosFight")==1 or function_Cached("FoWStalfosFight")==2 ) and function_Cached("FoWCloneSwitch")==1) then
		return 2
	else
		return 0
	end 
end


function Fortress_Left_3F_ItemDrop() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWLeftDrop")==1 ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and function_Cached("FoWLeftDrop")==1 ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Middle_2F_BigChest() 
	if ( function_Cached("FowDungeons")==1 and ( function_Cached("FoWEyegores")==1 or ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) ) ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( function_Cached("FoWEyegores")==1 or ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) ) ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Middle_2F_StatueChest() 
	if ( function_Cached("FowDungeons")==1 and has("mitts") ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Right_2F_LeftChest() 
	if ( function_Cached("FowDungeons")==1 ) then
		return 1
	elseif ( function_Cached("FowDungeons")==2 ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Right_2F_RightChest()  -- pas utiliser sur le tracker
	if ( function_Cached("FowDungeons")==1 ) then
		return 1
	elseif ( function_Cached("FowDungeons")==2 ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Right_2F_DigChest() 
	if ( function_Cached("FowDungeons")==1 and has("mitts") ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Right_3F_DigChest()   -- pas utiliser sur le tracker
	if ( function_Cached("FowDungeons")==1 and has("mitts") ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Right_3F_ItemDrop() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWRightDrop")==1 ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and function_Cached("FoWRightDrop")==1 ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Entrance_1F_RightHP() 
	if ( function_Cached("FowDungeons")==1 and function_Cached("FoWHP")==1) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( function_Cached("FoWHP")==1 or function_Cached("FoWHP")==2 ) ) then
		return 2
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) ) then
		return 3
	else
		return 0
	end 
end

function Fortress_BackLeft_BigChest() 
    if ( function_Cached("FowDungeons")==1 and ( ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) or ( function_Cached("FoWEyegores")==1 and function_Cached("FoWLeftDoor")==1 and function_Cached("FoWDarknut")==1 )) and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) or ( function_Cached("FoWEyegores")==1 and ( function_Cached("FoWLeftDoor")==1 or function_Cached("FoWLeftDoor")==2 ) and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) )) and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end


function Fortress_BackLeft_SmallChest() 
	if ( function_Cached("FowDungeons")==1 and ( ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) or (function_Cached("FoWEyegores")==1 and function_Cached("FoWLeftDoor")==1 and function_Cached("FoWDarknut")==1)) and function_Cached("BombWalls")==1 and has("mitts") ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) or (function_Cached("FoWEyegores")==1 and ( function_Cached("FoWLeftDoor")==1 or function_Cached("FoWLeftDoor")==2 ) and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ))) and function_Cached("BombWalls")==1 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Fortress_BackRight_Statue_ItemDrop() 
	if ( function_Cached("FowDungeons")==1 and ( ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) or function_Cached("FoWEyegores")==1) and function_Cached("FoWRightDoor")==1 and function_Cached("FoWStatueCloneSwitch")==1 ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) or function_Cached("FoWEyegores")==1) and ( function_Cached("FoWRightDoor")==1 or function_Cached("FoWRightDoor")==2 ) and function_Cached("FoWStatueCloneSwitch")==1 ) then
		return 2
	else
		return 0
	end 
end


function Fortress_BackRight_Minish_ItemDrop() 
	if ( function_Cached("FowDungeons")==1 and ( ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) or function_Cached("FoWEyegores")==1) and function_Cached("FoWRightDoor")==1 and function_Cached("HasDamageSource")==1 and function_Cached("FoWMiddleDoor")==1 and has("mitts") ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) or function_Cached("FoWEyegores")==1) and ( function_Cached("FoWRightDoor")==1 or function_Cached("FoWRightDoor")==2 ) and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) and ( function_Cached("FoWMiddleDoor")==1 or function_Cached("FoWMiddleDoor")==2 ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Fortress_BackRight_DigRoom_TopPot() 
	if ( function_Cached("FowDungeons")==1 and ( ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) or function_Cached("FoWEyegores")==1 ) and function_Cached("FoWRightDoor")==1 and function_Cached("FoWMiddleDoor")==1 and has("mitts")) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) or function_Cached("FoWEyegores")==1 ) and ( function_Cached("FoWRightDoor")==1 or function_Cached("FoWRightDoor")==2 ) and ( function_Cached("FoWMiddleDoor")==1 or function_Cached("FoWMiddleDoor")==2 ) and has("mitts")) then
		return 2
	else
		return 0
	end 
end


function Fortress_BackRight_DigRoom_BottomPot() 
	if ( ( function_Cached("FowDungeons")==1 and ( ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) or function_Cached("FoWEyegores")==1 ) and function_Cached("FoWRightDoor")==1 and function_Cached("HasDamageSource")==1 and function_Cached("FoWMiddleDoor")==1 and has("mitts") ) or (function_Cached("FowDungeons")==1 and function_Cached("FoWPot")==1) ) then
		return 1
	elseif ( ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) or function_Cached("FoWEyegores")==1 ) and ( function_Cached("FoWRightDoor")==1 or function_Cached("FoWRightDoor")==2 ) and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) and ( function_Cached("FoWMiddleDoor")==1 or function_Cached("FoWMiddleDoor")==2 ) and has("mitts") ) or (( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( function_Cached("FoWPot")==1 or function_Cached("FoWPot")==2 ) ) ) then
		return 2
	else
		return 0
	end 
end


function Fortress_BackRight_BigChest() 
	if ( function_Cached("FowDungeons")==1 and ( ( function_Cached("FoWBlueWarp")==1 and function_Cached("FoWDarknut")==1 ) or function_Cached("FoWEyegores")==1 ) and function_Cached("FoWRightDoor")==1  and function_Cached("FoWMiddleDoor")==1 and has("mitts") and function_Cached("FoWLastDoor")==1 ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and ( ( function_Cached("FoWBlueWarp")==1 and ( function_Cached("FoWDarknut")==1 or function_Cached("FoWDarknut")==2 ) ) or function_Cached("FoWEyegores")==1 ) and ( function_Cached("FoWRightDoor")==1 or function_Cached("FoWRightDoor")==2 )  and ( function_Cached("FoWMiddleDoor")==1 or function_Cached("FoWMiddleDoor")==2 ) and has("mitts") and ( function_Cached("FoWLastDoor")==1 or function_Cached("FoWLastDoor")==2 ) ) then
		return 2
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
	if ( function_Cached("FowDungeons")==1 and has("mitts") and function_Cached("FoWBossDoor")==1 and function_Cached("HasMazaalDamage")==1 and function_Cached("HasBow")==1  ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and has("mitts") and function_Cached("FoWBossDoor")==1 and ( function_Cached("HasMazaalDamage")==1 or function_Cached("HasMazaalDamage")==2 ) and function_Cached("HasBow")==1  ) then
		return 2
	else
		return 0
	end 
end


function Fortress_Prize() 
	if ( function_Cached("FowDungeons")==1 and has("mitts") and function_Cached("FoWBossDoor")==1 and function_Cached("HasMazaalDamage")==1 and function_Cached("HasBow")==1  ) then
		return 1
	elseif ( ( function_Cached("FowDungeons")==1 or function_Cached("FowDungeons")==2 ) and has("mitts") and function_Cached("FoWBossDoor")==1 and ( function_Cached("HasMazaalDamage")==1 or function_Cached("HasMazaalDamage")==2 ) and function_Cached("HasBow")==1  ) then
		return 2
	else
		return 0
	end 
end
