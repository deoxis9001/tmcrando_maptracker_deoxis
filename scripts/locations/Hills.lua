function Json_Hills_Beanstalk_Chests()
  if function_Cached("Hills_BeanstalkFusion_LeftChest")==1 then
    return 1
  elseif function_Cached("Hills_BeanstalkFusion_LeftChest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hills_BeanstalkFusion_LeftChest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_Beanstalk_HeartPiece()
  if function_Cached("Hills_BeanstalkFusion_HP")==1 then
    return 1
  elseif function_Cached("Hills_BeanstalkFusion_HP")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hills_BeanstalkFusion_HP")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_Farm_Chest()
  if function_Cached("Hills_Fusion_Chest")==1 then
    return 1
  elseif function_Cached("Hills_Fusion_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hills_Fusion_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_RopeGolden_Kill()
  if function_Cached("Hills_GoldenRope")==1 then
    return 1
  elseif function_Cached("Hills_GoldenRope")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hills_GoldenRope")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_BombWall_Chest()
  if function_Cached("Hills_BombCave_Chest")==1 then
    return 1
  elseif function_Cached("Hills_BombCave_Chest")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hills_BombCave_Chest")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_MittsCave_Rupee()
  if function_Cached("Hills_FarmDigCave_Item")==1 then
    return 1
  elseif function_Cached("Hills_FarmDigCave_Item")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Hills_FarmDigCave_Item")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end