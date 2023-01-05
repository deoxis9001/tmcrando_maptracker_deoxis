function Json_Dungeon_Fortress_EntranceFarLeft()
  if Fortress_Entrance_1F_LeftChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_WizzrobeFight()
  if Fortress_Entrance_1F_LeftWizrobeChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_EntranceLargeRupee()
  if Deepwood_1F_SlugTorches_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_EntranceLargeRupee()
  if Fortress_Entrance_1F_RightItem()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_LeftSideMittsChests()
  if Fortress_Left_2F_DigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_LeftSideRupees()
  if Fortress_Left_2F_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_Eyegores()
  if Fortress_Left_3F_Eyegore_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_LeftSideKeyDrop()
  if Fortress_Left_3F_ItemDrop()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_RightSideTwoLeverRoom()
  if Fortress_Right_2F_LeftChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_RightSideMittsChests()
  if Fortress_Right_2F_DigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_RightSideKeyDrop()
  if Fortress_Right_3F_ItemDrop()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_RightSideHeartPiece()
  if Fortress_Entrance_1F_RightHP()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_PedestalChest()
  if Fortress_Middle_2F_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_CenterPathSwitch()
  if Fortress_Middle_2F_StatueChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_BombableWallBigChest()
  if Deepwood_1F_SlugTorches_Chest()==1 then
    return 1
  else
    return 0
  end
end
--ici
function Json_Dungeon_Fortress_BombableWallBigChest()
  if Fortress_BackLeft_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_BombableWallSmallChest()
  if Fortress_BackLeft_SmallChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_ClonePuzzleKeyDrop()
  if Fortress_BackRight_Statue_ItemDrop()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_MinishDirtRoomKeyDrop()
  if Fortress_BackRight_Minish_ItemDrop()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_RightSideMoldormTopPot()
  if Fortress_BackRight_DigRoom_TopPot()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_RightSideMoldormBottomPot()
  if Fortress_BackRight_DigRoom_BottomPot()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_SkullRoomChest()
  if Fortress_BackRight_BigChest()==1 then
    return 1
  else
    return 0
  end
end


function Json_Dungeon_Fortress_Mazaal()
  if Fortress_BossItem()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Fortress_FOWReward()
  if Fortress_Prize()==1 then
    return 1
  else
    return 0
  end
end
