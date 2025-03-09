function Json_Dungeon_Crypt_Gibdos()
	if function_Cached("Crypt_Gibdo_LeftItem") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Crypt_Gibdo_LeftItem") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Crypt_Gibdo_LeftItem") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Crypt_OtherGibdos()
	if function_Cached("Crypt_Gibdo_RightItem") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Crypt_Gibdo_RightItem") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Crypt_Gibdo_RightItem") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Crypt_LeftPath()
	if function_Cached("Crypt_LeftItem") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Crypt_LeftItem") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Crypt_LeftItem") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Crypt_RightPath()
	if function_Cached("Crypt_RightItem") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Crypt_RightItem") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Crypt_RightItem") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
function Json_Dungeon_Crypt_KingGustaf()
	if function_Cached("Crypt_Prize") == 1 then
		return AccessibilityLevel.Normal
	elseif function_Cached("Crypt_Prize") == 2 then
		return  AccessibilityLevel.SequenceBreak
	elseif function_Cached("Crypt_Prize") == 3 then
		return  AccessibilityLevel.Inspect
	else
		return AccessibilityLevel.None
	end
end
