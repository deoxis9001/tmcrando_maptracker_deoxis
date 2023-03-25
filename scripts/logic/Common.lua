has_item_data={}
has_item_option={}
has_item_cache = {}
function_data = {}
has_item_option["fusionred_complet"] = true
has_item_option["fusiongreen_complet"] = true
has_item_option["lightarrowbreak_on"] = true
has_item_option["fusionblue_complet"] = true
has_item_option["fusiongold_vanilla"] = true

debug_item=false
notracking=true
function tracker_on_accessibility_updating()
	has_item_data = {}
	has_item_cache = {}
	function_data = {}
	if debug_item == true then
		print("-------------------reset-------------------")
	end
end
function tracker_on_pack_ready()
	notracking=false
	debug_item=true
end

function has( item, amount )
	if has_item_option[item]==nil then
		if notracking then
			return false
		end
	end
	if has_item_data[item] == nil then
		has_item_data[item]=false
	elseif  has_item_data[item] == 0 then
		has_item_data[item]=false
	else
		if debug_item == true then
			if has_item_cache[item] == nil then
				has_item_cache[item]=true
				print("cache: " , item , has_item_data[item])
			end
		end
		return has_item_data[item]
	end
	local count = Tracker:ProviderCountForCode( item )
	amount = tonumber( amount )

	if not amount then
		has_item_data[item] = count >= 1
		return count >= 1
	else
		has_item_data[item] = count >= amount
		return count >= amount
		end
end
function hasnot( item )
 local count = Tracker:ProviderCountForCode( item )
 return count == 0
end

function FusionsRed()
	if function_data["FusionsRed"] ~= nil then
		return function_data["FusionsRed"]
	end
	if ( has("fusionred_vanilla") or has("fusionred_complet") ) then
		if( redflag==false or redflag==nil ) then
			fusiongreencombined:updateMax()
			redflag=true
		end
		function_data["FusionsRed"]=1
		return 1
	else
		if( redflag==true or redflag==nil ) then
			fusiongreencombined:updateMax()
			redflag=false
		end
		function_data["FusionsRed"]=0
		return 0
	end 
end

function FusionsBlue()
	if function_data["FusionsBlue"] ~= nil then
		return function_data["FusionsBlue"]
	end
	if ( has("fusionblue_vanilla") or has("fusionblue_complet") ) then
		if( blueflag==false or blueflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			blueflag=true
		end
		function_data["FusionsBlue"]=1
		return 1
	else
		if( blueflag==true or blueflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			blueflag=false
		end
		function_data["FusionsBlue"]=0
		return 0
	end 
end

function FusionsGreen() 
	if function_data["FusionsGreen"] ~= nil then
		return function_data["FusionsGreen"]
	end
	if ( has("fusiongreen_vanilla") or has("fusiongreen_complet") ) then
		function_data["FusionsGreen"]=1
		return 1
	else
		function_data["FusionsGreen"]=0
		return 0
	end 
end

function FusionsGold() 
	if function_data["FusionsGold"] ~= nil then
		return function_data["FusionsGold"]
	end
	if ( has("fusiongold_vanilla") or has("fusiongold_complet") ) then
		if( goldflag==false or goldflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			goldflag=true
		end
		function_data["FusionsGold"]=1
		return 1
	else
		if( goldflag==true or goldflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			goldflag=false
		end
		function_data["FusionsGold"]=0
		return 0
	end 
end
function CloudTopFallVisibility() 
	if function_data["CloudTopFallVisibility"] ~= nil then
		return function_data["CloudTopFallVisibility"]
	end
	if FusionsGold()==1 then
		function_data["CloudTopFallVisibility"]=1
		return 1
	elseif has("cloudwindcrest_yes") then
		function_data["CloudTopFallVisibility"]=1
		return 1
	elseif has("fallswindcrest_yes") then
		function_data["CloudTopFallVisibility"]=1
		return 1
	else
		function_data["CloudTopFallVisibility"]=0
		return 0
	end
end

function Sword1()
	if function_data["Sword1"] ~= nil then
		return function_data["Sword1"]
	end
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		function_data["Sword1"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 and has("progressiveitems") then
		function_data["Sword1"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword3") > 0 and has("progressiveitems") then
		function_data["Sword1"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword2") > 0 and has("progressiveitems") then
		function_data["Sword1"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword") > 0 then
		function_data["Sword1"]=1
		return 1
	elseif has("smithsword") then
		function_data["Sword1"]=1
		return 1
	else
		function_data["Sword1"]=0
		return 0
	end
end

function Sword2()
	if function_data["Sword2"] ~= nil then
		return function_data["Sword2"]
	end
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		function_data["Sword2"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 and has("progressiveitems") then
		function_data["Sword2"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword3") > 0 and has("progressiveitems") then
		function_data["Sword2"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword2") > 0 then
		function_data["Sword2"]=1
		return 1
	elseif has("greensword") then
		function_data["Sword2"]=1
		return 1
	else
		function_data["Sword2"]=0
		return 0
	end
end

function Sword3()
	if function_data["Sword3"] ~= nil then
		return function_data["Sword3"]
	end
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		function_data["Sword3"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 and has("progressiveitems") then
		function_data["Sword3"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword3") > 0 then
		function_data["Sword3"]=1
		return 1
	elseif has("redsword") then
		function_data["Sword3"]=1
		return 1
	else
		function_data["Sword3"]=0
		return 0
	end
end
function Sword4()
	if function_data["Sword4"] ~= nil then
		return function_data["Sword4"]
	end
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		function_data["Sword4"]=1
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 then
		function_data["Sword4"]=1
		return 1
	elseif has("bluesword") then
		function_data["Sword4"]=1
		return 1
	else
		function_data["Sword4"]=0
		return 0
	end
end

function Sword5()
	if function_data["Sword5"] ~= nil then
		return function_data["Sword5"]
	end
 if Tracker:ProviderCountForCode("sword5") > 0 then
		function_data["Sword5"]=1
  return 1
 elseif has("foursword") then
		function_data["Sword5"]=1
  return 1
 else
		function_data["Sword5"]=0
  return 0
 end
end

function GotSwords()
	if function_data["GotSwords"] ~= nil then
		return function_data["GotSwords"]
	end
	if has("sword0needed") then
		function_data["GotSwords"]=1
		return 1
	elseif Sword1()==1 and has("sword1needed") then
		function_data["GotSwords"]=1
		return 1
	elseif Sword2()==1 and has("sword2needed") then
		function_data["GotSwords"]=1
		return 1
	elseif Sword3()==1 and has("sword3needed") then
		function_data["GotSwords"]=1
		return 1
	elseif Sword4()==1 and has("sword4needed") then
		function_data["GotSwords"]=1
		return 1
	elseif Sword5()==1 and has("sword5needed") then
		function_data["GotSwords"]=1
		return 1
	else
		function_data["GotSwords"]=0
		return 0
	end
end

function GotElements()
	if function_data["GotElements"] ~= nil then
		return function_data["GotElements"]
	end
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
		function_data["GotElements"]=1
		return 1
	elseif has("element1Needed") and CountElement>=1 then
		function_data["GotElements"]=1
		return 1
	elseif has("element2Needed") and CountElement>=2 then
		function_data["GotElements"]=1
		return 1
	elseif has("element3Needed") and CountElement>=3 then
		function_data["GotElements"]=1
		return 1
	elseif has("element4Needed") and CountElement>=4 then
		function_data["GotElements"]=1
		return 1
	else
		function_data["GotElements"]=0
		return 0
	end
end

function GotFigurine()
	if function_data["GotFigurine"] ~= nil then
		return function_data["GotFigurine"]
	end
	if Tracker:ProviderCountForCode("figurine") >= Tracker:ProviderCountForCode("figurine_option") then
		function_data["GotFigurine"]=1
		return 1
	else
		function_data["GotFigurine"]=0
		return 0
	end
end

function GotDungeons()
	if function_data["GotDungeons"] ~= nil then
		return function_data["GotDungeons"]
	end
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
		function_data["GotDungeons"]=1
		return 1
	elseif CountDungeons >= 1 and has("dungeons1") then
		function_data["GotDungeons"]=1
		return 1
	elseif CountDungeons >= 2 and has("dungeons2") then
		function_data["GotDungeons"]=1
		return 1
	elseif CountDungeons >= 3 and has("dungeons3") then
		function_data["GotDungeons"]=1
		return 1
	elseif CountDungeons >= 4 and has("dungeons4") then
		function_data["GotDungeons"]=1
		return 1
	elseif CountDungeons >= 5 and has("dungeons5") then
		function_data["GotDungeons"]=1
		return 1
	elseif CountDungeons >= 6 and has("dungeons6") then
		function_data["GotDungeons"]=1
		return 1
	else
		function_data["GotDungeons"]=0
		return 0
	end
end

function CompletePed()
	if function_data["CompletePed"] ~= nil then
		return function_data["CompletePed"]
	end
	if (  GotSwords()==1 and GotElements()==1 and GotDungeons()==1 and GotFigurine()==1  ) then
		function_data["CompletePed"]=1
		return 1
	else
		function_data["CompletePed"]=0
		return 0
	end
end

function HasSword()
	if function_data["HasSword"] ~= nil then
		return function_data["HasSword"]
	end
	if ( Sword1()==1 or Sword2()==1 or Sword3()==1 or Sword4()==1 or Sword5()==1 ) then
		function_data["HasSword"]=1
		return 1
	else
		function_data["HasSword"]=0
		return 0
	end
end

function HasWhiteSword()
	if function_data["HasWhiteSword"] ~= nil then
		return function_data["HasWhiteSword"]
	end
	if ( Sword2()==1 or Sword3()==1 or Sword4()==1 or Sword5()==1 ) then
		function_data["HasWhiteSword"]=1
		return 1
	else
		function_data["HasWhiteSword"]=0
		return 0
	end
end

function HasSpin()
	if function_data["HasSpin"] ~= nil then
		return function_data["HasSpin"]
	end
	if ( has("spinattack") ) then
		function_data["HasSpin"]=1
		return 1
	else
		function_data["HasSpin"]=1
		return 0
	end
end

function CanSplit2()
	if function_data["CanSplit2"] ~= nil then
		return function_data["CanSplit2"]
	end
	if ( Sword3()==1 and has("spinattack") ) then
		function_data["CanSplit2"]=1
		return 1
	else
		function_data["CanSplit2"]=0
		return 0
	end
end

function CanSplit3()
	if function_data["CanSplit3"] ~= nil then
		return function_data["CanSplit3"]
	end
	if ( Sword4()==1 and has("spinattack") ) then
		function_data["CanSplit3"]=1
		return 1
	else
		function_data["CanSplit3"]=0
		return 0
	end
end

function CanSplit4()
	if function_data["CanSplit4"] ~= nil then
		return function_data["CanSplit4"]
	end
	if ( Sword5()==1 and has("spinattack") ) then
		function_data["CanSplit4"]=1
		return 1
	else
		function_data["CanSplit4"]=0
		return 0
	end
end

function HasBottle()
	if function_data["HasBottle"] ~= nil then
		return function_data["HasBottle"]
	end
	if ( Tracker:ProviderCountForCode("bottle") > 0 ) then
		function_data["HasBottle"]=1
		return 1
	else
		function_data["HasBottle"]=0
		return 0
	end
end

function HasBow()
	if function_data["HasBow"] ~= nil then
		return function_data["HasBow"]
	end
	if ( has("bow") or has("lights") ) then
		function_data["HasBow"]=1
		return 1
	else
		function_data["HasBow"]=0
		return 0
	end
end

function HasLightBow()
	if function_data["HasLightBow"] ~= nil then
		return function_data["HasLightBow"]
	end
	if ( has("lights") ) then
		function_data["HasLightBow"]=1
		return 1
	else
		function_data["HasLightBow"]=0
		return 0
	end
end

function HasBoomerang()
	if function_data["HasBoomerang"] ~= nil then
		return function_data["HasBoomerang"]
	end
	if ( has("boomerang") or has("magicboomerang") ) then
		function_data["HasBoomerang"]=1
		return 1
	else
		function_data["HasBoomerang"]=0
		return 0
	end
end

function HasMagicBoomerang()
	if function_data["HasMagicBoomerang"] ~= nil then
		return function_data["HasMagicBoomerang"]
	end
	if ( has("magicboomerang") ) then
		function_data["HasMagicBoomerang"]=1
		return 1
	else
		function_data["HasMagicBoomerang"]=0
		return 0
	end
end

function HasShield()
	if function_data["HasShield"] ~= nil then
		return function_data["HasShield"]
	end
	if ( has("shield") or has("mirrorshield") ) then
		function_data["HasShield"]=1
		return 1
	else
		function_data["HasShield"]=0
		return 0
	end
end

function HasBeam()
	if function_data["HasBeam"] ~= nil then
		return function_data["HasBeam"]
	end
	if ( HasSword()==1 and ( ( has("swordbeam") and HasBottle()==1 ) or has("perilbeam") ) ) then
		function_data["HasBeam"]=1
		return 1
	else
		function_data["HasBeam"]=0
		return 0
	end
end
function CanDownThrust()
	if function_data["CanDownThrust"] ~= nil then
		return function_data["CanDownThrust"]
	end
	if ( HasSword()==1 and has("downthrust") and has("cape") ) then
		function_data["CanDownThrust"]=1
		return 1
	else
		function_data["CanDownThrust"]=0
		return 0
	end
end


function HasDamageSource()
	if function_data["HasDamageSource"] ~= nil then
		return function_data["HasDamageSource"]
	end
	if ( HasSword()==1 ) then
		function_data["HasDamageSource"]=1
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		function_data["HasDamageSource"]=1
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		function_data["HasDamageSource"]=1
		return 1
	elseif ( has("bombs") ) then
		function_data["HasDamageSource"]=2
		return 2
	elseif ( HasBow()==1 ) then
		function_data["HasDamageSource"]=2
		return 2
	else
		function_data["HasDamageSource"]=0
		return 0
	end
end

function HasMadderDamage()
	if function_data["HasMadderDamage"] ~= nil then
		return function_data["HasMadderDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasMadderDamage"]=1
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		function_data["HasMadderDamage"]=1
		return 1
	elseif ( has("bombs") ) then
		function_data["HasMadderDamage"]=2
		return 2
	else
		function_data["HasMadderDamage"]=0
		return 0
	end
end

function HasChuDamage()
	if function_data["HasChuDamage"] ~= nil then
		return function_data["HasChuDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasChuDamage"]=1
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		function_data["HasChuDamage"]=1
		return 1
	elseif ( has("bombs") ) then
		function_data["HasChuDamage"]=2
		return 2
	else
		function_data["HasChuDamage"]=0
		return 0
	end
end

function HasHelmasaurDamage()
	if function_data["HasHelmasaurDamage"] ~= nil then
		return function_data["HasHelmasaurDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasHelmasaurDamage"]=1
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		function_data["HasHelmasaurDamage"]=1
		return 1
	elseif ( has("weaponsgust_yes") and has("gust") ) then
		function_data["HasHelmasaurDamage"]=1
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		function_data["HasHelmasaurDamage"]=1
		return 1
	elseif ( has("bombs") ) then
		function_data["HasHelmasaurDamage"]=2
		return 2
	elseif ( has("gust") ) then
		function_data["HasHelmasaurDamage"]=2
		return 2
	elseif ( HasBow()==1 ) then
		function_data["HasHelmasaurDamage"]=2
		return 2
	else
		function_data["HasHelmasaurDamage"]=0
		return 0
	end
end

function HasGleerokDamage()
	if function_data["HasGleerokDamage"] ~= nil then
		return function_data["HasGleerokDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasGleerokDamage"]=1
		return 1
	elseif ( has("weaponsbow_boss") and HasBow()==1 ) then
		function_data["HasGleerokDamage"]=1
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		function_data["HasGleerokDamage"]=1
		return 1
	elseif ( HasBow()==1 ) then
		function_data["HasGleerokDamage"]=2
		return 2
	elseif ( has("bombs30") ) then
		function_data["HasGleerokDamage"]=2
		return 2
	else
		function_data["HasGleerokDamage"]=0
		return 0
	end
end

function HasWizrobeDamage()
	if function_data["HasWizrobeDamage"] ~= nil then
		return function_data["HasWizrobeDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasWizrobeDamage"]=1
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		function_data["HasWizrobeDamage"]=1
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		function_data["HasWizrobeDamage"]=1
		return 1
	elseif ( has("weaponslamp_yes") and has("lamp") ) then
		function_data["HasWizrobeDamage"]=1
		return 1
	elseif (  HasBow()==1 ) then
		function_data["HasWizrobeDamage"]=2
		return 2
	elseif ( has("bombs") ) then
		function_data["HasWizrobeDamage"]=2
		return 2
	elseif ( has("lamp") ) then
		function_data["HasWizrobeDamage"]=2
		return 2
	else
		function_data["HasWizrobeDamage"]=0
		return 0
	end
end

function HasDarknutDamage()
	if function_data["HasDarknutDamage"] ~= nil then
		return function_data["HasDarknutDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasDarknutDamage"]=1
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		function_data["HasDarknutDamage"]=1
		return 1
	elseif ( has("bombs") ) then
		function_data["HasDarknutDamage"]=2
		return 2
	else
		function_data["HasDarknutDamage"]=0
		return 0
	end
end

function HasMazaalDamage()
	if function_data["HasMazaalDamage"] ~= nil then
		return function_data["HasMazaalDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasMazaalDamage"]=1
		return 1
	elseif ( has("weaponsbow_boss") and HasBow()==1 ) then
		function_data["HasMazaalDamage"]=1
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		function_data["HasMazaalDamage"]=1
		return 1
	elseif ( HasBow()==1 ) then
		function_data["HasMazaalDamage"]=2
		return 2
	elseif ( has("bombs30") ) then
		function_data["HasMazaalDamage"]=2
		return 2
	else
		function_data["HasMazaalDamage"]=0
		return 0
	end
end

function HasScissorDamage()
	if function_data["HasScissorDamage"] ~= nil then
		return function_data["HasScissorDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasScissorDamage"]=1
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		function_data["HasScissorDamage"]=1
		return 1
	elseif ( has("bombs30") ) then
		function_data["HasScissorDamage"]=2
		return 2
	else
		function_data["HasScissorDamage"]=0
		return 0
	end
end

function HasGhiniDamage()
	if function_data["HasGhiniDamage"] ~= nil then
		return function_data["HasGhiniDamage"]
	end
	if ( HasSword()==1 ) then
		function_data["HasGhiniDamage"]=1
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		function_data["HasGhiniDamage"]=1
		return 1
	elseif ( has("weaponsgust_yes") and has("gust") ) then
		function_data["HasGhiniDamage"]=1
		return 1
	elseif ( has("weaponsbow_yes") and HasBow()==1 ) then
		function_data["HasGhiniDamage"]=1
		return 1
	elseif ( has("bombs") ) then
		function_data["HasGhiniDamage"]=2
		return 2
	elseif ( has("gust") ) then
		function_data["HasGhiniDamage"]=2
		return 2
	elseif ( HasBow()==1 ) then
		function_data["HasGhiniDamage"]=2
		return 2
	else
		function_data["HasGhiniDamage"]=0
		return 0
	end
end

function ShopBack()
	if function_data["ShopBack"] ~= nil then
		return function_data["ShopBack"]
	end
	if ( TownDog()==1 ) then
		function_data["ShopBack"]=1
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard")  ) and has("gust") ) then
		function_data["ShopBack"]=1
		return 1
	else
		function_data["ShopBack"]=0
		return 0
	end
end

function SchoolHP()
	if ( has("cane") and CanSplit4()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard")  ) and has("cane") and has("gust") ) then
		return 1
	elseif ( has("cane") ) then
		return 3
	else
		return 0
	end
end

function MusicHouseHP()
	if ( MusicHouse()==1 ) then
		return 1
	elseif( ( has("grabbable_easy") or has("grabbable_hard")  ) and ( HasBoomerang()==1 or has("gust") ) ) then
		return 1
	else
		return 3
	end
end

function FountainHP()
	if ( has("cape")  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard")  ) and ( has("gust") or ( HasBoomerang()==1 and ( LightArrowBreak()==1 or has("cane") ) ) ) ) then
		return 1
	elseif ( has("grabbable_hard") and HasMagicBoomerang()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard")  ) and ( has("gust") or ( HasBoomerang()==1 and ( LightArrowBreak()==2 or has("cane") ) ) ) ) then
		return 2
	else
		return 0
	end
end

function LowerFallsItems()
	if ( AccessMinishWoods()==1 and has("cane") and ( has("flippers") or has("cape") ) ) then
		return 1
	elseif ( has("grabbable_easy") and OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and has ("gust") ) then
		return 1
	elseif ( has("grabbable_easy") and AccessFalls()==1 and has("grip") and has ("gust") ) then
		return 1
	elseif ( has("grabbable_hard") and OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and ( HasMagicBoomerang()==1 or has ("gust") ) ) then
		return 1
	elseif ( has("grabbable_hard") and AccessFalls()==1 and has("grip") and ( HasMagicBoomerang()==1 or has ("gust") ) ) then
		return 1
	elseif ( AccessMinishWoods()==2 and has("cane") and ( has("flippers") or has("cape") ) ) then
		return 2
	elseif ( has("grabbable_easy") and OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==2 and has ("gust") ) then
		return 2
	elseif ( has("grabbable_easy") and AccessFalls()==2 and has("grip") and has ("gust") ) then
		return 2
	elseif ( has("grabbable_hard") and OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==2 and ( HasMagicBoomerang()==1 or has ("gust") ) ) then
		return 2
	elseif ( has("grabbable_hard") and AccessFalls()==1 and has("grip") and ( HasMagicBoomerang()==1 or has ("gust") ) ) then
		return 2
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
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessLonLon()==1 and LakeShortcut()==1 and HasMagicBoomerang()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessSouthLake()==1 and ( has("gust") or HasMagicBoomerang()==1 ) ) then
		return 1
	elseif ( ( AccessLonLon()==2 or AccessLonLon()==1 ) and ( CapeExtension()==1 or CapeExtension()==2 ) ) then
		return 2
	elseif ( AccessSouthLake()==2 and ( has("cape") or has("flippers") ) ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessLonLon()==2 and LakeShortcut()==1 and HasMagicBoomerang()==1  ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessSouthLake()==2 and ( has("gust") or HasMagicBoomerang()==1 ) ) then
		return 2
	else
		return 0
	end
end


function MinishNorthHP()
	if ( AccessNorthMinish()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessMinishWoods()==1 and ( has("gust") or HasMagicBoomerang()==1 ) ) then
		return 1
	elseif ( has("grabbable_hard") and HasBoomerang()==1 ) then
		return 1
	elseif ( AccessNorthMinish()==2  ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessMinishWoods()==2 and ( has("gust") or HasMagicBoomerang()==1 ) ) then
		return 2
	else
		return 0
	end
end


function MinishSouthHP()
	if ( AccessMinishWoods()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessBelari()==1 and has("gust") ) then
		return 1
	elseif ( AccessMinishWoods()==2  ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and AccessBelari()==2 and has("gust") ) then
		return 2
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
	if ( CanSplit4()==1 or CanSplit3()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
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
	elseif ( OverworldBlocks()==1 and ( CapeExtension()==1 or CapeExtension()==2 ) ) then
		return 2
	elseif ( ( AccessFalls()==1 or  AccessFalls()==2 ) and has("grip") and ( has("flippers") or ( ( DarkRooms()==1 or  DarkRooms()==2 ) and ( CapeExtension()==1 or CapeExtension()==2 ) ) ) ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( AccessFalls()==1 or  AccessFalls()==2 ) and has("grip") and ( ( DarkRooms()==1 or  DarkRooms()==2 ) and ( has("gust") or HasMagicBoomerang()==1 ) ) ) then
		return 2
	else
		return 0
	end
end


function DeepwoodMadderHP()
	if ( DeepwoodPreMadderpillar()==1 and DeepwoodMadderpillarDoor()==1 and DeepwoodWeb()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( ( DeepwoodPreMadderpillar()==1 and DeepwoodMadderpillarDoor()==1 and DeepwoodWeb()==1 ) or has("gust") and ( Deepwood1stDoor()==1 or DeepwoodPreMadderpillar()==1 ) ) ) then
		return 1
	elseif ( ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) and ( DeepwoodMadderpillarDoor()==1 or DeepwoodMadderpillarDoor()==2 ) and DeepwoodWeb()==1 ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( ( ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) and ( DeepwoodMadderpillarDoor()==1 or DeepwoodMadderpillarDoor()==2 ) and DeepwoodWeb()==1 ) or has("gust") and ( Deepwood1stDoor()==1 or ( DeepwoodPreMadderpillar()==1 or DeepwoodPreMadderpillar()==2 ) ) ) ) then
		return 2
	else
		return 0
	end
end


function CoFRupees()
	if ( ( BombWalls()==1 or Bobombs()==1 ) and CoFSpikeBeetle()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	elseif ( ( BombWalls()==1 or Bobombs()==1 or Bobombs()==2 ) and ( CoFSpikeBeetle()==1 or CoFSpikeBeetle()==2 ) ) then
		return 2
	else
		return 0
	end
end


function FoWLeftRupee()
	if ( FoWEyeSwitch()==1 and FoWStalfosFight()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	elseif ( FoWEyeSwitch()==1 and FoWStalfosFight()==2 ) then
		return 2
	else
		return 0
	end
end


function FoWEntranceRupee()
	if ( has("mitts")  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	else
		return 0
	end
end


function FoWHP()
	if ( FoWCloneSwitch()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	else
		return 0
	end
end


function ToDRightRupees()
	if ( ToD2ndRupeePath()==1  ) then
		return 1
	elseif ( has("grabbable_hard") and has("gust") and ToDLilypadEnd()==1 ) then
		return 1
	elseif ( has("grabbable_hard") and has("gust") and ToDLilypadEnd()==2 ) then
		return 2
	else
		return 0
	end
end


function PoWRupees()
	if ( PoWJump()==1  ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and HasMagicBoomerang()==1 ) then
		return 1
	elseif ( PoWJump()==2  ) then
		return 2
	else
		return 0
	end
end


function PoWDrop()
	if ( has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and has("cane") and PoWPotPuzzle()==1 ) then
		return 1
	elseif ( has("grabbable_easy") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 ) and DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and ( HasBoomerang()==1 and ( LightArrowBreak()==1 or has("cane") ) ) ) then
		return 1
	elseif ( has("grabbable_easy") and PoWRedWarp()==1 and OverworldBlocks()==1 and ( has("gust") or ( HasBoomerang()==1 and ( LightArrowBreak()==1 or has("cane") ) ) ) ) then
		return 1
	elseif ( has("grabbable_hard") and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 ) and DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and HasBoomerang()==1 ) then
		return 1
	elseif ( has("grabbable_hard") and PoWRedWarp()==1 and OverworldBlocks()==1 and ( has("gust") or HasBoomerang()==1 ) ) then
		return 1
	elseif ( has("cape") and ( CanSplit3()==1 or CanSplit4()==1 ) and has("cane") and ( PoWPotPuzzle()==1 or PoWPotPuzzle()==2 ) ) then
		return 1
	elseif ( has("grabbable_easy") and ( ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) or PoWBlueWarp()==1 ) and ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( HasBoomerang()==1 and ( LightArrowBreak()==1 or LightArrowBreak()==2 or has("cane") ) ) ) then
		return 2
	elseif ( has("grabbable_easy") and PoWRedWarp()==1 and OverworldBlocks()==1 and ( has("gust") or ( HasBoomerang()==1 and ( LightArrowBreak()==2 or has("cane") ) ) ) ) then
		return 2
	elseif ( has("grabbable_hard") and ( ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) or PoWBlueWarp()==1 ) and ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and HasBoomerang()==1 ) then
		return 2
	else
		return 0
	end
end


function PoWHP()
	if ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and PoWHandRoom()==1 and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 ) ) then
		return 1
	elseif ( PoWRedWarp()==1 and OverworldBlocks()==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( CanSplit3()==1 or CanSplit4()==1 ) and PoWJump()==1 and PoW1stDoor()==1 and ( has("gust") or HasBoomerang()==1 ) ) then
		return 1
	elseif ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( PoWHandRoom()==1 or PoWHandRoom()==2 ) and ( ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) or PoWBlueWarp()==1 ) ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( CanSplit3()==1 or CanSplit4()==1 ) and ( PoWJump()==1 or PoWJump()==2 ) and ( PoW1stDoor()==1 or PoW1stDoor()==2 ) and ( has("gust") or HasBoomerang()==1 ) ) then
		return 2
	else
		return 0
	end
end

function GuardSkip()
	if function_data["GuardSkip"] ~= nil then
		return function_data["GuardSkip"]
	end
	if ( has("guardskip_on") and has("boots")  ) then
		function_data["GuardSkip"]=1
		return 1
	elseif ( has("guardskip_off") and has("boots")  ) then
		function_data["GuardSkip"]=2
		return 2
	else
		function_data["GuardSkip"]=0
		return 0
	end
end

function LikeLike()
	if function_data["LikeLike"] ~= nil then
		return function_data["LikeLike"]
	end
	if ( has("likelike_on") ) then
		function_data["LikeLike"]=1
		return 1
	elseif ( has("likelike_off") and HasSword()==1 ) then
		function_data["LikeLike"]=1
		return 1
	elseif ( has("likelike_off") ) then
		function_data["LikeLike"]=2
		return 2
	else
		function_data["LikeLike"]=0
		return 0
	end
end
function BlowDust()
	if function_data["BlowDust"] ~= nil then
		return function_data["BlowDust"]
	end
	if ( has("blowdust_on") and ( has("bombs") or has("gust") ) ) then
		function_data["BlowDust"]=1
		return 1
	elseif ( has("blowdust_off") and has("gust") ) then
		function_data["BlowDust"]=1
		return 1
	elseif ( has("blowdust_off") and has("bombs") ) then
		function_data["BlowDust"]=2
		return 2
	else
		function_data["BlowDust"]=0
		return 0
	end
end
function CrenelMushroom()
	if function_data["CrenelMushroom"] ~= nil then
		return function_data["CrenelMushroom"]
	end
	if ( has("crenelmushroom_on") and ( has("bombs") or has("gust") ) ) then
		function_data["CrenelMushroom"]=1
		return 1
	elseif ( has("crenelmushroom_off") and ( has("bombs") ) ) then
		function_data["CrenelMushroom"]=1
		return 1
	elseif ( has("crenelmushroom_off") and has("gust") ) then
		function_data["CrenelMushroom"]=2
		return 2
	else
		function_data["CrenelMushroom"]=0
		return 0
	end
end
function LightArrowBreak()
	if function_data["LightArrowBreak"] ~= nil then
		return function_data["LightArrowBreak"]
	end
	if ( has("lightarrowbreak_on") and has("lights") ) then
		function_data["LightArrowBreak"]=1
		return 1
	elseif ( has("lightarrowbreak_off") and has("lights") ) then
		function_data["LightArrowBreak"]=2
		return 2
	else
		function_data["LightArrowBreak"]=0
		return 0
	end
end
function Bobombs()
	if function_data["Bobombs"] ~= nil then
		return function_data["Bobombs"]
	end
	if ( has("bobombs_on") and ( HasSword()==1 or has("gust") or has("bombs") ) ) then
		function_data["Bobombs"]=1
		return 1
	elseif ( has("bobombs_off") and ( HasSword()==1 or has("gust") or has("bombs") ) ) then
		function_data["Bobombs"]=2
		return 2
	else
		function_data["Bobombs"]=0
		return 0
	end
end
function CrenelBeam()
	if function_data["CrenelBeam"] ~= nil then
		return function_data["CrenelBeam"]
	end
	if ( has("crenelbeam_on") and HasBeam()==1 ) then
		function_data["CrenelBeam"]=1
		return 1
	elseif ( has("crenelbeam_off") and HasBeam()==1 ) then
		function_data["CrenelBeam"]=2
		return 2
	else
		function_data["CrenelBeam"]=0
		return 0
	end
end
function DownThrustBeetle()
	if function_data["DownThrustBeetle"] ~= nil then
		return function_data["DownThrustBeetle"]
	end
	if ( has("downstrikebeetle_on") and CanDownThrust()==1 ) then
		function_data["DownThrustBeetle"]=0
		return 1
	elseif ( has("downstrikebeetle_off") and CanDownThrust()==1 ) then
		function_data["DownThrustBeetle"]=0
		return 2
	else
		function_data["DownThrustBeetle"]=0
		return 0
	end 
end
function CapeExtension()
	if function_data["CapeExtension"] ~= nil then
		return function_data["CapeExtension"]
	end
	if ( has("capeextension_on") and ( has("flippers") or has("cape") )  ) then
		function_data["CapeExtension"]=1
		return 1
	elseif ( has("capeextension_off") and has("flippers")  ) then
		function_data["CapeExtension"]=1
		return 1
	elseif ( has("capeextension_off") and has("cape") ) then
		function_data["CapeExtension"]=2
		return 2
	else
		function_data["CapeExtension"]=0
		return 0
	end 
end
function DarkRooms()
	if function_data["DarkRooms"] ~= nil then
		return function_data["DarkRooms"]
	end
	if ( has("darkrooms_off") and has("lamp") ) then
		function_data["DarkRooms"]=1
		return 1
	elseif ( has("darkrooms_off") ) then
		function_data["DarkRooms"]=2
		return 2
	elseif ( has("darkrooms_on") ) then
		function_data["DarkRooms"]=1
		return 1
	else
		function_data["DarkRooms"]=0
		return 0
	end 
end
function LakeMinish()
	if function_data["LakeMinish"] ~= nil then
		return function_data["LakeMinish"]
	end
	if ( has("lakeminish_on") and Hylia_CrackFusion_LibrariNPC()==1 ) then
		function_data["LakeMinish"]=1
		return 1
	elseif ( has("lakeminish_off") and Hylia_CrackFusion_LibrariNPC()==1 ) then
		function_data["LakeMinish"]=2
		return 2
	else
		function_data["LakeMinish"]=0
		return 0
	end 
end
function CabinSwim()
	if function_data["CabinSwim"] ~= nil then
		return function_data["CabinSwim"]
	end
	if ( has("cabinswim_on") and ( has("flippers") or has("gust") ) ) then
		function_data["CabinSwim"]=1
		return 1
	elseif ( has("cabinswim_off") and has("gust") ) then
		function_data["CabinSwim"]=1
		return 1
	elseif ( has("cabinswim_off") and has("flippers") ) then
		function_data["CabinSwim"]=2
		return 2
	else
		function_data["CabinSwim"]=0
		return 0
	end 
end
function CloudsKill()
	if function_data["CloudsKill"] ~= nil then
		return function_data["CloudsKill"]
	end
	if ( has("cloudskill_off") and HasDamageSource()==1 ) then
		function_data["CloudsKill"]=1
		return 1
	elseif ( has("cloudskill_on")  ) then
		function_data["CloudsKill"]=1
		return 1
	elseif ( has("cloudskill_off") and HasDamageSource()==2 ) then
		function_data["CloudsKill"]=2
		return 2
	elseif ( has("cloudskill_off")  ) then
		function_data["CloudsKill"]=2
		return 2
	else
		function_data["CloudsKill"]=0
		return 0
	end 
end
function FoWPot()
	if function_data["FoWPot"] ~= nil then
		return function_data["FoWPot"]
	end
	if ( has("fowpot_on") and has("gust") ) then
		function_data["FoWPot"]=1
		return 1
	elseif ( has("fowpot_off") and has("gust") ) then
		function_data["FoWPot"]=2
		return 2
	else
		function_data["FoWPot"]=0
		return 0
	end 
end
function PoWJump()
	if function_data["PoWJump"] ~= nil then
		return function_data["PoWJump"]
	end
	if ( has("powjump_on") ) then
		function_data["PoWJump"]=1
		return 1
	elseif ( has("powjump_off") and has("cane") ) then
		function_data["PoWJump"]=1
		return 1
	elseif ( has("powjump_off") and has("cape") ) then
		function_data["PoWJump"]=2
		return 2
	else
		function_data["PoWJump"]=0
		return 0
	end 
end
function PoWPotPuzzleOOL()
	if function_data["PoWPotPuzzleOOL"] ~= nil then
		return function_data["PoWPotPuzzleOOL"]
	end
	if ( has("powpotpuzzleool_on") and ( ( HasSword()==1 or HasBoomerang()==1 or has("bombs") or HasBow()==1 ) and ( ( DarkRooms()==1 and ( ( PoW2ndHalf1stDoor()==1 and has("cape") ) or PoWShortcuts()==1 ) and ( PoW2ndHalf()==1 or PoWBlueWarp()==1 ) ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 ) ) ) ) then
		function_data["PoWPotPuzzleOOL"]=1
		return 1
	elseif ( has("powpotpuzzleool_on") and ( ( HasSword()==1 or HasBoomerang()==1 or has("bombs") or HasBow()==1 ) and ( ( ( DarkRooms()==1 or DarkRooms()==2 ) and ( ( ( PoW2ndHalf1stDoor()==1 or PoW2ndHalf1stDoor()==2 ) and has("cape") ) or PoWShortcuts()==1 ) and ( ( PoW2ndHalf()==1 or PoW2ndHalf()==2 ) or PoWBlueWarp()==1 ) ) or ( PoWRedWarp()==1 and OverworldBlocks()==1 ) ) ) ) then
		function_data["PoWPotPuzzleOOL"]=2
		return 2
	else
		function_data["PoWPotPuzzleOOL"]=0
		return 0
	end 
end
function DHCCanonHit()
	if function_data["DHCCanonHit"] ~= nil then
		return function_data["DHCCanonHit"]
	end
	if ( has("dhccanonhit_on") and has("bombs") and HasSword()==1 ) then
		function_data["DHCCanonHit"]=1
		return 1
	elseif ( has("dhccanonhit_off") and CanSplit4()==1 ) then
		function_data["DHCCanonHit"]=1
		return 1
	elseif ( has("dhccanonhit_off") and has("bombs") and HasSword()==1 ) then
		function_data["DHCCanonHit"]=2
		return 2
	else
		function_data["DHCCanonHit"]=0
		return 0
	end 
end
function DHCBladePuzzleShuffle()
	if function_data["DHCBladePuzzleShuffle"] ~= nil then
		return function_data["DHCBladePuzzleShuffle"]
	end
	if ( has("dhcbladepuzzleshuffle_on") and ( CanSplit2()==1 or CanSplit3()==1 or CanSplit4()==1 ) ) then
		function_data["DHCBladePuzzleShuffle"]=1
		return 1
	elseif ( has("dhcbladepuzzleshuffle_off") and CanSplit4()==1 ) then
		function_data["DHCBladePuzzleShuffle"]=1
		return 1
	elseif ( has("dhcbladepuzzleshuffle_off") and ( CanSplit2()==1 or CanSplit3()==1 ) ) then
		function_data["DHCBladePuzzleShuffle"]=2
		return 2
	else
		function_data["DHCBladePuzzleShuffle"]=0
		return 0
	end 
end
function DHCSwitchHit()
	if function_data["DHCSwitchHit"] ~= nil then
		return function_data["DHCSwitchHit"]
	end
	if ( has("dhcswitchhit_on") and HasSword()==1 and HasSpin()==1 ) then
		function_data["DHCSwitchHit"]=1
		return 1
	elseif ( has("dhcswitchhit_off") and CanSplit4()==1 ) then
		function_data["DHCSwitchHit"]=1
		return 1
	elseif ( has("dhcswitchhit_off") and HasSword()==1 and HasSpin()==1 ) then
		function_data["DHCSwitchHit"]=2
		return 2
	else
		function_data["DHCSwitchHit"]=0
		return 0
	end 
end
function StrangerFusion() 
	if ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0f") ) ) then
		return 1
	else
		return 0
	end
end
function CryptDungeons()
	if ( has("dungeonser_off") ) then
		return AccessCrypt()
	elseif ( has("crypt_dws") ) then
		return AccessDeepwood()
	elseif ( has("crypt_cof") ) then
		return AccessCoF()
	elseif ( has("crypt_fow") ) then
		return AccessFortress()
	elseif ( has("crypt_tod") ) then
		return AccessDroplets()
	elseif ( has("crypt_crypt") ) then
		return AccessCrypt()
	elseif ( has("crypt_pow") ) then
		return AccessPalace()
	elseif ( has("crypt_dhc") ) then
		return 1
	else
		return 0
	end
end
function DeepwoodDungeons()
	if ( has("dungeonser_off") ) then
		return AccessDeepwood()
	elseif ( has("dws_dws") ) then
		return AccessDeepwood()
	elseif ( has("dws_cof") ) then
		return AccessCoF()
	elseif ( has("dws_fow") ) then
		return AccessFortress()
	elseif ( has("dws_tod") ) then
		return AccessDroplets()
	elseif ( has("dws_crypt") ) then
		return AccessCrypt()
	elseif ( has("dws_pow") ) then
		return AccessPalace()
	elseif ( has("dws_dhc") ) then
		return 1
	else
		return 0
	end
end
function CofDungeons()
	if ( has("dungeonser_off") ) then
		return AccessCoF()
	elseif ( has("cof_dws") ) then
		return AccessDeepwood()
	elseif ( has("cof_cof") ) then
		return AccessCoF()
	elseif ( has("cof_fow") ) then
		return AccessFortress()
	elseif ( has("cof_tod") ) then
		return AccessDroplets()
	elseif ( has("cof_crypt") ) then
		return AccessCrypt()
	elseif ( has("cof_pow") ) then
		return AccessPalace()
	elseif ( has("cof_dhc") ) then
		return 1
	else
		return 0
	end
end
function FowDungeons()
	if ( has("dungeonser_off") ) then
		return AccessFortress()
	elseif ( has("fow_dws") ) then
		return AccessDeepwood()
	elseif ( has("fow_cof") ) then
		return AccessCoF()
	elseif ( has("fow_fow") ) then
		return AccessFortress()
	elseif ( has("fow_tod") ) then
		return AccessDroplets()
	elseif ( has("fow_crypt") ) then
		return AccessCrypt()
	elseif ( has("fow_pow") ) then
		return AccessPalace()
	elseif ( has("fow_dhc") ) then
		return 1
	else
		return 0
	end
end
function TodDungeons()
	if ( has("dungeonser_off") ) then
		return AccessDroplets()
	elseif ( has("tod_dws") ) then
		return AccessDeepwood()
	elseif ( has("tod_cof") ) then
		return AccessCoF()
	elseif ( has("tod_fow") ) then
		return AccessFortress()
	elseif ( has("tod_tod") ) then
		return AccessDroplets()
	elseif ( has("tod_crypt") ) then
		return AccessCrypt()
	elseif ( has("tod_pow") ) then
		return AccessPalace()
	elseif ( has("tod_dhc") ) then
		return 1
	else
		return 0
	end
end
function PowDungeons()
	if ( has("dungeonser_off") ) then
		return AccessPalace()
	elseif ( has("pow_dws") ) then
		return AccessDeepwood()
	elseif ( has("pow_cof") ) then
		return AccessCoF()
	elseif ( has("pow_fow") ) then
		return AccessFortress()
	elseif ( has("pow_tod") ) then
		return AccessDroplets()
	elseif ( has("pow_crypt") ) then
		return AccessCrypt()
	elseif ( has("pow_pow") ) then
		return AccessPalace()
	elseif ( has("pow_dhc") ) then
		return 1
	else
		return 0
	end
end
function DhcDungeons()
	if ( has("dungeonser_off") ) then
		return 1
	elseif ( has("dhc_dws") ) then
		return AccessDeepwood()
	elseif ( has("dhc_cof") ) then
		return AccessCoF()
	elseif ( has("dhc_fow") ) then
		return AccessFortress()
	elseif ( has("dhc_tod") ) then
		return AccessDroplets()
	elseif ( has("dhc_crypt") ) then
		return AccessCrypt()
	elseif ( has("dhc_pow") ) then
		return AccessPalace()
	elseif ( has("dhc_dhc") ) then
		return 1
	else
		return 0
	end
end