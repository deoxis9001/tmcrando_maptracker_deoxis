DirWorld="Dungeons/Deepwood/"

function Json_Dungeon_Deepwood_SlugRoom()
  if Deepwood_1F_SlugTorches_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_UpstairsChest()
  if Deepwood_2F_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_BarrelRoomNorthwest()
  if Deepwood_1F_BarrelRoom_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_WestSideBigChest()
  if Deepwood_1F_West_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_TwoStatueRoom()
  if Deepwood_1F_West_StatuePuzzle_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_MulldozerKey()
  if Deepwood_1F_East_MulldozerFight_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_TwoLampChest()
  if Deepwood_1F_NorthEast_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_BasementSwitchRoomBigChest()
  if Deepwood_B1_SwitchRoom_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_BasementSwitchChest()
  if Deepwood_B1_SwitchRoom_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_BlueWarpHeartPiece()
  if Deepwood_1F_BlueWarp_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_PuffstoolRoom()
  if Deepwood_1F_BlueWarp_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_MadderpillarChest()
  if Deepwood_1F_Madderpillar_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_MadderpillarHeartPiece()
  if Deepwood_1F_Madderpillar_HP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_BasementBigChest()
  if Deepwood_B1_West_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Deepwood_GreenChu()
  if Deepwood_BossItem()==1 then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations..""..DirWorld.."".. N .."Deepwood.json")
Tracker:AddLocations(JsLocations..""..DirWorld.."Map/Deepwood.json")

