function Json_Valley_NorthwestGrave_HeartPiece()
  if function_Cached("Valley_GraveyardLeftGrave_HP") == 1 then
    return 1
  elseif function_Cached("Valley_GraveyardLeftGrave_HP") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_GraveyardLeftGrave_HP") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_NorthwestGrave_Chest()
  if function_Cached("Valley_GraveyardLeftFusion_Chest") == 1 then
    return 1
  elseif function_Cached("Valley_GraveyardLeftFusion_Chest") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_GraveyardLeftFusion_Chest") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_LostWoodsSecret_Chest()
  if function_Cached("Valley_LostWoods_Chest") == 1 then
    return 1
  elseif function_Cached("Valley_LostWoods_Chest") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_LostWoods_Chest") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_GreatFairy_Gift()
  if function_Cached("Valley_GreatFairy_NPC") == 1 then
    return 1
  elseif function_Cached("Valley_GreatFairy_NPC") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_GreatFairy_NPC") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_Dampe_Gift()
  if function_Cached("Valley_Dampe_NPC") == 1 then
    return 1
  elseif function_Cached("Valley_Dampe_NPC") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_Dampe_NPC") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_NortheastGrave_GraveChest()
  if function_Cached("Valley_GraveyardRightGraveFusion_Chest") == 1 then
    return 1
  elseif function_Cached("Valley_GraveyardRightGraveFusion_Chest") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_GraveyardRightGraveFusion_Chest") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_NortheastGrave_Chest()
  if function_Cached("Valley_GraveyardRightFusion_Chest") == 1 then
    return 1
  elseif function_Cached("Valley_GraveyardRightFusion_Chest") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_GraveyardRightFusion_Chest") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_Butterfly_JoyButterfly()
  if function_Cached("Valley_GraveyardButterflyFusion_Item") == 1 then
    return 1
  elseif function_Cached("Valley_GraveyardButterflyFusion_Item") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_GraveyardButterflyFusion_Item") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_PreRoyalValeyChest_Chest()
  if function_Cached("Valley_PreValleyFusion_Chest") == 1 then
    return 1
  elseif function_Cached("Valley_PreValleyFusion_Chest") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Valley_PreValleyFusion_Chest") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
