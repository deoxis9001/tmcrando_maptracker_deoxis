function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count == amount
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
		return 1
	else
		return 0
	end 
end

function FusionsBlue()
	if ( has("openworld_on") ) then
		return 1
	elseif ( has("fusionblue_vanilla") or has("fusionblue_complet") ) then
		return 1
	else
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
		return 1
	elseif ( has("fusiongold_vanilla") or has("fusiongold_complet") ) then
		return 1
	else
		return 0
	end 
end

function Sword1()
  if Tracker:ProviderCountForCode("sword") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword2") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("smithsword") then
    return 1
  elseif has("greensword") then
    return 1
  elseif has("redsword") then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end

function Sword2()
  if Tracker:ProviderCountForCode("sword2") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("greensword") then
    return 1
  elseif has("redsword") then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end

function Sword3()
  if Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("redsword") then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end
function Sword4()
  if Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
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
    -- return 0
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
  if has("element0Needed") then
    return 1
  elseif has("element1Needed") and NumberElement()>=1 then
    return 1
  elseif has("element2Needed") and NumberElement()>=2 then
    return 1
  elseif has("element3Needed") and NumberElement()>=3 then
    return 1
  elseif has("element4Needed") and NumberElement()>=4 then
    return 1
  else
    return 0
  end
end

function NumberElement()
	local count_element=0
	if has("water") then
		count_element = count_element + 1
	end
	if has("fire") then
		count_element = count_element + 1
	end
	if has("wind") then
		count_element = count_element + 1
	end
	if has("earth") then
		count_element = count_element + 1
	end
	return count_element
end

function GotFigurine()
  if Tracker:ProviderCountForCode("figurine") >= Tracker:ProviderCountForCode("figurine_option") then
    return 1
  else
    return 0
  end
end

function GotDungeons()
	local count = 0
	if has("dws") then
		count = count + 1
	end
	if has("cof") then
		count = count + 1
	end
	if has("fow") then
		count = count + 1
	end
	if has("tod") then
		count = count + 1
	end
	if has("rc") then
		count = count + 1
	end
	if has("pow") then
		count = count + 1
	end
	
	if count >= Tracker:ProviderCountForCode("dungeons") then
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
	if ( Sword1()==1 ) then
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

function HasDamageSource()
	if ( HasSword()==1 ) then
		return 1
	elseif ( ( HasBow()==1 or has("bombs") ) and has("weapons_on")) then
		return 1
	elseif ( ( HasBow()==1 or has("bombs") ) and has("weapons_off")) then
		return 2
	else
		return 0
	end
end

function HasChuDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif (has("weapons_on") and  has("bombs") ) then
		return 1
	elseif (has("weapons_off") and  has("bombs") ) then
		return 2
	else
		return 0
	end
end

function HasGleerokDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif (has("weapons_on") and (HasBow()==1  or has("bombs30") ) ) then
		return 1
	elseif ( has("weapons_off") and (HasBow()==1  or has("bombs30") ) ) then
		return 2
	else
		return 0
	end
end
function HasWizrobeDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( ( HasBow()==1  or has("bombs")  or has("lamp")) and has("weapons_on")) then
		return 1
	elseif ( ( HasBow()==1  or has("bombs")  or has("lamp")) and has("weapons_off")) then
		return 2
	else
		return 0
	end
end
function HasDarknutDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( HasBow()==1  or has("bombs") ) and has("weapons_on") then
		return 1
	elseif ( HasBow()==1  or has("bombs") ) and has("weapons_off") then
		return 2
	else
		return 0
	end
end
function HasHandDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( (HasBow()==1  or has("bombs")) and has("weapons_on")) then
		return 1
	elseif ( (HasBow()==1  or has("bombs")) and has("weapons_off")) then
		return 2
	else
		return 0
	end
end
function HasMazaalDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( has("weapons_on")) then
		return 1
	elseif ( has("weapons_off")) then
		return 2
	else
		return 0
	end
end
function HasGhiniDamage()
	if ( HasSword()==1 ) then
		return 1
	elseif ( (HasBow()==1  or has("bombs") or has("bombs30") or has("gust")) and has("weapons_on")) then
		return 1
	elseif ( (HasBow()==1  or has("bombs") or has("bombs30") or has("gust")) and has("weapons_off")) then
		return 2
	else
		return 0
	end
end
function HasBeam()
	if ( HasSword()==1 and  ( ( has("swordbeam")  and HasBottle()==1) or has("perilbeam") ) ) then
		return 1
	else
		return 0
	end
end
function CanDownThrust()
	if ( HasSword()==1 and   has("downthrust") and has("cape") ) then
		return 1
	else
		return 0
	end
end
function GuardSkip()
	if ( has("boots") and has("guardskip_on") ) then
		return 1
	elseif ( has("boots") and has("guardskip_off") ) then
		return 2
	else
		return 0
	end
end
function LikeLike()
	if ( has("likelike_on") ) then
		return 1
	elseif ( HasSword()==1 and has("likelike_off") ) then
		return 1
	elseif ( has("likelike_off") ) then
		return 2
	else
		return 0
	end
end
function BlowDust()
	if ( (has("bombs") or has("gust") )  and has("blowdust_on")) then
		return 1
	elseif ( (has("gust") ) and has("blowdust_off")) then
		return 1
	elseif ( (has("bombs") ) and has("blowdust_off")) then
		return 2
	else
		return 0
	end
end
function CrenelMushroom()
	if ( (has("bombs") or has("gust") )  and has("crenelmushroom_on")) then
		return 1
	elseif ( (has("bombs") )  and has("crenelmushroom_off")) then
		return 1
	elseif ( (has("gust") )  and has("crenelmushroom_off")) then
		return 2
	else
		return 0
	end
end
function LightArrowBreak()
	if ( has("lightarrowbreak_on") and HasLightBow()==1 ) then
		return 1
	elseif (has("lightarrowbreak_off") and HasLightBow()==1 ) then
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
function DownStrikeBeetle()
	if ( has("downstrikebeetle_on") and CanDownThrust()==1 ) then
		return 1
	elseif ( has("downstrikebeetle_off") and CanDownThrust()==1 ) then
		return 2
	else
		return 0
	end 
end
function CapeExtension()
	if (has("capeextension_on") and (has("flippers") or has("cape"))  ) then
		return 1
	elseif ( has("flippers") and has("capeextension_off") ) then
		return 1
	elseif ( has("cape") and has("capeextension_off") ) then
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
	if ( has("flippers") and has("ocarina") and has("lakeminish_on") ) then
		return 1
	elseif ( has("flippers") and has("lakeminish_off") ) then
		return 2
	else
		return 0
	end 
end
function CabinSwim()
	if ( ( has("flippers") or has("gust") ) and has("cabinswim_on") ) then
		return 1
	elseif ( has("gust") and has("cabinswim_off") ) then
		return 1
	elseif ( has("flippers") and has("cabinswim_off") ) then
		return 2
	else
		return 0
	end 
end
function CloudsKill()
	if ( HasDamageSource()==1 and has("cloudskill_off")  ) then
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
	if ( has("gust") and has("fowpot_on") ) then
		return 1
	elseif ( has("gust") and has("fowpot_off") ) then
		return 2
	else
		return 0
	end 
end
function PoWJump()
	if ( has("powjump_on") ) then
		return 1
	elseif ( has("cane") and has("powjump_off") ) then
		return 1
	elseif ( has("cape") and has("powjump_off") ) then
		return 2
	else
		return 0
	end 
end
function PoWPotPuzzleOOL()
	if ( has("powpotpuzzleool_on") and (( HasSword()==1 or HasBoomerang()==1 or has("bombs") or HasBow()==1)  and ( (DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and (PoW2ndHalf()==1 or PoWBlueWarp()==1) ) or (PoWRedWarp()==1 and OverworldBlocks()==1)) ) ) then
		return 1
	elseif ( has("powpotpuzzleool_off") and (( HasSword()==1 or HasBoomerang()==1 or has("bombs") or HasBow()==1)  and ( (DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and (PoW2ndHalf()==1 or PoWBlueWarp()==1) ) or (PoWRedWarp()==1 and OverworldBlocks()==1)) ) ) then
		return 2
	else
		return 0
	end 
end
function DHCCanonHit()
	if ( has("bombs") and HasSword()==1 and has("dhccanonhit_on") ) then
		return 1
	elseif ( CanSplit4()==1	and has("dhccanonhit_off") ) then
		return 1
	elseif ( has("bombs") and HasSword()==1 and has("dhccanonhit_off") ) then
		return 2
	else
		return 0
	end 
end
function DHCBladePuzzleShuffle()
	if ( ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1) and has("dhcbladepuzzleshuffle_on") ) then
		return 1
	elseif ( CanSplit4()==1	and has("dhcbladepuzzleshuffle_off") ) then
		return 1
	elseif ( CanSplit2()==1	and has("dhcbladepuzzleshuffle_off") ) then
		return 2
	else
		return 0
	end 
end
function DHCSwitchHit()
	if ( HasSword()==1	and HasSpin()==1 and has("dhcswitchhit_on") ) then
		return 1
	elseif ( CanSplit4()==1	and has("dhcswitchhit_off") ) then
		return 1
	elseif ( HasSword()==1	and HasSpin()==1 and has("dhcswitchhit_off") ) then
		return 2
	else
		return 0
	end 
end
function WindPortal() 
	if (has("openworld_on") ) then
		return 1
	elseif ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0f") ) ) then
		return 1
	else
		return 0
	end
end