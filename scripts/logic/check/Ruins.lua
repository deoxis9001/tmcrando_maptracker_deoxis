function Ruins_ButterflyFusion_Item() 
	if ( AccessRuins()==1 ) then
		return 1
	else
		return 0
	end 
end

function Ruins_BombCave_Chest() 
    if ( AccessRuins()==1 and BombWalls()==1 ) then
        return 1
	else
		return 0
	end 
end


function Ruins_MinishHome_Chest()
	if ( AccessRuins()==1 ) then
		return 1
	else
		return 0
	end 
end


function Ruins_PillarsFusion_Chest() 
	if ( AccessRuins()==1 and RuinsShortcut()==1) then
		return 1
	else
		return 0
	end 
end


function Ruins_BeanStalkFusion_BigChest() 
	if ( AccessRuins()==1 and RuinsShortcut()==1 and RuinsTektites()==1) then
		return 1
	else
		return 0
	end 
end


function Ruins_CrackFusion_Chest()
    if ( AccessRuins()==1 and RuinsShortcut()==1 and RuinsTektites()==1) then
        return 1
	else
		return 0
	end 
end


function Ruins_MinishCave_HP() 
    if ( AccessRuins()==1 and RuinsShortcut()==1 and RuinsTektites()==1) then
		return 1
	else
		return 0
	end 
end


function Ruins_ArmosKill_Chest() 
	if ( AccessRuins()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end


function Ruins_NearFoWFusion_Chest()
	if ( AccessRuins()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function Ruins_OctoGolden_KillOcto() 
	if ( Fusions()==1 and has("golden_enemy_on") and AccessRuins()==1 and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and AccessRuins()==1) then
		return 2
	else
		return 0
	end 
end
