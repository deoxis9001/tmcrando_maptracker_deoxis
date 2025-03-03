
function WesternWoods_FusionChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3a") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TreeFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions11") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TopDig() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions48") ) ) and function_Cached("AccessWestern")==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_PercyFusion_Moblin() 
	if ( function_Cached("AccessWestern")==1 and function_Cached("Percy")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_PercyFusion_Percy() 
	if ( function_Cached("AccessWestern")==1 and function_Cached("Percy")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BottomDig() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4c") ) ) and function_Cached("AccessWestern")==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_GoldenOcto() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3d") ) ) and function_Cached("AccessWestern")==1 and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BeanstalkFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions24") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BeanstalkFusion_Item() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions24") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end