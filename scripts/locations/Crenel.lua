function Json_Crenel_Mines_Melari()
  if function_Cached("Crenel_Melari_NPC")==1 then
    return 1
  elseif function_Cached("Crenel_Melari_NPC")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_Melari_NPC")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Mines_Digging()
  if function_Cached("Crenel_Melari_Mining")==1 then
    return 1
  elseif function_Cached("Crenel_Melari_Mining")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_Melari_Mining")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Mines_Chest()
  if function_Cached("Crenel_MinesPathFusion_Chest")==1 then
    return 1
  elseif function_Cached("Crenel_MinesPathFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_MinesPathFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_GreatFairy_Item()
  if function_Cached("Crenel_GreatFairy_NPC")==1 then
    return 1
  elseif function_Cached("Crenel_GreatFairy_NPC")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_GreatFairy_NPC")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Beanstalk_HeartPiece()
  if function_Cached("Crenel_BeanstalkFusion_HP")==1 then
    return 1
  elseif function_Cached("Crenel_BeanstalkFusion_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_BeanstalkFusion_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Beanstalk_Rupees()
  if function_Cached("Crenel_BeanstalkFusion_Item")==1 then
    return 1
  elseif function_Cached("Crenel_BeanstalkFusion_Item")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_BeanstalkFusion_Item")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_WallChest_Chest()
  if function_Cached("Crenel_ClimbFusion_Chest")==1 then
    return 1
  elseif function_Cached("Crenel_ClimbFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_ClimbFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_MiddleCrenelTektiteGolden_Kill()
  if function_Cached("Crenel_VineTop_GoldenTektite")==1 then
    return 1
  elseif function_Cached("Crenel_VineTop_GoldenTektite")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_VineTop_GoldenTektite")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_TopTektiteGolden_Kill()
  if function_Cached("Crenel_BelowCoF_GoldenTektite")==1 then
    return 1
  elseif function_Cached("Crenel_BelowCoF_GoldenTektite")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_BelowCoF_GoldenTektite")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_RainyMinishPathChest_Chest()
  if function_Cached("Crenel_RainPathFusion_Chest")==1 then
    return 1
  elseif function_Cached("Crenel_RainPathFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_RainPathFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_BridgeCave_chest()
  if function_Cached("Crenel_BridgeCave_Chest")==1 then
    return 1
  elseif function_Cached("Crenel_BridgeCave_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_BridgeCave_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_BusinessScrub_Scrub()
  if function_Cached("Crenel_Scrub_NPC")==1 then
    return 1
  elseif function_Cached("Crenel_Scrub_NPC")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_Scrub_NPC")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Fairy_HeartPiece()
  if function_Cached("Crenel_FairyCave_HP")==1 then
    return 1
  elseif function_Cached("Crenel_FairyCave_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_FairyCave_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Dojo_Chests()
  if function_Cached("Crenel_Dojo_Chest")==1 then
    return 1
  elseif function_Cached("Crenel_Dojo_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_Dojo_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Dojo_HeartPiece()
  if function_Cached("Crenel_Dojo_HP")==1 then
    return 1
  elseif function_Cached("Crenel_Dojo_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_Dojo_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_Dojo_Grayblade()
  if function_Cached("Crenel_Dojo_NPC")==1 then
    return 1
  elseif function_Cached("Crenel_Dojo_NPC")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_Dojo_NPC")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_MinesCave_chest()
  if function_Cached("Crenel_UpperBlock_Chest")==1 then
    return 1
  elseif function_Cached("Crenel_UpperBlock_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_UpperBlock_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Crenel_DiggingCave_Heartpiece()
  if function_Cached("Crenel_DigCave_HP")==1 then
    return 1
  elseif function_Cached("Crenel_DigCave_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crenel_DigCave_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end