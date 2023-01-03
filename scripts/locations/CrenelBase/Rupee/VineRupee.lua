function CrenelBase_R_VineRupee_rupee()
  if CrenelBase_EntranceVine()==1 then
    return 1
  elseif CrenelBase_EntranceVine()==2 then
    return 1, AccessibilityLevel.SequenceBreak
  else
    return 0
  end
end