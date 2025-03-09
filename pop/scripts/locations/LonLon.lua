function Json_LonLon_DiggingSpot_Digging()
  if function_Cached("LonLon_DigSpot") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_DigSpot") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_DigSpot") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_MalonPot_Pot()
  if function_Cached("LonLon_RanchPot") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_RanchPot") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_RanchPot") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_MinishCrack_Chest()
  if function_Cached("LonLon_NorthMinishCrack_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_NorthMinishCrack_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_NorthMinishCrack_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_Cave_Chest()
  if function_Cached("LonLon_Cave_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_Cave_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_Cave_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_Cave_HiddenChest()
  if function_Cached("LonLon_CaveSecret_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_CaveSecret_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_CaveSecret_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_BonktheTree_HeartPiece()
  if function_Cached("LonLon_Path_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_Path_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_Path_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_BonktheTree_Chest()
  if function_Cached("LonLon_Path_FusionChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_Path_FusionChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_Path_FusionChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_DriedUpPond_BigChest()
  if function_Cached("LonLon_PuddleFusion_BigChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_PuddleFusion_BigChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_PuddleFusion_BigChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_GoronQuest_Chest()
  if function_Cached("LonLon_GoronCaveFusion_SmallChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_GoronCaveFusion_SmallChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_GoronCaveFusion_SmallChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_LonLon_GoronQuest_BigChest()
  if function_Cached("LonLon_GoronCaveFusion_BigChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("LonLon_GoronCaveFusion_BigChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("LonLon_GoronCaveFusion_BigChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end
