function FallsLower_LonLonFusion_Chest() 
	if ( Fusions()==1 and AccessMinishWoods()==1 and has("cane") ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_HP() 
	if ( AccessMinishWoods()==1 and has("cane") ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_WaterfallFusion_DojoNPC() 
	if ( Fusions()==1 and AccessMinishWoods()==1 and has("cane") and has("flippers") and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_RockItem1() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_RockItem2() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_RockItem3() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_DigCave_LeftChest() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("cape") or has("flippers")) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function FallsLower_DigCave_RightChest() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("cape") or has("flippers")) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end