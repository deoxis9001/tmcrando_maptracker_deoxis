function Hylia_SunkenHP() 
	if ( function_Cached("AccessLonLon")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_DogNPC() 
	if ( function_Cached("AccessLonLon")==1 and has("dogbottle") ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and has("dogbottle") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_SmallIsland_HP() 
	if ( function_Cached("AccessLonLon")==1 and function_Cached("LakeIslandHP")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2 ) and ( function_Cached("LakeIslandHP")==1 or function_Cached("LakeIslandHP")==2) ) then
		return 2
	elseif ( function_Cached("AccessLonLon")==1 ) then
		return 3
	else
		return 0
	end 
end

function Hylia_CapeCave_Chest() 
	if ( function_Cached("AccessTreasureCave")==1 ) then
		return 1
	elseif ( function_Cached("AccessTreasureCave")==2 ) then
		return 2
	else
		return 0
	end 
end

function Hylia_CapeCave_LonLonHP() 
	if ( function_Cached("AccessTreasureCave")==1 ) then
		return 1
	elseif ( function_Cached("AccessTreasureCave")==2 ) then
		return 2
	elseif ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) then
		return 3
	else
		return 0
	end 
end

function Hylia_BeanstalkFusion_HP() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==1 and function_Cached("FusionsBlue")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==2 and function_Cached("FusionsBlue")==1 ) then
		return 2
	else
		return 0
	end 
end

function Hylia_BeanstalkFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==1 and function_Cached("FusionsBlue")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==2 and function_Cached("FusionsBlue")==1 ) then
		return 2
	else
		return 0
	end 
end

function Hylia_MiddleIslandFusion_DigCaveChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions34") ) ) and ( function_Cached("AccessLonLon")==1 and has("mitts") and function_Cached("CapeExtension")==1 ) ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions34") ) ) and ( ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) and has("mitts") and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_BottomHP() 
	if ( function_Cached("LakeSouthHP")==1 ) then
		return 1
	elseif ( function_Cached("LakeSouthHP")==2 ) then
		return 2
	elseif ( function_Cached("LakeSouthHP")==3 ) then
		return 3
	else
		return 0
	end 
end

function Hylia_Dojo_HP() 
	if ( function_Cached("AccessLonLon")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("LakeShortcut")==1 ) ) then
		return 1
	elseif ( ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) and ( ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) or function_Cached("LakeShortcut")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_Dojo_NPC() 
	if ( function_Cached("AccessLonLon")==1 and has("10hearts") and function_Cached("HasSword")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("LakeShortcut")==1 ) ) then
		return 1
	elseif ( ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) and has("10hearts") and function_Cached("HasSword")==1 and ( ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) or function_Cached("LakeShortcut")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_CrackFusion_LibrariNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions12") ) ) and function_Cached("LakeWindCrest")==1 and ( has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function Hylia_NorthMinishHole_Chest() 
	if ( function_Cached("AccessSouthLake")==1 and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 ) and has("flippers") ) then
		return 1
	elseif ( ( function_Cached("AccessSouthLake")==2 or function_Cached("AccessSouthLake")==1 ) and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 or function_Cached("LakeMinish")==2 ) and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_SouthMinishHole_Chest() 
	if ( function_Cached("AccessSouthLake")==1 and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 ) and has("flippers") ) then
		return 1
	elseif ( ( function_Cached("AccessSouthLake")==2 or function_Cached("AccessSouthLake")==1 ) and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 or function_Cached("LakeMinish")==2 ) and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_CabinPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions51") ) ) and function_Cached("AccessSouthLake")==1 and ( ( function_Cached("BonkedTrees")==1 and function_Cached("CabinSwim")==1 ) or ( function_Cached("LakeMinish")==1 and has("flippers") and function_Cached("CabinSwim")==1 ) ) )then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions51") ) ) and ( function_Cached("AccessSouthLake")==1 or function_Cached("AccessSouthLake")==2 ) and ( ( function_Cached("BonkedTrees")==1 and ( function_Cached("CabinSwim")==1 or function_Cached("CabinSwim")==2 ) ) or ( ( function_Cached("LakeMinish")==1 or function_Cached("LakeMinish")==2 ) and has("flippers") and ( function_Cached("CabinSwim")==1 or function_Cached("CabinSwim")==2 ) ) ) )then
		return 2
	else
		return 0
	end 
end

function Hylia_MayorCabin_Item() 
	if ( function_Cached("AccessSouthLake")==1 and function_Cached("MayorCabin")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessSouthLake")==1 or function_Cached("AccessSouthLake")==2 ) and ( function_Cached("MayorCabin")==1 or function_Cached("MayorCabin")==2 ) ) then
		return 2
	elseif ( ( function_Cached("AccessSouthLake")==1 or function_Cached("AccessSouthLake")==2 ) ) then
		return 3
	else
		return 0
	end 
end