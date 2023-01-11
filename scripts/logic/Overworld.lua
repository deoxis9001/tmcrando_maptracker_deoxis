function CanDestroyTrees() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasSword()==1 or LightArrowBreak()==1 or has("bombs") or has("lamp") ) then
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
function NorthFieldCrack() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanDestroyTrees()==1 ) then
		return 1
	else
		return 0
	end 
end
function TownDog() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("cane") or has("cape") or has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function WellPillar() 
	if ( has("openworld_on") and ( has("mitts") or has("flippers") or has("cape") or has("bombs") or CanSplit3()==1 or CanSplit4()==1) )  then
		return 1
	elseif ( has("mitts") and (CanSplit3()==1 or CanSplit4()==1) and ( has("flippers") or has("cape") ) ) then
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
	elseif ( TownDog()==1 and has("bracelets") and BlowDust()==1 and ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1)) then
		return 1
	else
		return 0
	end 
end
function Julietta() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( TownDog()==1 and HasBottle()==1) then
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
	elseif ( Fountain()==1 and has("cane") and HasSword()==1 ) then
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
	elseif ( AccessLonLon()==1 ) then
		return 1
	else
		return 0
	end 
end
function GoronCave() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("flippers") or has("cape") or ( has("cane") and LonLonNorthShortcut()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function MayorCabin() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ( ( BonkedTrees()==1 and CabinSwim()==1 ) or (LakeMinish()==1 and has("flippers") and CabinSwim()==1 ) ) and has("bracelets")  ) then
		return 1
	else
		return 0
	end 
end
function LonLonSouthShortcut() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ( ( AccessLonLon()==1 and has("cane") ) or has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end
function LakeShortcut() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CapeExtension()==1 ) then
		return 1
	else
		return 0
	end 
end
function WindCrest() 
	if ( has("openworld_on") and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end
function WesternShortcut() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( AccessTrilby()==1 and ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1  ) ) then
		return 1
	else
		return 0
	end 
end
function TrilbyShortcut() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) then
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
	elseif (( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions21") ) ) and has("lamp") ) then
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
	elseif ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1) then
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
function SwampShortcut() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( WindCrest()==1 or has("flippers") or has ("cape") or ( has("boots") and HasBow()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SwampNorthShortcut() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end
function SwampSouthShortcut()
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("flippers") or has("cape") or HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end
function RuinsFusion() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("wilds") >= 3 and FUSIONS_COMBINED==false ) or ( Tracker:ProviderCountForCode("clouds") >= 9 and FUSIONS_COMBINED==true ) then
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
function RuinsShortcut() 
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("rc_smallkey") >= 1 ) then
		return 1
	else
		return 0
	end 
end
function CryptBlocks() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("rc_smallkey") >= 3 ) then
		return 1
	else
		return 0
	end 
end
function CryptEntrance() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( CanSplit3()==1 and has("lamp") ) then
		return 1
	else
		return 0
	end 
end

function CryptPuzzle() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function FallsFusion() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("falls") and FUSIONS_COMBINED==false ) or ( Tracker:ProviderCountForCode("clouds") >= 8 and FUSIONS_COMBINED==true ) then
		return 1
	else
		return 0
	end 
end
function AccessWindTribe() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( AccessClouds()==1 and ( has("cape") or has("mitts")) and Tracker:ProviderCountForCode("clouds") >= 5   ) then
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
function DeepwoodWarpSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( BlowDust()==1 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodBlueWarp() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ( Deepwood1stDoor()==1 and has("gust") ) or ( Deepwood1stDoor()==1 and ( Deepwood2ndDoor()==1 or Tracker:ProviderCountForCode("dws_smallkey") >= 2 ) ) ) then
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
function DeepwoodMadderpillarWeb() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMadderpillarFight() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasSword()==1 ) then
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
function DeepwoodRedWarp() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function CoFSpikeBeetle() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 and (DownStrikeBeetle()==1 or has("cane") or has("shield") or has("bombs") ) ) then
		return 1
	else
		return 0
	end 
end
function CoFHelmasaur() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end
function CoFBlueWarp() 
	if ( has("openworld_on") ) then
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
function CoFRedWarp() 
	if ( has("openworld_on") ) then
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
	elseif (FoWEyeSwitch()==1 and FoWStalfosFight()==1 and ( has("cape") or CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1  ) ) then
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
function FoWBlueWarp() 
	if ( has("openworld_on") ) then
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
	if ( has("openworld_on") and ToDBigDoor()==1 ) then
		return 1
	elseif ( ToDBigDoor()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDBlueWarp()
	if ( has("openworld_on") ) then
		return 1
	elseif ( ToDMainRoom()==1 and ( ToDLeftPath()==1 or ( ToDRightPath()==1 and has("cape") ) and ToDEitherPath()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftMushroomSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("gust") or  has("cape") ) then
		return 1
	else
		return 0
	end 
end
function ToDBasementLilySpawn() 
	if ( has("openworld_on") and has("flippers") and ToDLeftMushroomSwitch()==1) then
		return 1
	elseif ( has("flippers") and ToDWestDoor()==1 and has("gust")) then
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
	elseif ( ( has("gust") and ToDBasementLilySpawn()==1) or has("cape") ) then
		return 1
	else
		return 0
	end 
end
function ToDLeftPath() 
	if ( has("openworld_on") and has("flippers") and  ToDWestDoor()==1 and  ToDLeftMushroomSwitch()==1 and  ToDLeftPillars()==1 and  ToDLeftIceRoom()==1 and  ToDLeftMushroomSwitch()==1 and  ToDLeftMushroomSwitch()==1) then
		return 1
	elseif ( has("flippers") and ToDWestDoor()==1 and ToDLeftMushroomSwitch()==1 and ToDLeftPillars()==1 and ToDLeftIceRoom()==1) then
		return 1
	else
		return 0
	end 
end
function ToDDarkMazeReverse() 
	if ( has("openworld_on") and  DarkRooms()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDRightIceBlock() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("lamp") ) then
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
	elseif ( HasDamageSource()==1 ) then
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
	if ( has("openworld_on") ) then
		return 1
	elseif ( ToDRightIceBlock()==1 and ToDRightIce()==1 and DarkRooms()==1 and ToDScissorBeetles()==1 and ToDDarkMaze()==1 and ToDDarkDoor()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDEitherPath() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ToDEitherDoor()==1 and has("flippers") and  ToDLeftPillars()==1 and ToDRightIceBlock()==1 and ToDRightIce()==1 and DarkRooms()==1 and ToDScissorBeetles()==1 and ToDDarkMaze()==1 and has("cape")  ) then
		return 1
	else
		return 0
	end 
end
function ToD2ndRupeePath() 
	if ( has("openworld_on") and ( ( ToDMainRoom()==1 and (  ( ToDLeftPath()==1 and has("cape") ) or ToDRightPath()==1 ) ) and (ToDBlueWarp()==1 and has("cape") and DarkRooms()==1) ) ) then
		return 1
	elseif ( ( ToDBigDoor() and ( ( ToDLeftPath()==1 and has("cape") ) or ToDRightPath()==1 or ToDEitherPath()==1 ) ) or (ToDBlueWarp()==1 and has("cape") and DarkRooms()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function ToDRedWarp() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ToD2ndRupeePath()==1 and CanSplit2()==1 and ToDRightIce()==1 and CapeExtension()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDMadderpillars() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function ToDEastSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ToDBlueWarp()==1 and CanSplit2()==1) then
		return 1
	else
		return 0
	end 
end
function ToDWestSwitch() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( ToDRedWarp()==1 and BombWalls()==1 and ToDWeb()==1 and ToDMadderpillars()==1 and CanSplit2() ) then
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
	if ( has("openworld_on") and AccessDroplets()==1 and ToDMainRoom()==1 ) then
		return 1
	elseif ( AccessDroplets()==1 and ToDMainRoom()==1 and ToDEastSwitch()==1 and ToDWestSwitch()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWPotPuzzle() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("bracelets") and PoWPotPuzzleOOL()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWNoWarps() 
	if ( has("openworld_on") ) then
		return 0
	else
		return 1
	end 
end
function PoWBlueWarp() 
	if ( has("openworld_on") ) then
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
function PoWRedWarp() 
	if ( has("openworld_on") ) then
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
	elseif ( HasBow()==1 and HasMagicBoomerang()==1 and HasBeam()==1 ) then
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
	elseif (HasDarknutDamage()==1) then
		return 1
	else
		return 0
	end 
end
function DHCTowerDarknuts() 
	if ( has("openworld_on") ) then
		return 1
	elseif (HasDarknutDamage()==1) then
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
function DHCBlueWarp() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end
function DHCRedWarp() 
	if ( has("openworld_on") ) then
		return 1
	else
		return 0
	end 
end