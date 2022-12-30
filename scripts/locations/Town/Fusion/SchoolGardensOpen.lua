function Town_F_SchoolGardensOpen_GardenChests()
  if Town_School_Path_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Town_F_SchoolGardensOpen_GardenChests_Y()
  if Town_School_Path_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Town_F_SchoolGardensOpen_GardenChests_B()
  if Town_School_Path_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Town_F_SchoolGardensOpen_HeartPiece()
  if Town_School_Path_HP()==1 then
    return 1
  else
    return 0
  end
end
function Town_F_SchoolGardensOpen_HeartPiece_Y()
  if Town_School_Path_HP()==1 then
    return 1
  else
    return 0
  end
end
function Town_F_SchoolGardensOpen_HeartPiece_B()
  if Town_School_Path_HP()==2 or Town_School_Path_HP()==1 then
    return 1
  else
    return 0
  end
end

function Town_F_SchoolGardensOpen_MinishPathChest()
  if Town_School_PathFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Town_F_SchoolGardensOpen_MinishPathChest_Y()
  if Town_School_PathFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Town_F_SchoolGardensOpen_MinishPathChest_B()
  if Town_School_PathFusion_Chest()==1 then
    return 1
  else
    return 0
  end
end