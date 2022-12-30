function RV_N_Dampe()
  if Sword4()==1 and (has("bombs") or has("flippers") or has("cape")) and has("spinattack") then
    return 1
  else
    return 0
  end
end

function RV_N_Dampe_Y()
  if RV_N_Dampe()==1 and has("lamp") then
    return 1
  else
    return 0
  end
end
function RV_N_Dampe_B()
  if Sword4()==1 and (has("bombs") or has("flippers") or has("cape")) and has("spinattack") then
    return 1
  else
    return 0
  end
end