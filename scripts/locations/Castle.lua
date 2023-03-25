function Json_Castle_Moat_LeftChest()
  if Castle_Moat_LeftChest()==1 then
    return 1
  elseif Castle_Moat_LeftChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_Moat_LeftChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_Moat_RightChest()
  if Castle_Moat_RightChest()==1 then
    return 1
  elseif Castle_Moat_RightChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_Moat_RightChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_Dojo_Grimblade()
  if Castle_Dojo_NPC()==1 then
    return 1
  elseif Castle_Dojo_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_Dojo_NPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_Dojo_HeartPiece()
  if Castle_Dojo_HP()==1 then
    return 1
  elseif Castle_Dojo_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_Dojo_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_RopeGolden_Kill()
  if Castle_GoldenRope()==1 then
    return 1
  elseif Castle_GoldenRope()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_GoldenRope()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_RightFountain_DryFountain()
  if Castle_RightFountainFusion_HP()==1 then
    return 1
  elseif Castle_RightFountainFusion_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_RightFountainFusion_HP()==1 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_RightFountain_MinishHole()
  if Castle_RightFountainFusion_MinishHoleChest()==1 then
    return 1
  elseif Castle_RightFountainFusion_MinishHoleChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_RightFountainFusion_MinishHoleChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_LeftFountain_MinishHole()
  if Castle_LeftFountainFusion_MinishHoleChest()==1 then
    return 1
  elseif Castle_LeftFountainFusion_MinishHoleChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Castle_LeftFountainFusion_MinishHoleChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end



Tracker:AddLocations(JsLocations.."Castle.json")
