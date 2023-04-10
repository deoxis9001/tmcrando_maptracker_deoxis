function CoF_1F_SpikeBeetle_BigChest() 
	if ( function_Cached("CofDungeons")==1 and ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function CoF_1F_Item() 
	if ( function_Cached("CofDungeons")==1 and function_Cached("CoFRupees")==1 ) then
		return 1
	elseif ( function_Cached("CofDungeons")==2 and function_Cached("CoFRupees")==1 ) then
		return 2
	else
		return 0
	end 
end


function CoF_B1_HazyRoom_BigChest() 
	if ( function_Cached("CofDungeons")==1 and ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 and function_Cached("CoFHelmasaur")==1 ) then
		return 1
	elseif (( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) and ( function_Cached("CoFHelmasaur")==1 or function_Cached("CoFHelmasaur")==2 ) ) then
		return 2 
	else
		return 0
	end 
end

function CoF_B1_Rollobite_Chest() 
    if ( function_Cached("CofDungeons")==1 and ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 and function_Cached("CoFHelmasaur")==1 and ( function_Cached("HasSword")==1 or has("gust") or has("cane") or function_Cached("HasBoomerang")==1 or has("bombs") ) ) then
        return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) and ( function_Cached("CoFHelmasaur")==1 or function_Cached("CoFHelmasaur")==2 ) and ( function_Cached("HasSword")==1 or has("gust") or has("cane") or function_Cached("HasBoomerang")==1 or has("bombs") ) ) then
        return 2
	else
		return 0
	end 
end


function CoF_B1_SpikeyChus_PillarChest() 
	if ( function_Cached("CofDungeons")==1 and has("cane") and ( function_Cached("CoFBlueWarp")==1 or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 and function_Cached("CoF1stDoor")==1 and function_Cached("HasSword")==1 ) ) ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and has("cane") and ( function_Cached("CoFBlueWarp")==1 or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) and ( function_Cached("CoF1stDoor")==1 or function_Cached("CoF1stDoor")==2 ) and function_Cached("HasSword")==1 ) ) ) then
		return 2
	else
		return 0
	end 
end


function CoF_B1_HP() 
	if ( function_Cached("CofDungeons")==1 and function_Cached("BombWalls")==1 and ( ( function_Cached("CoFBlueWarp")==1 and has("cane") ) or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 and function_Cached("CoF1stDoor")==1 and function_Cached("HasSword")==1 ) ) ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and function_Cached("BombWalls")==1 and ( ( function_Cached("CoFBlueWarp")==1 and has("cane") ) or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) and ( function_Cached("CoF1stDoor")==1 or function_Cached("CoF1stDoor")==2 ) and function_Cached("HasSword")==1 ) ) ) then
		return 2
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) ) then
		return 3
	else
		return 0
	end 
end


function CoF_B1_SpikeyChus_BigChest() 
	if ( ( function_Cached("CofDungeons")==1 and ( ( function_Cached("CoFBlueWarp")==1 and (has("cane") or function_Cached("CoFChuFightBackDoor")==1 ) and function_Cached("CoFChuFight")==1) or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 and function_Cached("CoF1stDoor")==1 and function_Cached("HasSword")==1 )))) then
		return 1
	elseif ( ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( ( function_Cached("CoFBlueWarp")==1 and (has("cane") or function_Cached("CoFChuFightBackDoor")==1 ) and ( function_Cached("CoFChuFight")==1 or function_Cached("CoFChuFight")==2 ) ) or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) and ( function_Cached("CoF1stDoor")==1 or function_Cached("CoF1stDoor")==2 ) and function_Cached("HasSword")==1 )))) then
		return 2
	else
		return 0
	end 
end


function CoF_B2_PreLava_Chest() 
	if ( function_Cached("CofDungeons")==1 and function_Cached("CoFBasementAccess")==1 and has("cane") ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("CoFBasementAccess")==1 or function_Cached("CoFBasementAccess")==2 ) and has("cane") ) then
		return 2
	else
		return 0
	end 
end


function CoF_B2_LavaRoom_BladeChest() 
	if ( function_Cached("CofDungeons")==1 and function_Cached("CoFBasementAccess")==1 and ( has("cane") or has("cape") ) ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("CoFBasementAccess")==1 or function_Cached("CoFBasementAccess")==2 ) and ( has("cane") or has("cape") ) ) then
		return 2
	else
		return 0
	end 
end


function CoF_B2_LavaRoom_Chest() 
	if ( function_Cached("CofDungeons")==1 and function_Cached("CoFBasementAccess")==1 and ( has("cane") or has("cape") ) ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("CoFBasementAccess")==1 or function_Cached("CoFBasementAccess")==2 ) and ( has("cane") or has("cape") ) ) then
		return 2
	else
		return 0
	end 
end



function CoF_B2_LavaRoom_BigChest() 
    if ( function_Cached("CofDungeons")==1 and function_Cached("CoFBasementAccess")==1 and ( has("cane") or has("cape") ) ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("CoFBasementAccess")==1 or function_Cached("CoFBasementAccess")==2 ) and ( has("cane") or has("cape") ) ) then
		return 2
	else
		return 0
	end 
end


function CompleteCoF()
	if ( function_Cached("AccessMelari")==1 and has("cof") ) then
		return 1
	elseif ( function_Cached("AccessMelari")==2 and has("cof") ) then
		return 2
	else
		return 0
	end 
end


function CoF_BossItem() 
	if ( function_Cached("CofDungeons")==1 and function_Cached("CoFBasementAccess")==1 and function_Cached("CoFBossDoor")==1 and has("cane") and function_Cached("HasGleerokDamage")==1 ) then
		return 1
	elseif ( ( function_Cached("CofDungeons")==1 or function_Cached("CofDungeons")==2 ) and ( function_Cached("CoFBasementAccess")==1 or function_Cached("CoFBasementAccess")==2 ) and function_Cached("CoFBossDoor")==1 and has("cane") and ( function_Cached("HasGleerokDamage")==1 or function_Cached("HasGleerokDamage")==2 ) ) then
		return 2
	else
		return 0
	end 
end