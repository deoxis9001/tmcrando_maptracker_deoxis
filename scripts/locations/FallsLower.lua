
function Json_FallsLower_Rupees_Rupee()
  if FallsLower_RockItem1()==1 then
    return 1
  elseif FallsLower_RockItem1()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif FallsLower_RockItem1()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_FallsLower_MittsCave_Chest()
  if FallsLower_DigCave_LeftChest()==1 then
    return 1
  elseif FallsLower_DigCave_LeftChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif FallsLower_DigCave_LeftChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_FallsLower_HeartPiece_HeartPiece()
  if FallsLower_HP()==1 then
    return 1
  elseif FallsLower_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif FallsLower_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_FallsLower_DojoWaterfall_Splitblade()
  if FallsLower_WaterfallFusion_DojoNPC()==1 then
    return 1
  elseif FallsLower_WaterfallFusion_DojoNPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif FallsLower_WaterfallFusion_DojoNPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_FallsLower_RanchChest_Chest()
  if FallsLower_LonLonFusion_Chest()==1 then
    return 1
  elseif FallsLower_LonLonFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif FallsLower_LonLonFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."FallsLower.json")