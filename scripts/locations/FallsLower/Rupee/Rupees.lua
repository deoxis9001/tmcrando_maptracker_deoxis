function FallsLower_R_SouthVeilFallsRupees_Rupee1()
  if FallsLower_RockItem1()==1 then
    return 1
  elseif FallsLower_RockItem1()==2 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end


function FallsLower_R_SouthVeilFallsRupees_Rupee2()
  if FallsLower_RockItem2()==1 then
    return 1
  elseif FallsLower_RockItem2()==2 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end

function FallsLower_R_SouthVeilFallsRupees_Rupee3()
  if FallsLower_RockItem3()==1 then
    return 1
  elseif FallsLower_RockItem3()==2 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end