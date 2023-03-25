function Json_Hylia_Dojo_Waveblade()
  if Hylia_Dojo_NPC()==1 then
    return 1
  elseif Hylia_Dojo_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_Dojo_NPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_Dojo_HeartPiece()
  if Hylia_Dojo_HP()==1 then
    return 1
  elseif Hylia_Dojo_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_Dojo_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_PondHeartPiece_Chest()
  if Hylia_SunkenHP()==1 then
    return 1
  elseif Hylia_SunkenHP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_SunkenHP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_NorthMinishHole_Chest()
  if Hylia_NorthMinishHole_Chest()==1 then
    return 1
  elseif Hylia_NorthMinishHole_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_NorthMinishHole_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_TreasureCave_Chest()
  if Hylia_CapeCave_Chest()==1 then
    return 1
  elseif Hylia_CapeCave_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_CapeCave_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_TreasureCave_BeanstalkChest()
  if Hylia_BeanstalkFusion_Chest()==1 then
    return 1
  elseif Hylia_BeanstalkFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_BeanstalkFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_TreasureCave_BeanstalkHeartPiece()
  if Hylia_BeanstalkFusion_HP()==1 then
    return 1
  elseif Hylia_BeanstalkFusion_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_BeanstalkFusion_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end



function Json_Hylia_MinishWoods_NorthMinishHole_Chest()
  if Hylia_SouthMinishHole_Chest()==1 then
    return 1
  elseif Hylia_SouthMinishHole_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_SouthMinishHole_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_LonLon_NorthHeartPiece_HeartPiece()
  if Hylia_CapeCave_LonLonHP()==1 then
    return 1
  elseif Hylia_CapeCave_LonLonHP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_CapeCave_LonLonHP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_LakeCabin_Item()
  if Hylia_MayorCabin_Item()==1 then
    return 1
  elseif Hylia_MayorCabin_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_MayorCabin_Item()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_LakeCabin_Chest()
  if Hylia_CabinPathFusion_Chest()==1 then
    return 1
  elseif Hylia_CabinPathFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_CabinPathFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_Southern_HeartPiece()
  if Hylia_BottomHP()==1 then
    return 1
  elseif Hylia_BottomHP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_BottomHP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_CapeHeartPiece_HeartPiece()
  if Hylia_SmallIsland_HP()==1 then
    return 1
  elseif Hylia_SmallIsland_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_SmallIsland_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_Fifi_Item()
  if Hylia_DogNPC()==1 then
    return 1
  elseif Hylia_DogNPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_DogNPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_MiddleIslandCave_Chest()
  if Hylia_MiddleIslandFusion_DigCaveChest()==1 then
    return 1
  elseif Hylia_MiddleIslandFusion_DigCaveChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_MiddleIslandFusion_DigCaveChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hylia_Librari_Item()
  if Hylia_CrackFusion_LibrariNPC()==1 then
    return 1
  elseif Hylia_CrackFusion_LibrariNPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hylia_CrackFusion_LibrariNPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

Tracker:AddLocations(JsLocations.."Hylia.json")