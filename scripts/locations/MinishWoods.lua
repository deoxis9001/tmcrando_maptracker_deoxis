function Json_MinishWoods_SyrupsHut_Item()
  if MinishWoods_WitchHut_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_ShrineHeartPiece_HeartPiece()
  if MinishWoods_BottomHP()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_NorthernHeartPiece_HeartPiece()
  if MinishWoods_TopHP()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MittCave_Digging()
  if WitchDiggingCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_GreatFairy_Gift()
  if MinishWoods_GreatFairy_NPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MinishVillage_Barrel()
  if MinishVillage_BarrelHouse_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MinishVillage_HeartPiece()
  if MinishVillage_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MinishVillage_Chest()
  if MinishWoods_MinishPathFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_LeftChest()
  if MinishWoods_FlipperHole_LeftChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_LeftHeartPiece()
  if MinishWoods_FlipperHole_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_MiddleChest()
  if MinishWoods_FlipperHole_MiddleChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_RightChest()
  if MinishWoods_FlipperHole_RightChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_LikeLikeCave_Chests()
  if MinishWoods_LikeLikeDiggingCave_LeftChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_Belari_Gift1stItem()
  if MinishWoods_BombMinish_NPC1()==1 then
    return 1
  else
    return 0
  end
end


function Json_MinishWoods_Belari_Gift2ndItem()
  if MinishWoods_BombMinish_NPC2()==1 then
    return 1
  else
    return 0
  end
end


function Json_MinishWoods_PreMinishVillage_MinishHole_Chest()
  if MinishWoods_MinishPathFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_PreStumpChest_Chest()
  if MinishWoods_EastFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_PreShrineChest_Chest()
  if MinishWoods_SouthFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_PostMinishVillage_Chest()
  if MinishWoods_PostVillageFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_GoldenOcto_Kill()
  if MinishWoods_OctoGolden_KillOcto()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_Entrance_Chest()
  if MinishWoods_WestFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_MinishWoods_CrossthePond_Chest()
  if MinishWoods_NorthFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end



Tracker:AddLocations(JsLocations.."MinishWoods.json")