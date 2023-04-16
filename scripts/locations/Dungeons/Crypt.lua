-- DirWorld="Dungeons/Crypt/"

function Json_Dungeon_Crypt_Gibdos()
  if function_Cached("Crypt_Gibdo_LeftItem")==1 then
    return 1
  elseif function_Cached("Crypt_Gibdo_LeftItem")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crypt_Gibdo_LeftItem")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Dungeon_Crypt_OtherGibdos()
  if function_Cached("Crypt_Gibdo_RightItem")==1 then
    return 1
  elseif function_Cached("Crypt_Gibdo_RightItem")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crypt_Gibdo_RightItem")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Dungeon_Crypt_LeftPath()
  if function_Cached("Crypt_LeftItem")==1 then
    return 1
  elseif function_Cached("Crypt_LeftItem")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crypt_LeftItem")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Dungeon_Crypt_RightPath()
  if function_Cached("Crypt_RightItem")==1 then
    return 1
  elseif function_Cached("Crypt_RightItem")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crypt_RightItem")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function Json_Dungeon_Crypt_KingGustaf()
  if function_Cached("Crypt_Prize")==1 then
    return 1
  elseif function_Cached("Crypt_Prize")==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif function_Cached("Crypt_Prize")==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

-- Tracker:AddLocations(JsLocations..""..DirWorld.."Normal/Crypt.json")
-- Tracker:AddLocations(JsLocations..""..DirWorld.."Map/Crypt.json")

