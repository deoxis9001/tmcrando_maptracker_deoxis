DirWorld="Dungeons/CaveOfFlame/"

function Dungeon_CaveOfFlame_SpinyBeetleFight()
  if CoF_1F_SpikeBeetle_BigChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_SpinyBeetleFight_Y()
  if CoF_1F_SpikeBeetle_BigChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_SpinyBeetleFight_B()
  if CoF_1F_SpikeBeetle_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_Rupees()
  if CoF_1F_Item()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_Rupees_Y()
  if CoF_1F_Item()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_Rupees_B()
  if CoF_1F_Item()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_BigChestRoom()
  if CoF_B1_HazyRoom_BigChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_BigChestRoom_Y()
  if CoF_B1_HazyRoom_BigChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_BigChestRoom_B()
  if CoF_B1_HazyRoom_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_FirstRollobiteRoom()
  if CoF_B1_Rollobite_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_FirstRollobiteRoom_Y()
  if CoF_B1_Rollobite_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_FirstRollobiteRoom_B()
  if CoF_B1_Rollobite_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_BombableWallHeartPiece()
  if CoF_B1_HP()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_BombableWallHeartPiece_Y()
  if CoF_B1_HP()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_BombableWallHeartPiece_B()
  if CoF_B1_HP()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_SpinyChuFight()
  if CoF_B1_SpikeyChus_BigChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_SpinyChuFight_Y()
  if CoF_B1_SpikeyChus_BigChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_SpinyChuFight_B()
  if CoF_B1_SpikeyChus_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_SpinyChuPillarChest()
  if CoF_B1_SpikeyChus_PillarChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_SpinyChuPillarChest_Y()
  if CoF_B1_SpikeyChus_PillarChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_SpinyChuPillarChest_B()
  if CoF_B1_SpikeyChus_PillarChest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_PreLavaBasementRoom()
  if CoF_B2_PreLava_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_PreLavaBasementRoom_Y()
  if CoF_B2_PreLava_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_PreLavaBasementRoom_B()
  if CoF_B2_PreLava_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_BladeChest()
  if CoF_B2_LavaRoom_BladeChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_BladeChest_Y()
  if CoF_B2_LavaRoom_BladeChest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_BladeChest_B()
  if CoF_B2_LavaRoom_BladeChest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_LavaBasement()
  if CoF_B2_LavaRoom_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_LavaBasement_Y()
  if CoF_B2_LavaRoom_Chest()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_LavaBasement_B()
  if CoF_B2_LavaRoom_Chest()==1 then
    return 1
  else
    return 0
  end
end

function Dungeon_CaveOfFlame_LavaBasementBigChest()
  if CoF_B2_LavaRoom_BigChest()==1 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 1
  end
end
function Dungeon_CaveOfFlame_LavaBasementBigChest_Y()
  if CoF_B2_LavaRoom_BigChest()==1 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0, AccessibilityLevel.SequenceBreak
  end
end
function Dungeon_CaveOfFlame_LavaBasementBigChest_B()
  if CoF_B2_LavaRoom_BigChest()==1 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0, AccessibilityLevel.SequenceBreak
  end
end

function Dungeon_CaveOfFlame_Gleerok()
  if CoF_BossItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_Gleerok_Y()
  if CoF_BossItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_CaveOfFlame_Gleerok_B()
  if CoF_BossItem()==1 then
    return 1
  else
    return 0
  end
end


Tracker:AddLocations(JsLocations..""..DirWorld.."".. N .."CaveOfFlame.json")
Tracker:AddLocations(JsLocations..""..DirWorld.."".. R .."CaveOfFlame.json")
Tracker:AddLocations(JsLocations..""..DirWorld.."Map/CaveOfFlame.json")

