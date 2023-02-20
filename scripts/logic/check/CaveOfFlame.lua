function CoF_1F_SpikeBeetle_BigChest() 
	if ( CofDungeons()==1 and ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 ) then
		return 1
	else
		return 0
	end 
end


function CoF_1F_Item() 
	if ( CofDungeons()==1 and CoFRupees()==1 ) then
		return 1
	else
		return 0
	end 
end


function CoF_B1_HazyRoom_BigChest() 
	if ( CofDungeons()==1 and ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 and CoFHelmasaur()==1 ) then
		return 1 
	else
		return 0
	end 
end

function CoF_B1_Rollobite_Chest() 
    if ( CofDungeons()==1 and ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 and CoFHelmasaur()==1 and ( HasSword()==1 or has("gust") or has("cane") or HasBoomerang()==1 or has("bombs") ) ) then
        return 1
	else
		return 0
	end 
end


function CoF_B1_SpikeyChus_PillarChest() 
	if ( CofDungeons()==1 and has("cane") and ( CoFBlueWarp()==1 or ( ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 and CoF1stDoor()==1 and HasSword()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end


function CoF_B1_HP() 
	if ( CofDungeons()==1 and BombWalls()==1 and ( ( CoFBlueWarp()==1 and has("cane") ) or ( ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 and CoF1stDoor()==1 and HasSword()==1 ) ) ) then
		return 1
	elseif ( CofDungeons()==1 and ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 ) then
		return 3
	else
		return 0
	end 
end


function CoF_B1_SpikeyChus_BigChest() 
	if ( ( CofDungeons()==1 and ( ( CoFBlueWarp()==1 and (has("cane") or has("cape") ) and CoFChuFight()==1) or ( ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 and CoF1stDoor()==1 and HasSword()==1 )))) then
		return 1
	else
		return 0
	end 
end


function CoF_B2_PreLava_Chest() 
	if ( CoFBasementAccess()==1 and has("cane") ) then
		return 1
	else
		return 0
	end 
end


function CoF_B2_LavaRoom_BladeChest() 
	if ( CoFBasementAccess()==1 and ( has("cane") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end


function CoF_B2_LavaRoom_Chest() 
	if ( CoFBasementAccess()==1 and ( has("cane") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end



function CoF_B2_LavaRoom_BigChest() 
    if ( CoFBasementAccess()==1 and ( has("cane") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end


function CompleteCoF()
	if ( has("cof") ) then
		return 1
	else
		return 0
	end 
end


function CoF_BossItem() 
	if ( CoFBasementAccess()==1 and CoFBossDoor()==1 and has("cane") and HasGleerokDamage()==1 ) then
		return 1
	else
		return 0
	end 
end