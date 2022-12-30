function RV_N_LostWoodsSecretChest()
  if Sword4()==1 and (has("bombs") or has("flippers") or has("cape")) and has("spinattack") then
    return 1
  else
    return 0
  end
end
function RV_N_LostWoodsSecretChest_Y()
  if RV_N_LostWoodsSecretChest()==1 and has("lamp") then
    return 1
  else
    return 0
  end
end
function RV_N_LostWoodsSecretChest_B()
  if Sword4()==1 and (has("bombs") or has("flippers") or has("cape")) and has("spinattack") then
    return 1
  else
    return 0
  end
end
