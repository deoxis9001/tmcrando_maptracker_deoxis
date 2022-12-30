function Hills_Fusion_Chest() 
	if ( Fusions()==1 and ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_LeftChest() 
	if ( Fusions()==1 and ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_HP() 
	if ( Fusions()==1 and ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_RightChest() 
	if ( Fusions()==1 and ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BombCave_Chest() 
	if ( (CanDestroyTrees()==1 or WindCrest()==1) and BombWalls()==1) then
		return 1
	else
		return 0
	end 
end

function Hills_FarmDigCave_Item() 
	if ( has("rupees_on") and AccessMinishWoods()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


--pas dans la logique de base
function Hills_RopeGolden_KillRope() 
	if ( Fusions()==1 and has("golden_enemy_on") and HasSword()==1 and (CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and (CanDestroyTrees()==1 or WindCrest()==1)) then
		return 2
	else
		return 0
	end 
end