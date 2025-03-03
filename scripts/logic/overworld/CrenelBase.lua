function CrenelBase_EntranceVine()
	if function_Cached("AccessTrilby")==1 then
		return 1
	elseif function_Cached("AccessTrilby")==2 then
		return 2
	else
		return 0
	end
end

function CrenelBase_FairyCave_Item()
	if ( function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 ) or ( function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or has("grip") ) and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_GreenWaterFusion_Chest()
	if ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 1
	elseif ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or has("grip") ) and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 1
	elseif ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 2
	else
		return 0
	end
end

function CrenelBase_WestFusion_Chest()
	if( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) then
		return 1
	elseif ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) then
		return 1
	elseif( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_WaterCave_Chest()
	if function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and ( has("bombs") or has("cape") ) then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("BombWalls")==1 and ( has("bombs") or has("cape") ) then
		return 1
	elseif function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and ( has("bombs") or has("cape") ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_WaterCave_HP()
	if ( function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and function_Cached("CrenelWaterCaveHP")==1 ) then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("BombWalls")==1 and function_Cached("CrenelWaterCaveHP")==1 then
		return 1
	elseif ( ( function_Cached("AccessTrilby")==1 or function_Cached("AccessTrilby")==2 ) and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and ( function_Cached("CrenelWaterCaveHP")==1 or function_Cached("CrenelWaterCaveHP")==2) ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_MinishVineHole_Chest()
	if function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif ( function_Cached("AccessTrilby")==1 or function_Cached("AccessTrilby")==2 ) and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_MinishCrack_Chest()
	if function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif ( function_Cached("AccessTrilby")==1 or function_Cached("AccessTrilby")==2 ) and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	else
		return 0
	end
end