function Json_Ruins_MinishWallHole_HeartPiece()
  if Ruins_MinishCave_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_MinishHole_Chest()
  if Ruins_MinishHome_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_BombableWall_Chest()
  if Ruins_BombCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_ArmosKill_Chest()
  if Ruins_ArmosKill_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_PreFOW_Chest()
  if Ruins_NearFoWFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_4Pillars_Chest()
  if Ruins_PillarsFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_OctoGolden_Kill()
  if Ruins_GoldenOcto()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_MinishCrack_Chest()
  if Ruins_CrackFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_JoyButterfly_Butterfly()
  if Ruins_ButterflyFusion_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_Ruins_Beanstalk_BigChest()
  if Ruins_BeanStalkFusion_BigChest()==1 then
    return 1
  else
    return 0
  end
end
Tracker:AddLocations(JsLocations.."Ruins.json")
