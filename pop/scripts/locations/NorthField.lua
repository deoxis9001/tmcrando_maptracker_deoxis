function Json_NorthField_DiggingSpot_Digging()
  if function_Cached("NorthField_DigSpot") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_DigSpot") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_DigSpot") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_NorthField_Cave_HeartPiece()
  if function_Cached("NorthField_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_NorthField_DojoWaterfall_Greatblade()
  if function_Cached("NorthField_WaterfallFusion_DojoNPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_WaterfallFusion_DojoNPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_WaterfallFusion_DojoNPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_NorthField_TopRightTree_Chest()
  if function_Cached("NorthField_TreeFusion_TopRightChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_TreeFusion_TopRightChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_TreeFusion_TopRightChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_NorthField_TopLeftTree_Chest()
  if function_Cached("NorthField_TreeFusion_TopLeftChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_TreeFusion_TopLeftChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_TreeFusion_TopLeftChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_NorthField_BottomRightTree_Chest()
  if function_Cached("NorthField_TreeFusion_BottomRightChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_TreeFusion_BottomRightChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_TreeFusion_BottomRightChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_NorthField_BottomLeftTree_Chest()
  if function_Cached("NorthField_TreeFusion_BottomLeftChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_TreeFusion_BottomLeftChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_TreeFusion_BottomLeftChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_NorthField_TingleChest_BigChest()
  if function_Cached("NorthField_TreeFusion_CenterBigChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("NorthField_TreeFusion_CenterBigChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("NorthField_TreeFusion_CenterBigChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end
