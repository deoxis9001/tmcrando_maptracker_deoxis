function Json_Castle_Dojo_Fuzer() 
		return 1
end

function Json_Castle_MinishCrack_Fuzer() 
	if ( BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_WindTribeHouse_Fuzer1() 
	if ( AccessWindTribe()==1 or StrangerFusion()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_WindTribeHouse_Fuzer2() 
	if ( Json_Clouds_WindTribeHouse_Fuzer1()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_WindTribeHouse_Fuzer3() 
	if ( AccessWindTribe()==1 or StrangerFusion()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_WindTribeHouse_Fuzer4() 
	if ( AccessWindTribe()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_WindTribeHouse_Fuzer5() 
	if ( AccessWindTribe()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_WindTribeHouse_Fuzer6() 
	if ( AccessWindTribe()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_WindTribeHouse_Fuzer7() 
	if ( Json_Clouds_WindTribeHouse_Fuzer6()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_Fuzer_Fuzer1() 
	if ( AccessClouds()==1 and AccessWindTribe()==0 ) then
		return 1
	else
		return 0
	end 
end

function Json_Clouds_Fuzer_Fuzer2() 
	if ( AccessClouds()==1 and AccessWindTribe()==0 ) then
		return 1
	else
		return 0
	end 
end


function Json_Crenel_Mines_Fuzer1() 
	if ( AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Crenel_Mines_Fuzer2() 
	if ( AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Crenel_Mines_Fuzer3() 
	if (  CompleteCoF()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Crenel_Mines_Fuzer4() 
	if ( CompleteCoF()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Crenel_Mines_Fuzer5() 
	if ( AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Crenel_DiggingCave_Fuzer() 
	if ( Crenel_DigCave_HP()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Crenel_Dojo_Fuzer() 
	if ( Crenel_Dojo_HP()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_CrenelBase_MinishCrack_Fuzer() 
	if ( CrenelBase_MinishCrack_Chest()==1  ) then
		return 1
	else
		return 0
	end 
end

function Json_Hills_MittsCave_Fuzer() 
	if ( AccessMinishWoods()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Json_Hills_MinishHouse_Fuzer() 
	if ( AccessEasternHills()==1 ) then
		return 1
	elseif ( AccessEasternHills()==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end

function Json_Hills_Farmer_Fuzer1() 
	if ( AccessMinishWoods()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Hills_Farmer_Fuzer2() 
	if ( AccessMinishWoods()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Hylia_Dojo_Fuzer() 
	if ( Hylia_Dojo_HP()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Hylia_TreasureCave_Fuzer() 
	if ( Hylia_CapeCave_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Hylia_Fifi_Fuzer() 
	if ( AccessLonLon()==1 and has("cane") ) then
		return 1
	elseif ( AccessLonLon()==2 and has("cane") ) then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end

function Json_Hylia_Librari_Fuzer() 
	if ( Hylia_CrackFusion_LibrariNPC()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Hylia_MinishHouseWindCrest_Fuzer() 
	if ( has("ocarina") ) then
		return 1
	else
		return 0
	end 
end


function Json_Hylia_DavidJr_Fuzer1() 
	if ( AccessLonLon()==1 and has("cane") and AccessEasternHills()==1 ) then
		return 1
	elseif ( ( AccessLonLon()==1 or AccessLonLon()==2) and has("cane") and ( AccessEasternHills()==1 or AccessEasternHills()==2 ) ) then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end


function Json_Hylia_DavidJr_Fuzer2() 
	if ( AccessLonLon()==1 and has("cane") and AccessEasternHills()==1 and HasMagicBoomerang()==1 ) then
		return 1
	elseif ( ( AccessLonLon()==1 or AccessLonLon()==2) and has("cane") and ( AccessEasternHills()==1 or AccessEasternHills()==2 ) and HasMagicBoomerang()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Hylia_MinishCrack_Fuzer() 
	if ( Hylia_NorthMinishHole_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_LonLon_GoronQuest_Fuzer1() 
	if ( GoronCave()==1 and ( CanDestroyTrees()==1 or has("ocarina") ) ) then
		return 1
	else
		return 0
	end 
end


function Json_LonLon_GoronQuest_Fuzer2() 
	if( LonLon_GoronCaveFusion_BigChest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_LonLon_Ankle_Fuzer() 
	if ( LonLon_Cave_Chest()==1 and has("cane") and AccessEasternHills()==1 ) then
		return 1
	elseif ( LonLon_Cave_Chest()==1 and has("cane") and AccessEasternHills()==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end


function Json_MinishWoods_MittCave_Fuzer() 
	if ( WitchDiggingCave_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_MinishVillage_Fuzer1() 
	local count=0
	if( has("fusions13") ) then
		count = count + 1
	end
	if( has("fusions14") ) then
		count = count + 1
	end
	if( has("fusions15") ) then
		count = count + 1
	end
	if( has("fusions16") ) then
		count = count + 1
	end
	if( has("fusions17") ) then
		count = count + 1
	end
	if( has("fusions18") ) then
		count = count + 1
	end
	if( has("fusions19") ) then
		count = count + 1
	end
	if( has("fusions1a") ) then
		count = count + 1
	end
	if ( count >=7 ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_MinishVillage_Fuzer2() 
	local count=0
	if( has("fusions1b") ) then
		count = count + 1
	end
	if( has("fusions1c") ) then
		count = count + 1
	end
	if( has("fusions1d") ) then
		count = count + 1
	end
	if( has("fusions1e") ) then
		count = count + 1
	end
	if( has("fusions1f") ) then
		count = count + 1
	end
	if( has("fusions20") ) then
		count = count + 1
	end
	if( has("fusions21") ) then
		count = count + 1
	end
	if ( count >=7 and Json_MinishWoods_MinishVillage_Fuzer1()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_MinishVillage_Fuzer3() 
	if ( MinishVillage_HP()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_Belari_Fuzer() 
	if ( MinishWoods_BombMinish_NPC2()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_Scrub_Fuzer1() 
	if ( Scrubs()==1 and has("fusions27") ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_Scrub_Fuzer2() 
	if ( Json_MinishWoods_Scrub_Fuzer1()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_NorthField_MinishCrack_Fuzer() 
	if ( BonkedTrees()==1 and CanDestroyTrees()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Ruins_MinishHole_Fuzer() 
	if ( AccessRuins()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_SouthHyruleField_Tingle_Fuzer1() 
	if ( has("cane") and ( AccessEasternHills()==1 ) and HasMagicBoomerang()==1 ) then
		return 1
	elseif ( has("cane") and ( AccessEasternHills()==2 ) and HasMagicBoomerang()==1 ) then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end


function Json_SouthHyruleField_Tingle_Fuzer2() 
	if ( has("cane") and ( AccessEasternHills()==1 ) and HasMagicBoomerang()==1 ) then
		return 1
	elseif ( has("cane") and ( AccessEasternHills()==2 ) and HasMagicBoomerang()==1 ) then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end


function Json_SouthHyruleField_SmithsHouse_Fuzer1() 
	return 1
end


function Json_SouthHyruleField_SmithsHouse_Fuzer2() 
	if ( ( has("fusionred_vanilla") and Json_SouthHyruleField_SmithsHouse_Fuzer1()==1 ) or FusionsRed()==0 ) then
		return 1
	else
		return 0
	end 
end


function Json_SouthField_MinishHouse_Fuzer() 
	if ( CanDestroyTrees()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Swamp_BusinessScrub_Fuzer() 
	if ( AccessSwamp()==1 and Scrubs()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Inn_Fuzer1() 
	return 1
end


function Json_Town_Inn_Fuzer2() 
	if ( has("fusions1b") ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Inn_Fuzer3() 
	if ( has("fusions1b") ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Inn_Fuzer4() 
	if ( has("fusions1b") ) then
		return 1
	else
		return 0
	end end


function Json_Town_School_Fuzer() 
	return 1
end

function Json_Town_Library_Fuzer1() 
	if ( Library()==1 and has("cane") and has("book3") and has("grip") ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Library_Fuzer2() 
	if ( Library()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Cafe_Fuzer1() 
	return 1
end


function Json_Town_Cafe_Fuzer2() 
	return 1 
end


function Json_Town_NearPostOffice_Fuzer() 
	if ( has("fusions1b") ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Stranger_Fuzer() 
	return 1
end


function Json_Town_Mayor_Fuzer() 
	return 1
end


function Json_Town_Postman_Fuzer() 
	return 1
end


function Json_Trilby_TreeHouse_Fuzer() 
	if ( AccessWestern()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Trilby_Knuckle_Fuzer() 
	if ( Trilby_DigCave_RightChest()==1 and has("cane") and AccessEasternHills()==1 ) then
		return 1
	elseif ( Trilby_DigCave_RightChest()==1 and has("cane") and AccessEasternHills()==2 ) then
		return 1, AccessibilityLevel.SequenceBreak
	else
		return 0
	end 
end


function Json_Trilby_MittsCave_Fuzer() 
	if ( Trilby_DigCave_RightChest()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Trilby_MinishHouse_Fuzer() 
	if ( Trilby_DigCave_RightChest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Valley_Dampe_Fuzer1() 
	if ( Valley_Dampe_NPC()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Valley_Dampe_Fuzer2() 
	if ( Json_Valley_Dampe_Fuzer1()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Valley_NortheastGrave_Fuzer1() 
	if ( Valley_GraveyardRightGraveFusion_Chest()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Valley_NortheastGrave_Fuzer2() 
	if ( Json_Valley_NortheastGrave_Fuzer1()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Valley_Spekter_Fuzer1() 
	if ( Valley_GraveyardLeftGrave_HP()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_Valley_Spekter_Fuzer2() 
	if ( Json_Valley_Spekter_Fuzer1()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_WesternWoods_MinishHouse_Fuzer() 
	if ( AccessWestern()==1 ) then
		return 1
	else
		return 0
	end 
end

function Json_MinishWoods_MinishVillage_Fuzer4() 
	if ( MinishVillage_HP()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_MinishVillage_Fuzer5() 
	if ( Json_MinishWoods_MinishVillage_Fuzer4()==1 and has("fusions4b") ) then
		return 1
	else
		return 0
	end 
end


function Json_MinishWoods_MinishVillage_Fuzer6() 
	if ( Json_MinishWoods_MinishVillage_Fuzer5()==1 and has("fusions57") ) then
		return 1
	else
		return 0
	end 
end

function Json_Town_Library_Fuzer3() 
	if ( Library()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Library_Fuzer4() 
	if ( Json_Town_Library_Fuzer3()==1 and has("fusions4b") ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_Library_Fuzer5() 
	if ( Json_Town_Library_Fuzer4()==1 and has("fusions57") ) then
		return 1
	else
		return 0
	end 
end

function Json_Town_MinishHouse_Fuzer1() 
	if ( Fountain()==1 ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_MinishHouse_Fuzer2() 
	if ( Json_Town_MinishHouse_Fuzer1()==1 and has("fusions4b") ) then
		return 1
	else
		return 0
	end 
end


function Json_Town_MinishHouse_Fuzer3() 
	if ( Json_Town_MinishHouse_Fuzer2()==1 and has("fusions57") ) then
		return 1
	else
		return 0
	end 
end


