function Falls_Entrance_HP()
	if ( function_Cached("FallsHP")==1 ) then
		return 1
	elseif ( function_Cached("FallsHP")==2 ) then
		return 2
	elseif ( function_Cached("FallsHP")==3 ) then
		return 3
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_HP()
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and function_Cached("CapeExtension")==1 ) or ( function_Cached("AccessFalls")==1 and has("grip") and ( has("flippers") or ( has("cape") and function_Cached("DarkRooms")==1 ) ) ) ) and has("mitts") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) or ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2 ) and has("grip") and ( has("flippers") or ( has("cape") and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) ) ) ) ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_Chest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and function_Cached("CapeExtension")==1 ) or ( function_Cached("AccessFalls")==1 and has("grip") and ( has("flippers") or ( has("cape") and function_Cached("DarkRooms")==1 ) ) ) ) and has("mitts") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) or ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2 ) and has("grip") and ( has("flippers") or ( has("cape") and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) ) ) ) ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Falls_1stCave_Chest()
	if ( function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and function_Cached("BombWalls")==1 ) or ( function_Cached("AccessFalls")==1 and has("grip") and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==2 or function_Cached("FallsFusion")==1 ) and ( function_Cached("DarkRooms")==2 or function_Cached("DarkRooms")==1 ) and function_Cached("BombWalls")==1 ) or ( function_Cached("AccessFalls")==2  and has("grip") and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Falls_Cliff_Chest()
	if ( function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and function_Cached("BombWalls")==1 and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) or ( function_Cached("AccessFalls")==1 and has("grip") and function_Cached("BombWalls")==1 and function_Cached("DarkRooms")==1 and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==2 or function_Cached("FallsFusion")==1 ) and ( function_Cached("DarkRooms")==2 or function_Cached("DarkRooms")==1 ) and function_Cached("BombWalls")==1 and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) or ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2) and has("grip") and function_Cached("BombWalls")==1 and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Falls_SouthDigSpot()
	if ( function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and has("mitts") ) or ( function_Cached("AccessFalls")==1 and has("grip") and has("mitts") ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==2 or function_Cached("FallsFusion")==1 ) and ( function_Cached("DarkRooms")==2 or function_Cached("DarkRooms")==1 ) and has("mitts") ) or ( function_Cached("AccessFalls")==2 and has("grip") and has("mitts") ) then
		return 2
	else
		return 0
	end 
end 

function Falls_GoldenTektite() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4a") ) ) and has("golden_enemy_on") and function_Cached("AccessFalls")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4a") ) ) and has("golden_enemy_on") and function_Cached("AccessFalls")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Falls_NorthDigSpot()
	if ( function_Cached("AccessFalls")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Falls_RockFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions61") ) ) and function_Cached("AccessFalls")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions61") ) ) and function_Cached("AccessFalls")==2 ) then
		return 2
	else
		return 0
	end 
end

function Falls_WaterfallFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions13") ) ) and function_Cached("AccessFalls")==1 and has("flippers") ) then 
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions13") ) ) and function_Cached("AccessFalls")==2 and has("flippers") ) then 
		return 2
	else
		return 0
	end 
end

function Falls_RupeeCave_Item() 
	if ( function_Cached("AccessFalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 ) then
		return 2
	else
		return 0
	end 
end

function Falls_RupeeCave_Underwater() 
	if ( function_Cached("AccessFalls")==1 and has("flippers") ) then 
		return 1
	elseif ( function_Cached("AccessFalls")==2 and has("flippers") ) then 
		return 2
	else
		return 0
	end 
end

function Falls_TopCave_BombWall_Chest() 
	if ( function_Cached("AccessFalls")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Falls_TopCave_Chest() 
	if ( function_Cached("AccessFalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 ) then
		return 2
	else
		return 0
	end 
end
function Falls_Biggoron() 
	if ( function_Cached("AccessFalls")==1 and function_Cached("HasBiggoronShield")==1 and ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0e") ) )) then
		return 1
	elseif ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2 ) and function_Cached("HasBiggoronShield")==1 and ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0e") ) )) then
			return 2
	else
		return 0
	end 
end