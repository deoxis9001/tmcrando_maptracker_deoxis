function Castle_RightFountainFusion_HP() 
	if ( Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_Dojo_HP() 
		return 1 
end

function Castle_Dojo_NPC() 
	if ( CastleDojo()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_RightFountainFusion_MinishHoleChest() 
	if ( Fusions()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_LeftFountainFusion_MinishHoleChest() 
	if ( Fusions()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_Moat_LeftChest() 
	if ( has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Castle_Moat_RightChest() 
	if ( has("flippers") ) then
		return 1
	else
		return 0
	end 
end
--pas dans la logique de base
function Castle_RopeGolden_KillRope() 
	if ( Fusions()==1 and has("golden_enemy_on") and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) ) then
		return 2
	else
		return 0
	end 
end

