function Json_Hills_Beanstalk_Chests()
  if Hills_BeanstalkFusion_LeftChest()==1 then
    return 1
  elseif Hills_BeanstalkFusion_LeftChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hills_BeanstalkFusion_LeftChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_Beanstalk_HeartPiece()
  if Hills_BeanstalkFusion_HP()==1 then
    return 1
  elseif Hills_BeanstalkFusion_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hills_BeanstalkFusion_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_Farm_Chest()
  if Hills_Fusion_Chest()==1 then
    return 1
  elseif Hills_Fusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hills_Fusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_RopeGolden_Kill()
  if Hills_GoldenRope()==1 then
    return 1
  elseif Hills_GoldenRope()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hills_GoldenRope()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_BombWall_Chest()
  if Hills_BombCave_Chest()==1 then
    return 1
  elseif Hills_BombCave_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hills_BombCave_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Hills_MittsCave_Rupee()
  if Hills_FarmDigCave_Item()==1 then
    return 1
  elseif Hills_FarmDigCave_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Hills_FarmDigCave_Item()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end
Tracker:AddLocations(JsLocations.."Hills.json")


-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."Beanstalk.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."FarmChest.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."RopeGolden.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. N .."BombableWall.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. R .."FarmRupee.json")