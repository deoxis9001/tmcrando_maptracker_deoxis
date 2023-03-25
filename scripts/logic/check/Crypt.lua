function Crypt_Gibdo_LeftItem() 
	if ( CryptDungeons()==1 and ( HasDamageSource()==1 or has("lamp") ) ) then
		return 1
	elseif ( ( CryptDungeons()==1 or CryptDungeons()==2 ) and ( ( HasDamageSource()==1 or HasDamageSource()==2 ) or has("lamp") ) ) then
		return 2
	else
		return 0
	end 
end

function Crypt_Gibdo_RightItem() 
	if ( CryptDungeons()==1 and ( HasDamageSource()==1 or has("lamp") ) ) then
		return 1
	elseif ( ( CryptDungeons()==1 or CryptDungeons()==2 ) and ( ( HasDamageSource()==1 or HasDamageSource()==2 ) or has("lamp") ) ) then
		return 2
	else
		return 0
	end 
end

function Crypt_LeftItem() 
	if ( CryptDungeons()==1 and CryptDoor()==1 and CanSplit3()==1 ) then
		return 1
	elseif ( ( CryptDungeons()==1 or CryptDungeons()==2 ) and CryptDoor()==1 and CanSplit3()==1 ) then
		return 2
	else
		return 0
	end 
end

function Crypt_RightItem() 
	if ( CryptDungeons()==1 and CryptDoor()==1 and CanSplit3()==1 ) then
		return 1
	elseif ( ( CryptDungeons()==1 or CryptDungeons()==2 ) and CryptDoor()==1 and CanSplit3()==1 ) then
		return 2
	else
		return 0
	end 
end

function Crypt_Prize() 
	if ( CryptDungeons()==1 and CryptDoor()==1 and CryptBlocks()==1 and CryptPuzzle()==1 ) then
		return 1
	elseif ( ( CryptDungeons()==1 or CryptDungeons()==2 ) and CryptDoor()==1 and CryptBlocks()==1 and ( CryptPuzzle()==1 or CryptPuzzle()==2 ) ) then
		return 2
	else
		return 0
	end 
end
