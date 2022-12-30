function NorthField_DigSpot() 
	if ( has("obscure_on") and has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function NorthField_HP() 
	if ( OverworldBlocks()==1 or CapeExtension()==1 ) then
		return 1
	elseif ( CapeExtension()==2 ) then
		return 2
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopLeftChest() 
	if ( Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopRightChest() 
	if ( Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomLeftChest() 
	if ( Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomRightChest() 
	if ( Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_CenterBigChest() 
	if ( Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end
function NorthField_WaterfallFusion_DojoNPC() 
	if ( Fusions()==1 and has("flippers") and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
