function Swamp_ButterflyFusion_Item() 
	if ( AccessSwamp()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_CenterCave_DarknutChest() 
	if ( AccessSwamp()==1 and HasDamageSource()==1) then
		return 1
	else
		return 0
	end 
end

function Swamp_CenterChest() 
	if ( AccessSwamp()==1 and HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NearWaterfall_CaveHP() 
	if ( AccessSwamp()==1  and SwampNorthShortcut()==1 and ( has("cape") or has("flippers") ) ) then
		return 1 
	else
		return 0
	end 
end

function Swamp_WaterfallFusion_DojoNPC() 
	if ( AccessSwamp()==1  and SwampNorthShortcut()==1 and ( has("cape") or has("flippers") ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NorthCave_Chest() 
	if ( AccessSwamp()==1 and SwampNorthShortcut()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_DiggingCave_Chest() 
	if ( AccessSwamp()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Underwater() 
	if ( AccessSwamp()==1 and has("flippers")  ) then
		return 1
	else
		return 0
	end 
end

function Swamp_SouthCave_Chest() 
	if ( AccessSwamp()==1 and SwampShortcut()==1 and SwampSouthShortcut()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Dojo_HP() 
	if ( (AccessSwamp()==1 and (has("cape") or HasBow()==1)  ) or (WindCrest()==1 and has("boots")) ) then
		return 1
	else
		return 0
	end 
end
function Swamp_Dojo_NPC() 
	if ( (AccessSwamp()==1 and (has("cape") or HasBow()==1) and GotScrolls()==1 and HasSword()==1  ) or (WindCrest()==1 and has("boots")  and GotScrolls()==1 and HasSword()==1) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthCrack_Chest() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 )) then
		return 1
	else
		return 0
	end 
end

function Swamp_Minish_Mulldozer_BigChest() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and ( has("flippers") or has("gust") ) and HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthWestCrack_Chest() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and ( has("flippers") or has("gust") ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WestCrack_Chest() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 )) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_VineCrack_Chest() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 )) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_Chest() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and has("flippers")) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_HP() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and has("flippers")) then
		return 1
	else
		return 0
	end 
end

--pas dans la logique de base
function Swamp_RopeGolden_KillRope() 
	if ( Fusions()==1 and has("golden_enemy_on") and AccessSwamp()==1 and ( has("boots") or has("cape") ) and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and AccessSwamp()==1 and ( has("boots") or has("cape") ) ) then
		return 2
	else
		return 0
	end 
end


function Swamp_Fusion() 
	if ( AccessSwamp()==1 and RuinsFusion()==1 and ( has("boots") or ( has("cape") and has("flippers") ) ) ) then
		return 1
	else
		return 0
	end 
end
