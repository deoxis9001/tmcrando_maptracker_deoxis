-- DirWorld="Dungeons/Crypt/"

function Json_Dungeon_Crypt_Gibdos()
  if Crypt_Gibdo_LeftItem()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Crypt_OtherGibdos()
  if Crypt_Gibdo_RightItem()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Crypt_LeftPath()
  if Crypt_LeftItem()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Crypt_RightPath()
  if Crypt_RightItem()==1 then
    return 1
  else
    return 0
  end
end

function Json_Dungeon_Crypt_KingGustaf()
  if Crypt_Prize()==1 then
    return 1
  else
    return 0
  end
end

-- Tracker:AddLocations(JsLocations..""..DirWorld.."Normal/Crypt.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."Map/Crypt.json")
