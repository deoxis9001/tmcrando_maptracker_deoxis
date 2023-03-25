function Json_WesternWoods_Beanstalk_Chest()
  if WesternWoods_BeanstalkFusion_Chest()==1 then
    return 1
  elseif WesternWoods_BeanstalkFusion_Chest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_BeanstalkFusion_Chest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_Beanstalk_Rupees()
  if WesternWoods_BeanstalkFusion_Item()==1 then
    return 1
  elseif WesternWoods_BeanstalkFusion_Item()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_BeanstalkFusion_Item()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_SouthDigging_BuriedTreasure()
  if WesternWoods_BottomDig()==1 then
    return 1
  elseif WesternWoods_BottomDig()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_BottomDig()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_NorthDigging_BuriedTreasure()
  if WesternWoods_TopDig()==1 then
    return 1
  elseif WesternWoods_TopDig()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_TopDig()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_Tree_HeartPiece()
  if WesternWoods_TreeFusion_HP()==1 then
    return 1
  elseif WesternWoods_TreeFusion_HP()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_TreeFusion_HP()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_WesternWoodChest_FreestandingChest()
  if WesternWoods_FusionChest()==1 then
    return 1
  elseif WesternWoods_FusionChest()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_FusionChest()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_Percy_MoblinReward()
  if WesternWoods_PercyFusion_Moblin()==1 then
    return 1
  elseif WesternWoods_PercyFusion_Moblin()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_PercyFusion_Moblin()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_Percy_PercyReward()
  if WesternWoods_PercyFusion_Percy()==1 then
    return 1
  elseif WesternWoods_PercyFusion_Percy()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_PercyFusion_Percy()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_WesternWoods_OctoGolden_Kill()
  if WesternWoods_GoldenOcto()==1 then
    return 1
  elseif WesternWoods_GoldenOcto()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif WesternWoods_GoldenOcto()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."WesternWoods.json")