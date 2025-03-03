
function Town_CafeLady_NPC() 
	return 1
end
function Town_Shop_80Item() 
	return 1
end
function Town_Shop_300Item() 
	if ( has("wallet") ) then
		return 1
	else
		return 0
	end 
end
function Town_Shop_600Item() 
	if ( has("wallet3") ) then
		return 1
	else
		return 0
	end 
end
function Town_Shop_Extra600Item() 
	if ( has("shopbag_extra_on") and has("wallet3") ) then
		return 1
	else
		return 0
	end 
end
function Town_Shop_BehindCounterItem() 
	if ( function_Cached("ShopBack")==1 ) then
		return 1
	elseif ( function_Cached("ShopBack")==2 ) then
		return 2
	else
		return 0
	end 
end
function Town_Shop_AtticChest() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Bakery_AtticChest() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_BackdoorHP() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_LedgeChest() 
	if ( function_Cached("InnLedge")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_Pot() 
		return 1
end
function Town_Well_RightChest() 
	return 1
end
function Town_GoronShop_Set1_Item2() 
	if ( has("goron_eu") and function_Cached("Town_GoronShop_Set1_Item1")==1 and has("wallet") ) then
		return 1
	elseif ( has("goron_jp") and function_Cached("Town_GoronShop_Set1_Item1")==1 and has("wallet") ) then
		return 1
	else
		return 0
	end 
end

function Town_GoronShop_Set1_Item1() 
	if ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions33") ) ) then
		return 1
	else
		return 0
	end 
end

function Town_GoronShop_Set2_Items()
	if function_Cached("Town_GoronShop_Set1_Item1")==1 and has("goron_eu") and has("wallet") then
		return 1
	elseif function_Cached("Town_GoronShop_Set1_Item1")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set3_Item1()
	if function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_eu") and has("wallet2") then
		return 1
	elseif function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set3_Items()
	if function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_eu") and has("wallet") then
		return 1
	elseif function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set4_Items()
	if function_Cached("Town_GoronShop_Set3_Items")==1 and has("goron_eu") and has("wallet2") then
		return 1
	elseif function_Cached("Town_GoronShop_Set3_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set5_Item1()
	if function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_eu") and has("wallet3") then
		return 1
	elseif function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set5_Items()
	if function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_eu") and has("wallet2") then
		return 1
	elseif function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_Dojo_NPC1() 
	if ( function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC2() 
	if ( function_Cached("HasWhiteSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC3() 
	if ( function_Cached("HasSword")==1 and has("boots") ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC4() 
	if ( function_Cached("HasSword")==1 and has("cape") ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_TopChest() 
	if ( has("bombs") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Roof_Chest() 
	if ( has("cane") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_PathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions36") ) ) and has("cane") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_Chest() 
	if ( has("cane") and function_Cached("CanSplit4")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_HP() 
	if ( function_Cached("SchoolHP")==1 ) then
		return 1
	elseif ( function_Cached("SchoolHP")==2 ) then
		return 2
	elseif ( function_Cached("SchoolHP")==3 ) then
		return 3
	else
		return 0
	end 
end
function Town_Digging() 
	if ( has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_LeftChest() 
	if ( function_Cached("WellPillar")==1 or has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function Town_Bell_HP() 
	if ( has("cape") ) then
		return 1
	else
		return 0
	end 
end
function Town_WaterfallFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions42") ) ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Town_Carlov_NPC() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_BottomChest() 
	if ( function_Cached("WellPillar")==1 or has("flippers") or has("cape") ) then
		return 1
	else
		return 0
	end 
end
function Town_Cuccos_NPC() 
	if ( has("cape") or has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Town_Jullieta_Item() 
	if ( function_Cached("Julietta")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Simulation_Chest() 
	if ( function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_ShoeShop_NPC() 
	if ( has("mushroom") ) then
		return 1
	else
		return 0
	end 
end
function Town_MusicHouse() 
	if ( function_Cached("MusicHouse")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_MusicHouse_HP() 
	if ( function_Cached("MusicHouseHP")==1 ) then
		return 1
	elseif ( function_Cached("MusicHouseHP")==2 ) then
		return 2
	elseif ( function_Cached("MusicHouseHP")==3 ) then
		return 3
	else
		return 0
	end 
end
function Town_Well_PillarChest() 
	if ( function_Cached("WellPillar")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_DrLeft_AtticItem() 
	if ( function_Cached("DrLeft")==1 and function_Cached("TownDog")==1 ) then
		return 1
	elseif ( function_Cached("DrLeft")==2 and function_Cached("TownDog")==1 ) then
		return 2
	else
		return 0
	end 
end
function Town_Fountain_BigChest() 
	if ( function_Cached("TownMulldozers")==1 ) then
		return 1
	elseif ( function_Cached("TownMulldozers")==2 ) then
		return 2
	else
		return 0
	end 
end
function Town_Fountain_SmallChest() 
	if ( function_Cached("Fountain")==1 and ( has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_HP() 
	if ( function_Cached("Fountain")==1 and function_Cached("FountainHP")==1 ) then
		return 1
	elseif ( function_Cached("Fountain")==1 and function_Cached("FountainHP")==2 ) then
		return 2
	elseif ( function_Cached("Fountain")==1 ) then
		return 3
	else
		return 0
	end 
end
function Town_Library_YellowMinish_NPC() 
	if ( function_Cached("Library")==1 and has("cane") and has("book3") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_FrozenChest() 
	if ( function_Cached("Library")==1 and has("flippers") and has("cane") and has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_BigChest() 
	if ( ( function_Cached("Library")==1 and has("cane") and function_Cached("HasDamageSource")==1 and ( has("flippers") or ( has("book3") and has("grip") and ( has("gust") or has("cape") ) ) ) ) ) then
		return 1
	elseif ( ( function_Cached("Library")==1 and has("cane") and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) and ( has("flippers") or ( has("book3") and has("grip") and ( has("gust") or has("cape") ) ) ) ) ) then
		return 2
	else
		return 0
	end 
end
function Town_UnderLibrary_Underwater() 
	if ( function_Cached("Library")==1 and has("flippers") and has("cane") ) then
		return 1
	else
		return 0
	end 
end