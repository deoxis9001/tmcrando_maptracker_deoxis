
function FusionsRed()

	if ( has("fusionred_vanilla") or has("fusionred_complet") ) then
		return 1
	else
		return 0
	end 
end

function FusionsBlue()

	if ( has("fusionblue_vanilla") or has("fusionblue_complet") ) then
		return 1
	else
		return 0
	end 
end

function FusionsGreen()

	if ( has("fusiongreen_vanilla") or has("fusiongreen_complet") ) then
		return 1
	else
		return 0
	end 
end
function FusionsRedWNumber() 

	local count_fusion=0
	if has("fusions0a") then
		count_fusion=count_fusion+1
	end
	if has("fusions0b") then
		count_fusion=count_fusion+1
	end
	if has("fusions0c") then
		count_fusion=count_fusion+1
	end
	if has("fusions0d") then
		count_fusion=count_fusion+1
	end
	if has("fusions0e") then
		count_fusion=count_fusion+1
	end
	if has("fusions0f") then
		count_fusion=count_fusion+1
	end
	if has("fusions10") then
		count_fusion=count_fusion+1
	end
	if has("fusions11") then
		count_fusion=count_fusion+1
	end
	if has("fusions12") then
		count_fusion=count_fusion+1
	end
		return count_fusion
end
function FusionsRedVNumber() 

	local count_fusion=0
	if has("fusions13") then
		count_fusion=count_fusion+1
	end
	if has("fusions14") then
		count_fusion=count_fusion+1
	end
	if has("fusions15") then
		count_fusion=count_fusion+1
	end
	if has("fusions16") then
		count_fusion=count_fusion+1
	end
	if has("fusions18") then
		count_fusion=count_fusion+1
	end
	if has("fusions19") then
		count_fusion=count_fusion+1
	end
	if has("fusions1a") then
		count_fusion=count_fusion+1
	end
		return count_fusion
end
function FusionsRedENumber() 
	local count_fusion=0
	if has("fusions17") then
		count_fusion=count_fusion+1
	end
	if has("fusions1b") then
		count_fusion=count_fusion+1
	end
	if has("fusions1c") then
		count_fusion=count_fusion+1
	end
	if has("fusions1d") then
		count_fusion=count_fusion+1
	end
	if has("fusions1e") then
		count_fusion=count_fusion+1
	end
	if has("fusions1f") then
		count_fusion=count_fusion+1
	end
	if has("fusions20") then
		count_fusion=count_fusion+1
	end
	if has("fusions21") then
		count_fusion=count_fusion+1
	end
	return count_fusion
end
function FusionsBlueSNumber() 
	local count_fusion=0
	local count_fusion2=0
	if has("fusions2d") then
		count_fusion=count_fusion+1
	end
	if has("fusions2e") then
		count_fusion=count_fusion+1
	end
	if has("fusions30") then
		count_fusion=count_fusion+1
	end
	if has("fusions31") then
		count_fusion=count_fusion+1
	end
	if has("fusions32") then
		count_fusion=count_fusion+1
	end
	if has("fusions33") then
		count_fusion=count_fusion+1
	end
	
	if has("fusions25") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions26") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions29") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2a") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2b") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2f") then
		count_fusion2=count_fusion2+1
	end
	count_fusion3=math.floor(count_fusion2/2)
	count_fusion=count_fusion+count_fusion3
		return count_fusion
end
function FusionsBlueLNumber()
	local count_fusion=0
	local count_fusion2=0
	if has("fusions22") then
		count_fusion=count_fusion+1
	end
	if has("fusions23") then
		count_fusion=count_fusion+1
	end
	if has("fusions24") then
		count_fusion=count_fusion+1
	end
	if has("fusions27") then
		count_fusion=count_fusion+1
	end
	if has("fusions28") then
		count_fusion=count_fusion+1
	end
	if has("fusions2c") then
		count_fusion=count_fusion+1
	end
	
	if has("fusions25") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions26") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions29") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2a") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2b") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2f") then
		count_fusion2=count_fusion2+1
	end
	count_fusion3=math.ceil(count_fusion2/2)
	count_fusion=count_fusion+count_fusion3
		return count_fusion
end
function FusionsBlueWallNumber() 
	local count_fusion2=0
	if has("fusions25") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions26") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions29") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2a") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2b") then
		count_fusion2=count_fusion2+1
	end
	if has("fusions2f") then
		count_fusion2=count_fusion2+1
	end
	count_fusion3=math.ceil(count_fusion2/2)
	count_fusion4=math.floor(count_fusion2/2)
	count_fusion=count_fusion3-count_fusion4
	if ( count_fusion == 0 ) then
		return FusionsBlueLNumber()-count_fusion3
	else
		return FusionsBlueSNumber()-count_fusion4
	end 
end
function FusionsGreenCNumber() 
	local count_fusion=0
	if has("fusions34") then
		count_fusion=count_fusion+1
	end
	if has("fusions35") then
		count_fusion=count_fusion+1
	end
	if has("fusions36") then
		count_fusion=count_fusion+1
	end
	if has("fusions37") then
		count_fusion=count_fusion+1
	end
	if has("fusions38") then
		count_fusion=count_fusion+1
	end
	if has("fusions39") then
		count_fusion=count_fusion+1
	end
	if has("fusions3a") then
		count_fusion=count_fusion+1
	end
	if has("fusions3b") then
		count_fusion=count_fusion+1
	end
	if has("fusions3c") then
		count_fusion=count_fusion+1
	end
	if has("fusions3d") then
		count_fusion=count_fusion+1
	end
	if has("fusions3e") then
		count_fusion=count_fusion+1
	end
	if has("fusions3f") then
		count_fusion=count_fusion+1
	end
	if has("fusions40") then
		count_fusion=count_fusion+1
	end
	if has("fusions41") then
		count_fusion=count_fusion+1
	end
	if has("fusions5c") then
		count_fusion=count_fusion+1
	end
	if has("fusions5f") then
		count_fusion=count_fusion+1
	end
		return count_fusion
end
function FusionsGreenGNumber() 
	local count_fusion=0
	if has("fusions42") then
		count_fusion=count_fusion+1
	end
	if has("fusions43") then
		count_fusion=count_fusion+1
	end
	if has("fusions44") then
		count_fusion=count_fusion+1
	end
	if has("fusions45") then
		count_fusion=count_fusion+1
	end
	if has("fusions46") then
		count_fusion=count_fusion+1
	end
	if has("fusions47") then
		count_fusion=count_fusion+1
	end
	if has("fusions48") then
		count_fusion=count_fusion+1
	end
	if has("fusions49") then
		count_fusion=count_fusion+1
	end
	if has("fusions4a") then
		count_fusion=count_fusion+1
	end
	if has("fusions4b") then
		count_fusion=count_fusion+1
	end
	if has("fusions4c") then
		count_fusion=count_fusion+1
	end
	if has("fusions4d") then
		count_fusion=count_fusion+1
	end
	if has("fusions4e") then
		count_fusion=count_fusion+1
	end
	if has("fusions5d") then
		count_fusion=count_fusion+1
	end
	if has("fusions60") then
		count_fusion=count_fusion+1
	end
	if has("fusions62") then
		count_fusion=count_fusion+1
	end
	if has("fusions63") then
		count_fusion=count_fusion+1
	end
		return count_fusion
end
function FusionsGreenPNumber() 
	local count_fusion=0
	if has("fusions4f") then
		count_fusion=count_fusion+1
	end
	if has("fusions50") then
		count_fusion=count_fusion+1
	end
	if has("fusions51") then
		count_fusion=count_fusion+1
	end
	if has("fusions52") then
		count_fusion=count_fusion+1
	end
	if has("fusions53") then
		count_fusion=count_fusion+1
	end
	if has("fusions54") then
		count_fusion=count_fusion+1
	end
	if has("fusions55") then
		count_fusion=count_fusion+1
	end
	if has("fusions56") then
		count_fusion=count_fusion+1
	end
	if has("fusions57") then
		count_fusion=count_fusion+1
	end
	if has("fusions58") then
		count_fusion=count_fusion+1
	end
	if has("fusions59") then
		count_fusion=count_fusion+1
	end
	if has("fusions5a") then
		count_fusion=count_fusion+1
	end
	if has("fusions5b") then
		count_fusion=count_fusion+1
	end
	if has("fusions5e") then
		count_fusion=count_fusion+1
	end
	if has("fusions61") then
		count_fusion=count_fusion+1
	end
	if has("fusions64") then
		count_fusion=count_fusion+1
	end
	return count_fusion
end
function FusionsRedNumber(code)
	if function_data_fusion[code] ~= nil then
		-- If a cached value exists, return it
		return function_data_fusion[code]
	end
	if fusionredcombined:getActive() then
		local count_fuzer=function_Cached("FusionsRedWNumber")+function_Cached("FusionsRedVNumber")+function_Cached("FusionsRedENumber")
		if count_fuzer < redW:getActive() then
				function_data_fusion[code]=1
				return 1
		else
				function_data_fusion[code]=0
				return 0
		end
	else
		if function_Cached("FusionsRedWNumber")<redW:getActive() and code=="redW" then
				function_data_fusion[code]=1
			return 1
		elseif function_Cached("FusionsRedVNumber")<redV:getActive() and code=="redV" then
				function_data_fusion[code]=1
			return 1
		elseif function_Cached("FusionsRedENumber")<redE:getActive() and code=="redE" then
				function_data_fusion[code]=1
			return 1
		else
			function_data_fusion[code]=0
			return 0
		end
	end
end
function FusionsBlueNumber(code)
	if function_data_fusion[code] ~= nil then
		-- If a cached value exists, return it
		return function_data_fusion[code]
	end
	local info_fuze=0
	if fusionbluecombined:getActive() then
		local count_fuzer=function_Cached("FusionsBlueLNumber")+function_Cached("FusionsBlueSNumber")
		if count_fuzer < blueL:getActive() then
				function_data_fusion[code]=1
				return 1
		else
				function_data_fusion[code]=0
				return 0
		end
	else
		local count_fusion2=0
		if has("fusions25") then
			count_fusion2=count_fusion2+1
		end
		if has("fusions26") then
			count_fusion2=count_fusion2+1
		end
		if has("fusions29") then
			count_fusion2=count_fusion2+1
		end
		if has("fusions2a") then
			count_fusion2=count_fusion2+1
		end
		if has("fusions2b") then
			count_fusion2=count_fusion2+1
		end
		if has("fusions2f") then
			count_fusion2=count_fusion2+1
		end
		count_fusion3=math.ceil(count_fusion2/2)
		count_fusion4=math.floor(count_fusion2/2)
		count_fusion=count_fusion3-count_fusion4
		if ( count_fusion == 0 ) then
			info_fuzer=blueL:getActive()-count_fusion3
		else
			info_fuzer=blueS:getActive()-count_fusion4
		end
		if function_Cached("FusionsBlueLNumber")<blueL:getActive() and code=="blueL" then
				function_data_fusion[code]=1
				return 1
		elseif function_Cached("FusionsBlueSNumber")<blueS:getActive() and code=="blueS" then
				function_data_fusion[code]=1
				return 1
		elseif function_Cached("FusionsBlueWallNumber")<info_fuzer and code=="blueWall" then
				function_data_fusion[code]=1
				return 1
		else
				function_data_fusion[code]=0
				return 0
		end
	end
end
function FusionsGreenNumber(code)
	if function_data_fusion[code] ~= nil then
		-- If a cached value exists, return it
		return function_data_fusion[code]
	end
	if fusiongreencombined:getActive() then
		local count_fuzer=function_Cached("FusionsGreenCNumber")+function_Cached("FusionsGreenGNumber")+function_Cached("FusionsGreenPNumber")
		if count_fuzer < greenC:getActive() then
				function_data_fusion[code]=1
				return 1
		else
				function_data_fusion[code]=0
				return 0
		end
	else
		if function_Cached("FusionsGreenCNumber")<greenC:getActive() and code=="greenC" then
				function_data_fusion[code]=1
				return 1
		elseif function_Cached("FusionsGreenGNumber")<greenG:getActive() and code=="greenG" then
				function_data_fusion[code]=1
				return 1
		elseif function_Cached("FusionsGreenPNumber")<greenP:getActive() and code=="greenP" then
				function_data_fusion[code]=1
				return 1
		else
				function_data_fusion[code]=0
				return 0
		end
	end
end



function FusionsGold()

	if ( has("fusiongold_vanilla") or has("fusiongold_complet") ) then
		if( goldflag==false or goldflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			goldflag=true
		end
		return 1
	else
		if( goldflag==true or goldflag==nil ) then
			fusionredcombined:updateMax()
			fusiongreencombined:updateMax()
			goldflag=false
		end
		return 0
	end 
end
function CloudTopFallVisibility()

	if function_Cached("FusionsGold")==1 then
		return 1
	elseif function_Cached("OpenWindTribe") and function_Cached("StrangerFusion")==1  then
		return 1
	elseif has("cloudwindcrest_yes") then
		return 1
	elseif has("fallswindcrest_yes") then
		return 1
	else
		return 0
	end
end

function Sword1()
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword3") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword2") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword") > 0 then
		return 1
	elseif has("smithsword") then
		return 1
	else
		return 0
	end
end

function Sword2()
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword3") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword2") > 0 then
		return 1
	elseif has("greensword") then
		return 1
	else
		return 0
	end
end

function Sword3()
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword3") > 0 then
		return 1
	elseif has("redsword") then
		return 1
	else
		return 0
	end
end
function Sword4()
	if Tracker:ProviderCountForCode("sword5") > 0 and has("progressiveitems") then
		return 1
	elseif Tracker:ProviderCountForCode("sword4") > 0 then
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
	elseif function_Cached("Sword1")==1 and has("sword1needed") then
		return 1
	elseif function_Cached("Sword2")==1 and has("sword2needed") then
		return 1
	elseif function_Cached("Sword3")==1 and has("sword3needed") then
		return 1
	elseif function_Cached("Sword4")==1 and has("sword4needed") then
		return 1
	elseif function_Cached("Sword5")==1 and has("sword5needed") then
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

	if ( function_Cached("GotSwords")==1 and function_Cached("GotElements")==1 and function_Cached("GotDungeons")==1 and function_Cached("GotFigurine")==1 ) then
		return 1
	else
		return 0
	end
end

function HasSword()

	if ( function_Cached("Sword1")==1 or function_Cached("Sword2")==1 or function_Cached("Sword3")==1 or function_Cached("Sword4")==1 or function_Cached("Sword5")==1 ) then
		return 1
	else
		return 0
	end
end

function HasWhiteSword()

	if ( function_Cached("Sword2")==1 or function_Cached("Sword3")==1 or function_Cached("Sword4")==1 or function_Cached("Sword5")==1 ) then
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
	if ( function_Cached("Sword3")==1 and has("spinattack") ) then
		return 1
	else
		return 0
	end
end

function CanSplit3()
	if ( function_Cached("Sword4")==1 and has("spinattack") ) then
		return 1
	else
		return 0
	end
end

function CanSplit4()
	if ( function_Cached("Sword5")==1 and has("spinattack") ) then
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
	if ( function_Cached("HasSword")==1 and ( ( has("swordbeam") and function_Cached("HasBottle")==1 ) or has("perilbeam") ) ) then
		return 1
	elseif ( has("beam_out_on") and function_Cached("HasSword")==1 and has("swordbeam")  ) then
		return 2
	else
		return 0
	end
end
function CanDownThrust()

	if ( function_Cached("HasSword")==1 and has("downthrust") and has("cape") ) then
		return 1
	else
		return 0
	end
end


function HasDamageSource()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponsbow_yes") and function_Cached("HasBow")==1 ) then
		return 1
	elseif ( has("damage_source_out_on") and has("bombs") ) then
		return 2
	elseif ( has("damage_source_out_on") and function_Cached("HasBow")==1 ) then
		return 2
	else
		return 0
	end
end

function HasMadderDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		return 1
	elseif ( has("damage_source_out_on") and has("bombs") ) then
		return 2
	else
		return 0
	end
end

function HasChuDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		return 1
	elseif ( has("damage_source_out_on") and has("bombs") ) then
		return 2
	else
		return 0
	end
end

function HasHelmasaurDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponsgust_yes") and has("gust") ) then
		return 1
	elseif ( has("weaponsbow_yes") and function_Cached("HasBow")==1 ) then
		return 1
	elseif ( has("damage_source_out_on") and has("bombs") ) then
		return 2
	elseif ( has("damage_source_out_on") and has("gust") ) then
		return 2
	elseif ( has("damage_source_out_on") and function_Cached("HasBow")==1 ) then
		return 2
	else
		return 0
	end
end

function HasGleerokDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbow_boss") and function_Cached("HasBow")==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		return 1
	elseif ( has("damage_source_out_on") and function_Cached("HasBow")==1 ) then
		return 2
	elseif ( has("damage_source_out_on") and has("bombs30") ) then
		return 2
	else
		return 0
	end
end

function HasWizrobeDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbow_yes") and function_Cached("HasBow")==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponslamp_yes") and has("lamp") ) then
		return 1
	elseif ( has("damage_source_out_on") and function_Cached("HasBow")==1 ) then
		return 2
	elseif ( has("damage_source_out_on") and has("bombs") ) then
		return 2
	elseif ( has("damage_source_out_on") and has("lamp") ) then
		return 2
	else
		return 0
	end
end

function HasDarknutDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs") ) then
		return 1
	elseif ( has("damage_source_out_on") and has("bombs") ) then
		return 2
	else
		return 0
	end
end

function HasMazaalDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbow_boss") and function_Cached("HasBow")==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		return 1
	elseif ( has("damage_source_out_on") and function_Cached("HasBow")==1 ) then
		return 2
	elseif ( has("damage_source_out_on") and has("bombs30") ) then
		return 2
	else
		return 0
	end
end

function HasScissorDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbombs_boss") and has("bombs30") ) then
		return 1
	elseif ( has("damage_source_out_on") and has("bombs30") ) then
		return 2
	else
		return 0
	end
end

function HasGhiniDamage()

	if ( function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("weaponsbombs_yes") and has("bombs") ) then
		return 1
	elseif ( has("weaponsgust_yes") and has("gust") ) then
		return 1
	elseif ( has("weaponsbow_yes") and function_Cached("HasBow")==1 ) then
		return 1
	elseif ( has("damage_source_out_on") and has("bombs") ) then
		return 2
	elseif ( has("damage_source_out_on") and has("gust") ) then
		return 2
	elseif ( has("damage_source_out_on") and function_Cached("HasBow")==1 ) then
		return 2
	else
		return 0
	end
end

function ShopBack()

	if ( function_Cached("TownDog")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	else
		return 0
	end
end

function SchoolHP()
	if ( has("cane") and function_Cached("CanSplit4")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("cane") and has("gust") ) then
		return 1
	elseif ( has("cane") ) then
		return 3
	else
		return 0
	end
end

function MusicHouseHP()
	if ( function_Cached("MusicHouse")==1 ) then
		return 1
	elseif( ( has("grabbable_easy") or has("grabbable_hard") ) and ( function_Cached("HasBoomerang")==1 or has("gust") ) ) then
		return 1
	else
		return 3
	end
end

function FountainHP()
	if ( has("cape") ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( has("gust") or ( function_Cached("HasBoomerang")==1 and ( function_Cached("LightArrowBreak")==1 or has("cane") ) ) ) ) then
		return 1
	elseif ( has("grabbable_hard") and function_Cached("HasMagicBoomerang")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( has("gust") or ( function_Cached("HasBoomerang")==1 and ( function_Cached("LightArrowBreak")==2 or has("cane") ) ) ) ) then
		return 2
	else
		return 0
	end
end

function LowerFallsItems()
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") and ( has("flippers") or has("cape") ) ) then
		return 1
	elseif ( has("grabbable_easy") and function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and has ("gust") ) then
		return 1
	elseif ( has("grabbable_easy") and function_Cached("AccessFalls")==1 and has("grip") and has ("gust") ) then
		return 1
	elseif ( has("grabbable_hard") and function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and ( function_Cached("HasMagicBoomerang")==1 or has ("gust") ) ) then
		return 1
	elseif ( has("grabbable_hard") and function_Cached("AccessFalls")==1 and has("grip") and ( function_Cached("HasMagicBoomerang")==1 or has ("gust") ) ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") and ( has("flippers") or has("cape") ) ) then
		return 2
	elseif ( has("grabbable_easy") and function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==1 or function_Cached("FallsFusion")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 )and has ("gust") ) then
		return 2
	elseif ( has("grabbable_easy") and function_Cached("AccessFalls")==2 and has("grip") and has ("gust") ) then
		return 2
	elseif ( has("grabbable_hard") and function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==1 or function_Cached("FallsFusion")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 )and ( function_Cached("HasMagicBoomerang")==1 or has ("gust") ) ) then
		return 2
	elseif ( has("grabbable_hard") and function_Cached("AccessFalls")==1 and has("grip") and ( function_Cached("HasMagicBoomerang")==1 or has ("gust") ) ) then
		return 2
	else
		return 0
	end
end

function LakeIslandHP()
	if ( has("cape") ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("HasMagicBoomerang")==1 ) then
		return 1
	else
		return 0
	end
end


function LakeSouthHP()
	if ( function_Cached("AccessLonLon")==1 and function_Cached("CapeExtension")==1 ) then
		return 1
	elseif ( function_Cached("AccessSouthLake")==1 and ( has("cape") or has("flippers") ) ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessLonLon")==1 and function_Cached("LakeShortcut")==1 and function_Cached("HasMagicBoomerang")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessSouthLake")==1 and ( has("gust") or function_Cached("HasMagicBoomerang")==1 ) ) then
		return 1
	elseif ( ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) then
		return 2
	elseif ( function_Cached("AccessSouthLake")==2 and ( has("cape") or has("flippers") ) ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessLonLon")==2 and function_Cached("LakeShortcut")==1 and function_Cached("HasMagicBoomerang")==1 ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessSouthLake")==2 and ( has("gust") or function_Cached("HasMagicBoomerang")==1 ) ) then
		return 2
	elseif ( ( function_Cached("AccessSouthLake")==1 or function_Cached("AccessSouthLake")==2 ) ) then
		return 3
	else
		return 0
	end
end


function MinishNorthHP()
	if ( function_Cached("AccessNorthMinish")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessMinishWoods")==1 and ( has("gust") or function_Cached("HasMagicBoomerang")==1 ) ) then
		return 1
	elseif ( has("grabbable_hard") and function_Cached("HasBoomerang")==1 ) then
		return 1
	elseif ( function_Cached("AccessNorthMinish")==2 ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessMinishWoods")==2 and ( has("gust") or function_Cached("HasMagicBoomerang")==1 ) ) then
		return 2
	elseif( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) then
		return 3
	else
		return 0
	end
end


function MinishSouthHP()
	if ( function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessBelari")==1 and has("gust") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessBelari")==2 and has("gust") ) then
		return 2
	else
		return 0
	end
end


function CrenelWaterCaveHP()
	if ( has("bombs") or has("cape") or has("flippers") ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") or function_Cached("HasMagicBoomerang")==1 ) then
		return 1
	elseif ( has("grabbable_hard") and function_Cached("HasBoomerang")==1 ) then
		return 1
	else
		return 0
	end
end


function LeftGraveHP()
	if ( function_Cached("CanSplit4")==1 or function_Cached("CanSplit3")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	elseif ( has("grabbable_hard") and function_Cached("HasBoomerang")==1 ) then
		return 1
	else
		return 0
	end
end


function FallsHP()
	if ( function_Cached("OverworldBlocks")==1 and function_Cached("CapeExtension")==1 ) then
		return 1
	elseif ( function_Cached("AccessFalls")==1 and has("grip") and ( has("flippers") or ( function_Cached("DarkRooms")==1 and function_Cached("CapeExtension")==1 ) ) ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("OverworldBlocks")==1 and ( has("gust") or function_Cached("HasMagicBoomerang")==1 ) ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("AccessFalls")==1 and has("grip") and ( function_Cached("DarkRooms")==1 and ( has("gust") or function_Cached("HasMagicBoomerang")==1 ) ) ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) then
		return 2
	elseif ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2 ) and has("grip") and ( has("flippers") or ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) ) ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2 ) and has("grip") and ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( has("gust") or function_Cached("HasMagicBoomerang")==1 ) ) ) then
		return 2
	elseif ( function_Cached("OverworldBlocks")==1 ) then
		return 3
	else
		return 0
	end
end


function DeepwoodMadderHP()
	if ( function_Cached("DeepwoodPreMadderpillar")==1 and function_Cached("DeepwoodMadderpillarDoor")==1 and function_Cached("DeepwoodWeb")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( ( function_Cached("DeepwoodPreMadderpillar")==1 and function_Cached("DeepwoodMadderpillarDoor")==1 and function_Cached("DeepwoodWeb")==1 ) or has("gust") and ( function_Cached("Deepwood1stDoor")==1 or function_Cached("DeepwoodPreMadderpillar")==1 ) ) ) then
		return 1
	elseif ( ( function_Cached("DeepwoodPreMadderpillar")==1 or function_Cached("DeepwoodPreMadderpillar")==2 ) and ( function_Cached("DeepwoodMadderpillarDoor")==1 or function_Cached("DeepwoodMadderpillarDoor")==2 ) and function_Cached("DeepwoodWeb")==1 ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( ( ( function_Cached("DeepwoodPreMadderpillar")==1 or function_Cached("DeepwoodPreMadderpillar")==2 ) and ( function_Cached("DeepwoodMadderpillarDoor")==1 or function_Cached("DeepwoodMadderpillarDoor")==2 ) and function_Cached("DeepwoodWeb")==1 ) or has("gust") and ( function_Cached("Deepwood1stDoor")==1 or ( function_Cached("DeepwoodPreMadderpillar")==1 or function_Cached("DeepwoodPreMadderpillar")==2 ) ) ) ) then
		return 2
	else
		return 0
	end
end


function CoFRupees()
	if ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 ) and function_Cached("CoFSpikeBeetle")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	elseif ( ( function_Cached("BombWalls")==1 or function_Cached("Bobombs")==1 or function_Cached("Bobombs")==2 ) and ( function_Cached("CoFSpikeBeetle")==1 or function_Cached("CoFSpikeBeetle")==2 ) ) then
		return 2
	else
		return 0
	end
end


function FoWLeftRupee()
	if ( function_Cached("FoWEyeSwitch")==1 and function_Cached("FoWStalfosFight")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	elseif ( function_Cached("FoWEyeSwitch")==1 and function_Cached("FoWStalfosFight")==2 ) then
		return 2
	else
		return 0
	end
end


function FoWEntranceRupee()
	if ( has("mitts") ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	else
		return 0
	end
end


function FoWHP()
	if ( function_Cached("FoWCloneSwitch")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and has("gust") ) then
		return 1
	else
		return 0
	end
end

function ToDRightRupees()
	if ( function_Cached("ToD2ndRupeePath")==1 ) then
		return 1
	elseif ( has("grabbable_hard") and has("gust") and function_Cached("ToDLilypadEnd")==1 ) then
		return 1
	elseif ( function_Cached("ToD2ndRupeePath")==2 ) then
		return 2
	elseif ( has("grabbable_hard") and has("gust") and function_Cached("ToDLilypadEnd")==2 ) then
		return 2
	else
		return 0
	end
end


function PoWRupees()
	if ( function_Cached("PoWJump")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and function_Cached("HasMagicBoomerang")==1 ) then
		return 1
	elseif ( function_Cached("PoWJump")==2 ) then
		return 2
	else
		return 0
	end
end


function PoWDrop()
	if ( has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and has("cane") and function_Cached("PoWPotPuzzle")==1 ) then
		return 1
	elseif ( has("grabbable_easy") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoWBlueWarp")==1 ) and function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("HasBoomerang")==1 and ( function_Cached("LightArrowBreak")==1 or has("cane") ) ) ) then
		return 1
	elseif ( has("grabbable_easy") and function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 and ( has("gust") or ( function_Cached("HasBoomerang")==1 and ( function_Cached("LightArrowBreak")==1 or has("cane") ) ) ) ) then
		return 1
	elseif ( has("grabbable_hard") and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoWBlueWarp")==1 ) and function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("HasBoomerang")==1 ) then
		return 1
	elseif ( has("grabbable_hard") and function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 and ( has("gust") or function_Cached("HasBoomerang")==1 ) ) then
		return 1
	elseif ( has("cape") and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and has("cane") and ( function_Cached("PoWPotPuzzle")==1 or function_Cached("PoWPotPuzzle")==2 ) ) then
		return 2
	elseif ( has("grabbable_easy") and ( ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) or function_Cached("PoWBlueWarp")==1 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("HasBoomerang")==1 and ( function_Cached("LightArrowBreak")==1 or function_Cached("LightArrowBreak")==2 or has("cane") ) ) ) then
		return 2
	elseif ( has("grabbable_easy") and function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 and ( has("gust") or ( function_Cached("HasBoomerang")==1 and ( function_Cached("LightArrowBreak")==2 or has("cane") ) ) ) ) then
		return 2
	elseif ( has("grabbable_hard") and ( ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) or function_Cached("PoWBlueWarp")==1 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("HasBoomerang")==1 ) then
		return 2
	else
		return 0
	end
end


function PoWHP()
	if ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and function_Cached("PoWHandRoom")==1 and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoWBlueWarp")==1 ) ) then
		return 1
	elseif ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 ) then
		return 1
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("PoWJump")==1 and function_Cached("PoW1stDoor")==1 and ( has("gust") or function_Cached("HasBoomerang")==1 ) ) then
		return 1
	elseif ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoWHandRoom")==1 or function_Cached("PoWHandRoom")==2 ) and ( ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) or function_Cached("PoWBlueWarp")==1 ) ) then
		return 2
	elseif ( ( has("grabbable_easy") or has("grabbable_hard") ) and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and ( function_Cached("PoWJump")==1 or function_Cached("PoWJump")==2 ) and ( function_Cached("PoW1stDoor")==1 or function_Cached("PoW1stDoor")==2 ) and ( has("gust") or function_Cached("HasBoomerang")==1 ) ) then
		return 2
	else
		return 0
	end
end

function GuardSkip()

	if ( has("guardskip_on") and has("boots") ) then
		return 1
	elseif ( has("guardskip_out_on") and has("boots") ) then
		return 2
	else
		return 0
	end
end

function LikeLike()

	if ( has("likelike_on") ) then
		return 1
	elseif ( has("likelike_off") and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( has("likelike_out_on") ) then
		return 2
	else
		return 0
	end
end
function BlowDust()

	if ( has("blowdust_on") and ( has("bombs") or has("gust") ) ) then
		return 1
	elseif ( has("blowdust_off") and has("gust") ) then
		return 1
	elseif ( has("blowdust_out_on") and has("bombs") ) then
		return 2
	else
		return 0
	end
end
function CrenelMushroom()

	if ( has("crenelmushroom_on") and ( has("bombs") or has("gust") ) ) then
		return 1
	elseif ( has("crenelmushroom_off") and ( has("bombs") ) ) then
		return 1
	elseif ( has("crenelmushroom_out_on") and has("gust") ) then
		return 2
	else
		return 0
	end
end
function LightArrowBreak()

	if ( has("lightarrowbreak_on") and has("lights") ) then
		return 1
	elseif ( has("lightarrowbreak_out_on") and has("lights") ) then
		return 2
	else
		return 0
	end
end
function Bobombs()

	if ( has("bobombs_on") and ( function_Cached("HasSword")==1 or has("gust") or has("bombs") ) ) then
		return 1
	elseif ( has("bobombs_out_on") and ( function_Cached("HasSword")==1 or has("gust") or has("bombs") ) ) then
		return 2
	else
		return 0
	end
end
function CrenelBeam()

	if ( has("crenelbeam_on") and function_Cached("HasBeam")==1 ) then
		return 1
	elseif has("crenelbeam_out_on") and ( function_Cached("HasBeam")==1 or function_Cached("HasBeam")==2 ) then
		return 2
	else
		return 0
	end
end
function DownThrustBeetle()

	if ( has("downstrikebeetle_on") and function_Cached("CanDownThrust")==1 ) then
		return 1
	elseif ( has("downstrikebeetle_out_on") and function_Cached("CanDownThrust")==1 ) then
		return 2
	else
		return 0
	end 
end
function CapeExtension()

	if ( has("capeextension_on") and ( has("flippers") or has("cape") ) ) then
		return 1
	elseif ( has("capeextension_off") and has("flippers") ) then
		return 1
	elseif ( has("capeextension_out_on") and has("cape") ) then
		return 2
	else
		return 0
	end 
end
function DarkRooms()
	if ( has("darkrooms_on") ) then
		return 1
	elseif ( has("darkrooms_off") and has("lamp") ) then
		return 1
	elseif ( has("darkrooms_out_on") ) then
		return 2
	else
		return 0
	end 
end
function LakeMinish()

	if ( has("lakeminish_on") and function_Cached("Hylia_CrackFusion_LibrariNPC")==1 ) then
		return 1
	elseif ( has("lakeminish_out_on") and function_Cached("Hylia_CrackFusion_LibrariNPC")==1 ) then
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
	elseif ( has("cabinswim_out_on") and has("flippers") ) then
		return 2
	else
		return 0
	end 
end
function CloudsKill()

	if ( has("cloudskill_on") ) then
		return 1
	elseif ( function_Cached("HasDamageSource")==1 ) then
		return 1
	elseif ( has("cloudskill_out_on") and function_Cached("HasDamageSource")==2 ) then
		return 2
	elseif ( has("cloudskill_out_on") ) then
		return 2
	else
		return 0
	end 
end
function FoWPot()

	if ( has("fowpot_on") and has("gust") ) then
		return 1
	elseif ( has("fowpot_out_on") and has("gust") ) then
		return 2
	else
		return 0
	end 
end
function PoWJump()

	if ( has("powjump_on") and has("cape") ) then
		return 1
	elseif ( has("cane") ) then
		return 1
	elseif ( has("powjump_out_on") and has("cape") ) then
		return 2
	else
		return 0
	end 
end
function PoWPotPuzzleOOL()

	if ( has("powpotpuzzleool_on") and ( ( function_Cached("HasSword")==1 or function_Cached("HasBoomerang")==1 or has("bombs") or function_Cached("HasBow")==1 ) and ( ( function_Cached("DarkRooms")==1 and ( ( function_Cached("PoW2ndHalf1stDoor")==1 and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoWBlueWarp")==1 ) ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 ) ) ) ) then
		return 1
	elseif ( has("powpotpuzzleool_out_on") and ( ( function_Cached("HasSword")==1 or function_Cached("HasBoomerang")==1 or has("bombs") or function_Cached("HasBow")==1 ) and ( ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) or function_Cached("PoWBlueWarp")==1 ) ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 ) ) ) ) then
		return 2
	elseif ( has("powpotpuzzleool_out_on") and ( ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( ( ( function_Cached("PoW2ndHalf1stDoor")==1 or function_Cached("PoW2ndHalf1stDoor")==2 ) and has("cape") ) or function_Cached("PoWShortcuts")==1 ) and ( function_Cached("PoW2ndHalf")==1 or function_Cached("PoW2ndHalf")==2 ) ) or ( function_Cached("PoWRedWarp")==1 and function_Cached("OverworldBlocks")==1 )) then
		return 2
	else
		return 0
	end 
end
function DHCCanonHit()

	if ( has("dhccanonhit_on") and has("bombs") and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( function_Cached("CanSplit4")==1 ) then
		return 1
	elseif ( has("dhccanonhit_out_on") and has("bombs") and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end
function DHCBladePuzzleShuffle()

	if ( has("dhcbladepuzzleshuffle_on") and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 ) ) then
		return 1
	elseif ( function_Cached("CanSplit4")==1 ) then
		return 1
	elseif (  has("dhcbladepuzzleshuffle_out_on") and has("dhcbladepuzzleshuffle_off") and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function DHCSwitchHit()

	if ( has("dhcswitchhit_on") and function_Cached("HasSword")==1 and function_Cached("HasSpin")==1 ) then
		return 1
	elseif ( function_Cached("CanSplit4")==1 ) then
		return 1
	elseif ( has("dhcswitchhit_out_on") and  function_Cached("HasSword")==1 and function_Cached("HasSpin")==1 ) then
		return 2
	else
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
		return function_Cached("AccessCrypt")
	elseif ( has("crypt_dws") ) then
		return function_Cached("AccessDeepwood")
	elseif ( has("crypt_cof") ) then
		return function_Cached("AccessCoF")
	elseif ( has("crypt_fow") ) then
		return function_Cached("AccessFortress")
	elseif ( has("crypt_tod") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("crypt_crypt") ) then
		return function_Cached("AccessCrypt")
	elseif ( has("crypt_pow") ) then
		return function_Cached("AccessPalace")
	elseif ( has("crypt_dhc") ) then
		return 1
	else
		return 0
	end
end
function DeepwoodDungeons()
	if ( has("dungeonser_off") ) then
		return function_Cached("AccessDeepwood")
	elseif ( has("dws_dws") ) then
		return function_Cached("AccessDeepwood")
	elseif ( has("dws_cof") ) then
		return function_Cached("AccessCoF")
	elseif ( has("dws_fow") ) then
		return function_Cached("AccessFortress")
	elseif ( has("dws_tod") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("dws_crypt") ) then
		return function_Cached("AccessCrypt")
	elseif ( has("dws_pow") ) then
		return function_Cached("AccessPalace")
	elseif ( has("dws_dhc") ) then
		return 1
	else
		return 0
	end
end
function CofDungeons()
	if ( has("dungeonser_off") ) then
		return function_Cached("AccessCoF")
	elseif ( has("cof_dws") ) then
		return function_Cached("AccessDeepwood")
	elseif ( has("cof_cof") ) then
		return function_Cached("AccessCoF")
	elseif ( has("cof_fow") ) then
		return function_Cached("AccessFortress")
	elseif ( has("cof_tod") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("cof_crypt") ) then
		return function_Cached("AccessCrypt")
	elseif ( has("cof_pow") ) then
		return function_Cached("AccessPalace")
	elseif ( has("cof_dhc") ) then
		return 1
	else
		return 0
	end
end
function FowDungeons()
	if ( has("dungeonser_off") ) then
		return function_Cached("AccessFortress")
	elseif ( has("fow_dws") ) then
		return function_Cached("AccessDeepwood")
	elseif ( has("fow_cof") ) then
		return function_Cached("AccessCoF")
	elseif ( has("fow_fow") ) then
		return function_Cached("AccessFortress")
	elseif ( has("fow_tod") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("fow_crypt") ) then
		return function_Cached("AccessCrypt")
	elseif ( has("fow_pow") ) then
		return function_Cached("AccessPalace")
	elseif ( has("fow_dhc") ) then
		return 1
	else
		return 0
	end
end
function TodDungeons()
	if ( has("dungeonser_off") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("tod_dws") ) then
		return function_Cached("AccessDeepwood")
	elseif ( has("tod_cof") ) then
		return function_Cached("AccessCoF")
	elseif ( has("tod_fow") ) then
		return function_Cached("AccessFortress")
	elseif ( has("tod_tod") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("tod_crypt") ) then
		return function_Cached("AccessCrypt")
	elseif ( has("tod_pow") ) then
		return function_Cached("AccessPalace")
	elseif ( has("tod_dhc") ) then
		return 1
	else
		return 0
	end
end
function PowDungeons()
	if ( has("dungeonser_off") ) then
		return function_Cached("AccessPalace")
	elseif ( has("pow_dws") ) then
		return function_Cached("AccessDeepwood")
	elseif ( has("pow_cof") ) then
		return function_Cached("AccessCoF")
	elseif ( has("pow_fow") ) then
		return function_Cached("AccessFortress")
	elseif ( has("pow_tod") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("pow_crypt") ) then
		return function_Cached("AccessCrypt")
	elseif ( has("pow_pow") ) then
		return function_Cached("AccessPalace")
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
		return function_Cached("AccessDeepwood")
	elseif ( has("dhc_cof") ) then
		return function_Cached("AccessCoF")
	elseif ( has("dhc_fow") ) then
		return function_Cached("AccessFortress")
	elseif ( has("dhc_tod") ) then
		return function_Cached("AccessDroplets")
	elseif ( has("dhc_crypt") ) then
		return function_Cached("AccessCrypt")
	elseif ( has("dhc_pow") ) then
		return function_Cached("AccessPalace")
	elseif ( has("dhc_dhc") ) then
		return 1
	else
		return 0
	end
end