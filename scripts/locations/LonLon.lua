DirWorld="LonLon/"

function Json_LonLon_DiggingSpot_Digging()
  if LonLon_DigSpot()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_MalonPot_Pot()
  if LonLon_RanchPot()==1 then
    return 1
  else
    return 0
  end
end

function LonLon_MinishCrack_Chest()
  if LonLon_NorthMinishCrack_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_Cave_Chest()
  if LonLon_Cave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_Cave_HiddenChest()
  if LonLon_CaveSecret_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_BonktheTree_HeartPiece()
  if LonLon_Path_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_BonktheTree_Chest()
  if LonLon_Path_FusionChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_DriedUpPond_BigChest()
  if LonLon_PuddleFusion_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_GoronQuest_Chest()
  if LonLon_GoronCaveFusion_SmallChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_LonLon_GoronQuest_BigChest()
  if LonLon_GoronCaveFusion_BigChest()==1 then
    return 1
  else
    return 0
  end
end

Tracker:AddLocations(JsLocations.."Lonlon.json")
