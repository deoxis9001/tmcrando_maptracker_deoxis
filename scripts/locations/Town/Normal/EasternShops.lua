function Town_N_EasternShops_Rem()
  if Town_ShoeShop_NPC()==1 then
    return 1
  else
    return 0
  end
end

function Town_N_EasternShops_SimonSimulations()
  if Town_Simulation_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Town_N_EasternShops_FigurineHouse()
  if Town_MusicHouse()==1 then
    return 1
  else
    return 0
  end
end


function Town_N_EasternShops_FigurineHouseHeartPiece()
  if Town_MusicHouse()==1 then
    return 1
  else
    return 1, AccessibilityLevel.Inspect
  end
end
