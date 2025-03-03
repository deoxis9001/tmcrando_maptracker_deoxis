

function Ruins_ButterflyFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions20") ) ) and function_Cached("AccessRuins")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions20") ) ) and function_Cached("AccessRuins")==2 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_BombCave_Chest() 
	if ( function_Cached("AccessRuins")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessRuins")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_MinishHome_Chest()
	if ( function_Cached("AccessRuins")==1 ) then
		return 1
	elseif ( function_Cached("AccessRuins")==2 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_PillarsFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions64") ) ) and function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions64") ) ) and function_Cached("AccessRuins")==2 and function_Cached("RuinsArmos")==1 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_BeanStalkFusion_BigChest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions17") ) ) and function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 and function_Cached("RuinsTektites")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions17") ) ) and ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 )  and function_Cached("RuinsArmos")==1 and ( function_Cached("RuinsTektites")==1 or function_Cached("RuinsTektites")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_CrackFusion_Chest()
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions41") ) ) and function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 and function_Cached("RuinsTektites")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions41") ) ) and ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 )  and function_Cached("RuinsArmos")==1 and ( function_Cached("RuinsTektites")==1 or function_Cached("RuinsTektites")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_MinishCave_HP() 
	if ( function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 and function_Cached("RuinsTektites")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 )  and function_Cached("RuinsArmos")==1 and ( function_Cached("RuinsTektites")==1 or function_Cached("RuinsTektites")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_ArmosKill_Chest() 
	if ( function_Cached("AccessRuins")==1 and function_Cached("HasDamageSource")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 ) and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_GoldenOcto() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions54") ) ) and has("golden_enemy_on") and function_Cached("AccessRuins")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions54") ) ) and has("golden_enemy_on") and function_Cached("AccessRuins")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_NearFoWFusion_Chest()
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0a") ) ) and function_Cached("AccessRuins")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0a") ) ) and function_Cached("AccessRuins")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end