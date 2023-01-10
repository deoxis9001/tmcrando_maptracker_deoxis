function Json_Swamp_DivingSpots_Diving()
  if Swamp_Underwater()==1 then
    return 1
  else
    return 0
  end
end
  
function Json_Swamp_Dojo_Swiftblade()
  if Swamp_Dojo_NPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_Dojo_HeartPiece()
  if Swamp_Dojo_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_SouthLakeCave_chest()
  if Swamp_SouthCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_PlatformChest_Chest()
  if Swamp_CenterChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_NortheastLakeCave_HeartPiece()
  if Swamp_NearWaterfall_CaveHP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_NorthCave_Chest()
  if Swamp_NorthCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_Mulldozers_BigChest()
  if Swamp_Minish_Mulldozer_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_Mulldozers_LeftChest()
  if Swamp_MinishFusion_NorthWestCrack_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_MittsCave_Chests()
  if Swamp_DiggingCave_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_Darknut_Kill()
  if Swamp_CenterCave_DarknutChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_CastorWildsFusions_Fusions()
  if Swamp_Fusion()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_WesternMinishCrack_Chest()
  if Swamp_MinishFusion_WestCrack_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_WaterMinishHole_Chest()
  if Swamp_MinishFusion_WaterHole_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_WaterMinishHole_HeartPiece()
	if Swamp_MinishFusion_WaterHole_HP()==1 then
	  return 1
	else
	  return 0
	end
end

function Json_Swamp_DojoWaterfall_Scarblade()
  if Swamp_WaterfallFusion_DojoNPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_VineMinishCrack_Chest()
  if Swamp_MinishFusion_VineCrack_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_RopeGolden_Kill()
  if Swamp_GoldenRope()==1 then
    return 1
  else
    return 0
  end
end

function Json_Swamp_NorthernMinishCrack_Chest()
  if Swamp_MinishFusion_NorthCrack_Chest()==1 then
    return 1
  else
    return 0
  end
end


function Json_Swamp_Butterfly_JoyButterfly()
  if Swamp_ButterflyFusion_Item()==1 then
    return 1
  else
    return 0
  end
end

Tracker:AddLocations(JsLocations.."Swamp.json")
