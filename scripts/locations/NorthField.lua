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


-- DirWorld="NorthField/"

-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."BottomLeftTree.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."BottomRightTree.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."TopLeftTree.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."TopRightTree.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."Waterfall.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. F .."4TreesDone.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. N .."CaveHeartPiece.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."".. O .."DiggingSpot.json")

