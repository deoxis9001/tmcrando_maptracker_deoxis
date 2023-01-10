function Json_Trilby_RupeeCave_Rupees()
  if Trilby_PuddleFusion_Item()==1 then
    return 1
  elseif has("nologic_on") and Trilby_PuddleFusion_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Trilby_MittsCave_Chest()
  if Trilby_DigCave_RightChest()==1 then
    return 1
  elseif has("nologic_on") and Trilby_DigCave_RightChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Trilby_BusinessScrub_Item()
  if Trilby_Scrub_NPC()==1 then
    return 1
  elseif has("nologic_on") and Trilby_Scrub_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Trilby_BombWall_Chest()
  if Trilby_BombCave_Chest()==1 then
    return 1
  elseif has("nologic_on") and Trilby_BombCave_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Trilby_RockChest_Chest()
  if Trilby_MiddleFusion_Chest()==1 then
    return 1
  elseif has("nologic_on") and Trilby_MiddleFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end
function Json_Trilby_NorthernChest_Chest()
  if Trilby_TopFusion_Chest()==1 then
    return 1
  elseif has("nologic_on") and Trilby_TopFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end

function Json_Trilby_FusionMittsCave_Chest()
  if Trilby_DigCave_WaterFusion_Chest()==1 then
    return 1
  elseif has("nologic_on") and Trilby_DigCave_WaterFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end



Tracker:AddLocations(JsLocations.."Trilby.json")
