function Json_Town_FlippersCave_ScissorBeetles()
  if function_Cached("Town_UnderLibrary_BigChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_UnderLibrary_BigChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_UnderLibrary_BigChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_FlippersCave_FrozenChest()
  if function_Cached("Town_UnderLibrary_FrozenChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_UnderLibrary_FrozenChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_UnderLibrary_FrozenChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_FlippersCave_UndertheWaterfall()
  if function_Cached("Town_UnderLibrary_Underwater") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_UnderLibrary_Underwater") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_UnderLibrary_Underwater") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Inn_BackDoorHeartPiece()
  if function_Cached("Town_Inn_BackdoorHP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Inn_BackdoorHP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Inn_BackdoorHP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Inn_RightPot()
  if function_Cached("Town_Inn_Pot") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Inn_Pot") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Inn_Pot") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_DiggingCave_Chests()
  if function_Cached("Town_Digging") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Digging") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Digging") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_DiggingCave_BasementLeftChest()
  if function_Cached("Town_Well_LeftChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Well_LeftChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Well_LeftChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_SwiftbladeDojo_SpinAttack()
  if (function_Cached("Town_Dojo_NPC1") == 1) then
    return AccessibilityLevel.Normal
  elseif (function_Cached("Town_Dojo_NPC1") == 2) then
    return  AccessibilityLevel.SequenceBreak
  elseif (function_Cached("Town_Dojo_NPC1") == 3) then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_SwiftbladeDojo_RockBreaker()
  if (function_Cached("Town_Dojo_NPC2") == 1) then
    return AccessibilityLevel.Normal
  elseif (function_Cached("Town_Dojo_NPC2") == 2) then
    return  AccessibilityLevel.SequenceBreak
  elseif (function_Cached("Town_Dojo_NPC2") == 3) then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_SwiftbladeDojo_DashAttack()
  if (function_Cached("Town_Dojo_NPC3") == 1) then
    return AccessibilityLevel.Normal
  elseif (function_Cached("Town_Dojo_NPC3") == 2) then
    return  AccessibilityLevel.SequenceBreak
  elseif (function_Cached("Town_Dojo_NPC3") == 3) then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_SwiftbladeDojo_DownThrust()
  if (function_Cached("Town_Dojo_NPC4") == 1) then
    return AccessibilityLevel.Normal
  elseif (function_Cached("Town_Dojo_NPC4") == 2) then
    return  AccessibilityLevel.SequenceBreak
  elseif (function_Cached("Town_Dojo_NPC4") == 3) then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_StockwellShop_Wallet()
  if function_Cached("Town_Shop_80Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Shop_80Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  else
    return  AccessibilityLevel.Inspect
  end
end

function Json_Town_StockwellShop_Boomerang()
  if function_Cached("Town_Shop_300Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Shop_300Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  else
    return  AccessibilityLevel.Inspect
  end
end

function Json_Town_StockwellShop_QuiverSpot()
  if function_Cached("Town_Shop_600Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Shop_600Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  else
    return  AccessibilityLevel.Inspect
  end
end

function Json_Town_StockwellShop_BombagSpot()
  if function_Cached("Town_Shop_Extra600Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Shop_Extra600Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  else
    return  AccessibilityLevel.Inspect
  end
end

function Json_Town_StockwellShop_AtticChest()
  if function_Cached("Town_Shop_AtticChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Shop_AtticChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Shop_AtticChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_StockwellShop_DogFoodBottle()
  if function_Cached("Town_Shop_BehindCounterItem") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Shop_BehindCounterItem") == 2 then
    return  AccessibilityLevel.SequenceBreak
  else
    return  AccessibilityLevel.Inspect
  end
end

function Json_Town_SchoolGardens_GardenChests()
  if function_Cached("Town_School_Path_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_School_Path_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_School_Path_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_SchoolGardens_HeartPiece()
  if function_Cached("Town_School_Path_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_School_Path_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_School_Path_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_SchoolGardens_MinishPathChest()
  if function_Cached("Town_School_PathFusion_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_School_PathFusion_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_School_PathFusion_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_School_RoofChest()
  if function_Cached("Town_School_Roof_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_School_Roof_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_School_Roof_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_School_PulltheStatue()
  if function_Cached("Town_Well_TopChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Well_TopChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Well_TopChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_MayorHouseBasement_Chest()
  if function_Cached("Town_Well_RightChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Well_RightChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Well_RightChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Library_YellowMinishGift()
  if function_Cached("Town_Library_YellowMinish_NPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Library_YellowMinish_NPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Library_YellowMinish_NPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Cafe_Gift()
  if function_Cached("Town_CafeLady_NPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_CafeLady_NPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_CafeLady_NPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_JuliettaHouse_Item()
  if function_Cached("Town_Jullieta_Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Jullieta_Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  else
    return  AccessibilityLevel.Inspect
  end
end

function Json_Town_HyruleWell_BottomChest()
  if function_Cached("Town_Well_BottomChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Well_BottomChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Well_BottomChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_HyruleWell_CenterChest()
  if function_Cached("Town_Well_PillarChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Well_PillarChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Well_PillarChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_HearthLedge_Chest()
  if function_Cached("Town_Inn_LedgeChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Inn_LedgeChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Inn_LedgeChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Fountain_Mulldozers()
  if function_Cached("Town_Fountain_BigChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Fountain_BigChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Fountain_BigChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Fountain_Chest()
  if function_Cached("Town_Fountain_SmallChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Fountain_SmallChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Fountain_SmallChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Fountain_HeartPiece()
  if function_Cached("Town_Fountain_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Fountain_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Fountain_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_EasternShops_Rem()
  if function_Cached("Town_ShoeShop_NPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_ShoeShop_NPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_ShoeShop_NPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_EasternShops_SimonSimulations()
  if function_Cached("Town_Simulation_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Simulation_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Simulation_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_EasternShops_FigurineHouse()
  if function_Cached("Town_MusicHouse") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_MusicHouse") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_MusicHouse") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_EasternShops_FigurineHouseHeartPiece()
  if function_Cached("Town_MusicHouse_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_MusicHouse_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_MusicHouse_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_DrLeftHouse_DrLeftHouse()
  if function_Cached("Town_DrLeft_AtticItem") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_DrLeft_AtticItem") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_DrLeft_AtticItem") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Carlov_Gift()
  if function_Cached("Town_Carlov_NPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Carlov_NPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Carlov_NPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Bell_HeartPiece()
  if function_Cached("Town_Bell_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Bell_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Bell_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_BakeryAttic_Chest()
  if function_Cached("Town_Bakery_AtticChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Bakery_AtticChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Bakery_AtticChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set1_Item2()
  if function_Cached("Town_GoronShop_Set1_Item2") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set1_Item2") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set1_Item2") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set1_Item1()
  if function_Cached("Town_GoronShop_Set1_Item1") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set1_Item1") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set1_Item1") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set2_Items()
  if function_Cached("Town_GoronShop_Set2_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set2_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set2_Items") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set3_Item1()
  if function_Cached("Town_GoronShop_Set3_Item1") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set3_Item1") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set3_Item1") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set3_Items()
  if function_Cached("Town_GoronShop_Set3_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set3_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set3_Items") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set4_Items()
  if function_Cached("Town_GoronShop_Set4_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set4_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set4_Items") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set5_Item1()
  if function_Cached("Town_GoronShop_Set5_Item1") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set5_Item1") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set5_Item1") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_GoronShop_Set5_Items()
  if function_Cached("Town_GoronShop_Set5_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set5_Items") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_GoronShop_Set5_Items") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_Anju_Gift1()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift2()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift3()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift4()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift5()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift6()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift7()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift8()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift9()
  return AccessibilityLevel.Normal
end

function Json_Town_Anju_Gift10()
  if function_Cached("Town_Cuccos_NPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_Cuccos_NPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_Cuccos_NPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Town_TownWaterfall_Waterfall()
  if function_Cached("Town_WaterfallFusion_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Town_WaterfallFusion_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Town_WaterfallFusion_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end
