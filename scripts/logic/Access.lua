function AccessLonLon() 
	if ( has("ocarina") or ( CanDestroyTrees()==1 and ( has("llrkey") or has("cape") or has("openworld_on") or (has("flippers") and ("mitts") )))) then
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
	if ( has("openworld_on") or has("flippers") or has("cape") or ( HasSword()==1 and HasSpin()==1 ) or GuardSkip()==1 or (WindCrest()==1 and (UperBean()==1 or has("grip")))) then
		return 1
	elseif ( has("nologic_on") and GuardSkip()==2 ) then
		return 2
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
	elseif ( has("nologic_on") and ( ( AccessTrilby()==1 or AccessTrilby()==2) and LowerBean()==1 and ( has("grip")  or ( ( BombWalls()==1 or has("cape") ) and CrenelDust()==1 ) ) ) ) then
		return 2
	else
		return 0
	end 
end
function AccessMelari() 
	if ( WindCrest()==1 or ( AccessCrenel()==1  and ( ( has("cane") and ( has("grip") or CrenelMushroom()==1 ) ) or ( has("grip") and ( has("cape") or LightArrowBreak()==1 or has("gust") ) and CrenelSwitch()==1 ) ) ) )	then
		return 1
	elseif ( has("nologic_on") and ( ( AccessTrilby()==1 or AccessTrilby()==2)  and ( ( has("cane") and ( has("grip") or CrenelMushroom()==1 ) ) or ( has("grip") and ( has("cape") or LightArrowBreak()==1 or has("gust") ) and CrenelSwitch()==1 ) ) ) )	then
		return 2
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
function AccessValley() 
	if CanSplit3()==1 and (OverworldBlocks()==1 or has("cape") or has("flippers"))	then
		return 1
	else
		return 0
	end 
end
function AccessFalls()
	if ( ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and has("grip") ) or WindCrest()==1 or ( has("openworld_on") and has("grip") )) then
		return 1
	else
		return 0
	end 
end
function AccessClouds()
	if WindCrest()==1 or ( AccessFalls()==1 and has("grip") ) or has("openworld_on") then
		return 1
	else
		return 0
	end 
end
function AccessDeepwood()
	if AccessMinishWoods()==1 and Festari()==1 then
		return 1
	else
		return 0
	end 
end
function CoFAccess()
	if AccessMelari()==1 then
		return 1
	elseif has("nologic_on") and AccessMelari()==2 then
		return 2
	else
		return 0
	end 
end
function CoFBasementAccess()
	if  CoFAccess()==1 and (CoFRedWarp()==1 or ( ( CoFBlueWarp()==1 or ( BombWalls()==1 and CoFSpikeBeetle()==1 and CoF1stDoor()==1 and HasSword()==1 )) and CoF2ndDoor()==1 and has("cane") and HasSword()==1 )) then
		return 1
	elseif  has("nologic_on") and CoFAccess()==2 and (CoFRedWarp()==1 or ( ( CoFBlueWarp()==1 or ( BombWalls()==1 and CoFSpikeBeetle()==1 and CoF1stDoor()==1 and HasSword()==1 )) and CoF2ndDoor()==1 and has("cane") and HasSword()==1 )) then
		return 2
	else
		return 0
	end 
end
function AccessFortress()
	if ( AccessRuins()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function AccessDroplets()
	if ( AccessLonLon()==1 and CapeExtension()==1 ) then
		return 1
	else
		return 0
	end 
end
function AccessPalace()
	if ( AccessWindTribe()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoW2ndHalf()
	if ( AccessPalace()==1 and has("cape") and CanSplit3()==1 and PoWJump()==1 and PoW1stDoor()==1 and PoWBigDoor()==1) then
		return 1
	else
		return 0
	end 
end
function AccessDHC()
	if ( has("dhc_open") or has("dhc_peditems") ) then
		return 1
	elseif ( ( has("dhc_closed") or has("dhc_none") ) and CompletePed()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCBlackKnight()
	if ( DHCBlueWarp()==1 or ( DHCRedWarp()==1 and DHCGrateRoom()==1 and OverworldBlocks()==1 and DHCBlackKnightFight()==1 ) or ( DHC1stDoor()==1 and DHC2ndCanon()==1 and BombWalls()==1 and DHCThrone()==1 and CanSplit4()==1 and DHCOutsideSwitch()==1 and DHCSwitchPuzzles()==1 and DHCChainSoldiers()==1 and DHCGrateRoom()==1 and OverworldBlocks()==1 and DHCBlackKnightFight()==1 ) ) then
		return 1
	else
		return 0
	end 
end