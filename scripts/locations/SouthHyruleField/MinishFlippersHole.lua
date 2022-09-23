function MinishFlippersHole()
  if (Sword1()==1 or has("bombs") or has("lights") or has("lamp")) and has("flippers") and has("boots") then
    return 1
  else
    return 0
  end
end