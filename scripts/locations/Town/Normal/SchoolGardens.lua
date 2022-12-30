function Town_N_SchoolGardens_GardenChests()
  if Town_School_Path_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Town_N_SchoolGardens_GardenChests_Y()
  if Town_School_Path_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Town_N_SchoolGardens_GardenChests_B()
  if Town_School_Path_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Town_N_SchoolGardens_HeartPiece()
  if Town_School_Path_HP()==1 then
    return 1
  else
    return 0
  end
end
function Town_N_SchoolGardens_HeartPiece_Y()
  if Town_School_Path_HP()==1 then
    return 1
  else
    return 0
  end
end
function Town_N_SchoolGardens_HeartPiece_B()
  if Town_School_Path_HP()==2 or Town_School_Path_HP()==1 then
    return 1
  else
    return 0
  end
end