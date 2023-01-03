function Town_N_Fountain_Mulldozers()
  if Town_Fountain_BigChest()==1 then
    return 1
  else
    return 0
  end
end

function Town_N_Fountain_SmallChest()
  if Town_Fountain_SmallChest()==1 then
    return 1
  else
    return 0
  end
end

function Town_N_Fountain_HeartPiece()
  if Town_Fountain_HP()==1 then
    return 1
  elseif Town_Fountain_HP()==2 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

