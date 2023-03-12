function CanDestroyTrees() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") or has("bombs") or HasSword()==1 or LightArrowBreak()==1 ) then
		return 1
	else
		return 0
	end 
end
function BonkedTrees() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("boots") ) then
		return 1
	else
		return 0
	end 
end
function TownDog() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("cape") or has("flippers") or has("cane") ) then
		return 1
	else
		return 0
	end 
end
function WellPillar() 
	if ( has("openworld_on") and ( has("mitts") or has("flippers") or has("cape") or has("bombs") or CanSplit3()==1 or CanSplit4()==1 ) ) then
		return 1
	elseif ( has("mitts") and ( CanSplit3()==1 or CanSplit4()==1 ) and ( has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end
function InnLedge() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function MusicHouse() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("carlov") ) then
		return 1
	else
		return 0
	end 
end
function DrLeft() 
	if ( has("openworld_on") and TownDog()==1 ) then
		return 1
	elseif ( has("bracelets") and TownDog()==1 and BlowDust()==1 and ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function Julietta() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( TownDog()==1 and HasBottle()==1 ) then
		return 1
	else
		return 0
	end 
end
function Fountain() 
	if ( has("openworld_on") and TownDog()==1 ) then
		return 1
	elseif ( TownDog()==1 and HasBottle()==1 ) then
		return 1
	else
		return 0
	end 
end
function TownMulldozers() 
	if ( has("openworld_on") and has("cane") and Fountain()==1 ) then
		return 1
	elseif ( has("cane") and Fountain()==1 and HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function Library() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("ocarina") ) then
		return 1
	else
		return 0
	end 
end
function OverworldBlocks() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("bombs") ) then
		return 1
	else
		return 0
	end 
end
function CastleDojo() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function BombWalls() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("bombs") ) then
		return 1
	else
		return 0
	end 
end
function LonLonNorthShortcut() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function LonLonSecret() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function GoronCave() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("flippers") or has("cape") or ( has("cane") and AccessLonLon()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function MayorCabin() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("bracelets") and ( ( BonkedTrees()==1 and CabinSwim()==1 ) or ( has("flippers") and LakeMinish()==1 and CabinSwim()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function LonLonSouthShortcut() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function LakeShortcut() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end


function WesternShortcut_setting() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end

function WesternShortcut() 
	if ( WesternShortcut_setting()==1 ) then
		return 1
	else
		return 0
	end 
end

function TrilbyShortcut() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function Scrubs() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("shield") ) then
		return 1
	else
		return 0
	end 
end
function Percy() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions21") ) ) and has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function LowerBean() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasBottle()==1 ) then
		return 1
	else
		return 0
	end 
end
function UpperBean() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function CrenelDust() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end
function CrenelDojo() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) then
		return 1
	else
		return 0
	end 
end
function CrenelSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("bombs") or has("cape") or HasBow()==1 or HasBoomerang()==1 or CrenelBeam()==1 ) then
		return 1
	else
		return 0
	end
end
function SwampDarknut()
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function SwampShortcut() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function SwampNorthShortcut() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function SwampSouthShortcut()
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function RuinsFusion()
	if ( has("openworld_on") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("wilds") >= 3 and fusiongoldcombined:getActive()==false ) or ( Tracker:ProviderCountForCode("clouds") >= 9 and fusiongoldcombined:getActive() ) then
		return 1
	else
		return 0
	end 
end
function CloudFusions()
	if ( has("openworld_on") ) then
		return 1
	elseif ( ( ( Tracker:ProviderCountForCode("clouds") >= 5 and fusiongoldcombined:getActive()==false ) or ( Tracker:ProviderCountForCode("clouds") >= 9 and fusiongoldcombined:getActive() ) ) and ( has("cape") or has("mitts") ) ) then
		return 1
	else
		return 0
	end 
end
function CompletedGolds()
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("fusiongold_complet") ) then
		return 1
	else
		return 0
	end 
end
function Festari() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("flippers") or has("jabber") ) then
		return 1
	else
		return 0
	end 
end
function RuinsArmos() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function RuinsTektites() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function Graveyard() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("gravekey") and has("boots") ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit3()==1 ) then
		return 1
	else
		return 0
	end 
end

function CryptPuzzle() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") and HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function FallsFusion() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ( fusiongoldcombined:getActive()==false and has("falls",1 ) ) or ( fusiongoldcombined:getActive() and Tracker:ProviderCountForCode("clouds")>=4 ) ) and OverworldBlocks()==1 then
		return 1
	else
		return 0
	end 
end
function Gregal() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("gust") ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodWeb() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("gust") or has ("lamp") ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMulldozers() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodWarpChests() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMadderpillarFight() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasMadderDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMadderpillarWeb() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function CoFSpikeBeetle() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 and ( DownThrustBeetle()==1 or has("cane") or has("shield") or has("bombs") ) ) then
		return 1
	else
		return 0
	end 
end
function CoFHelmasaur() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasHelmasaurDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function CoFChuFight() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasWizrobeDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWEyeSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWStalfosFight() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWDigSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function FoWCloneSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWStatueCloneSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit2()==1 or CanSplit3()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWLeftDrop() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( FoWEyeSwitch()==1 and FoWStalfosFight()==1 and ( has("cape") or CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function FoWEyegores() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWRightDrop() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( FoWCloneSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end
function FoWDarknut() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDWeb() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("gust") or has("cape") ) then
		return 1
	else
		return 0
	end 
end
function ToDBasementLilySpawn() 
	if ( has("openworld_on") and has("flippers") and ToDLeftMushroomSwitch()==1 ) then
		return 1
	elseif ( has("flippers") and ToDWestDoor()==1 and has("gust") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftPillars() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("gust") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftReverse() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftIceRoom() 
	if ( has("openworld_on")and ( has("cape") or has("gust") ) ) then
		return 1
	elseif ( ( has("gust") and ToDBasementLilySpawn()==1 ) or has("cape") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftPath() 
	if ( has("openworld_on") and has("flippers") and ToDWestDoor()==1 and ToDLeftMushroomSwitch()==1 and ToDLeftPillars()==1 and ToDLeftIceRoom()==1 ) then
		return 1
	elseif ( has("flippers") and ToDWestDoor()==1 and ToDLeftMushroomSwitch()==1 and ToDLeftPillars()==1 and ToDLeftIceRoom()==1 ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( ToDEastSwitch_settings()==1 or has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function ToDRightIce() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function ToDScissorBeetles() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasScissorDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDDarkMaze() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
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
	elseif ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasMadderDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDEastSwitch_settings() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit2()==1 and ToDBlueWarp()==1 or ( ToDMainRoom()==1  and ( ToDLeftPath()==1 or ToDEitherPath()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function ToDEastSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit2()==1 and ToDBlueWarp()==1 or ( ToDMainRoom()==1  and ( ToDLeftPath()==1 or ( ToDRightPath()==1 and has("cape") ) or ToDEitherPath()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function ToDWestSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( BombWalls()==1 and ToDWeb()==1 and ToDMadderpillars()==1 and CanSplit2()==1 and ( ToDRedWarp()==1 or ( ToD2ndRupeePath()==1 and ToDRightIce()==1 and CapeExtension()==1 ) ) ) then
		return 1
	else
		return 0
	end 
end
function ToDMulldozer() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("bracelets") or PoWPotPuzzleOOL()==1 ) then
		return 1
	else
		return 0
	end 
end

function PoWDarknut()
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDarknutDamage()==1 ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 or ( HasSword()==1 and has("bombs") ) ) then
		return 1
	else
		return 0
	end 
end
function PoWShortcuts() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function PoWDoubleWiz() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasWizrobeDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWTribleWiz() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasWizrobeDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWHandRoom() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("bombs") or HasBow()==1 or HasBeam()==1 or HasBoomerang()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCKing() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit4()==1 and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCFirstCanon() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( DHCCanonHit()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCBladePuzzle() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( DHCBladePuzzleShuffle()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHC2ndCanon() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( DHCCanonHit()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCThrone() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCOutsideSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasBow()==1 or HasMagicBoomerang()==1 or HasBeam()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCSwitchPuzzles() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( DHCSwitchHit()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCChainSoldiers() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCGrateRoom() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("cape") and ( HasBow()==1 or HasBoomerang()==1 or HasBeam()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function DHCBlackKnightFight() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCTowerDarknuts() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDarknutDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function DHCLampPuzzle() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function DHCGhini() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasGhiniDamage()==1 ) then
		return 1
	else
		return 0
	end 
end
function CrenelWindCrest() 
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
	elseif ( BlowDust()==1 ) then
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
	elseif ( has("tod_warps_red") ) then
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
	elseif ( has("pow_warps_red") ) then
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
	elseif ( has("dhc_warps_red") ) then
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