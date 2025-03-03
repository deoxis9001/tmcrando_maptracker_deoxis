function FallsLower_LonLonFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions60") ) ) and function_Cached("AccessMinishWoods")==1 and has("cane") ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions60") ) ) and function_Cached("AccessMinishWoods")==2 and has("cane") ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_HP() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_WaterfallFusion_DojoNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1d") ) ) and function_Cached("AccessMinishWoods")==1 and has("cane") and has("flippers") and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1d") ) ) and function_Cached("AccessMinishWoods")==2 and has("cane") and has("flippers") and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_RockItem1() 
	if ( function_Cached("LowerFallsItems")==1 ) then
		return 1
	elseif ( function_Cached("LowerFallsItems")==2 ) then
		return 2
	elseif ( function_Cached("Falls_Entrance_HP")==1 ) then
		return 3
	else
		return 0
	end 
end

function FallsLower_RockItem2() 
	if ( function_Cached("LowerFallsItems")==1 ) then
		return 1
	elseif ( function_Cached("LowerFallsItems")==2 ) then
		return 2
	elseif ( function_Cached("Falls_Entrance_HP")==1 ) then
		return 3
	else
		return 0
	end 
end

function FallsLower_RockItem3() 
	if ( function_Cached("LowerFallsItems")==1 ) then
		return 1
	elseif ( function_Cached("LowerFallsItems")==2 ) then
		return 2
	elseif ( function_Cached("Falls_Entrance_HP")==1 ) then
		return 3
	else
		return 0
	end 
end

function FallsLower_DigCave_LeftChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end
function FallsLower_DigCave_RightChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end