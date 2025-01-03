function Beam()
  if has("swordbeam") then
    return 1
  elseif has("perilbeam") then
    return 1
  else
    return 0
  end
end
