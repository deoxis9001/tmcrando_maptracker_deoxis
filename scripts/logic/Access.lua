function AccessEasternHills()
	if ( function_Cached("CanDestroyTrees")==1 or function_Cached("SHFWindCrest")==1 or ( function_Cached("OverworldBlocks")==1 and function_Cached("AccessMinishWoods")==1 ) ) then
		return 1
	elseif ( function_Cached("CanDestroyTrees")==2 or ( function_Cached("OverworldBlocks")==1 and function_Cached("AccessMinishWoods")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function AccessLonLon()
	
	if ( has("ocarina") or ( function_Cached("CanDestroyTrees")==1 and ( has("llrkey") or has("cape") or function_Cached("LonLonNorthShortcut")==1 or ( has("flippers") and has("mitts") ) ) ) ) then
		return 1
	elseif ( (function_Cached("CanDestroyTrees")==2 and ( has("llrkey") or has("cape") or function_Cached("LonLonNorthShortcut")==1 or ( has("flippers") and has("mitts") ) ) ) ) then
		return 2
	else
		return 0
	end 
end

function AccessSouthLake()
	 
	if ( ( function_Cached("AccessLonLon")==1 and function_Cached("CapeExtension")==1 ) or ( function_Cached("AccessNorthMinish")==1 and has("mitts") ) ) then
		return 1
	elseif ( (function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2) and (function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) or ( ( function_Cached("AccessNorthMinish")==1 or function_Cached("AccessNorthMinish")==2 ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function AccessTreasureCave()
	 
	if ( function_Cached("AccessMinishWoods")==1 and has("mitts") and has("cape") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("mitts") and has("cape") ) then
		return 2
	else
		return 0
	end 
end

function AccessMinishWoods()
	if ( function_Cached("CanDestroyTrees")==1 or has("ocarina") ) then
		return 1
	elseif ( function_Cached("CanDestroyTrees")==2 ) then
		return 2
	else
		return 0
	end 
end

function AccessNorthMinish()
	 
	if ( function_Cached("AccessMinishWoods")==1 and ( has("flippers") or has("cape") or function_Cached("LonLonSouthShortcut")==1 or ( function_Cached("AccessLonLon")==1 and has("cane") ) ) ) then
		return 1
	elseif ( ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and ( has("flippers") or has("cape") or function_Cached("LonLonSouthShortcut")==1 or ( ( function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2) and has("cane") ) ) ) then
		return 2
	else
		return 0
	end 
end

function AccessBelari()
	 
	if ( ( function_Cached("AccessMinishWoods")==1 and ( function_Cached("OverworldBlocks")==1 or function_Cached("CompleteDeepwood")==1 ) ) or function_Cached("MinishWindCrest")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessMinishWoods")==2 and ( function_Cached("OverworldBlocks")==1 or function_Cached("CompleteDeepwood")==1 ) ) ) then
		return 2
	else
		return 0
	end 
end

function AccessTrilby()
	 
	if ( function_Cached("WesternShortcut")==1 or has("flippers") or has("cape") or ( function_Cached("HasSword")==1 and function_Cached("HasSpin")==1 ) or function_Cached("GuardSkip")==1 or ( function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or has("grip") ) ) or ( function_Cached("SwampWindCrest")==1 and ( function_Cached("HasBow")==1 or has("boots") or has("cape") ) ) ) then
		return 1
	elseif ( function_Cached("GuardSkip")==2 ) then
		return 2
	else
		return 0
	end 
end

function AccessWestern()
	 
	if ( function_Cached("WesternShortcut")==1 or ( function_Cached("AccessTrilby")==1 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 or function_Cached("TrilbyShortcut")==1 ) ) or ( function_Cached("SwampWindCrest")==1 and ( function_Cached("HasBow")==1 or has("boots") or has("cape") ) ) ) then
		return 1
	else
		return 0
	end 
end

function AccessCrenel()
	 
	if ( ( function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and ( has("grip") or ( ( function_Cached("BombWalls")==1 or has("cape") ) and function_Cached("CrenelDust")==1 and ( function_Cached("UpperBean")==1 or ( function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 ) ) ) ) ) or function_Cached("CrenelWindCrest")==1 ) then
		return 1
	elseif ( ( ( function_Cached("AccessTrilby")==1 or function_Cached("AccessTrilby")==2 ) and function_Cached("LowerBean")==1 and ( has("grip") or ( ( function_Cached("BombWalls")==1 or has("cape") ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) and ( function_Cached("UpperBean")==1 or ( function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 ) ) ) ) ) ) then
		return 2
	else
		return 0
	end 
end
function AccessMelari()
	 
	if ( function_Cached("CrenelWindCrest")==1 or ( function_Cached("AccessCrenel")==1 and ( ( has("cane") and ( has("grip") or function_Cached("CrenelMushroom")==1 ) ) or ( has("grip") and ( has("cape") or function_Cached("LightArrowBreak")==1 or has("gust") ) and function_Cached("CrenelSwitch")==1 ) ) ) )	then
		return 1
	elseif ( ( ( function_Cached("AccessCrenel")==1 or function_Cached("AccessCrenel")==2 ) and ( ( has("cane") and ( has("grip") or ( function_Cached("CrenelMushroom")==1 or function_Cached("CrenelMushroom")==2 ) ) ) or ( has("grip") and ( has("cape") or ( function_Cached("LightArrowBreak")==1 or function_Cached("LightArrowBreak")==2 ) or has("gust") ) and ( function_Cached("CrenelSwitch")==1 or function_Cached("CrenelSwitch")==2 ) ) ) ) ) then
		return 2
	else
		return 0
	end 
end
function AccessSwamp()
	if ( function_Cached("SwampWindCrest")==1 or ( function_Cached("AccessWestern")==1 and ( has("boots") or has("cape") ) ) )	then
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
	 
	if ( function_Cached("RuinsFusion")==1 and function_Cached("AccessSwamp")==1 and ( has("cape") or ( has("boots") and ( has("flippers") or function_Cached("HasBow")==1 or function_Cached("SwampShortcut")==1 or function_Cached("SwampWindCrest")==1 ) ) ) ) then
		return 1
	elseif ( ( function_Cached("RuinsFusion")==1 or function_Cached("RuinsFusion")==2 ) and function_Cached("AccessSwamp")==1 and ( has("cape") or ( has("boots") and ( has("flippers") or function_Cached("HasBow")==1 or function_Cached("SwampShortcut")==1 or function_Cached("SwampWindCrest")==1 ) ) ) ) then
		return 2
	else
		return 0
	end 
end
function AccessValley()
	 
	if ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and ( function_Cached("OverworldBlocks")==1 or function_Cached("CapeExtension")==1 )	then
		return 1
	elseif ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("CapeExtension")==2 	then
		return 2
	else
		return 0
	end 
end
function AccessCrypt()
	 
	if ( function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 and function_Cached("CryptEntrance")==1 )	then
		return 1
	elseif ( ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 and function_Cached("CryptEntrance")==1 )	then
		return 2
	else
		return 0
	end 
	
end
function AccessFalls()
	
	if ( ( function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and has("grip") ) or function_Cached("FallsWindCrest")==1 or ( has("grip") and ( function_Cached("CloudWindCrest")==1 or ( function_Cached("StrangerFusion")==1 and function_Cached("OpenWindTribe")==1 ) ) ) ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==1 or function_Cached("FallsFusion")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function AccessClouds()
	
	if ( function_Cached("AccessFalls")==1 and has("grip") ) or function_Cached("CloudWindCrest")==1 or ( function_Cached("StrangerFusion")==1 and function_Cached("OpenWindTribe")==1 ) then
		return 1
	elseif function_Cached("AccessFalls")==2 and has("grip") then
		return 2
	else
		return 0
	end 
end

function AccessWindTribe()
	 
	if ( function_Cached("StrangerFusion")==1 and function_Cached("OpenWindTribe")==1 ) or ( function_Cached("AccessClouds")==1 and function_Cached("CloudFusions")==1 ) or function_Cached("CloudWindCrest")==1 then
		return 1
	elseif ( function_Cached("StrangerFusion")==1 and function_Cached("OpenWindTribe")==1 ) or ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) and ( function_Cached("CloudFusions")==1 or function_Cached("CloudFusions")==2 ) then
		return 2
	else
		return 0
	end 
end

function AccessDeepwood()
	
	if function_Cached("AccessMinishWoods")==1 and function_Cached("Festari")==1 then
		return 1
	elseif function_Cached("AccessMinishWoods")==2 and function_Cached("Festari")==1 then
		return 2
	else
		return 0
	end 
end
function AccessCoF()
	
	if function_Cached("AccessMelari")==1 then
		return 1
	elseif function_Cached("AccessMelari")==2 then
		return 2
	else
		return 0
	end 
end
function CoFBasementAccess()
	
	if ( function_Cached("CoFRedWarp")==1 or ( ( function_Cached("CoFBlueWarp")==1 or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 and function_Cached("CoF1stDoor")==1 and function_Cached("HasSword")==1 ) ) and function_Cached("CoF2ndDoor")==1 and has("cane") and function_Cached("HasSword")==1 ) ) then
		return 1
	elseif ( function_Cached("CoFRedWarp")==1 or ( ( function_Cached("CoFBlueWarp")==1 or ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) and ( function_Cached("CoF1stDoor")==1 or function_Cached("CoF1stDoor")==2 ) and function_Cached("HasSword")==1 ) ) and function_Cached("CoF2ndDoor")==1 and has("cane") and function_Cached("HasSword")==1 ) ) then
		return 2
	else
		return 0
	end 
end
function AccessFortress()
	
	if ( function_Cached("AccessRuins")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( function_Cached("AccessRuins")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end
function AccessDroplets()	
	if ( function_Cached("AccessLonLon")==1 and function_Cached("CapeExtension")==1 ) then
		return 1
	elseif ( (function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2) and (function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) then
		return 2
	else
		return 0
	end 
end
function AccessPalace()
	
	if ( function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( function_Cached("AccessWindTribe")==2 ) then
		return 2
	else
		return 0
	end 
end
function AccessDHC()
	
	if ( function_Cached("DhcDungeons")==1 and has("dhc_open") ) then
		return 1
	elseif ( ( function_Cached("DhcDungeons")==1 and has("dhc_closed") or has("dhc_ped") ) and function_Cached("CompletePed")==1 ) then
		return 1
	elseif ( function_Cached("DhcDungeons")==2 and has("dhc_open") ) then
		return 2
	elseif ( ( function_Cached("DhcDungeons")==2 and has("dhc_closed") or has("dhc_ped") ) and function_Cached("CompletePed")==1 ) then
		return 2
	else
		return 0
	end 
end
function DHCBlackKnight()	
	if ( function_Cached("DHCBlackKnightFight")==1 and ( function_Cached("DHCBlueWarp")==1 or ( function_Cached("DHCRedWarp")==1 and function_Cached("DHCChainSoldiers")==1 and function_Cached("DHCGrateRoom")==1 and function_Cached("OverworldBlocks")==1 ) or ( function_Cached("DHC1stDoor")==1 and function_Cached("DHC2ndCanon")==1 and function_Cached("BombWalls")==1 and function_Cached("DHCThrone")==1 and function_Cached("CanSplit4")==1 and function_Cached("DHCOutsideSwitch")==1 and function_Cached("DHCSwitchPuzzles")==1 and function_Cached("DHCChainSoldiers")==1 and function_Cached("DHCGrateRoom")==1 and function_Cached("OverworldBlocks")==1 ) ) ) then
		return 1
	elseif ( ( function_Cached("DHCBlackKnightFight")==1 or function_Cached("DHCBlackKnightFight")==2 ) and ( function_Cached("DHCBlueWarp")==1 or ( function_Cached("DHCRedWarp")==1 and ( function_Cached("DHCChainSoldiers")==1 or function_Cached("DHCChainSoldiers")==2 ) and ( function_Cached("DHCGrateRoom")==1 or function_Cached("DHCGrateRoom")==2 ) and function_Cached("OverworldBlocks")==1 ) or ( ( function_Cached("DHC1stDoor")==1 or function_Cached("DHC1stDoor")==2 ) and function_Cached("DHC2ndCanon")==1 and function_Cached("BombWalls")==1 and ( function_Cached("DHCThrone")==1 or function_Cached("DHCThrone")==2 ) and function_Cached("CanSplit4")==1 and ( function_Cached("DHCOutsideSwitch")==1 or function_Cached("DHCOutsideSwitch")==2 ) and ( function_Cached("DHCSwitchPuzzles")==1 or function_Cached("DHCSwitchPuzzles")==2 ) and function_Cached("DHCChainSoldiers")==1 and function_Cached("DHCGrateRoom")==1 and function_Cached("OverworldBlocks")==1 ) ) ) then
		return 2
	else
		return 0
	end 
end
function Json_AccessDeepwood()
	
	if ( function_Cached("AccessDeepwood")==1 ) then
		return 1
	elseif ( function_Cached("AccessDeepwood")==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	elseif ( function_Cached("AccessDeepwood")==3 ) then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end
function Json_AccessCoF()
	
	if ( function_Cached("AccessCoF")==1 ) then
		return 1
	elseif ( function_Cached("AccessCoF")==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	elseif ( function_Cached("AccessCoF")==3 ) then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end
function Json_AccessFortress()
	
	if ( function_Cached("AccessFortress")==1 ) then
		return 1
	elseif ( function_Cached("AccessFortress")==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	elseif ( function_Cached("AccessFortress")==3 ) then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end
function Json_AccessDroplets()
	
	if ( function_Cached("AccessDroplets")==1 ) then
		return 1
	elseif ( function_Cached("AccessDroplets")==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	elseif ( function_Cached("AccessDroplets")==3 ) then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end
function Json_AccessPalace()
	
	if ( function_Cached("AccessPalace")==1 ) then
		return 1
	elseif ( function_Cached("AccessPalace")==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	elseif ( function_Cached("AccessPalace")==3 ) then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end
function Json_AccessCrypt()
	
	if ( function_Cached("AccessCrypt")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrypt")==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	elseif ( function_Cached("AccessCrypt")==3 ) then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end 
end