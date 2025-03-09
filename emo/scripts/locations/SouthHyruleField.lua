function Json_SouthHyruleField_Tingle_Gift()
  if (function_Cached("SouthField_Tingle_NPC") == 1) then
    return 1
  elseif function_Cached("SouthField_Tingle_NPC") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("SouthField_Tingle_NPC") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_SouthHyruleField_SmithsHouse_Chests()
  if
    function_Cached("Smith_House_Chest") == 1 or function_Cached("Smith_Floor_Item1") == 1 or
      function_Cached("Smith_Floor_Item2") == 1
   then
    return 1
  elseif
    function_Cached("Smith_House_Chest") == 2 or function_Cached("Smith_Floor_Item1") == 2 or
      function_Cached("Smith_Floor_Item2") == 2
   then
    return 1, AccessibilityLevel.SequenceBreak
  elseif
    function_Cached("Smith_House_Chest") == 3 or function_Cached("Smith_Floor_Item1") == 3 or
      function_Cached("Smith_Floor_Item2") == 3
   then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_SouthHyruleField_MinishFlippersHole_HeartPiece()
  if function_Cached("SouthField_MinishSize_WaterHole_HP") == 1 then
    return 1
  elseif function_Cached("SouthField_MinishSize_WaterHole_HP") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("SouthField_MinishSize_WaterHole_HP") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_SouthHyruleField_RupeeCave_Rupees()
  if function_Cached("SouthField_PuddleFusion_Item") == 1 then
    return 1
  elseif function_Cached("SouthField_PuddleFusion_Item") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("SouthField_PuddleFusion_Item") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_SouthHyruleField_TreeHeartPiece_HeartPiece()
  if function_Cached("SouthField_TreeFusion_HP") == 1 then
    return 1
  elseif function_Cached("SouthField_TreeFusion_HP") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("SouthField_TreeFusion_HP") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_SouthHyruleField_NearLinksHouseChest_Chest()
  if function_Cached("SouthField_Fusion_Chest") == 1 then
    return 1
  elseif function_Cached("SouthField_Fusion_Chest") == 2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("SouthField_Fusion_Chest") == 3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
