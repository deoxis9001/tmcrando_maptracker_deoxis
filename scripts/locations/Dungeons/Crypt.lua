DirWorld="Dungeons/Crypt/"

function Dungeon_N_Crypt_Gibdos()
  if Crypt_Gibdo_LeftItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_Gibdos_Y()
  if Crypt_Gibdo_LeftItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_Gibdos_B()
  if Crypt_Gibdo_LeftItem()==1 then
    return 1
  else
    return 0
  end
end



function Dungeon_N_Crypt_OtherGibdos()
  if Crypt_Gibdo_RightItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_OtherGibdos_Y()
  if Crypt_Gibdo_RightItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_OtherGibdos_B()
  if Crypt_Gibdo_RightItem()==1 then
    return 1
  else
    return 0
  end
end



function Dungeon_N_Crypt_LeftPath()
  if Crypt_LeftItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_LeftPath_Y()
  if Crypt_LeftItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_LeftPath_B()
  if Crypt_LeftItem()==1 then
    return 1
  else
    return 0
  end
end



function Dungeon_N_Crypt_RightPath()
  if Crypt_RightItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_RightPath_Y()
  if Crypt_RightItem()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_RightPath_B()
  if Crypt_RightItem()==1 then
    return 1
  else
    return 0
  end
end



function Dungeon_N_Crypt_KingGustaf()
  if Crypt_Prize()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_KingGustaf_Y()
  if Crypt_Prize()==1 then
    return 1
  else
    return 0
  end
end
function Dungeon_N_Crypt_KingGustaf_B()
  if Crypt_Prize()==1 then
    return 1
  else
    return 0
  end
end

Tracker:AddLocations(JsLocations..""..DirWorld.."".. N .."Crypt.json")
Tracker:AddLocations(JsLocations..""..DirWorld.."Map/Crypt.json")

