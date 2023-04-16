function Json_Falls_UpperCave_BombWallChest()
 if function_Cached("Falls_TopCave_BombWall_Chest")==1 then
  return 1
 elseif function_Cached("Falls_TopCave_BombWall_Chest")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_TopCave_BombWall_Chest")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_UpperCave_FreestandingChest()
 if function_Cached("Falls_TopCave_Chest")==1 then
  return 1
 elseif function_Cached("Falls_TopCave_Chest")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_TopCave_Chest")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_UpperCave_DownstairsRupees()
 if function_Cached("Falls_RupeeCave_Item")==1 then
  return 1
 elseif function_Cached("Falls_RupeeCave_Item")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_RupeeCave_Item")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_UpperCave_UnderwaterRupees()
 if function_Cached("Falls_RupeeCave_Underwater")==1 then
  return 1
 elseif function_Cached("Falls_RupeeCave_Underwater")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_RupeeCave_Underwater")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_SouthDiggingSpot_Digging()
 if function_Cached("Falls_SouthDigSpot")==1 then
  return 1
 elseif function_Cached("Falls_SouthDigSpot")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_SouthDigSpot")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_UpperRocks_Digging()
 if function_Cached("Falls_NorthDigSpot")==1 then
  return 1
 elseif function_Cached("Falls_NorthDigSpot")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_NorthDigSpot")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_UpperRocks_Chest()
 if function_Cached("Falls_RockFusion_Chest")==1 then
  return 1
 elseif function_Cached("Falls_RockFusion_Chest")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_RockFusion_Chest")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_UpperWaterfall_HeartPiece()
 if function_Cached("Falls_WaterfallFusion_HP")==1 then
  return 1
 elseif function_Cached("Falls_WaterfallFusion_HP")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_WaterfallFusion_HP")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_FusionDiggingCave_HeartPiece()
 if function_Cached("Falls_WaterDigCaveFusion_HP")==1 then
  return 1
 elseif function_Cached("Falls_WaterDigCaveFusion_HP")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_WaterDigCaveFusion_HP")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_FusionDiggingCave_Chest()
 if function_Cached("Falls_WaterDigCaveFusion_Chest")==1 then
  return 1
 elseif function_Cached("Falls_WaterDigCaveFusion_Chest")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_WaterDigCaveFusion_Chest")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_TektiteGolden_Kill()
 if function_Cached("Falls_GoldenTektite")==1 then
  return 1
 elseif function_Cached("Falls_GoldenTektite")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_GoldenTektite")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_HeartPiece_HeartPiece()
 if function_Cached("Falls_Entrance_HP")==1 then
  return 1
 elseif function_Cached("Falls_Entrance_HP")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_Entrance_HP")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_SourceFlowCave_Fusion()
 if function_Cached("FallsFusion")==1 then
  return 1
 elseif function_Cached("FallsFusion")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("FallsFusion")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_SourceFlowCave_FirstChest()
 if function_Cached("Falls_1stCave_Chest")==1 then
  return 1
 elseif function_Cached("Falls_1stCave_Chest")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_1stCave_Chest")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end

function Json_Falls_SourceFlowCave_SecondChest()
 if function_Cached("Falls_Cliff_Chest")==1 then
  return 1
 elseif function_Cached("Falls_Cliff_Chest")==2 then
  return 1, AccessibilityLevel.SequenceBreak
 elseif function_Cached("Falls_Cliff_Chest")==3 then
  return 1, AccessibilityLevel.Inspect
 else
  return 0
 end
end