function Json_Valley_NorthwestGrave_HeartPiece()
  if Valley_GraveyardLeftGrave_HP()==1 then
    return 1
  elseif Valley_GraveyardLeftGrave_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_GraveyardLeftGrave_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_NorthwestGrave_Chest()
  if Valley_GraveyardLeftFusion_Chest()==1 then
    return 1
  elseif Valley_GraveyardLeftFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_GraveyardLeftFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_LostWoodsSecret_Chest()
  if Valley_LostWoods_Chest()==1 then
    return 1
  elseif Valley_LostWoods_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_LostWoods_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_GreatFairy_Gift()
  if Valley_GreatFairy_NPC()==1 then
    return 1
  elseif Valley_GreatFairy_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_GreatFairy_NPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_Dampe_Gift()
  if Valley_Dampe_NPC()==1 then
    return 1
  elseif Valley_Dampe_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_Dampe_NPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_NortheastGrave_GraveChest()
  if Valley_GraveyardRightGraveFusion_Chest()==1 then
    return 1
  elseif Valley_GraveyardRightGraveFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_GraveyardRightGraveFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_NortheastGrave_Chest()
  if Valley_GraveyardRightFusion_Chest()==1 then
    return 1
  elseif Valley_GraveyardRightFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_GraveyardRightFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_Butterfly_JoyButterfly()
  if Valley_GraveyardButterflyFusion_Item()==1 then
    return 1
  elseif Valley_GraveyardButterflyFusion_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_GraveyardButterflyFusion_Item()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_PreRoyalValeyChest_Chest()
  if Valley_PreValleyFusion_Chest()==1 then
    return 1
  elseif Valley_PreValleyFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_PreValleyFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."Valley.json")