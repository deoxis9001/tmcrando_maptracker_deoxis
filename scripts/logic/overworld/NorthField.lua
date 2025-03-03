
function NorthField_DigSpot() 
	if ( has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function NorthField_HP() 
	if ( function_Cached("OverworldBlocks")==1 or function_Cached("CapeExtension")==1 ) then
		return 1
	elseif ( function_Cached("CapeExtension")==2 ) then
		return 2
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopLeftChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions59") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopRightChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions40") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomLeftChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4d") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomRightChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5a") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_CenterBigChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions59") and has("fusions40") and has("fusions5a") and has("fusions4d") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_WaterfallFusion_DojoNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions15") ) ) and has("flippers") and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end