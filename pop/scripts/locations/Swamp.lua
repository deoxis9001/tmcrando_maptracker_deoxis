function Json_Swamp_DivingSpots_Diving()
  if function_Cached("Swamp_Underwater") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_Underwater") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_Underwater") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_Dojo_Swiftblade()
  if function_Cached("Swamp_Dojo_NPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_Dojo_NPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_Dojo_NPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_Dojo_HeartPiece()
  if function_Cached("Swamp_Dojo_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_Dojo_HP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_Dojo_HP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_SouthLakeCave_chest()
  if function_Cached("Swamp_SouthCave_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_SouthCave_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_SouthCave_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_PlatformChest_Chest()
  if function_Cached("Swamp_CenterChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_CenterChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_CenterChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_NortheastLakeCave_HeartPiece()
  if function_Cached("Swamp_NearWaterfall_CaveHP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_NearWaterfall_CaveHP") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_NearWaterfall_CaveHP") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_NorthCave_Chest()
  if function_Cached("Swamp_NorthCave_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_NorthCave_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_NorthCave_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_Mulldozers_BigChest()
  if function_Cached("Swamp_Minish_Mulldozer_BigChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_Minish_Mulldozer_BigChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_Minish_Mulldozer_BigChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_Mulldozers_LeftChest()
  if function_Cached("Swamp_MinishFusion_NorthWestCrack_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_MinishFusion_NorthWestCrack_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_MinishFusion_NorthWestCrack_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_MittsCave_Chests()
  if function_Cached("Swamp_DiggingCave_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_DiggingCave_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_DiggingCave_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_Darknut_Kill()
  if function_Cached("Swamp_CenterCave_DarknutChest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_CenterCave_DarknutChest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_CenterCave_DarknutChest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_CastorWildsFusions_Fusions()
  if function_Cached("Swamp_Fusion") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_Fusion") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_Fusion") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_WesternMinishCrack_Chest()
  if function_Cached("Swamp_MinishFusion_WestCrack_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_MinishFusion_WestCrack_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_MinishFusion_WestCrack_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_WaterMinishHole_Chest()
  if function_Cached("Swamp_MinishFusion_WaterHole_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_MinishFusion_WaterHole_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_MinishFusion_WaterHole_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_WaterMinishHole_HeartPiece()
  if function_Cached("Swamp_MinishFusion_WaterHole_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_MinishFusion_WaterHole_HP") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_MinishFusion_WaterHole_HP") == 1 then
    return AccessibilityLevel.Normal
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_DojoWaterfall_Scarblade()
  if function_Cached("Swamp_WaterfallFusion_DojoNPC") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_WaterfallFusion_DojoNPC") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_WaterfallFusion_DojoNPC") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_VineMinishCrack_Chest()
  if function_Cached("Swamp_MinishFusion_VineCrack_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_MinishFusion_VineCrack_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_MinishFusion_VineCrack_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_RopeGolden_Kill()
  if function_Cached("Swamp_GoldenRope") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_GoldenRope") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_GoldenRope") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_NorthernMinishCrack_Chest()
  if function_Cached("Swamp_MinishFusion_NorthCrack_Chest") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_MinishFusion_NorthCrack_Chest") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_MinishFusion_NorthCrack_Chest") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end

function Json_Swamp_Butterfly_JoyButterfly()
  if function_Cached("Swamp_ButterflyFusion_Item") == 1 then
    return AccessibilityLevel.Normal
  elseif function_Cached("Swamp_ButterflyFusion_Item") == 2 then
    return  AccessibilityLevel.SequenceBreak
  elseif function_Cached("Swamp_ButterflyFusion_Item") == 3 then
    return  AccessibilityLevel.Inspect
  else
    return AccessibilityLevel.None
  end
end
