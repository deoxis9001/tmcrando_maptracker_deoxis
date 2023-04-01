function Json_Trilby_RupeeCave_Rupees()
  if function_Cached("Trilby_PuddleFusion_Item")==1 then
    return 1
  elseif function_Cached("Trilby_PuddleFusion_Item")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Trilby_PuddleFusion_Item")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Trilby_MittsCave_Chest()
  if function_Cached("Trilby_DigCave_RightChest")==1 then
    return 1
  elseif function_Cached("Trilby_DigCave_RightChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Trilby_DigCave_RightChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Trilby_BusinessScrub_Item()
  if function_Cached("Trilby_Scrub_NPC")==1 then
    return 1
  elseif function_Cached("Trilby_Scrub_NPC")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Trilby_Scrub_NPC")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Trilby_BombWall_Chest()
  if function_Cached("Trilby_BombCave_Chest")==1 then
    return 1
  elseif function_Cached("Trilby_BombCave_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Trilby_BombCave_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Trilby_RockChest_Chest()
  if function_Cached("Trilby_MiddleFusion_Chest")==1 then
    return 1
  elseif function_Cached("Trilby_MiddleFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Trilby_MiddleFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
function Json_Trilby_NorthernChest_Chest()
  if function_Cached("Trilby_TopFusion_Chest")==1 then
    return 1
  elseif function_Cached("Trilby_TopFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Trilby_TopFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Trilby_FusionMittsCave_Chest()
  if function_Cached("Trilby_DigCave_WaterFusion_Chest")==1 then
    return 1
  elseif function_Cached("Trilby_DigCave_WaterFusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Trilby_DigCave_WaterFusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end