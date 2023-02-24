function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count >= 1
  else
    return count >= amount
  end
end
function hasnot(item)
  local count = Tracker:ProviderCountForCode(item)
  return count == 0
end

function FusionsRed()
	if ( has("openworld_on") ) then	
		return 1
	elseif ( has("fusionred_vanilla") or has("fusionred_complet") ) then
		if(redflag==false or redflag==nil) then
			fusiongreencombined:updateMax()
			redflag=true
		end
		return 1
	else
		if(redflag==true or redflag==nil) then
			fusiongreencombined:updateMax()
			redflag=false
		end
		return 0
	end 
end

function FusionsBlue()
	if ( has("openworld_on") ) then
		if(blueflag==false or blueflag==nil) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			blueflag=true
		end
		return 1
	elseif ( has("fusionblue_vanilla") or has("fusionblue_complet") ) then
		if(blueflag==false or blueflag==nil) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			blueflag=true
		end
		return 1
	else
		if(blueflag==true or blueflag==nil) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			blueflag=false
		end
		return 0
	end 
end

function FusionsGreen() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("fusiongreen_vanilla") or has("fusiongreen_complet") ) then
		return 1
	else
		return 0
	end 
end

function FusionsGold()
	if ( has("openworld_on") ) then
		if(goldflag==false or goldflag==nil) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			goldflag=true
		end
		return 1
	elseif ( has("fusiongold_vanilla") or has("fusiongold_complet") ) then
		if(goldflag==false or goldflag==nil) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			goldflag=true
		end
		return 1
	else
		if(goldflag==true or goldflag==nil) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			goldflag=false
		end
		return 0
	end 
end

function Sword1()
  if Tracker:ProviderCountForCode("sword") > 0 then
    return 1
  elseif has("smithsword") then
    return 1
  else
    return 0
  end
end

function Sword2()
  if Tracker:ProviderCountForCode("sword2") > 0 then
    return 1
  elseif has("greensword") then
    return 1
  else
    return 0
  end
end

function Sword3()
  if Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif has("redsword") then
    return 1
  else
    return 0
  end
end
function Sword4()
  if Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif has("bluesword") then
    return 1
  else
    return 0
  end
end

function Sword5()
  if Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end

function GotSwords()
  if has("sword0needed") then
    return 1
  elseif Sword1()==1 and has("sword1needed") then
    return 1
  elseif Sword2()==1 and has("sword2needed") then
    return 1
  elseif Sword3()==1 and has("sword3needed") then
    return 1
  elseif Sword4()==1 and has("sword4needed") then
    return 1
  elseif Sword5()==1 and has("sword5needed") then
    return 1
  else
    return 0
  end
end

function GotElements()
	local CountElement=0
	if has("water") then
		CountElement = CountElement + 1
	end
	if has("fire") then
		CountElement = CountElement + 1
	end
	if has("wind") then
		CountElement = CountElement + 1
	end
	if has("earth") then
		CountElement = CountElement + 1
	end
  if has("element0Needed") then
    return 1
  elseif has("element1Needed") and CountElement>=1 then
    return 1
  elseif has("element2Needed") and CountElement>=2 then
    return 1
  elseif has("element3Needed") and CountElement>=3 then
    return 1
  elseif has("element4Needed") and CountElement>=4 then
    return 1
  else
    return 0
  end
end

function GotFigurine()
  if Tracker:ProviderCountForCode("figurine") >= Tracker:ProviderCountForCode("figurine_option") then
    return 1
  else
    return 0
  end
end

function GotDungeons()
	local CountDungeons = 0
	if has("dws") then
		CountDungeons = CountDungeons + 1
	end
	if has("cof") then
		CountDungeons = CountDungeons + 1
	end
	if has("fow") then
		CountDungeons = CountDungeons + 1
	end
	if has("tod") then
		CountDungeons = CountDungeons + 1
	end
	if has("rc") then
		CountDungeons = CountDungeons + 1
	end
	if has("pow") then
		CountDungeons = CountDungeons + 1
	end
	if CountDungeons >= 0 and has("dungeons0") then
		return 1
	elseif CountDungeons >= 1 and has("dungeons1") then
		return 1
	elseif CountDungeons >= 2 and has("dungeons2") then
		return 1
	elseif CountDungeons >= 3 and has("dungeons3") then
		return 1
	elseif CountDungeons >= 4 and has("dungeons4") then
		return 1
	elseif CountDungeons >= 5 and has("dungeons5") then
		return 1
	elseif CountDungeons >= 6 and has("dungeons6") then
		return 1
	else
		return 0
	end
end

function CompletePed()
	if (  GotSwords()==1  and  GotElements()==1  and  GotDungeons()==1 and  GotFigurine()==1  ) then
		return 1
	else
		return 0
	end
end

function HasSword()
	if ( Sword1()==1 or Sword2()==1  or Sword3()==1  or Sword4()==1  or Sword5()==1 ) then
		return 1
	else
		return 0
	end
end

function HasWhiteSword()
	if ( Sword2()==1  or Sword3()==1  or Sword4()==1  or Sword5()==1 ) then
		return 1
	else
		return 0
	end
end

function HasSpin()
	if ( has("spinattack") ) then
		return 1
	else
		return 0
	end
end

function CanSplit2()
	if ( Sword3()==1 and has("spinattack") ) then
		return 1
	else
		return 0
	end
end

function CanSplit3()
	if ( Sword4()==1 and has("spinattack")  ) then
		return 1
	else
		return 0
	end
end

function CanSplit4()
	if ( Sword5()==1 and has("spinattack")  ) then
		return 1
	else
		return 0
	end
end

function HasBottle()
	if ( Tracker:ProviderCountForCode("bottle") > 0 ) then
		return 1
	else
		return 0
	end
end

function HasBow()
	if ( has("bow") or has("lights") ) then
		return 1
	else
		return 0
	end
end

function HasLightBow()
	if ( has("lights") ) then
		return 1
	else
		return 0
	end
end

function HasBoomerang()
	if ( has("boomerang") or has("magicboomerang") ) then
		return 1
	else
		return 0
	end
end

function HasMagicBoomerang()
	if ( has("magicboomerang") ) then
		return 1
	else
		return 0
	end
end

function HasShield()
	if ( has("shield") or has("mirrorshield") ) then
		return 1
	else
		return 0
	end
end

function HasBeam()
	if ( HasSword()==1 and ( ( has("swordbeam")  and HasBottle()==1) or has("perilbeam") ) ) then
		return 1
	else
		return 0
	end
end
function CanDownThrust()
	if ( HasSword()==1 and has("downthrust") and has("cape") ) then
		return 1
	else
		return 0
	end
end


function HasDamageSource()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		return 1
	else
		return 0
	end
end

function HasMadderDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		return 1
	else
		return 0
	end
end

function HasChuDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		return 1
	else
		return 0
	end
end

function HasHelmasaurDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponsgust_yes") and has("gust") ) then
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		return 1
	else
		return 0
	end
end

function HasGleerokDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbow_boss") and HasBow()==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		return 1
	else
		return 0
	end
end

function HasWizrobeDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponslamp_yes") and has("lamp") ) then
		return 1
	else
		return 0
	end
end

function HasDarknutDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		return 1
	else
		return 0
	end
end

function HasMazaalDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbow_boss") and HasBow()==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		return 1
	else
		return 0
	end
end

function HasScissorDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		return 1
	else
		return 0
	end
end

function HasGhiniDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponsgust_yes") and has("gust") ) then
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		return 1
	else
		return 0
	end
end

function ShopBack()
	if ( TownDog()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard")  ) and has("gust") ) then
		return 1
	else
		return 0
	end
end

function SchoolHP()
	if ( has("cane") and CanSplit4()==1) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard")  ) and  has("cane") and has("gust") ) then
		return 1
	else
		return 0
	end
end

function MusicHouseHP()
	if ( MusicHouse()==1 ) then
		return 1
	elseif( ( has("grabbable_easy") or has("grabbable_hard")  ) and (HasBoomerang()==1 or has("gust") )) then
		return 1
	else
		return 0
	end
end

function FountainHP()
	if ( has("cape")  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard")  ) and ( has("gust") or ( HasBoomerang()==1 and ( LightArrowBreak()==1 or has("cane") ) ) ) ) then
		return 1
	elseif ( has("grabbable_hard") and HasMagicBoomerang()==1) then
		return 1
	else
		return 0
	end
end

function LowerFallsItems()
	if ( AccessMinishWoods()==1 and has("cane") and ( has("flippers") or has("cape")) ) then
		return 1
	elseif ( has("grabbable_easy") and OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and has ("gust") )  then
		return 1
	elseif ( has("grabbable_easy") and AccessFalls()==1 and has("grip") and has ("gust") )  then
		return 1
	elseif ( has("grabbable_hard") and OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and ( HasMagicBoomerang()==1 or has ("gust") ) )  then
		return 1
	elseif ( has("grabbable_hard") and AccessFalls()==1 and has("grip") and ( HasMagicBoomerang()==1 or has ("gust") ) )  then
		return 1
	else
		return 0
	end
end

function LakeIslandHP()
	if ( has("cape")  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and HasMagicBoomerang()==1 ) then
		return 1
	else
		return 0
	end
end


function LakeSouthHP()
	if ( AccessLonLon()==1 and CapeExtension()==1  ) then
		return 1
	elseif ( AccessSouthLake()==1 and ( has("cape") or has("flippers") ) ) then
		return 1
	elseif ( ( has("grabbable_easy") or  has("grabbable_hard") ) and AccessLonLon()==1 and LakeShortcut()==1 and HasMagicBoomerang()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or  has("grabbable_hard") )  and  AccessSouthLake()==1 and ( has("gust") or  HasMagicBoomerang()==1 ) ) then
		return 1
	else
		return 0
	end
end


function MinishNorthHP()
	if ( AccessNorthMinish()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or  has("grabbable_hard") ) and ( has("gust") or HasMagicBoomerang()==1 ) ) then
		return 1
	elseif ( has("grabbable_hard") and  HasBoomerang()==1 ) then
		return 1
	else
		return 0
	end
end


function MinishSouthHP()
	if ( AccessMinishWoods()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or  has("grabbable_hard") ) and AccessBelari()==1 and  has("gust") ) then
		return 1
	else
		return 0
	end
end


function CrenelWaterCaveHP()
	if ( has("bombs") or has("cape") or has("flippers") ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") or HasMagicBoomerang()==1 ) then
		return 1
	elseif ( has("grabbable_hard") and HasBoomerang()==1 ) then
		return 1
	else
		return 0
	end
end


function LeftGraveHP()
	if ( CanSplit4()==1 or  CanSplit3()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust")) then
		return 1
	elseif ( has("grabbable_hard") and HasBoomerang()==1 ) then
		return 1
	else
		return 0
	end
end


function FallsHP()
	if ( OverworldBlocks()==1 and CapeExtension()==1 ) then
		return 1
	elseif ( AccessFalls()==1 and has("grip") and ( has("flippers") or ( DarkRooms()==1 and CapeExtension()==1 ) ) ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and OverworldBlocks()==1 and ( has("gust") or HasMagicBoomerang()==1 ) ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessFalls()==1 and has("grip") and ( DarkRooms()==1 and ( has("gust") or HasMagicBoomerang()==1 ) ) ) then
		return 1
	else
		return 0
	end
end


function DeepwoodMadderHP()
	if ( DeepwoodBlueWarp()==1 and DeepwoodMadderpillarDoor()==1 and DeepwoodWeb()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has ("gust") and ( Deepwood1stDoor()==1 or DeepwoodBlueWarp()==1 ) ) then
		return 1
	else
		return 0
	end
end


function CoFRupees()
	if ( ( BombWalls()==1 or  Bobombs()==1 ) and CoFSpikeBeetle()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust")) then
		return 1
	else
		return 0
	end
end


function FoWLeftRupee()
	if ( FoWEyeSwitch()==1 and FoWStalfosFight()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust")) then
		return 1
	else
		return 0
	end
end


function FoWEntranceRupee()
	if ( has("mitts")  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust")) then
		return 1
	else
		return 0
	end
end


function FoWHP()
	if ( FoWCloneSwitch()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust")) then
		return 1
	else
		return 0
	end
end


function ToDRightRupees()
	if ( ToD2ndRupeePath()==1  ) then
		return 1
	elseif ( has("grabbable_hard") and has("gust") ) then
		return 1
	else
		return 0
	end
end


function PoWRupees()
	if ( PoWJump()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and HasMagicBoomerang()==1) then
		return 1
	else
		return 0
	end
end


function PoWDrop()
	if ( has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and has("cane")  and PoWPotPuzzle()==1 ) then
		return 1
	elseif ( has("grabbable_easy") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 ) and DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and ( HasBoomerang()==1 and ( LightArrowBreak()==1 or has("cane") ) ) ) then
		return 1
	elseif ( has("grabbable_easy") and PoWRedWarp()==1 and OverworldBlocks()==1 and ( has("gust") or ( HasBoomerang()==1 and ( LightArrowBreak()==1 or has("cane") ) ) ) ) then
		return 1
	elseif ( has("grabbable_hard") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 ) and DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and HasBoomerang()==1 ) then
		return 1
	elseif ( has("grabbable_hard") and PoWRedWarp()==1 and OverworldBlocks()==1 and ( has("gust") or  HasBoomerang()==1 ) ) then
		return 1
	else
		return 0
	end
end


function PoWHP()
	if ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 )) then
		return 1
	elseif ( PoWRedWarp()==1 and OverworldBlocks()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( CanSplit3()==1 or CanSplit4()==1) and PoWJump()==1 and PoWPostKeyDoor()==1 and ( has("gust") or HasBoomerang()==1 ) ) then
		return 1
	else
		return 0
	end
end

function GuardSkip()
	if ( has("guardskip_on") and has("boots")  ) then
		return 1
	elseif ( has("guardskip_off") and has("boots")  ) then
		return 2
	else
		return 0
	end
end

function LikeLike()
	if ( has("likelike_on") ) then
		return 1
	elseif ( has("likelike_off") and HasSword()==1 ) then
		return 1
	elseif ( has("likelike_off") ) then
		return 2
	else
		return 0
	end
end
function BlowDust()
	if ( has("blowdust_on") and (has("bombs") or has("gust") ) ) then
		return 1
	elseif (has("blowdust_off") and has("gust") ) then
		return 1
	elseif (has("blowdust_off") and has("bombs") ) then
		return 2
	else
		return 0
	end
end
function CrenelMushroom()
	if ( has("crenelmushroom_on") and (has("bombs") or has("gust") ) ) then
		return 1
	elseif ( has("crenelmushroom_off") and (has("bombs") ) ) then
		return 1
	elseif (has("crenelmushroom_off") and has("gust") ) then
		return 2
	else
		return 0
	end
end
function LightArrowBreak()
	if ( has("lightarrowbreak_on") and has("lights") ) then
		return 1
	elseif (has("lightarrowbreak_off") and has("lights") ) then
		return 2
	else
		return 0
	end
end
function Bobombs()
	if ( has("bobombs_on") ) then
		return 1
	elseif ( has("bobombs_off") and (HasSword()==1 or has("gust") or has("bombs") ) ) then
		return 1
	elseif ( has("bobombs_off") ) then
		return 2
	else
		return 0
	end
end
function CrenelBeam()
	if ( has("crenelbeam_on") and HasBeam()==1 ) then
		return 1
	elseif ( has("crenelbeam_off") and HasBeam()==1 ) then
		return 2
	else
		return 0
	end
end
function DownThrustBeetle()
	if ( has("downstrikebeetle_on") and CanDownThrust()==1 ) then
		return 1
	elseif ( has("downstrikebeetle_off") and CanDownThrust()==1 ) then
		return 2
	else
		return 0
	end 
end
function CapeExtension()
	if ( has("capeextension_on") and (has("flippers") or has("cape"))  ) then
		return 1
	elseif ( has("capeextension_off") and has("flippers")  ) then
		return 1
	elseif ( has("capeextension_off") and has("cape") ) then
		return 2
	else
		return 0
	end 
end
function DarkRooms()
	if ( has("darkrooms_off") and has("lamp") ) then
		return 1
	elseif ( has("darkrooms_off") ) then
		return 2
	elseif ( has("darkrooms_on") ) then
		return 1
	else
		return 0
	end 
end
function LakeMinish()
	if ( has("lakeminish_on") and Hylia_CrackFusion_LibrariNPC()==1 ) then
		return 1
	elseif ( has("lakeminish_off") and Hylia_CrackFusion_LibrariNPC()==1 ) then
		return 2
	else
		return 0
	end 
end
function CabinSwim()
	if ( has("cabinswim_on") and ( has("flippers") or has("gust") ) ) then
		return 1
	elseif ( has("cabinswim_off") and has("gust") ) then
		return 1
	elseif ( has("cabinswim_off") and has("flippers") ) then
		return 2
	else
		return 0
	end 
end
function CloudsKill()
	if ( has("cloudskill_off") and HasDamageSource()==1 ) then
		return 1
	elseif ( has("cloudskill_off")  ) then
		return 2
	elseif ( has("cloudskill_on")  ) then
		return 1
	else
		return 0
	end 
end
function FoWPot()
	if ( has("fowpot_on") and has("gust") ) then
		return 1
	elseif ( has("fowpot_off") and has("gust") ) then
		return 2
	else
		return 0
	end 
end
function PoWJump()
	if ( has("powjump_on") ) then
		return 1
	elseif ( has("powjump_off") and has("cane") ) then
		return 1
	elseif ( has("powjump_off") and has("cape") ) then
		return 2
	else
		return 0
	end 
end
function PoWPotPuzzleOOL()
	if ( has("powpotpuzzleool_on") and (( HasSword()==1 or HasBoomerang()==1 or has("bombs") or HasBow()==1)  and ( (DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and (PoW2ndHalf()==1 or PoWBlueWarp()==1) ) or (PoWRedWarp()==1 and OverworldBlocks()==1)) ) ) then
		return 1
	else
		return 0
	end 
end
function DHCCanonHit()
	if ( has("dhccanonhit_on") and has("bombs") and HasSword()==1 ) then
		return 1
	elseif ( has("dhccanonhit_off") and CanSplit4()==1 ) then
		return 1
	elseif ( has("dhccanonhit_off") and has("bombs") and HasSword()==1 ) then
		return 2
	else
		return 0
	end 
end
function DHCBladePuzzleShuffle()
	if ( has("dhcbladepuzzleshuffle_on") and ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1) ) then
		return 1
	elseif ( has("dhcbladepuzzleshuffle_off") and CanSplit4()==1 ) then
		return 1
	elseif ( has("dhcbladepuzzleshuffle_off") and ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1) ) then
		return 2
	else
		return 0
	end 
end
function DHCSwitchHit()
	if ( has("dhcswitchhit_on") and HasSword()==1 and HasSpin()==1 ) then
		return 1
	elseif ( has("dhcswitchhit_off") and CanSplit4()==1 ) then
		return 1
	elseif ( has("dhcswitchhit_off") and HasSword()==1 and HasSpin()==1 ) then
		return 2
	else
		return 0
	end 
end
function StrangerFusion() 
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0f") ) ) then
		return 1
	else
		return 0
	end
end
function CryptDungeons()
	if (has("dungeonser_off")) then
		return AccessCrypt()
	elseif (has("crypt_dws")) then
		return AccessDeepwood()
	elseif (has("crypt_cof")) then
		return AccessCoF()
	elseif (has("crypt_fow")) then
		return AccessFortress()
	elseif (has("crypt_tod")) then
		return AccessDroplets()
	elseif (has("crypt_crypt")) then
		return AccessCrypt()
	elseif (has("crypt_pow")) then
		return AccessPalace()
	else
		return 0
	end
end
function DeepwoodDungeons()
	if (has("dungeonser_off")) then
		return AccessDeepwood()
	elseif (has("dws_dws")) then
		return AccessDeepwood()
	elseif (has("dws_cof")) then
		return AccessCoF()
	elseif (has("dws_fow")) then
		return AccessFortress()
	elseif (has("dws_tod")) then
		return AccessDroplets()
	elseif (has("dws_crypt")) then
		return AccessCrypt()
	elseif (has("dws_pow")) then
		return AccessPalace()
	else
		return 0
	end
end
function CofDungeons()
	if (has("dungeonser_off")) then
		return AccessCoF()
	elseif (has("cof_dws")) then
		return AccessDeepwood()
	elseif (has("cof_cof")) then
		return AccessCoF()
	elseif (has("cof_fow")) then
		return AccessFortress()
	elseif (has("cof_tod")) then
		return AccessDroplets()
	elseif (has("cof_crypt")) then
		return AccessCrypt()
	elseif (has("cof_pow")) then
		return AccessPalace()
	else
		return 0
	end
end
function FowDungeons()
	if (has("dungeonser_off")) then
		return AccessFortress()
	elseif (has("fow_dws")) then
		return AccessDeepwood()
	elseif (has("fow_cof")) then
		return AccessCoF()
	elseif (has("fow_fow")) then
		return AccessFortress()
	elseif (has("fow_tod")) then
		return AccessDroplets()
	elseif (has("fow_crypt")) then
		return AccessCrypt()
	elseif (has("fow_pow")) then
		return AccessPalace()
	else
		return 0
	end
end
function TodDungeons()
	if (has("dungeonser_off")) then
		return AccessDroplets()
	elseif (has("tod_dws")) then
		return AccessDeepwood()
	elseif (has("tod_cof")) then
		return AccessCoF()
	elseif (has("tod_fow")) then
		return AccessFortress()
	elseif (has("tod_tod")) then
		return AccessDroplets()
	elseif (has("tod_crypt")) then
		return AccessCrypt()
	elseif (has("tod_pow")) then
		return AccessPalace()
	else
		return 0
	end
end
function PowDungeons()
	if (has("dungeonser_off")) then
		return AccessPalace()
	elseif (has("pow_dws")) then
		return AccessDeepwood()
	elseif (has("pow_cof")) then
		return AccessCoF()
	elseif (has("pow_fow")) then
		return AccessFortress()
	elseif (has("pow_tod")) then
		return AccessDroplets()
	elseif (has("pow_crypt")) then
		return AccessCrypt()
	elseif (has("pow_pow")) then
		return AccessPalace()
	else
		return 0
	end
end