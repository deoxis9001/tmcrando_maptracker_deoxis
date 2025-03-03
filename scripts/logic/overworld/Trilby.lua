

function Trilby_MiddleFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5e") ) ) and function_Cached("AccessTrilby")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5e") ) ) and function_Cached("AccessTrilby")==2 ) then
		return 2
	else
		return 0
	end 
end

function Trilby_TopFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions52") ) ) and function_Cached("AccessTrilby")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions52") ) ) and function_Cached("AccessTrilby")==2 ) then
		return 2
	else
		return 0
	end 
end

function Trilby_DigCave_LeftChest() 
	if ( function_Cached("AccessTrilby")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Trilby_DigCave_RightChest() 
	if ( function_Cached("AccessTrilby")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Trilby_DigCave_WaterFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions22") ) ) and function_Cached("AccessTrilby")==1 and has("mitts") and ( has("cape") or has("flippers") ) ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions22") ) ) and function_Cached("AccessTrilby")==2 and has("mitts") and ( has("cape") or has("flippers") ) ) then
		return 2
	else
		return 0
	end 
end

function Trilby_Scrub_NPC() 
	if ( function_Cached("AccessTrilby")==1 and function_Cached("BombWalls")==1 and function_Cached("Scrubs")==1 ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and function_Cached("BombWalls")==1 and function_Cached("Scrubs")==1 ) then
		return 2
	else
		return 0
	end 
end

function Trilby_BombCave_Chest() 
	if ( function_Cached("AccessWestern")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	else
		return 0
	end 
end

function Trilby_PuddleFusion_Item() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3f") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end