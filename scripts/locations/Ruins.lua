function Json_Ruins_MinishWallHole_HeartPiece()
  if Ruins_MinishCave_HP()==1 then
    return 1
  elseif Ruins_MinishCave_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_MinishCave_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_MinishHole_Chest()
  if Ruins_MinishHome_Chest()==1 then
    return 1
  elseif Ruins_MinishHome_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_MinishHome_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_BombableWall_Chest()
  if Ruins_BombCave_Chest()==1 then
    return 1
  elseif Ruins_BombCave_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_BombCave_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_ArmosKill_Chest()
  if Ruins_ArmosKill_Chest()==1 then
    return 1
  elseif Ruins_ArmosKill_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_ArmosKill_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_PreFOW_Chest()
  if Ruins_NearFoWFusion_Chest()==1 then
    return 1
  elseif Ruins_NearFoWFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_NearFoWFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_4Pillars_Chest()
  if Ruins_PillarsFusion_Chest()==1 then
    return 1
  elseif Ruins_PillarsFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_PillarsFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_OctoGolden_Kill()
  if Ruins_GoldenOcto()==1 then
    return 1
  elseif Ruins_GoldenOcto()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_GoldenOcto()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_MinishCrack_Chest()
  if Ruins_CrackFusion_Chest()==1 then
    return 1
  elseif Ruins_CrackFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_CrackFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_JoyButterfly_Butterfly()
  if Ruins_ButterflyFusion_Item()==1 then
    return 1
  elseif Ruins_ButterflyFusion_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_ButterflyFusion_Item()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Ruins_Beanstalk_BigChest()
  if Ruins_BeanStalkFusion_BigChest()==1 then
    return 1
  elseif Ruins_BeanStalkFusion_BigChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Ruins_BeanStalkFusion_BigChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
Tracker:AddLocations(JsLocations.."Ruins.json")
