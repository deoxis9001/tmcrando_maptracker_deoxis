

function Castle_Moat_LeftChest() 
	if ( has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Castle_Moat_RightChest() 
	if ( has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Castle_GoldenRope() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3c") ) ) and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_RightFountainFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions18") ) ) ) then
		return 1
	else
		return 0
	end 
end

function Castle_Dojo_HP() 
		return 1 
end

function Castle_Dojo_NPC() 
	if ( function_Cached("CastleDojo")==1 and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_RightFountainFusion_MinishHoleChest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions18") ) ) and function_Cached("BonkedTrees")==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_LeftFountainFusion_MinishHoleChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions35") ) ) and function_Cached("BonkedTrees")==1 ) then
		return 1
	else
		return 0
	end 
end
