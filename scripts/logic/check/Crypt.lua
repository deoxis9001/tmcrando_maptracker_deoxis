function Crypt_Gibdo_LeftItem() 
	if ( CryptDungeons()==1 and ( HasDamageSource()==1 or has("lamp") ) ) then
		return 1
	else
		return 0
	end 
end

function Crypt_Gibdo_RightItem() 
	if ( CryptDungeons()==1 and ( HasDamageSource()==1 or has("lamp") ) ) then
		return 1
	else
		return 0
	end 
end

function Crypt_LeftItem() 
	if ( CryptDungeons()==1 and CryptDoor()==1 and CanSplit3()==1 ) then
    return 1
	else
		return 0
	end 
end

function Crypt_RightItem() 
	if ( CryptDungeons()==1 and CryptDoor()==1 and CanSplit3()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crypt_Prize() 
	if ( CryptDungeons()==1 and CryptDoor()==1 and CryptBlocks()==1 and CryptPuzzle()==1 ) then
		return 1
	else
		return 0
	end 
end
