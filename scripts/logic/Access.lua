function AccessLonLon() 
	if ( has("ocarina") or ( CanDestroyTrees()==1 and ( has("llrkey") or has("cape") or has("open_world") or (has("flippers") and ("mitts") )))) then
		return 1
	else
		return 0
	end 
end

function AccessSouthLake() 
	if ( (AccessLonLon()==1 and CapeExtension()==1 ) or (AccessNorthMinish()==1 and has("mitts") ) ) then
		return 1
	else
		return 0
	end 
end

function AccessTreasureCave() 
	if ( AccessMinishWoods()==1 and has("mitts") and has("cape") ) then
		return 1
	else
		return 0
	end 
end

function AccessMinishWoods() 
	if ( CanDestroyTrees()==1 or has("ocarina") ) then
		return 1
	else
		return 0
	end 
end

function AccessNorthMinish() 
	if ( AccessMinishWoods()==1 and ( has("flippers") or has("cape") or LonLonSouthShortcut()==1 )) then
		return 1
	else
		return 0
	end 
end

function AccessBelari() 
	if ( ( AccessMinishWoods()==1 and OverworldBlocks()==1) or WindCrest()==1 or CompleteDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end

function AccessTrilby() 
	if ( has("open_world") or has("flippers") or has("cape") or ( HasSword()==1 and HasSpin()==1 ) or GuardSkip()==1 or (WindCrest()==1 and (UperBean()==1 or has("grip")))) then
		return 1
	else
		return 0
	end 
end
function AccessWestern() 
	if ( WesternShortcut()==1 or ( AccessTrilby()==1 and ( CanSplit2()==1 or TrilbyShortcut()==1 ) ) or  ( WindCrest()==1 and ( has("boots") or has("cape") ) ) ) then
		return 1
	else
		return 0
	end 
end
function AccessCrenel() 
	if ( ( AccessTrilby()==1 and LowerBean()==1 and ( has("grip")  or ( ( BombWalls()==1 or has("cape") ) and CrenelDust()==1 ) ) ) or WindCrest()==1 ) then
		return 1
	else
		return 0
	end 
end
function AccessMelari() 
	if ( WindCrest()==1 or ( AccessCrenel()==1  and ( ( has("cane") and ( has("grip") or CrenelMushroom()==1 ) ) or ( has("grip") and ( has("cape") or LightArrowBreak()==1 or has("gust") ) and CrenelSwitch()==1 ) ) ) )	then
		return 1
	else
		return 0
	end 
end
function AccessSwamp() 
	if ( WindCrest()==1 or (AccessWestern()==1 and ( has("boots") or has("cape") ) ) )	then
		return 1
	else
		return 0
	end 
end
function GotScrolls() 
	if ( Tracker:ProviderCountForCode("sevenscrolls") >= 7 )	then
		return 1
	else
		return 0
	end 
end
function AccessRuins() 
	if ( ( has("boots") or has("cape") ) and ( ( AccessSwamp()==1 and SwampShortcut()==1 ) or WindCrest()==1 ) and RuinsFusion()==1 )	then
		return 1
	else
		return 0
	end 
end