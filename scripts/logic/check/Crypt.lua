function Crypt_Gibdo_LeftItem()
	if (function_Cached("CryptDungeons") == 1 and (function_Cached("HasDamageSource") == 1 or has("lamp"))) then
		return 1
	elseif
		((function_Cached("CryptDungeons") == 1 or function_Cached("CryptDungeons") == 2) and
			((function_Cached("HasDamageSource") == 1 or function_Cached("HasDamageSource") == 2) or has("lamp")))
	 then
		return 2
	elseif (function_Cached("CryptDungeons") == 1 or function_Cached("CryptDungeons") == 2) then
		return 3
	else
		return 0
	end
end

function Crypt_Gibdo_RightItem()
	if (function_Cached("CryptDungeons") == 1 and (function_Cached("HasDamageSource") == 1 or has("lamp"))) then
		return 1
	elseif
		((function_Cached("CryptDungeons") == 1 or function_Cached("CryptDungeons") == 2) and
			((function_Cached("HasDamageSource") == 1 or function_Cached("HasDamageSource") == 2) or has("lamp")))
	 then
		return 2
	elseif (function_Cached("CryptDungeons") == 1 or function_Cached("CryptDungeons") == 2) then
		return 3
	else
		return 0
	end
end

function Crypt_LeftItem()
	if (function_Cached("CryptDungeons") == 1 and function_Cached("CryptDoor") == 1 and function_Cached("CanSplit3") == 1) then
		return 1
	elseif
		((function_Cached("CryptDungeons") == 1 or function_Cached("CryptDungeons") == 2) and
			function_Cached("CryptDoor") == 1 and
			function_Cached("CanSplit3") == 1)
	 then
		return 2
	else
		return 0
	end
end

function Crypt_RightItem()
	if (function_Cached("CryptDungeons") == 1 and function_Cached("CryptDoor") == 1 and function_Cached("CanSplit3") == 1) then
		return 1
	elseif
		((function_Cached("CryptDungeons") == 1 or function_Cached("CryptDungeons") == 2) and
			function_Cached("CryptDoor") == 1 and
			function_Cached("CanSplit3") == 1)
	 then
		return 2
	else
		return 0
	end
end

function Crypt_Prize()
	if
		(function_Cached("CryptDungeons") == 1 and function_Cached("CryptDoor") == 1 and function_Cached("CryptBlocks") == 1 and
			function_Cached("CryptPuzzle") == 1)
	 then
		return 1
	elseif
		((function_Cached("CryptDungeons") == 1 or function_Cached("CryptDungeons") == 2) and
			function_Cached("CryptDoor") == 1 and
			function_Cached("CryptBlocks") == 1 and
			(function_Cached("CryptPuzzle") == 1 or function_Cached("CryptPuzzle") == 2))
	 then
		return 2
	else
		return 0
	end
end
