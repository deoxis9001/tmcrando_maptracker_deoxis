
function Hills_GoldenRope() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions55") ) ) and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Hills_Fusion_Chest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions16") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions16") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 2
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_LeftChest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 2
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_HP() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_RightChest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 1
	else
		return 0
	end 
end

function Hills_BombCave_Chest() 
	if ( function_Cached("AccessEasternHills")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessEasternHills")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Hills_FarmDigCave_Item() 
	if ( function_Cached("AccessMinishWoods")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end