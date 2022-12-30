function LonLon_RanchPot() 
	if ( CanDestroyTrees()==1 or has("ocarina") ) then
		return 1
	else
		return 0
	end 
end

function LonLon_PuddleFusion_BigChest() 
	if ( Fusions()==1 and AccessLonLon()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_Cave_Chest() 
	if ( Fusions()==1 and AccessLonLon()==1 and CanSplit2()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_CaveSecret_Chest() 
	if ( Fusions()==1 and AccessLonLon()==1 and CanSplit2()==1  and BombWalls()==1 and has("lamp") ) then
		return 1
	else
		return 0
	end 
end

function LonLon_Path_FusionChest() 
	if ( Fusions()==1 and AccessLonLon()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_Path_HP() 
	if ( AccessLonLon()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_DigSpot() 
	if ( has("obscure_on") and AccessLonLon()==1 and ( has("cane") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function LonLon_NorthMinishCrack_Chest() 
	if ( AccessLonLon()==1 and ( has("cane") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_SmallChest() 
	if ( Fusions()==1 and GoronCave()==1 and ( CanDestroyTrees()==1 or has("ocarina"))) then
		return 1
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_BigChest() 
	if ( Fusions()==1 and GoronCave()==1 and ( CanDestroyTrees()==1 or has("ocarina"))) then
		return 1
	else
		return 0
	end 
end