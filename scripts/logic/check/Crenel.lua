function Crenel_BridgeCave_Chest() 
	if ( AccessCrenel()==1 and  BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_FairyCave_HP() 
	if ( AccessCrenel()==1 and  BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Scrub_NPC()
	if ( AccessCrenel()==1 and BombWalls()==1 and  (has("grip") or has("bombs") or CrenelMushroom()==1 ) and Scrubs()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Dojo_Chest() 
	if ( AccessCrenel()==1 and has("grip") and CrenelDojo()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Dojo_HP() 
	if ( AccessCrenel()==1 and has("grip") and CrenelDojo()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Dojo_NPC() 
	if ( AccessCrenel()==1 and has("grip") and CrenelDojo()==1 and HasSword()==1) then
		return 1
	else
		return 0
	end 
end

function Crenel_GreatFairy_NPC()
	if ( AccessCrenel()==1 and has("grip") and BombWalls()==1 and has("bombs") or HasBottle()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_ClimbFusion_Chest() 
	if ( AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_DigCave_HP() 
	if ( AccessCrenel()==1 and has("grip") and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_HP() 
	if ( AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_Item() 
	if ( AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_RainPathFusion_Chest() 
	if ( AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_UpperBlock_Chest() 
	if ( AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_MinesPathFusion_Chest() 
	if ( AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Melari_Mining() 
	if ( AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Melari_NPC() 
	if ( CompleteCoF()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_TopTektiteGolden_KillTektite() 
	if ( Fusions()==1 and has("golden_enemy_on") and AccessCrenel()==1 and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and AccessCrenel()==1) then
		return 2
	else
		return 0
	end 
end
function Crenel_MiddleTektiteGolden_KillTektite() 
	if ( Fusions()==1 and has("golden_enemy_on") and AccessCrenel()==1 and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and AccessCrenel()==1) then
		return 2
	else
		return 0
	end 
end