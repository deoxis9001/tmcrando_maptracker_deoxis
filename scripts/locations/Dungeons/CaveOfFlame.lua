DirWorld="Dungeons/CaveOfFlame/"

function Json_Dungeon_CaveOfFlame_SpinyBeetleFight()
  if CoF_1F_SpikeBeetle_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_Rupees()
  if CoF_1F_Item()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_BigChestRoom()
  if CoF_B1_HazyRoom_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_FirstRollobiteRoom()
  if CoF_B1_Rollobite_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_BombableWallHeartPiece()
  if CoF_B1_HP()==1 then
    return 1
  elseif CoF_B1_HP()==2 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_SpinyChuFight()
  if CoF_B1_SpikeyChus_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_SpinyChuPillarChest()
  if CoF_B1_SpikeyChus_PillarChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_PreLavaBasementRoom()
  if CoF_B2_PreLava_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_BladeChest()
  if CoF_B2_LavaRoom_BladeChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_LavaBasement()
  if CoF_B2_LavaRoom_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_LavaBasementBigChest()
  if CoF_B2_LavaRoom_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_CaveOfFlame_Gleerok()
  if CoF_BossItem()==1 then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations..""..DirWorld.."Normal/CaveOfFlame.json")
Tracker:AddLocations(JsLocations..""..DirWorld.."Rupee/CaveOfFlame.json")
Tracker:AddLocations(JsLocations..""..DirWorld.."Map/CaveOfFlame.json")

