

function LonLon_RanchPot() 
	if ( function_Cached("CanDestroyTrees")==1 or function_Cached("LakeWindCrest")==1 ) then
		return 1
	elseif ( function_Cached("CanDestroyTrees")==2 or function_Cached("LakeWindCrest")==1 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_PuddleFusion_BigChest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1e") ) ) and function_Cached("AccessLonLon")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1e") ) ) and function_Cached("AccessLonLon")==2 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_Cave_Chest() 
	if ( function_Cached("AccessLonLon")==1 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function LonLon_CaveSecret_Chest() 
	if ( function_Cached("AccessLonLon")==1 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("BombWalls")==1 and function_Cached("LonLonSecret")==1 ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("BombWalls")==1 and function_Cached("LonLonSecret")==1 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_Path_FusionChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions50") ) ) and function_Cached("AccessLonLon")==1 and function_Cached("BonkedTrees")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions50") ) ) and function_Cached("AccessLonLon")==2 and function_Cached("BonkedTrees")==1 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_Path_HP() 
	if ( function_Cached("AccessLonLon")==1 and function_Cached("BonkedTrees")==1 ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and function_Cached("BonkedTrees")==1 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_DigSpot() 
	if ( function_Cached("AccessLonLon")==1 and ( has("cane") or has("cape") ) and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( has("cane") or has("cape") ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function LonLon_NorthMinishCrack_Chest() 
	if ( function_Cached("AccessLonLon")==1 and ( has("cane") or has("cape") ) ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( has("cane") or has("cape") ) ) then
		return 2
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_SmallChest() 
	if has("fusionblue_vanilla") then
		GoronNumber=0
		if ( has("fusions25") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions26") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions29") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2a") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2b") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2f") ) then
			GoronNumber = GoronNumber + 1
		end
	elseif has("fusionblue_complet") then
		GoronNumber = 6
	else
		GoronNumber = 0
	end
	if ( GoronNumber >=4 and function_Cached("GoronCave")==1 and ( function_Cached("CanDestroyTrees")==1 or function_Cached("LakeWindCrest")==1 ) ) then
		return 1
	elseif ( GoronNumber >=4 and ( function_Cached("GoronCave")==1 or function_Cached("GoronCave")==2 ) and (  function_Cached("CanDestroyTrees")==1 or function_Cached("CanDestroyTrees")==2 or function_Cached("LakeWindCrest")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_BigChest() 
	if has("fusionblue_vanilla") then
		local GoronNumber=0
		if ( has("fusions25") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions26") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions29") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2a") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2b") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2f") ) then
			GoronNumber = GoronNumber + 1
		end
	elseif has("fusionblue_complet") then
		GoronNumber = 6
	else
		GoronNumber = 0
	end

	if ( GoronNumber>=6 and function_Cached("GoronCave")==1 and ( function_Cached("CanDestroyTrees")==1 or function_Cached("LakeWindCrest")==1 ) ) then
		return 1
	elseif ( GoronNumber >=6 and ( function_Cached("GoronCave")==1 or function_Cached("GoronCave")==2 ) and (  function_Cached("CanDestroyTrees")==1 or function_Cached("CanDestroyTrees")==2 or function_Cached("LakeWindCrest")==1 ) ) then
		return 2
	else
		return 0
	end 
end