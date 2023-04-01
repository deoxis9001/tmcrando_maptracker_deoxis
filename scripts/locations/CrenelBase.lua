function Json_CrenelBase_WaterPathChest_Chest()
  if function_Cached("CrenelBase_GreenWaterFusion_Chest")==1 then
    return 1
  elseif function_Cached("CrenelBase_GreenWaterFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_GreenWaterFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_CrenelBase_Chest_Chest()
  if function_Cached("CrenelBase_WestFusion_Chest")==1 then
    return 1
  elseif function_Cached("CrenelBase_WestFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_WestFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
function Json_CrenelBase_MinishCrack_Chest()
  if function_Cached("CrenelBase_MinishCrack_Chest")==1 then
    return 1
  elseif function_Cached("CrenelBase_MinishCrack_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_MinishCrack_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
function Json_CrenelBase_HeartPieceCave_Chests()
  if function_Cached("CrenelBase_WaterCave_Chest")==1 then
    return 1
  elseif function_Cached("CrenelBase_WaterCave_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_WaterCave_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_CrenelBase_HeartPieceCave_HeartPiece()
  if function_Cached("CrenelBase_WaterCave_HP")==1 then
    return 1
  elseif function_Cached("CrenelBase_WaterCave_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_WaterCave_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
function Json_CrenelBase_VineRupee_Rupee()
  if function_Cached("CrenelBase_EntranceVine")==1 then
    return 1
  elseif function_Cached("CrenelBase_EntranceVine")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_EntranceVine")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_CrenelBase_MinishHole_Chest()
  if function_Cached("CrenelBase_MinishVineHole_Chest")==1 then
    return 1
  elseif function_Cached("CrenelBase_MinishVineHole_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_MinishVineHole_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_CrenelBase_Fairy_Rupees()
  if function_Cached("CrenelBase_FairyCave_Item")==1 then
    return 1
  elseif function_Cached("CrenelBase_FairyCave_Item")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("CrenelBase_FairyCave_Item")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end