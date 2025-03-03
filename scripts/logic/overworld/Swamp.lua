

function Swamp_ButterflyFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions10") ) ) and function_Cached("AccessSwamp")==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_CenterCave_DarknutChest() 
	if ( function_Cached("AccessSwamp")==1 and function_Cached("SwampDarknut")==1 ) then
		return 1
	elseif ( function_Cached("AccessSwamp")==1 and ( function_Cached("SwampDarknut")==1 or function_Cached("SwampDarknut")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Swamp_CenterChest() 
	if ( function_Cached("AccessSwamp")==1 and function_Cached("HasBow")==1 ) then
		return 1
	else
		return 0
	end 
end


function Swamp_GoldenRope() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions49") ) ) and function_Cached("AccessSwamp")==1 and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NearWaterfall_CaveHP() 
	if ( function_Cached("AccessSwamp")==1 and ( function_Cached("SwampNorthShortcut")==1 or function_Cached("HasBow")==1 ) and ( has("cape") or has("flippers") ) ) then
		return 1 
	else
		return 0
	end 
end

function Swamp_WaterfallFusion_DojoNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0c") ) ) and function_Cached("AccessSwamp")==1 and ( function_Cached("SwampNorthShortcut")==1 or function_Cached("HasBow")==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NorthCave_Chest() 
	if ( function_Cached("AccessSwamp")==1 and ( function_Cached("SwampNorthShortcut")==1 or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_DiggingCave_Chest() 
	if ( function_Cached("AccessSwamp")==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Underwater() 
	if ( function_Cached("AccessSwamp")==1 and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_SouthCave_Chest() 
	if ( function_Cached("AccessSwamp")==1 and ( has("flippers") or has("cape") or ( function_Cached("HasBow")==1 and has("boots") ) or ( function_Cached("SwampShortcut")==1 and function_Cached("SwampSouthShortcut")==1 ) or ( function_Cached("SwampWindCrest")==1 and ( function_Cached("HasBow")==1 or function_Cached("SwampSouthShortcut")==1 ) ) ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Dojo_HP()
	if ( ( function_Cached("AccessSwamp")==1 and ( has("cape") or function_Cached("HasBow")==1 or ( has("boots") and has("flippers") ) ) ) or ( function_Cached("SwampWindCrest")==1 and has("boots") ) ) then
		return 1
	else
		return 0
	end 
end
function Swamp_Dojo_NPC() 
	if ( ( function_Cached("AccessSwamp")==1 and ( has("cape") or function_Cached("HasBow")==1 or ( has("boots") and has("flippers") ) ) and function_Cached("GotScrolls")==1 and function_Cached("HasSword")==1 ) or ( function_Cached("SwampWindCrest")==1 and has("boots") and function_Cached("GotScrolls")==1 and function_Cached("HasSword")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4b") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Minish_Mulldozer_BigChest() 
	if ( function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and ( has("flippers") or has("gust") ) and function_Cached("HasDamageSource")==1 ) then
		return 1
	elseif ( function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and ( has("flippers") or has("gust") ) and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthWestCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5b") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and ( has("flippers") or has("gust") ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WestCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_VineCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3e") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_HP() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end


function Swamp_Fusion() 
	if ( function_Cached("AccessSwamp")==1 and function_Cached("RuinsFusion")==1 ) then
		return 1
	elseif ( function_Cached("AccessSwamp")==1 and function_Cached("RuinsFusion")==2 ) then
		return 2
	else
		return 0
	end 
end