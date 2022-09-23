function Dampe()
  if DampeYellow()==1 and has("lamp") then
    return 1
  else
    return 0
  end
end
function DampeYellow()
  if Sword4()==1 and (has("bombs") or has("flipper") or has("cape")) and has("spinattack") then
    return 1
  else
    return 0
  end
end
