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
function Town_Shop_BehindCounterItem() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_Pot() 
	if ( has("obscure_on") ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_RightChest() 
	return 1
end
function Town_Dojo_NPC1() 
	if ( HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC2() 
	if ( Sword2()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC3() 
	if ( HasSword()==1 and has("boots") ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC4() 
	if ( HasSword()==1 and has("cape") ) then
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
	if ( has("cane") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_Chest() 
	if ( has("cane") and CanSplit4()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_HP() 
	if ( has("cane") and CanSplit4()==1 ) then
		return 1
	elseif ( has("cane") ) then
		return 2
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
	if ( WellPillar()==1 or has("mitts") ) then
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
	if ( has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Town_Carlov_NPC() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_BottomChest() 
	if ( WellPillar()==1 or has("flippers") or has("cape") ) then
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
	if ( Julietta()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Shop_AtticChest() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Bakery_AtticChest() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_BackdoorHP() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_LedgeChest() 
	if ( InnLedge()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Simulation_Chest() 
	if ( HasSword()==1 ) then
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
	if ( MusicHouse()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_PillarChest() 
	if ( WellPillar()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_DrLeft_AtticItem() 
	if ( DrLeft()==1 and TownDog()==1 )  then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_BigChest() 
	if ( TownMulldozers()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_SmallChest() 
	if ( Fountain()==1 and ( has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_HP() 
	if ( Fountain()==1 and has("cape") ) then
		return 1
	elseif ( Fountain()==1 ) then
		return 2
	else
		return 0
	end 
end
function Town_Library_YellowMinish_NPC() 
	if ( Library()==1 and has("cane") and has("book3") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_FrozenChest() 
	if ( Library()==1 and has("flippers") and has("cane") and has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_BigChest() 
	if ( ( Library()==1 and has("cane") and HasDamageSource()==1 and ( has("flippers") or  (has("book3") and has("grip") and ( has("gust") or has("cape")))))) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_Underwater() 
	if ( has("rupees_on") and has("obscure_on") and Library()==1 and has("flippers") and has("cane") ) then
		return 1
	else
		return 0
	end 
end