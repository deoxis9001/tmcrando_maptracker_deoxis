function Json_Clouds_CentralFusion_Fusion()
  if Clouds_Fusion_Center()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_BottomLeftChest_Chest()
  if Clouds_South_RightChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_TopRightFusion_Fusion()
  if Clouds_Fusion_TopRight()==1 then
    return 1
  else
    return 0
  end
end

function Json_WindTribe_WindTribeHouse_1FChests()
  if WindTribe_1F_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_WindTribe_WindTribeHouse_2FChest()
  if WindTribe_2F_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_WindTribe_WindTribeHouse_2FSaveGregal()
  if WindTribe_2F_Gregal_NPC1()==1 then
    return 1
  else
    return 0
  end
end

function Json_WindTribe_WindTribeHouse_2FGregalGift()
  if WindTribe_2F_Gregal_NPC2()==1 then
    return 1
  else
    return 0
  end
end

function Json_WindTribe_WindTribeHouse_3FChests()
  if WindTribe_3F_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_WindTribe_WindTribeHouse_4FChests()
  if WindTribe_4F_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_BottomRightChest_Chest()
  if Clouds_South_RightChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_BottomLeftFusion_Fusion()
  if Clouds_Fusion_BottomLeft()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_BottomRightFusion_Fusion()
  if Clouds_Fusion_BottomRight()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_CenterLeft_Chest()
  if Clouds_South_MiddleChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_CenterRight_Chest()
  if Clouds_South_RightChest()==1 then
    return 1
  else
    return 0
  end
end


function Json_Clouds_KillPiranhasNorth_Kill()
  if Clouds_North_Kill()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_KillPiranhasSouth_Kill()
  if Clouds_South_Kill()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_RightChest_Chest()
  if Clouds_FreeChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_TopLeftFusion_Fusion()
  if Clouds_Fusion_TopLeft()==1 then
    return 1
  else
    return 0
  end
end


function Json_Clouds_TopLeftSouthChest_Chest()
  if Clouds_NorthWest_BottomChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_TopRightDiggingSpot_Digging()
  if Clouds_NorthEast_DigSpot()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_BottomLeftDiggingSpot_Digging()
  if Clouds_South_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_CenterDiggingSpot_Digging()
  if Clouds_South_MiddleDigSpot()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_SouthDiggingSpot_Digging()
  if Clouds_South_RightDigSpot()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_SoutheastNorthDiggingSpot_Digging()
  if Clouds_SouthEast_TopDigSpot()==1 then
    return 1
  else
    return 0
  end
end
function Json_Clouds_SoutheastSouthDiggingSpot_Digging()
  if Clouds_SouthEast_BottomDigSpot()==1 then
    return 1
  else
    return 0
  end
end



function Json_Clouds_TopLeftNorthChests_Chests()
  if Clouds_NorthWest_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Clouds_TopLeftNorthChests_Digging()
  if Clouds_NorthWest_DigSpot()==1 then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."Clouds.json")