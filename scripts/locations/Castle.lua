function Json_Castle_Moat_LeftChest()
  if function_Cached("Castle_Moat_LeftChest")==1 then
    return 1
  elseif function_Cached("Castle_Moat_LeftChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_Moat_LeftChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_Moat_RightChest()
  if function_Cached("Castle_Moat_RightChest")==1 then
    return 1
  elseif function_Cached("Castle_Moat_RightChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_Moat_RightChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_Dojo_Grimblade()
  if function_Cached("Castle_Dojo_NPC")==1 then
    return 1
  elseif function_Cached("Castle_Dojo_NPC")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_Dojo_NPC")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_Dojo_HeartPiece()
  if function_Cached("Castle_Dojo_HP")==1 then
    return 1
  elseif function_Cached("Castle_Dojo_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_Dojo_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_RopeGolden_Kill()
  if function_Cached("Castle_GoldenRope")==1 then
    return 1
  elseif function_Cached("Castle_GoldenRope")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_GoldenRope")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_RightFountain_DryFountain()
  if function_Cached("Castle_RightFountainFusion_HP")==1 then
    return 1
  elseif function_Cached("Castle_RightFountainFusion_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_RightFountainFusion_HP")==1 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_RightFountain_MinishHole()
  if function_Cached("Castle_RightFountainFusion_MinishHoleChest")==1 then
    return 1
  elseif function_Cached("Castle_RightFountainFusion_MinishHoleChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_RightFountainFusion_MinishHoleChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Castle_LeftFountain_MinishHole()
  if function_Cached("Castle_LeftFountainFusion_MinishHoleChest")==1 then
    return 1
  elseif function_Cached("Castle_LeftFountainFusion_MinishHoleChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Castle_LeftFountainFusion_MinishHoleChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end