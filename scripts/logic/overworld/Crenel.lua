function Crenel_VineTop_GoldenTektite() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3b") ) ) and function_Cached("AccessCrenel")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3b") ) ) and function_Cached("AccessCrenel")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_BridgeCave_Chest() 
	if ( function_Cached("AccessCrenel")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_FairyCave_HP() 
	if ( function_Cached("AccessCrenel")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end


function Crenel_BelowCoF_GoldenTektite() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0d") ) ) and function_Cached("AccessCrenel")==1 and function_Cached("HasSword")==1 and ( has("grip") or has("bombs") or function_Cached("CrenelMushroom")==1 or function_Cached("CrenelWindCrest")==1 ) ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0d") ) ) and ( function_Cached("AccessCrenel")==1 or function_Cached("AccessCrenel")==2 ) and function_Cached("HasSword")==1 and ( has("grip") or has("bombs") or ( function_Cached("CrenelMushroom")==1 or function_Cached("CrenelMushroom")==2 ) or function_Cached("CrenelWindCrest")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Scrub_NPC()
	if ( function_Cached("AccessCrenel")==1 and function_Cached("BombWalls")==1 and ( has("grip") or has("bombs") or function_Cached("CrenelMushroom")==1 or function_Cached("CrenelWindCrest")==1 ) and function_Cached("Scrubs")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessCrenel")==1 or function_Cached("AccessCrenel")==2 ) and function_Cached("BombWalls")==1 and ( has("grip") or has("bombs") or ( function_Cached("CrenelMushroom")==1 or function_Cached("CrenelMushroom")==2 ) or function_Cached("CrenelWindCrest")==1 ) and function_Cached("Scrubs")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Dojo_Chest() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Dojo_HP() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Dojo_NPC() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("CrenelDojo")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("CrenelDojo")==1 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_GreatFairy_NPC()
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("BombWalls")==1 and ( has("bombs") or function_Cached("HasBottle")==1 ) ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("BombWalls")==1 and ( has("bombs") or function_Cached("HasBottle")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_ClimbFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions62") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions62") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_DigCave_HP() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_RainPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions43") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions43") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_UpperBlock_Chest() 
	if ( function_Cached("AccessMelari")==1 ) then
		return 1
	elseif ( function_Cached("AccessMelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_MinesPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions45") ) ) and function_Cached("AccessMelari")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions45") ) ) and function_Cached("AccessMelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Melari_Mining() 
	if ( function_Cached("AccessMelari")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMelari")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Melari_NPC() 
	if ( function_Cached("CompleteCoF")==1 ) then
		return 1
	else
		return 0
	end 
end