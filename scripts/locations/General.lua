function Json_General_FusionsSharedRedV_Fuzer()
	if FusionsRedNumber("redV")==1 then
		return 1
	elseif FusionsRedNumber("redV")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif FusionsRedNumber("redV")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_General_FusionsSharedBlueS_Fuzer()
	if FusionsBlueNumber("blueS")==1 then
		return 1
	elseif FusionsBlueNumber("blueS")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif FusionsBlueNumber("blueS")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_General_FusionsSharedGreenC_Fuzer()
	if FusionsGreenNumber("greenC")==1 then
		return 1
	elseif FusionsGreenNumber("greenC")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif FusionsGreenNumber("greenC")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_General_FusionsSharedGreenG_Fuzer()
	if FusionsGreenNumber("greenG")==1 then
		return 1
	elseif FusionsGreenNumber("greenC")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif FusionsGreenNumber("greenC")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
function Json_General_FusionsSharedGreenP_Fuzer()
	if FusionsGreenNumber("greenP")==1 then
		return 1
	elseif FusionsGreenNumber("greenP")==2 then
		return 1, AccessibilityLevel.SequenceBreak
	elseif FusionsGreenNumber("greenP")==3 then
		return 1, AccessibilityLevel.Inspect
	else
		return 0
	end
end
