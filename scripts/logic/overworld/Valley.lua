
function Valley_PreValleyFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5f") ) ) and function_Cached("AccessValley")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5f") ) ) and function_Cached("AccessValley")==2 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GreatFairy_NPC() 
	if ( function_Cached("AccessValley")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and function_Cached("BombWalls")==1  then
		return 2
	else
		return 0
	end 
end

function Valley_LostWoods_Chest() 
	if ( function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 ) then
		return 1
	elseif ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) then
		return 2
	else
		return 0
	end 
end

function Valley_Dampe_NPC() 
	if ( function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 ) then
		return 1
	elseif ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardButterflyFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions19") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions19") ) ) and( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardLeftFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5c") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5c") ) ) and ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardLeftGrave_HP() 
	if ( function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 and function_Cached("LeftGraveHP")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 and ( function_Cached("LeftGraveHP")==1 or function_Cached("LeftGraveHP")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardRightFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5d") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5d") ) ) and ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardRightGraveFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions30") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions30") ) ) and ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end