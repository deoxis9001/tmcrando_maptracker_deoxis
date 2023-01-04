function Json_CrenelBase_WaterPathChest_Chest()
  if CrenelBase_GreenWaterFusion_Chest()==1 then
    return 1
  elseif CrenelBase_GreenWaterFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_CrenelBase_Chest_Chest()
  if CrenelBase_WestFusion_Chest()==1 then
    return 1
  elseif CrenelBase_WestFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end
function Json_CrenelBase_MinishCrack_Chest()
  if CrenelBase_MinishCrack_Chest()==1 then
    return 1
  elseif CrenelBase_MinishCrack_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end
function Json_CrenelBase_HeartPieceCave_Chests()
  if CrenelBase_WaterCave_Chest()==1 then
    return 1
  elseif CrenelBase_WaterCave_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_CrenelBase_HeartPieceCave_HeartPiece()
  if CrenelBase_WaterCave_HP()==1 then
    return 1
  elseif CrenelBase_WaterCave_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end
function Json_CrenelBase_VineRupee_Rupee()
  if CrenelBase_EntranceVine()==1 then
    return 1
  elseif CrenelBase_EntranceVine()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_CrenelBase_MinishHole_Chest()
  if CrenelBase_MinishVineHole_Chest()==1 then
    return 1
  elseif CrenelBase_MinishVineHole_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_CrenelBase_Fairy_Rupees()
  if CrenelBase_FairyCave_Item()==1 then
    return 1
  elseif CrenelBase_FairyCave_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."CrenelBase.json")
