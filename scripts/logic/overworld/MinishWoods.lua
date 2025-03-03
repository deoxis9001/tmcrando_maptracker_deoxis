function MinishWoods_GreatFairy_NPC() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_GoldenOcto() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions56") ) ) and function_Cached("AccessNorthMinish")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions56") ) ) and function_Cached("AccessNorthMinish")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_WitchHut_Item() 
	if ( function_Cached("AccessNorthMinish")==1 ) then
		return 1
	elseif ( function_Cached("AccessNorthMinish")==2 ) then
		return 2
	else
		return 0
	end 
end

function WitchDiggingCave_Chest() 
	if ( function_Cached("AccessNorthMinish")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessNorthMinish")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_NorthFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions44") ) ) and function_Cached("AccessNorthMinish")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions44") ) ) and function_Cached("AccessNorthMinish")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_TopHP() 
	if ( function_Cached("MinishNorthHP")==1 ) then
		return 1
	elseif ( function_Cached("MinishNorthHP")==2 ) then
		return 2
	elseif ( function_Cached("MinishNorthHP")==3 ) then
		return 3
	else
		return 0
	end 
end

function MinishWoods_WestFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions47") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions47") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_LikeLikeDiggingCave_LeftChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("mitts") and function_Cached("LikeLike")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and has("mitts") and ( function_Cached("LikeLike")==1 or function_Cached("LikeLike")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_LikeLikeDiggingCave_RightChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("mitts") and function_Cached("LikeLike")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and has("mitts") and ( function_Cached("LikeLike")==1 or function_Cached("LikeLike")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_EastFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions46") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions46") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_SouthFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions39") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions39") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_BottomHP() 
	if ( function_Cached("MinishSouthHP")==1 ) then
		return 1
	elseif ( function_Cached("MinishSouthHP")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_CrackFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4e") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4e") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_MinishPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions37") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions37") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishVillage_BarrelHouse_Item() 
	if ( function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishVillage_HP() 
	if ( function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_BombMinish_NPC1() 
	if ( function_Cached("AccessBelari")==1 ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_BombMinish_NPC2() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1c") ) ) and function_Cached("AccessBelari")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1c") ) ) and function_Cached("AccessBelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_PostVillageFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions38") ) ) and function_Cached("AccessBelari")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions38") ) ) and function_Cached("AccessBelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_MiddleChest() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_RightChest() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_LeftChest() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_HP() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end