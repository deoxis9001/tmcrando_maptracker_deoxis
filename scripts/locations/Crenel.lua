function Json_Crenel_Mines_Melari()
  if Crenel_Melari_NPC()==1 then
    return 1
  elseif has("nologic_on") and Crenel_Melari_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_Mines_Digging()
  if Crenel_Melari_Mining()==1 then
    return 1
  elseif has("nologic_on") and Crenel_Melari_Mining()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_Mines_Chest()
  if Crenel_MinesPathFusion_Chest()==1 then
    return 1
  elseif has("nologic_on") and Crenel_MinesPathFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_GreatFairy_Item()
  if Crenel_GreatFairy_NPC()==1 then
    return 1
  elseif has("nologic_on") and Crenel_GreatFairy_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_Beanstalk_HeartPiece()
  if Crenel_BeanstalkFusion_HP()==1 then
    return 1
  elseif has("nologic_on") and Crenel_BeanstalkFusion_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_Beanstalk_Rupees()
  if Crenel_BeanstalkFusion_Item()==1 then
    return 1
  elseif has("nologic_on") and Crenel_BeanstalkFusion_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_WallChest_Chest()
  if Crenel_ClimbFusion_Chest()==1 then
    return 1
  elseif has("nologic_on") and Crenel_ClimbFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_MiddleCrenelTektiteGolden_Kill()
  if Crenel_VineTop_GoldenTektite()==1 then
    return 1
  elseif has("nologic_on") and Crenel_VineTop_GoldenTektite()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_TopTektiteGolden_Kill()
  if Crenel_BelowCoF_GoldenTektite()==1 then
    return 1
  elseif has("nologic_on") and Crenel_BelowCoF_GoldenTektite()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_RainyMinishPathChest_Chest()
  if Crenel_RainPathFusion_Chest()==1 then
    return 1
  elseif has("nologic_on") and Crenel_RainPathFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_BridgeCave_chest()
  if Crenel_BridgeCave_Chest()==1 then
    return 1
  elseif has("nologic_on") and Crenel_BridgeCave_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_BusinessScrub_Scrub()
  if Crenel_Scrub_NPC()==1 then
    return 1
  elseif has("nologic_on") and Crenel_Scrub_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_Fairy_HeartPiece()
  if Crenel_FairyCave_HP()==1 then
    return 1
  elseif has("nologic_on") and Crenel_FairyCave_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_Dojo_Chests()
  if Crenel_Dojo_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Crenel_Dojo_HeartPiece()
  if Crenel_Dojo_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Crenel_Dojo_Grayblade()
  if Crenel_Dojo_NPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_Crenel_MinesCave_chest()
  if Crenel_UpperBlock_Chest()==1 then
    return 1
  elseif has("nologic_on") and Crenel_UpperBlock_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Crenel_DiggingCave_Heartpiece()
  if Crenel_DigCave_HP()==1 then
    return 1
  elseif has("nologic_on") and Crenel_DigCave_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

Tracker:AddLocations(JsLocations.."Crenel.json")
Tracker:AddLocations(JsLocations.."Mines.json")
