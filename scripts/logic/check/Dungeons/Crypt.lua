function Crypt_Gibdo_LeftItem() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1) then
		return 1
	else
		return 0
	end 
end

function Crypt_Gibdo_RightItem() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1) then
		return 1
	else
		return 0
	end 
end

function Crypt_LeftItem() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1  and CryptDoor()==1 ) then
    return 1
	else
		return 0
	end 
end

function Crypt_RightItem() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1  and CryptDoor()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crypt_Prize() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1  and CryptDoor()==1 and CryptBlocks()==1 and CryptPuzzle()==1) then
		return 1
	else
		return 0
	end 
end
