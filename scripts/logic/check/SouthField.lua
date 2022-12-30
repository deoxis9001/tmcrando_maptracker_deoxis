function SouthField_PuddleFusion_Item()
	if ( has("fusions_open") and has("rupees_on") and ( CanDestroyTrees()==1 or has("cape") or has("flippers") or AccessWestern()==1 ) ) then
		return 1
	elseif ( has("open_world") and has("rupees_on") and ( CanDestroyTrees()==1 or has("cape") or has("flippers") or AccessWestern()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SouthField_Fusion_Chest()
	if ( has("fusions_open") and ( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	elseif ( has("open_world") and ( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SouthField_TreeFusion_HP()
	if ( has("fusions_open") and ( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	elseif ( has("open_world") and ( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SouthField_MinishSize_WaterHole_HP() 
	if ( has("flippers") and CanDestroyTrees()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end
function SouthField_Tingle_NPC() 
	if ( has("PacciCane")  and has("trophy") and ( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	else
		return 0
	end 
end