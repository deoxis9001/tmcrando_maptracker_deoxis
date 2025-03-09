function Json_Ruins_MinishWallHole_HeartPiece()
  if function_Cached("Ruins_MinishCave_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_MinishCave_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_MinishCave_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_MinishHole_Chest()
  if function_Cached("Ruins_MinishHome_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_MinishHome_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_MinishHome_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_BombableWall_Chest()
  if function_Cached("Ruins_BombCave_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_BombCave_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_BombCave_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_ArmosKill_Chest()
  if function_Cached("Ruins_ArmosKill_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_ArmosKill_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_ArmosKill_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_PreFOW_Chest()
  if function_Cached("Ruins_NearFoWFusion_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_NearFoWFusion_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_NearFoWFusion_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_4Pillars_Chest()
  if function_Cached("Ruins_PillarsFusion_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_PillarsFusion_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_PillarsFusion_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_OctoGolden_Kill()
  if function_Cached("Ruins_GoldenOcto") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_GoldenOcto") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_GoldenOcto") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_MinishCrack_Chest()
  if function_Cached("Ruins_CrackFusion_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_CrackFusion_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_CrackFusion_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_JoyButterfly_Butterfly()
  if function_Cached("Ruins_ButterflyFusion_Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_ButterflyFusion_Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_ButterflyFusion_Item") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Ruins_Beanstalk_BigChest()
  if function_Cached("Ruins_BeanStalkFusion_BigChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Ruins_BeanStalkFusion_BigChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Ruins_BeanStalkFusion_BigChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end
