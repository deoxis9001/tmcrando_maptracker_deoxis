function Json_SouthHyruleField_Tingle_Gift()
  if (SouthField_Tingle_NPC()==1) then
    return 1
  else
    return 0
  end
end

function Json_SouthHyruleField_SmithsHouse_Chests()
  if (Smith_House_Chest()==1 or Smith_Floor_Item1()==1 or Smith_Floor_Item2()==1) then
    return 1
  else
    return 0
  end
end

function Json_SouthHyruleField_MinishFlippersHole_HeartPiece()
  if ( SouthField_MinishSize_WaterHole_HP()==1 ) then
    return 1
  else
    return 0
  end
end

function Json_SouthHyruleField_RupeeCave_Rupees()
	if (SouthField_PuddleFusion_Item()==1) then
    return 1
  else
    return 0
  end
end

function Json_SouthHyruleField_TreeHeartPiece_HeartPiece()
  if SouthField_TreeFusion_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_SouthHyruleField_NearLinksHouseChest_Chest()
  if (SouthField_Fusion_Chest()==1) then
    return 1
  else
    return 0
  end
end

Tracker:AddLocations(JsLocations.."SouthHyruleField.json")