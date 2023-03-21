function CanDestroyTrees() 
	if has("bombs") then
		return 1
	end 
 if has("lamp") then
		return 1
	end 
 if HasSword()==1 then
		return 1
	end 
 if LightArrowBreak()==1 then 
		return 1
	end 
 if has("openworld_on") then 
		return 1
	end 
	return 0
end
function BonkedTrees() 
	if has("boots") then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function TownDog() 
	if has("flippers") then
		return 1
	end 
 if has("cape") then
		return 1
	end 
 if has("cane") then
		return 1
	end 
 if has("openworld_on") then 
		return 1
	end 
	return 0
end
function WellPillar() 
	if has("mitts") then
		if has("flippers") then
			if CanSplit3() == 1 then
				return 1
			end 
 if CanSplit4() == 1 then
				return 1
			end
		end 
 if has("cape") then
			if CanSplit3() == 1 then
				return 1
			end 
 if CanSplit4() == 1 then
				return 1
			end
		end
	end 
 if has("openworld_on") then
		if has("mitts") then
			return 1
		end 
 if has("flippers") then
			return 1
		end 
 if has("cape") then
			return 1
		end 
 if has("bombs") then
			return 1
		end 
 if CanSplit3() == 1 then
			return 1
		end 
 if CanSplit4() == 1 then
			return 1
		end
	end
	return 0
end
function InnLedge() 
	if ( has("lamp") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function MusicHouse() 
	if ( has("carlov") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function DrLeft() 
	if TownDog()==1 then
		if has("openworld_on") then
			return 1
		end 
 if has("bracelets") then
			if BlowDust()==1 then
				if CanSplit2()==1 then
					return 1
				end 
 if CanSplit3()==1 then
					return 1
				end 
 if CanSplit4()==1 then
					return 1
				end
			end
		end
	end
	return 0
end
function Julietta() 
	if TownDog()==1 then
		if HasBottle()==1 then
			return 1
		end
	end 
 if has("openworld_on") then
		return 1
	end
	return 0
end
function Fountain() 
	if TownDog()==1 then
		if HasBottle()==1 then
			return 1
		end 
 if has("openworld_on") then
			return 1
		end
	end
	return 0
end
function TownMulldozers() 
	if has("cane") then
		if Fountain()==1 then
			if HasDamageSource()==1 then 
				return 1
			end 
 if has("openworld_on") then
				return 1
			end
		end
	end
	return 0
end
function Library() 
	if ( has("ocarina") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function OverworldBlocks() 
	if ( has("bombs") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function CastleDojo() 
	if ( has("lamp") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function BombWalls() 
	if ( has("bombs") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function LonLonNorthShortcut() 
	if has("openworld_on") then
		return 1
	end 
	return 0
end
function LonLonSecret() 
	if ( has("lamp") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function GoronCave() 
	if has("flippers") then
		return 1
	end 
 if has("cape") then
		return 1
	end 
 if has("cane") then
		if AccessLonLon()==1 then
			return 1
		end
	end 
 if has("openworld_on") then
		return 1
	end
	return 0
end
function MayorCabin() 
	if has("bracelets") then
		if has("flippers") then
			if LakeMinish()==1 then
				if CabinSwim()==1 then
					return 1
				end
			end
		end 
 if BonkedTrees()==1 then
			if CabinSwim()==1 then
				return 1
			end
		end
	end
	return 0
end
function LonLonSouthShortcut()
	if has("openworld_on") then
		return 1
	end 
	return 0
end
function LakeShortcut()
	if has("openworld_on") then
		return 1
	end 
	return 0
end

function WesternShortcut() 
	if has("openworld_on") then
		return 1
	end 
	return 0
end

function TrilbyShortcut()
	if has("openworld_on") then
		return 1
	end
	return 0
end
function Scrubs() 
	if ( has("shield") ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function Percy()  
	if ( has("lamp") ) then
		if has("fusionred_complet") then
			return 1
		end 
 if has("fusionred_vanilla") then
			if has("fusions21") then
				return 1
			end
		end
	end 
	return 0
end
function LowerBean() 
	if ( HasBottle()==1 ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end
	return 0
end
function UpperBean() 
	if has("openworld_on") then
		return 1
	end
	return 0
end
function CrenelDust() 
	if ( BlowDust()==1 ) then
		return 1
	end 
 if has("openworld_on") then
		return 1
	end
	return 0
end
function CrenelDojo()
	if ( CanSplit2()==1 ) then
		return 1 
	end 
 if ( CanSplit3()==1 ) then
		return 1 
	end 
 if ( CanSplit4()==1 ) then
		return 1 
	end 
 if has("openworld_on") then
		return 1
	end 
	return 0
end
function CrenelSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("bombs") or has("cape") or HasBow()==1 or HasBoomerang()==1 or CrenelBeam()==1 ) then
		return 1
	else
		return 0
	end
end
function SwampDarknut()
	if has("openworld_on") then
		return 1
	end 
 if ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function SwampShortcut() 
	if has("openworld_on") then
		return 1
	else
		return 0
	end 
end
function SwampNorthShortcut() 
	if has("openworld_on") then
		return 1
	else
		return 0
	end 
end
function SwampSouthShortcut()
	if has("openworld_on") then
		return 1
	else
		return 0
	end 
end
function RuinsFusion()
	if has("openworld_on") then
		return 1
	end 
 if ( Tracker:ProviderCountForCode("wilds") >= 3 and fusiongoldcombined:getActive()==false ) or ( Tracker:ProviderCountForCode("clouds") >= 9 and fusiongoldcombined:getActive() ) then
		return 1
	else
		return 0
	end 
end
function CloudFusions()
	if has("openworld_on") then
		return 1
	end 
 if ( ( ( Tracker:ProviderCountForCode("clouds") >= 5 and fusiongoldcombined:getActive()==false ) or ( Tracker:ProviderCountForCode("clouds") >= 9 and fusiongoldcombined:getActive() ) ) and ( has("cape") or has("mitts") ) ) then
		return 1
	else
		return 0
	end 
end
function CompletedGolds()
	if has("openworld_on") then
		return 1
	end 
 if ( has("fusiongold_complet") ) then
		return 1
	else
		return 0
	end 
end
function Festari() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("flippers") or has("jabber") ) then
		return 1
	else
		return 0
	end 
end
function RuinsArmos() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function RuinsTektites() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function Graveyard() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("gravekey") and has("boots") ) then
		return 1
	else
		return 0
	end 
end
function CryptDoor() 
	if ( Tracker:ProviderCountForCode("rc_smallkey") >= 1 ) then
		return 1
	else
		return 0
	end 
end
function CryptBlocks() 
	if ( Tracker:ProviderCountForCode("rc_smallkey") >= 3 ) then
		return 1
	else
		return 0
	end 
end
function CryptEntrance() 
	if has("openworld_on") then
		return 1
	end 
 if ( CanSplit3()==1 ) then
		return 1
	else
		return 0
	end 
end

function CryptPuzzle() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("lamp") and HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function FallsFusion() 
	if has("openworld_on") then
		return 1
	end 
 if ( ( fusiongoldcombined:getActive()==false and has("falls",1 ) ) or ( fusiongoldcombined:getActive() and Tracker:ProviderCountForCode("clouds")>=4 ) ) and OverworldBlocks()==1 then
		return 1
	else
		return 0
	end 
end
function Gregal() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("gust") ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodWeb() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("gust") or has ("lamp") ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMulldozers() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodPreMadderpillar()
	if ( DeepwoodBlueWarp()==1 or ( Deepwood1stDoor()==1 and ( Deepwood2ndDoor()==1 or Tracker:ProviderCountForCode("dws_smallkey") >= 2 or has("gust") ) ) ) then
		return 1
	else
		return 0
	end
end
function DeepwoodNWChest() 
	if has("openworld_on") then
		return 1
	end 
 if ( BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodWarpChests() 
	if has("openworld_on") then
		return 1
	end 
 if ( BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMadderpillarFight() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasMadderDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMadderpillarWeb() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function CoFSpikeBeetle() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 and ( DownThrustBeetle()==1 or has("cane") or has("shield") or has("bombs") ) ) then
		return 1
	else
		return 0
	end 
end
function CoFHelmasaur() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasHelmasaurDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function CoFChuFight() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function CoFChuFightBackDoor() 
	if ( has("openworld_on") and has("cape") ) then
		return 1
	else
		return 0
	end 
end
function FoWWizrobes() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasWizrobeDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWEyeSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWStalfosFight() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWDigSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function FoWCloneSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWStatueCloneSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( CanSplit2()==1 or CanSplit3()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWLeftDrop() 
	if has("openworld_on") then
		return 1
	end 
 if ( FoWEyeSwitch()==1 and FoWStalfosFight()==1 and ( has("cape") or CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function FoWEyegores() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWRightDrop() 
	if has("openworld_on") then
		return 1
	end 
 if ( FoWCloneSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWDarknut() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDWeb() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function ToDMainRoom() 
	if ( ToDBigDoor()==1 or ( ToDBlueWarp()==1 and ToDScissorBeetles()==1 ) or ( ToDRedWarp()==1 and BombWalls()==1 and ToDWeb()==1 and ToDMadderpillars()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftMushroomSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("gust") or has("cape") ) then
		return 1
	else
		return 0
	end 
end
function ToDBasementLilySpawn() 
	if ( has("openworld_on") and has("flippers") and ToDLeftMushroomSwitch()==1 ) then
		return 1
	end 
 if ( has("flippers") and ToDWestDoor()==1 and has("gust") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftPillars() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("gust") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftReverse() 
	if has("openworld_on") then
		return 1
	else
		return 0
	end 
end
function ToDLeftIceRoom() 
	if ( has("openworld_on")and ( has("cape") or has("gust") ) ) then
		return 1
	end 
 if ( ( has("gust") and ToDBasementLilySpawn()==1 ) or has("cape") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftPath() 
	if ( has("openworld_on") and has("flippers") and ToDWestDoor()==1 and ToDLeftMushroomSwitch()==1 and ToDLeftPillars()==1 and ToDLeftIceRoom()==1 ) then
		return 1
	end 
 if ( has("flippers") and ToDWestDoor()==1 and ToDLeftMushroomSwitch()==1 and ToDLeftPillars()==1 and ToDLeftIceRoom()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDDarkMazeReverse() 
	if ( has("openworld_on") and DarkRooms()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDLilypadEnd() 
	if ( ( ToDBlueWarp()==1 and ToDScissorBeetles()==1 ) or ( ToDMainRoom()==1 and ( ToDLeftPath()==1 or ( ToDRightPath()==1 and has("cape") ) or ToDEitherPath()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function ToDRightIceBlock() 
	if has("openworld_on") then
		return 1
	end 
 if ( ToDEastSwitch_settings()==1 or has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function ToDRightIce() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function ToDScissorBeetles() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasScissorDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDDarkMaze() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function ToDRightPath() 
	if ( ToDRightIceBlock()==1 and ToDRightIce()==1 and DarkRooms()==1 and ToDScissorBeetles()==1 and ToDDarkMaze()==1 and ToDDarkDoor()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDEitherPath() 
	if ( ToDEitherDoor()==1 and has("flippers") and ToDLeftPillars()==1 and ToDRightIceBlock()==1 and ToDRightIce()==1 and DarkRooms()==1 and ToDScissorBeetles()==1 and ToDDarkMaze()==1 and has("cape") ) then
		return 1
	else
		return 0
	end 
end
function ToDDarkMazeDoor() 
	if ( has("small_key_none") ) then
		return 1
	end 
 if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end
function ToDDarkMazeReverse() 
	if ( has("openworld_on") and DarkRooms()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToD2ndRupeePath() 
	if ( ( ToDMainRoom()==1 and ( ( ToDLeftPath()==1 and has("cape") ) or ToDRightPath()==1 or ToDEitherPath()==1 ) ) or ( ToDBlueWarp()==1 and ToDScissorBeetles()==1 and has("cape") and DarkRooms()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function ToDMadderpillars() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasMadderDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDEastSwitch_settings() 
	if has("openworld_on") then
		return 1
	end 
 if ( CanSplit2()==1 and ToDBlueWarp()==1 or ( ToDMainRoom()==1  and ( ToDLeftPath()==1 or ToDEitherPath()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function ToDEastSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( CanSplit2()==1 and ToDBlueWarp()==1 or ( ToDMainRoom()==1  and ( ToDLeftPath()==1 or ( ToDRightPath()==1 and has("cape") ) or ToDEitherPath()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function ToDWestSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( BombWalls()==1 and ToDWeb()==1 and ToDMadderpillars()==1 and CanSplit2()==1 and ( ToDRedWarp()==1 or ( ToD2ndRupeePath()==1 and ToDRightIce()==1 and CapeExtension()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function ToDMulldozer() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function AccessOcto() 
	if ( ToDMainRoom()==1 and ToDEastSwitch()==1 and ToDWestSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWPotPuzzle() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("bracelets") or PoWPotPuzzleOOL()==1 ) then
		return 1
	else
		return 0
	end 
end

function PoWDarknut()
	if has("openworld_on") then
		return 1
	end 
 if ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end

function PoW2ndHalf()
	if ( ( PoWBlueWarp()==1 and PoWDarknut()==1 ) or ( has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoW1stDoor()==1 and PoWBossDoor()==1 ) ) then
		return 1
	else
		return 0
	end 
end

function PoWPeahatRoom()
	if has("openworld_on") then
		return 1
	end 
 if ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 or ( HasSword()==1 and has("bombs") ) ) then
		return 1
	else
		return 0
	end 
end
function PoWShortcuts() 
	if has("openworld_on") then
		return 1
	else
		return 0
	end 
end
function PoWDoubleWiz() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasWizrobeDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWTribleWiz() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasWizrobeDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWHandRoom() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("bombs") or HasBow()==1 or HasBeam()==1 or HasBoomerang()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCKing() 
	if has("openworld_on") then
		return 1
	end 
 if ( CanSplit4()==1 and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCFirstCanon() 
	if has("openworld_on") then
		return 1
	end 
 if ( DHCCanonHit()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCBladePuzzle() 
	if has("openworld_on") then
		return 1
	end 
 if ( DHCBladePuzzleShuffle()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHC2ndCanon() 
	if has("openworld_on") then
		return 1
	end 
 if ( DHCCanonHit()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCThrone() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCOutsideSwitch() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasBow()==1 or HasMagicBoomerang()==1 or HasBeam()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCSwitchPuzzles() 
	if has("openworld_on") then
		return 1
	end 
 if ( DHCSwitchHit()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCChainSoldiers() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCGrateRoom() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("cape") and ( HasBow()==1 or HasBoomerang()==1 or HasBeam()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function DHCBlackKnightFight() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCTowerDarknuts() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCLampPuzzle() 
	if has("openworld_on") then
		return 1
	end 
 if ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function DHCGhini() 
	if has("openworld_on") then
		return 1
	end 
 if ( HasGhiniDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function CrenelWindCrest() 
	-- print("crenelwindcrest_yes:",has("crenelwindcrest_yes"))
	-- print("ocarina:",has("ocarina"))
	if ( has("crenelwindcrest_yes") and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end
function FallsWindCrest() 
	if ( has("fallswindcrest_yes") and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end
function CloudWindCrest()
	if ( has("cloudwindcrest_yes") and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end
function SwampWindCrest() 
	if ( has("swampwindcrest_yes") and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end
function SHFWindCrest() 
	if ( has("shfwindcrest_yes") and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end
function MinishWindCrest() 
	if ( has("minishwindcrest_yes") and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end

function DeepwoodWarpSwitch() 
	if ( has("dws_warps_blue") ) then
		return 1
	end 
 if ( BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodBlueWarp()
	if ( has("dws_warps_blue") ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodRedWarp() 
	if ( has("dws_warps_red") ) then
		return 1
	else
		return 0
	end 
end
function CoFNoBlueWarp() 
	if ( CoFBlueWarp()==1 ) then
		return 0
	else
		return 1
	end 
end
function CoFBlueWarp() 
	if ( has("cof_warps_blue") ) then
		return 1
	else
		return 0
	end 
end
function CoFRedWarp() 
	if ( has("cof_warps_red") ) then
		return 1
	else
		return 0
	end 
end
function FoWBlueWarp() 
	if ( has("fow_warps_blue") ) then
		return 1
	else
		return 0
	end 
end
function ToDBlueWarp()
	if ( has("tod_warps_blue") ) then
		return 1
	else
		return 0
	end 
end
function ToDNoWarp()
	if ( has("tod_warps_blue") ) then
		return 0
	end 
 if ( has("tod_warps_red") ) then
		return 0
	else
		return 1
	end 
end
function ToDRedWarp() 
	if ( has("tod_warps_red") ) then
		return 1
	else
		return 0
	end 
end
function PoWNoWarps() 
	if ( has("pow_warps_blue") ) then
		return 0
	end 
 if ( has("pow_warps_red") ) then
		return 0
	else
		return 1
	end 
end
function PoWBlueWarp() 
	if ( has("pow_warps_blue") ) then
		return 1
	else
		return 0
	end 
end
function PoWRedWarp() 
	if ( has("pow_warps_red") ) then
		return 1
	else
		return 0
	end 
end
function DHCNoWarps() 
	if ( has("dhc_warps_blue") ) then
		return 0
	end 
 if ( has("dhc_warps_red") ) then
		return 0
	else
		return 1
	end 
end
function DHCBlueWarp() 
	if ( has("dhc_warps_blue") ) then
		return 1
	else
		return 0
	end 
end
function DHCRedWarp() 
	if ( has("dhc_warps_red") ) then
		return 1
	else
		return 0
	end 
end