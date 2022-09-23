function JoyButterfly()
  if NorthwestGraveYellow()==1 and has("lamp") then
    return 1
  else
    return 0
  end
end
function JoyButterflyYellow()
  if Sword4()==1 and (has("bombs") or has("flipper") or has("cape")) and has("spinattack") and has("boots") and has("gravekey") then
    return 1
  else
    return 0
  end
end
