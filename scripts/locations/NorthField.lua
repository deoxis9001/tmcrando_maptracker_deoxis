function Json_NorthField_DiggingSpot_Digging()
  if NorthField_DigSpot()==1 then
    return 1
  else
    return 0
  end
end

function Json_NorthField_Cave_HeartPiece()
  if NorthField_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_NorthField_DojoWaterfall_Greatblade()
  if NorthField_WaterfallFusion_DojoNPC()==1 then
    return 1
  else
    return 0
  end
end

function Json_NorthField_TopRightTree_Chest()
  if NorthField_TreeFusion_TopRightChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_NorthField_TopLeftTree_Chest()
  if NorthField_TreeFusion_TopLeftChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_NorthField_BottomRightTree_Chest()
  if NorthField_TreeFusion_BottomRightChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_NorthField_BottomLeftTree_Chest()
  if NorthField_TreeFusion_BottomLeftChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_NorthField_TingleChest_BigChest()
  if NorthField_TreeFusion_CenterBigChest()==1 then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations.."NorthField.json")
