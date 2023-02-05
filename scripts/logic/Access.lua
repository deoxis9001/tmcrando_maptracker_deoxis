function AccessEasternHills() 
	if ( CanDestroyTrees()==1 or SHFWindCrest()==1 or (OverworldBlocks()==1 and AccessMinishWoods()==1) ) then
		return 1
	else
		return 0
	end 
end

function AccessLonLon() 
	if ( has("ocarina") or ( CanDestroyTrees()==1 and ( has("llrkey") or has("cape") or has("openworld_on") or (has("flippers") and has("mitts") )))) then
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
	if ( ( AccessMinishWoods()==1 and OverworldBlocks()==1) or MinishWindCrest()==1 or CompleteDeepwood()==1 ) then
		return 1
	else
		return 0
	end 
end

function AccessTrilby() 
	if ( has("openworld_on") or has("flippers") or has("cape") or ( HasSword()==1 and HasSpin()==1 ) or GuardSkip()==1 or (CrenelWindCrest()==1 and (UpperBean()==1 or has("grip")))) then
		return 1
	else
		return 0
	end 
end
function AccessWestern() 
	if ( WesternShortcut()==1 or ( AccessTrilby()==1 and ( CanSplit2()==1 or TrilbyShortcut()==1 ) ) or  ( SwampWindCrest()==1 and ( has("boots") or has("cape") ) ) ) then
		return 1
	else
		return 0
	end 
end
function AccessCrenel() 
	if ( ( AccessTrilby()==1 and LowerBean()==1 and ( has("grip")  or ( ( BombWalls()==1 or has("cape") ) and CrenelDust()==1 and ( UpperBean()==1 or (BombWalls()==1 and OverworldBlocks()==1))))) or CrenelWindCrest()==1 ) then
		return 1
	else
		return 0
	end 
end
function AccessMelari() 
	if ( CrenelWindCrest()==1 or ( AccessCrenel()==1  and ( ( has("cane") and ( has("grip") or CrenelMushroom()==1 ) ) or ( has("grip") and ( has("cape") or LightArrowBreak()==1 or has("gust") ) and CrenelSwitch()==1 ) ) ) )	then
		return 1
	else
		return 0
	end 
end
function AccessSwamp() 
	if ( SwampWindCrest()==1 or (AccessWestern()==1 and ( has("boots") or has("cape") ) ) )	then
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
	if ( ( has("boots") or has("cape") ) and ( ( AccessSwamp()==1 and SwampShortcut()==1 ) or SwampWindCrest()==1 ) and RuinsFusion()==1 )	then
		return 1
	else
		return 0
	end 
end
function AccessValley() 
	if (CanSplit3()==1 or CanSplit4()==1) and (OverworldBlocks()==1 or has("cape") or has("flippers"))	then
		return 1
	else
		return 0
	end 
end
function AccessCrypt() 
	if (AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 and CryptEntrance()==1)	then
		return 1
	else
		return 0
	end 
end
function AccessFalls()
	if ( ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and has("grip") ) or FallsWindCrest()==1 or ( has("openworld_on") and has("grip") )) then
		return 1
	else
		return 0
	end 
end
function AccessClouds()
	if ( AccessFalls()==1 and has("grip") ) or (OpenWindTribe()==1 or CloudWindCrest()==1 )then
		return 1
	else
		return 0
	end 
end

function AccessWindTribe() 
	if ( CloudWindCrest()==1 or OpenWindTribe()==1 or ( AccessClouds()==1 and ( ( fusiongoldcombined:getActive()==false and Tracker:ProviderCountForCode("clouds")>=4  ) or ( fusiongoldcombined:getActive() and Tracker:ProviderCountForCode("clouds")>=9 )  ))) then
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
function AccessCoF()
	if AccessMelari()==1 then
		return 1
	else
		return 0
	end 
end
function CoFBasementAccess()
	if  CofDungeons()==1 and (CoFRedWarp()==1 or ( ( CoFBlueWarp()==1 or ( BombWalls()==1 and CoFSpikeBeetle()==1 and CoF1stDoor()==1 and HasSword()==1 )) and CoF2ndDoor()==1 and has("cane") and HasSword()==1 )) then
		return 1
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
	if ( PowDungeons()==1 and has("cape") and (CanSplit3()==1 or CanSplit4()==1 )and PoWJump()==1 and PoW1stDoor()==1 and PoWBigDoor()==1) then
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