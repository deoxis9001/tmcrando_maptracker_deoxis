function Json_MinishWoods_SyrupsHut_Item()
  if function_Cached("MinishWoods_WitchHut_Item")==1 then
    return 1
  elseif function_Cached("MinishWoods_WitchHut_Item")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_WitchHut_Item")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_ShrineHeartPiece_HeartPiece()
  if function_Cached("MinishWoods_BottomHP")==1 then
    return 1
  elseif function_Cached("MinishWoods_BottomHP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_BottomHP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_NorthernHeartPiece_HeartPiece()
  if function_Cached("MinishWoods_TopHP")==1 then
    return 1
  elseif function_Cached("MinishWoods_TopHP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_TopHP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MittCave_Digging()
  if function_Cached("WitchDiggingCave_Chest")==1 then
    return 1
  elseif function_Cached("WitchDiggingCave_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("WitchDiggingCave_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_GreatFairy_Gift()
  if function_Cached("MinishWoods_GreatFairy_NPC")==1 then
    return 1
  elseif function_Cached("MinishWoods_GreatFairy_NPC")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_GreatFairy_NPC")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MinishVillage_Barrel()
  if function_Cached("MinishVillage_BarrelHouse_Item")==1 then
    return 1
  elseif function_Cached("MinishVillage_BarrelHouse_Item")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishVillage_BarrelHouse_Item")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MinishVillage_HeartPiece()
  if function_Cached("MinishVillage_HP")==1 then
    return 1
  elseif function_Cached("MinishVillage_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishVillage_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MinishVillage_Chest()
  if function_Cached("MinishWoods_MinishPathFusion_Chest")==1 then
    return 1
  elseif function_Cached("MinishWoods_MinishPathFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_MinishPathFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_LeftChest()
  if function_Cached("MinishWoods_FlipperHole_LeftChest")==1 then
    return 1
  elseif function_Cached("MinishWoods_FlipperHole_LeftChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_FlipperHole_LeftChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_LeftHeartPiece()
  if function_Cached("MinishWoods_FlipperHole_HP")==1 then
    return 1
  elseif function_Cached("MinishWoods_FlipperHole_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_FlipperHole_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_MiddleChest()
  if function_Cached("MinishWoods_FlipperHole_MiddleChest")==1 then
    return 1
  elseif function_Cached("MinishWoods_FlipperHole_MiddleChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_FlipperHole_MiddleChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_MinishFlippersCave_RightChest()
  if function_Cached("MinishWoods_FlipperHole_RightChest")==1 then
    return 1
  elseif function_Cached("MinishWoods_FlipperHole_RightChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_FlipperHole_RightChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_LikeLikeCave_Chests()
  if function_Cached("MinishWoods_LikeLikeDiggingCave_LeftChest")==1 then
    return 1
  elseif function_Cached("MinishWoods_LikeLikeDiggingCave_LeftChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_LikeLikeDiggingCave_LeftChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_Belari_Gift1stItem()
  if function_Cached("MinishWoods_BombMinish_NPC1")==1 then
    return 1
  elseif function_Cached("MinishWoods_BombMinish_NPC1")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_BombMinish_NPC1")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end


function Json_MinishWoods_Belari_Gift2ndItem()
  if function_Cached("MinishWoods_BombMinish_NPC2")==1 then
    return 1
  elseif function_Cached("MinishWoods_BombMinish_NPC2")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_BombMinish_NPC2")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end


function Json_MinishWoods_PreMinishVillage_MinishHole_Chest()
  if function_Cached("MinishWoods_CrackFusion_Chest")==1 then
    return 1
  elseif function_Cached("MinishWoods_CrackFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_CrackFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_PreStumpChest_Chest()
  if function_Cached("MinishWoods_EastFusion_Chest")==1 then
    return 1
  elseif function_Cached("MinishWoods_EastFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_EastFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_PreShrineChest_Chest()
  if function_Cached("MinishWoods_SouthFusion_Chest")==1 then
    return 1
  elseif function_Cached("MinishWoods_SouthFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_SouthFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_PostMinishVillage_Chest()
  if function_Cached("MinishWoods_PostVillageFusion_Chest")==1 then
    return 1
  elseif function_Cached("MinishWoods_PostVillageFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_PostVillageFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_GoldenOcto_Kill()
  if function_Cached("MinishWoods_GoldenOcto")==1 then
    return 1
  elseif function_Cached("MinishWoods_GoldenOcto")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_GoldenOcto")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_Entrance_Chest()
  if function_Cached("MinishWoods_WestFusion_Chest")==1 then
    return 1
  elseif function_Cached("MinishWoods_WestFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_WestFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_MinishWoods_CrossthePond_Chest()
  if function_Cached("MinishWoods_NorthFusion_Chest")==1 then
    return 1
  elseif function_Cached("MinishWoods_NorthFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("MinishWoods_NorthFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end