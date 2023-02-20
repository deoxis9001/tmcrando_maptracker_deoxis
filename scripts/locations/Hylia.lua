
function Json_Hylia_Dojo_Waveblade()
  if Hylia_Dojo_NPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_Dojo_HeartPiece()
  if Hylia_Dojo_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_PondHeartPiece_Chest()
  if Hylia_SunkenHP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_NorthMinishHole_Chest()
  if Hylia_NorthMinishHole_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_TreasureCave_Chest()
  if Hylia_CapeCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_TreasureCave_BeanstalkChest()
  if Hylia_BeanstalkFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_TreasureCave_BeanstalkHeartPiece()
  if Hylia_BeanstalkFusion_HP()==1 then
    return 1
  else
    return 0
  end
end



function Json_Hylia_MinishWoods_NorthMinishHole_Chest()
  if Hylia_SouthMinishHole_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_LonLon_NorthHeartPiece_HeartPiece()
  if Hylia_CapeCave_LonLonHP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_LakeCabin_Item()
  if Hylia_MayorCabin_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_LakeCabin_Chest()
  if Hylia_CabinPathFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_Southern_HeartPiece()
  if Hylia_BottomHP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_CapeHeartPiece_HeartPiece()
  if Hylia_SmallIsland_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_Fifi_Item()
  if Hylia_DogNPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_MiddleIslandCave_Chest()
  if Hylia_MiddleIslandFusion_DigCaveChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Hylia_Librari_Item()
  if Hylia_CrackFusion_LibrariNPC()==1 then
    return 1
  else
    return 0
  end
end

Tracker:AddLocations(JsLocations.."Hylia.json")