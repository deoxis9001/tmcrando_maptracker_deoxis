function Json_Valley_NorthwestGrave_HeartPiece()
  if Valley_GraveyardLeftGrave_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Valley_NorthwestGrave_Chest()
  if Valley_GraveyardLeftFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Valley_LostWoodsSecret_Chest()
  if Valley_LostWoods_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Valley_GreatFairy_Gift()
  if Valley_GreatFairy_NPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_Valley_Dampe_Gift()
  if Valley_Dampe_NPC()==1 then
    return 1
  -- elseif Valley_Dampe_NPC()==2 then
    -- return 1, AccessibilityLevel.SequenceBreak
  -- elseif Valley_Dampe_NPC()==3 then
    -- return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Valley_NortheastGrave_GraveChest()
  if Valley_GraveyardRightGraveFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Valley_NortheastGrave_Chest()
  if Valley_GraveyardRightFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Valley_Butterfly_JoyButterfly()
  if Valley_GraveyardButterflyFusion_Item()==1then
    return 1
  else
    return 0
  end
end

function Json_Valley_PreRoyalValeyChest_Chest()
  if Valley_PreValleyFusion_Chest()==1then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."Valley.json")