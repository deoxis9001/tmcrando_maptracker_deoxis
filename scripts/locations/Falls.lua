function Falls_UpperCave_BombWallChest()
  if Falls_TopCave_BombWall_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Falls_UpperCave_FreestandingChest()
  if Falls_TopCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Falls_UpperCave_DownstairsRupees()
  if Falls_RupeeCave_Item()==1 then
    return 1
  else
    return 0
  end
end

function Falls_UpperCave_UnderwaterRupees()
  if Falls_RupeeCave_Underwater()==1 then
    return 1
  else
    return 0
  end
end

function Falls_SouthDiggingSpot_Digging()
  if Falls_SouthDigSpot()==1 then
    return 1
  else
    return 0
  end
end

function Falls_UpperRocks_Digging()
  if Falls_NorthDigSpot()==1 then
    return 1
  else
    return 0
  end
end

function Falls_UpperRocks_Chest()
  if Falls_RockFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Falls_UpperWaterfall_HeartPiece()
  if Falls_WaterfallFusion_HP()==1 then
    return 1
  else
    return 0
  end
end

function Falls_FusionDiggingCave_HeartPiece()
  if Falls_WaterDigCaveFusion_HP()==1 then
    return 1
  else
    return 0
  end
end

function Falls_FusionDiggingCave_Chest()
  if Falls_WaterDigCaveFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Falls_TektiteGolden_Kill()
  if Falls_GoldenTektite()==1 then
    return 1
  else
    return 0
  end
end

function Falls_HeartPiece_HeartPiece()
  if Falls_Entrance_HP()==1 then
    return 1
  else
    return 0
  end
end

function Falls_SourceFlowCave_Fusion()
  if FallsFusion()==1 then
    return 1
  else
    return 0
  end
end

function Falls_SourceFlowCave_FirstChest()
  if Falls_1stCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Falls_SourceFlowCave_SecondChest()
  if Falls_Cliff_Chest()==1 then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."Falls.json")