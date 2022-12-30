function RV_N_NorthwestGrave()
  if Sword4()==1 and (has("bombs") or has("flippers") or has("cape")) and has("spinattack") and has("boots") and has("gravekey") then
    return 1
  else
    return 0
  end
end
function RV_N_NorthwestGrave_Y()
  if RV_N_NorthwestGrave()==1 and has("lamp") then
    return 1
  else
    return 0
  end
end
function RV_N_NorthwestGrave_B()
  if Sword4()==1 and (has("bombs") or has("flippers") or has("cape")) and has("spinattack") and has("boots") and has("gravekey") then
    return 1
  else
    return 0
  end
end
