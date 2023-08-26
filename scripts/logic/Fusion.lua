function Castle_Dojo_Fuzer() 
	if ( FusionsRedNumber("redE")==1 ) then
		return 1
	elseif ( FusionsRedNumber("redE")==2 ) then
		return 2
	else
		return 0
	end 
end

function Castle_MinishCrack_Fuzer() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("BonkedTrees")==1 ) then
		return 1
	elseif ( FusionsGreenNumber("greenG")==2 and function_Cached("BonkedTrees")==1 ) then
		return 2
	else
		return 0
	end 
end

function Clouds_WindTribeHouse_Fuzer1() 
	if ( FusionsGreenNumber("greenG")==1 and ( function_Cached("AccessWindTribe")==1 or function_Cached("StrangerFusion")==1 ) ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 )  and ( function_Cached("AccessWindTribe")==1 or function_Cached("AccessWindTribe")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_WindTribeHouse_Fuzer2() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("Clouds_WindTribeHouse_Fuzer1")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 )  and ( function_Cached("Clouds_WindTribeHouse_Fuzer1")==1 or function_Cached("Clouds_WindTribeHouse_Fuzer1")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_WindTribeHouse_Fuzer3() 
	if ( FusionsGreenNumber("greenP")==1 and ( function_Cached("AccessWindTribe")==1 or function_Cached("StrangerFusion")==1 ) ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 )  and ( function_Cached("AccessWindTribe")==1 or function_Cached("AccessWindTribe")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_WindTribeHouse_Fuzer4() 
	if ( FusionsRedNumber("redV")==1 and function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redV")==1 or FusionsRedNumber("redV")==2 )  and ( function_Cached("AccessWindTribe")==1 or function_Cached("AccessWindTribe")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_WindTribeHouse_Fuzer5() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 )  and ( function_Cached("AccessWindTribe")==1 or function_Cached("AccessWindTribe")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_WindTribeHouse_Fuzer6() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 )  and ( function_Cached("AccessWindTribe")==1 or function_Cached("AccessWindTribe")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_WindTribeHouse_Fuzer7() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("AccessWindTribe")==1 and function_Cached("Clouds_WindTribeHouse_Fuzer6")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 )  and ( function_Cached("AccessWindTribe")==1 or function_Cached("AccessWindTribe")==2 ) and (function_Cached("Clouds_WindTribeHouse_Fuzer6")==1 or function_Cached("Clouds_WindTribeHouse_Fuzer6")==2) ) then
		return 2
	else
		return 0
	end 
end
function Clouds_Fuzer()
	item1=Tracker:FindObjectForCode("@Wind Tribe House/2F Gregal's Gift")
	item2=Tracker:FindObjectForCode("@Wind Tribe House/3F Chests")
	item3=Tracker:FindObjectForCode("@Wind Tribe House/4F Chests")
	local count = 0
	if item1.AvailableChestCount~=1 then
		count = count + 1
	end
	if item2.AvailableChestCount~=3 then
		count = count + 1
	end
	if item3.AvailableChestCount~=2 then
		count = count + 1
	end
	if function_Cached("StrangerFusion")==0 then
		item4=Tracker:FindObjectForCode("@Wind Tribe House/1F Chests")
		item5=Tracker:FindObjectForCode("@Wind Tribe House/2F Chest")
		item6=Tracker:FindObjectForCode("@Wind Tribe House/2F Save Gregal")
		if item4.AvailableChestCount~=2 then
			count = count + 1
		end
		if item5.AvailableChestCount~=1 then
			count = count + 1
		end
		if item6.AvailableChestCount~=1 then
			count = count + 1
		end
	end
	
	return count
end
function Clouds_Fuzer_Fuzer1()

	-- print(count)
	if ( FusionsRedNumber("redV")==1 and function_Cached("AccessClouds")==1 and function_Cached("Clouds_Fuzer")==0 ) then
		return 1
	elseif ( ( FusionsRedNumber("redV")==1 or FusionsRedNumber("redV")==2 ) and ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 )  and function_Cached("Clouds_Fuzer")==0 ) then
		return 2
	else
		return 0
	end 
end

function Clouds_Fuzer_Fuzer2() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("AccessClouds")==1 and function_Cached("Clouds_Fuzer")==0 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 ) and ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 )  and function_Cached("Clouds_Fuzer")==0 ) then
		return 2
	else
		return 0
	end 
end


function Crenel_Mines_Fuzer1() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("AccessMelari")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 ) and ( function_Cached("AccessMelari")==1 or function_Cached("AccessMelari")==2) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Mines_Fuzer2() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("AccessMelari")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 ) and ( function_Cached("AccessMelari")==1 or function_Cached("AccessMelari")==2) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Mines_Fuzer3() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("CompleteCoF")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("CompleteCoF")==1 or function_Cached("CompleteCoF")==2) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Mines_Fuzer4() 
	if ( FusionsRedNumber("redV")==1 and function_Cached("CompleteCoF")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redV")==1 or FusionsRedNumber("redV")==2 ) and ( function_Cached("CompleteCoF")==1 or function_Cached("CompleteCoF")==2) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Mines_Fuzer5() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("AccessMelari")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("AccessMelari")==1 or function_Cached("AccessMelari")==2) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_DiggingCave_Fuzer() 
	if ( FusionsBlueNumber("blueWall")==1 and function_Cached("Crenel_DigCave_HP")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueWall")==1 or FusionsBlueNumber("blueWall")==2 ) and ( function_Cached("Crenel_DigCave_HP")==1 or function_Cached("Crenel_DigCave_HP")==2) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Dojo_Fuzer() 
	if ( FusionsRedNumber("redW")==1 and function_Cached("Crenel_Dojo_HP")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redW")==1 or FusionsRedNumber("redW")==2 ) and ( function_Cached("Crenel_Dojo_HP")==1 or function_Cached("Crenel_Dojo_HP")==2) ) then
		return 2
	else
		return 0
	end 
end

function CrenelBase_MinishCrack_Fuzer() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("CrenelBase_MinishCrack_Chest")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 ) and ( function_Cached("CrenelBase_MinishCrack_Chest")==1 or function_Cached("CrenelBase_MinishCrack_Chest")==2) ) then
		return 2
	else
		return 0
	end 
end

function Hills_MittsCave_Fuzer() 
	if ( FusionsBlueNumber("blueWall")==1 and function_Cached("AccessMinishWoods")==1 and has("mitts") ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueWall")==1 or FusionsBlueNumber("blueWall")==2 ) and ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Hills_MinishHouse_Fuzer() 
	if ( FusionsBlueNumber("blueS")==1 and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueS")==1 or FusionsBlueNumber("blueS")==2 ) and ( function_Cached("AccessEasternHills")==1 or function_Cached("AccessEasternHills")==2) ) then
		return 2
	else
		return 0
	end 
end

function Hills_Farmer_Fuzer1() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 ) and ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2) ) then
		return 2
	else
		return 0
	end 
end

function Hills_Farmer_Fuzer2() 
	if ( FusionsBlueNumber("blueWall")==1 and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueWall")==1 or FusionsBlueNumber("blueWall")==2 ) and ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_Dojo_Fuzer() 
	if ( FusionsRedNumber("redV")==1 and function_Cached("Hylia_Dojo_HP")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redV")==1 or FusionsRedNumber("redV")==2 ) and ( function_Cached("Hylia_Dojo_HP")==1 or function_Cached("Hylia_Dojo_HP")==2) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_TreasureCave_Fuzer() 
	if ( FusionsBlueNumber("blueWall")==1 and function_Cached("Hylia_CapeCave_Chest")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueWall")==1 or FusionsBlueNumber("blueWall")==2 ) and ( function_Cached("Hylia_CapeCave_Chest")==1 or function_Cached("Hylia_CapeCave_Chest")==2) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_Fifi_Fuzer() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("AccessLonLon")==1 and has("cane") ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 ) and ( function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2 ) and has("cane")) then
		return 2
	else
		return 0
	end 
end

function Hylia_Librari_Fuzer() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("Hylia_CrackFusion_LibrariNPC")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 ) and ( function_Cached("Hylia_CrackFusion_LibrariNPC")==1 or function_Cached("Hylia_CrackFusion_LibrariNPC")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Hylia_MinishHouseWindCrest_Fuzer() 
	if ( FusionsRedNumber("redW")==1 and has("ocarina") ) then
		return 1
	elseif ( FusionsRedNumber("redW")==2 and has("ocarina") ) then
		return 1
	else
		return 0
	end 
end


function Hylia_DavidJr_Fuzer1() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("AccessLonLon")==1 and ( has("cane") and function_Cached("AccessEasternHills")==1  or has("open_tingle_yes") ) ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 ) and ( function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2 ) and ( has("cane") and ( function_Cached("AccessEasternHills")==1 or function_Cached("AccessEasternHills")==2 ) or has("open_tingle_yes") ) ) then
		return 2
	else
		return 0
	end 
end


function Hylia_DavidJr_Fuzer2() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("AccessLonLon")==1 and ( has("cane") and function_Cached("AccessEasternHills")==1 or has("open_tingle_yes") ) and function_Cached("HasMagicBoomerang")==1 and function_Cached("Hylia_DavidJr_Fuzer1")==1) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 ) and ( function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2) and ( has("cane") and ( function_Cached("AccessEasternHills")==1 or function_Cached("AccessEasternHills")==2 ) or has("open_tingle_yes") ) and function_Cached("HasMagicBoomerang")==1 and ( function_Cached("Hylia_DavidJr_Fuzer1")==1 or function_Cached("Hylia_DavidJr_Fuzer1")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Hylia_MinishCrack_Fuzer() 
	if ( FusionsBlueNumber("blueL")==1 and function_Cached("Hylia_NorthMinishHole_Chest")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueL")==1 or FusionsBlueNumber("blueL")==2 ) and ( function_Cached("Hylia_NorthMinishHole_Chest")==1 or function_Cached("Hylia_CrackFusion_LibrariNPC")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function LonLon_GoronQuest_Fuzer1() 
	if ( FusionsBlueNumber("blueS")==1 and function_Cached("GoronCave")==1 and ( function_Cached("CanDestroyTrees")==1 or has("ocarina") ) ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueS")==1 or FusionsBlueNumber("blueS")==2 ) and ( function_Cached("GoronCave")==1 or function_Cached("GoronCave")==2 ) and ( ( function_Cached("CanDestroyTrees")==1 or function_Cached("CanDestroyTrees")==2 ) or has("ocarina") ) ) then
		return 2
	else
		return 0
	end 
end


function LonLon_GoronQuest_Fuzer2() 
	if( FusionsRedNumber("redW")==1 and function_Cached("LonLon_GoronCaveFusion_BigChest")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redW")==1 or FusionsRedNumber("redW")==2 ) and ( function_Cached("LonLon_GoronCaveFusion_BigChest")==1 or function_Cached("LonLon_GoronCaveFusion_BigChest")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function LonLon_Ankle_Fuzer() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("LonLon_Cave_Chest")==1 and ( has("cane") and function_Cached("AccessEasternHills")==1 or has("open_tingle_yes") ) ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("LonLon_Cave_Chest")==1 or  function_Cached("LonLon_Cave_Chest")==2 ) and ( has("cane") and ( function_Cached("AccessEasternHills")==1 or function_Cached("AccessEasternHills")==2 ) or has("open_tingle_yes") ) ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_MittCave_Fuzer() 
	if ( FusionsBlueNumber("blueWall")==1 and function_Cached("WitchDiggingCave_Chest")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueWall")==1 or FusionsBlueNumber("blueWall")==2 ) and ( function_Cached("WitchDiggingCave_Chest")==1 or function_Cached("WitchDiggingCave_Chest")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_MinishVillage_Fuzer1()
	if ( FusionsRedNumber("redE")==1 and has("flippers") and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redE")==1 or FusionsRedNumber("redE")==2 ) and ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and has("flippers") ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_MinishVillage_Fuzer2()
	if ( FusionsRedNumber("redW")==1 and function_Cached("AccessMinishWoods")==1 and has("flippers") and function_Cached("MinishWoods_MinishVillage_Fuzer1")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redW")==1 or FusionsRedNumber("redW")==2 ) and ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and has("flippers") and ( function_Cached("MinishWoods_MinishVillage_Fuzer1")==1 or function_Cached("MinishWoods_MinishVillage_Fuzer1")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_MinishVillage_Fuzer3() 
	if ( FusionsRedNumber("redE")==1 and function_Cached("MinishVillage_HP")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redE")==1 or FusionsRedNumber("redE")==2 ) and ( function_Cached("MinishVillage_HP")==1 or function_Cached("MinishVillage_HP")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_Belari_Fuzer() 
	if ( FusionsRedNumber("redW")==1 and function_Cached("MinishWoods_BombMinish_NPC1")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redW")==1 or FusionsRedNumber("redW")==2 ) and ( function_Cached("MinishWoods_BombMinish_NPC1")==1 or function_Cached("MinishWoods_BombMinish_NPC1")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_Scrub_Fuzer1() 
	if ( FusionsGreenNumber("greenC")==1  and function_Cached("AccessMinishWoods")==1 and function_Cached("Scrubs")==1 and has("fusions27") ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and function_Cached("Scrubs")==1 and has("fusions27") ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_Scrub_Fuzer2()
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("AccessMinishWoods")==1 and function_Cached("Scrubs")==1 and has("fusions27") and function_Cached("MinishWoods_Scrub_Fuzer1")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 ) and ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and function_Cached("Scrubs")==1 and has("fusions27") and ( function_Cached("MinishWoods_Scrub_Fuzer1")==1 or function_Cached("MinishWoods_Scrub_Fuzer1")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function NorthField_MinishCrack_Fuzer() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("BonkedTrees")==1 and function_Cached("CanDestroyTrees")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2  ) and function_Cached("BonkedTrees")==1 and ( function_Cached("CanDestroyTrees")==1 or function_Cached("CanDestroyTrees")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Ruins_MinishHole_Fuzer() 
	if ( FusionsRedNumber("redE")==1 and function_Cached("AccessRuins")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redE")==1 or FusionsRedNumber("redE")==2 ) and ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function SouthHyruleField_Tingle_Fuzer1() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("AccessEasternHills")==1  and has("cane")) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 ) and ( function_Cached("AccessEasternHills")==1 or function_Cached("AccessEasternHills")==2 )  and has("cane")) then
		return 2
	else
		return 0
	end 
end


function SouthHyruleField_Tingle_Fuzer2() 
	if ( FusionsRedNumber("redW")==1 and function_Cached("AccessEasternHills")==1  and has("cane") and function_Cached("HasMagicBoomerang")==1 and function_Cached("SouthHyruleField_Tingle_Fuzer1")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redW")==1 or FusionsRedNumber("redW")==2 ) and ( function_Cached("AccessEasternHills")==1 or function_Cached("AccessEasternHills")==2 ) and has("cane") and function_Cached("HasMagicBoomerang")==1 and ( function_Cached("SouthHyruleField_Tingle_Fuzer1")==1 or function_Cached("SouthHyruleField_Tingle_Fuzer1")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function SouthHyruleField_SmithsHouse_Fuzer1() 
	if ( FusionsRedNumber("redV")==1 ) then
		return 1
	elseif ( FusionsRedNumber("redV")==2 ) then
		return 2
	else
		return 0
	end 
end


function SouthHyruleField_SmithsHouse_Fuzer2() 
	if ( FusionsGreenNumber("greenP")==1 and ( has("fusionred_vanilla") or function_Cached("FusionsRed")==0 ) and has("fusions16")) then
		return 1
	elseif ( FusionsGreenNumber("greenP")==2 and ( has("fusionred_vanilla") or function_Cached("FusionsRed")==0 ) and has("fusions16")) then
		return 2
	else
		return 0
	end 
end


function SouthField_MinishHouse_Fuzer() 
	if ( FusionsRedNumber("redV")==1 and function_Cached("CanDestroyTrees")==1 and function_Cached("BonkedTrees")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redV")==1 or FusionsRedNumber("redV")==2 ) and ( function_Cached("CanDestroyTrees")==1 or function_Cached("CanDestroyTrees")==2) and function_Cached("BonkedTrees")==1 ) then
		return 2
	else
		return 0
	end 
end


function Swamp_BusinessScrub_Fuzer() 
	if ( FusionsBlueNumber("blueL")==1 and function_Cached("AccessSwamp")==1 and function_Cached("Scrubs")==1 ) then
		return 1
	elseif ( FusionsBlueNumber("blueL")==2 and function_Cached("AccessSwamp")==1 and function_Cached("Scrubs")==1 ) then
		return 2
	else
		return 0
	end 
end


function Town_Inn_Fuzer1()
	if ( FusionsRedNumber("redE")==1 ) then
		return 1
	elseif ( FusionsRedNumber("redE")==2 ) then
		return 2
	else
		return 0
	end 
end


function Town_Inn_Fuzer2() 
	if ( FusionsRedNumber("redE")==1 and has("fusions1b") ) then
		return 1
	elseif ( FusionsRedNumber("redE")==2 and has("fusions1b") ) then
		return 2
	else
		return 0
	end 
end


function Town_Inn_Fuzer3() 
	if ( FusionsRedNumber("redV")==1 and has("fusions1b") ) then
		return 1
	elseif ( FusionsRedNumber("redV")==2 and has("fusions1b") ) then
		return 2
	else
		return 0
	end 
end


function Town_Inn_Fuzer4() 
	if ( FusionsRedNumber("redW")==1 and has("fusions1b") ) then
		return 1
	elseif ( FusionsRedNumber("redW")==2 and has("fusions1b") ) then
		return 2
	else
		return 0
	end end


function Town_School_Fuzer()
	if ( FusionsGreenNumber("greenP")==1 ) then
		return 1
	elseif ( FusionsGreenNumber("greenP")==2 ) then
		return 2
	else
		return 0
	end 
end

function Town_Library_Fuzer1() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("Library")==1 and has("cane") and has("book3") and has("grip") ) then
		return 1
	elseif ( FusionsGreenNumber("greenP")==2 and function_Cached("Library")==1 and has("cane") and has("book3") and has("grip") ) then
		return 2
	else
		return 0
	end 
end


function Town_Library_Fuzer2() 
	if ( FusionsBlueNumber("blueL")==1 and function_Cached("Library")==1 ) then
		return 1
	elseif ( FusionsBlueNumber("blueL")==2 and function_Cached("Library")==1 ) then
		return 2
	else
		return 0
	end 
end


function Town_Cafe_Fuzer1()
	if ( FusionsGreenNumber("greenC")==1 ) then
		return 1
	elseif ( FusionsGreenNumber("greenC")==2 ) then
		return 2
	else
		return 0
	end 
end


function Town_Cafe_Fuzer2()
	if ( FusionsBlueNumber("blueS")==1 ) then
		return 1
	elseif ( FusionsBlueNumber("blueS")==2 ) then
		return 2
	else
		return 0
	end 
end


function Town_NearPostOffice_Fuzer() 
	if ( FusionsRedNumber("redW")==1 and has("fusions1b") ) then
		return 1
	elseif ( FusionsRedNumber("redW")==2 and has("fusions1b") ) then
		return 2
	else
		return 0
	end 
end


function Town_Stranger_Fuzer()
	if ( FusionsRedNumber("redW")==1 ) then
		return 1
	elseif ( FusionsRedNumber("redW")==2 ) then
		return 2
	else
		return 0
	end 
end


function Town_Mayor_Fuzer() 
	if ( FusionsRedNumber("redE")==1 ) then
		return 1
	elseif ( FusionsRedNumber("redE")==2 ) then
		return 2
	else
		return 0
	end 
end


function Town_Postman_Fuzer()
	if ( FusionsBlueNumber("blueL")==1 ) then
		return 1
	elseif ( FusionsBlueNumber("blueL")==2 ) then
		return 2
	else
		return 0
	end 
end


function Trilby_TreeHouse_Fuzer() 
	if ( FusionsRedNumber("redE")==1 and function_Cached("AccessWestern")==1 ) then
		return 1
	elseif ( ( FusionsRedNumber("redE")==1 or FusionsRedNumber("redE")==2 ) and ( function_Cached("AccessWestern")==1 or function_Cached("AccessWestern")==2) ) then
		return 2
	else
		return 0
	end 
end

function Trilby_Knuckle_Fuzer() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("Trilby_DigCave_RightChest")==1 and ( has("cane") and function_Cached("AccessEasternHills")==1  or has("open_tingle_yes") ) ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 ) and ( function_Cached("Trilby_DigCave_RightChest")==1 or function_Cached("Trilby_DigCave_RightChest")==2 ) and  ( has("cane") and ( function_Cached("AccessEasternHills")==2 or function_Cached("AccessEasternHills")==1 or has("open_tingle_yes") ) ) ) then
		return 2
	else
		return 0
	end 
end


function Trilby_MittsCave_Fuzer() 
	if ( FusionsBlueNumber("blueWall")==1 and function_Cached("Trilby_DigCave_RightChest")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueWall")==1 or FusionsBlueNumber("blueWall")==2 ) and ( function_Cached("Trilby_DigCave_RightChest")==1 or function_Cached("Trilby_DigCave_RightChest")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function Trilby_MinishHouse_Fuzer() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("Trilby_DigCave_RightChest")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("Trilby_DigCave_RightChest")==1 or function_Cached("Trilby_DigCave_RightChest")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_Dampe_Fuzer1() 
	if ( FusionsBlueNumber("blueS")==1 and function_Cached("Valley_Dampe_NPC")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueS")==1 or FusionsBlueNumber("blueS")==2 ) and ( function_Cached("Valley_Dampe_NPC")==1 or function_Cached("Valley_Dampe_NPC")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_Dampe_Fuzer2() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("Valley_Dampe_NPC")==1 and function_Cached("Valley_Dampe_Fuzer1")) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("Valley_Dampe_NPC")==1 or function_Cached("Valley_Dampe_NPC")==2 ) and ( function_Cached("Valley_Dampe_Fuzer1")==1 or function_Cached("Valley_Dampe_Fuzer1")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_NortheastGrave_Fuzer1() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("Valley_GraveyardRightGraveFusion_Chest")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("Valley_GraveyardRightGraveFusion_Chest")==1 or function_Cached("Valley_GraveyardRightGraveFusion_Chest")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_NortheastGrave_Fuzer2() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("Valley_GraveyardRightGraveFusion_Chest")==1 and function_Cached("Valley_NortheastGrave_Fuzer1")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("Valley_GraveyardRightGraveFusion_Chest")==1 or function_Cached("Valley_GraveyardRightGraveFusion_Chest")==2 ) and ( function_Cached("Valley_NortheastGrave_Fuzer1")==1 or function_Cached("Valley_NortheastGrave_Fuzer1")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_Spekter_Fuzer1() 
	if ( FusionsBlueNumber("blueS")==1 and function_Cached("Valley_GraveyardLeftGrave_HP")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueS")==1 or FusionsBlueNumber("blueS")==2 ) and ( function_Cached("Valley_GraveyardLeftGrave_HP")==1 or function_Cached("Valley_GraveyardLeftGrave_HP")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_Spekter_Fuzer2() 
	if ( FusionsBlueNumber("blueL")==1 and function_Cached("Valley_GraveyardLeftGrave_HP")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueL")==1 or FusionsBlueNumber("blueL")==2 ) and ( function_Cached("Valley_GraveyardLeftGrave_HP")==1 or function_Cached("Valley_GraveyardLeftGrave_HP")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function WesternWoods_MinishHouse_Fuzer() 
	if ( FusionsBlueNumber("blueL")==1 and function_Cached("AccessWestern")==1 ) then
		return 1
	elseif ( ( FusionsBlueNumber("blueL")==1 or FusionsBlueNumber("blueL")==2 ) and ( function_Cached("AccessWestern")==1 or function_Cached("AccessWestern")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_MinishVillage_Fuzer4() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("MinishVillage_HP")==1 ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenG")==1 or FusionsGreenNumber("greenG")==2 ) and ( function_Cached("MinishVillage_HP")==1 or function_Cached("MinishVillage_HP")==2 ) ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_MinishVillage_Fuzer5() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("MinishVillage_HP")==1 and has("fusions4b") ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenP")==1 or FusionsGreenNumber("greenP")==2 ) and ( function_Cached("MinishVillage_HP")==1 or function_Cached("MinishVillage_HP")==2 ) and has("fusions4b") ) then
		return 2
	else
		return 0
	end 
end


function MinishWoods_MinishVillage_Fuzer6() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("MinishVillage_HP")==1 and has("fusions57") ) then
		return 1
	elseif ( ( FusionsGreenNumber("greenC")==1 or FusionsGreenNumber("greenC")==2 ) and ( function_Cached("MinishVillage_HP")==1 or function_Cached("MinishVillage_HP")==2 ) and has("fusions57") ) then
		return 2
	else
		return 0
	end 
end

function Town_Library_Fuzer3() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("Library")==1 ) then
		return 1
	elseif ( FusionsGreenNumber("greenG")==2 and function_Cached("Library")==1 ) then
		return 2
	else
		return 0
	end 
end


function Town_Library_Fuzer4() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("Library")==1 and has("fusions4b") ) then
		return 1
	elseif ( FusionsGreenNumber("greenP")==2 and function_Cached("Library")==1 and has("fusions4b") ) then
		return 2
	else
		return 0
	end 
end


function Town_Library_Fuzer5() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("Library")==1 and has("fusions57") ) then
		return 1
	elseif ( FusionsGreenNumber("greenC")==2 and function_Cached("Library")==1 and has("fusions57") ) then
		return 2
	else
		return 0
	end 
end

function Town_MinishHouse_Fuzer1() 
	if ( FusionsGreenNumber("greenG")==1 and function_Cached("Fountain")==1 ) then
		return 1
	elseif ( FusionsGreenNumber("greenG")==2 and function_Cached("Fountain")==1 ) then
		return 2
	else
		return 0
	end 
end


function Town_MinishHouse_Fuzer2() 
	if ( FusionsGreenNumber("greenP")==1 and function_Cached("Fountain")==1 and has("fusions4b") ) then
		return 1
	elseif ( FusionsGreenNumber("greenP")==2 and function_Cached("Fountain")==1 and has("fusions4b") ) then
		return 2
	else
		return 0
	end 
end


function Town_MinishHouse_Fuzer3() 
	if ( FusionsGreenNumber("greenC")==1 and function_Cached("Fountain")==1 and has("fusions57") ) then
		return 1
	elseif ( FusionsGreenNumber("greenC")==2 and function_Cached("Fountain")==1 and has("fusions57") ) then
		return 2
	else
		return 0
	end 
end


