function Json_Hylia_Dojo_Waveblade()
  if function_Cached("Hylia_Dojo_NPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_Dojo_NPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_Dojo_NPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_Dojo_HeartPiece()
  if function_Cached("Hylia_Dojo_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_Dojo_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_Dojo_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_PondHeartPiece_Chest()
  if function_Cached("Hylia_SunkenHP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_SunkenHP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_SunkenHP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_NorthMinishHole_Chest()
  if function_Cached("Hylia_NorthMinishHole_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_NorthMinishHole_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_NorthMinishHole_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_TreasureCave_Chest()
  if function_Cached("Hylia_CapeCave_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_CapeCave_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_CapeCave_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_TreasureCave_BeanstalkChest()
  if function_Cached("Hylia_BeanstalkFusion_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_BeanstalkFusion_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_BeanstalkFusion_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_TreasureCave_BeanstalkHeartPiece()
  if function_Cached("Hylia_BeanstalkFusion_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_BeanstalkFusion_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_BeanstalkFusion_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_MinishWoods_NorthMinishHole_Chest()
  if function_Cached("Hylia_SouthMinishHole_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_SouthMinishHole_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_SouthMinishHole_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_LonLon_NorthHeartPiece_HeartPiece()
  if function_Cached("Hylia_CapeCave_LonLonHP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_CapeCave_LonLonHP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_CapeCave_LonLonHP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_LakeCabin_Item()
  if function_Cached("Hylia_MayorCabin_Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_MayorCabin_Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_MayorCabin_Item") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_LakeCabin_Chest()
  if function_Cached("Hylia_CabinPathFusion_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_CabinPathFusion_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_CabinPathFusion_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_Southern_HeartPiece()
  if function_Cached("Hylia_BottomHP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_BottomHP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_BottomHP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_CapeHeartPiece_HeartPiece()
  if function_Cached("Hylia_SmallIsland_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_SmallIsland_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_SmallIsland_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_Fifi_Item()
  if function_Cached("Hylia_DogNPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_DogNPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_DogNPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_MiddleIslandCave_Chest()
  if function_Cached("Hylia_MiddleIslandFusion_DigCaveChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_MiddleIslandFusion_DigCaveChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_MiddleIslandFusion_DigCaveChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Hylia_Librari_Item()
  if function_Cached("Hylia_CrackFusion_LibrariNPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Hylia_CrackFusion_LibrariNPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hylia_CrackFusion_LibrariNPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end
