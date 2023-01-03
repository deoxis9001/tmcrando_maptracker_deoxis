function Valley_N_Dampe_Dampe()
  if Valley_Dampe_NPC()==1 then
    return 1
  elseif Valley_Dampe_NPC()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  elseif Valley_Dampe_NPC()==3 then
    return 1, AccessibilityLevel.Inspect
  else
    return 0
  end
end