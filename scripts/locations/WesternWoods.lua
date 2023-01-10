function Json_WesternWoods_Beanstalk_Chest()
  if WesternWoods_BeanstalkFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_Beanstalk_Rupees()
  if WesternWoods_BeanstalkFusion_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_SouthDigging_BuriedTreasure()
  if WesternWoods_BottomDig()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_NorthDigging_BuriedTreasure()
  if WesternWoods_TopDig()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_Tree_HeartPiece()
  if WesternWoods_TreeFusion_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_WesternWoodChest_FreestandingChest()
  if WesternWoods_FusionChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_Percy_MoblinReward()
  if WesternWoods_PercyFusion_Moblin()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_Percy_PercyReward()
  if WesternWoods_PercyFusion_Percy()==1 then
    return 1
  else
    return 0
  end
end

function Json_WesternWoods_OctoGolden_Kill()
  if WesternWoods_GoldenOcto()==1 then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."WesternWoods.json")