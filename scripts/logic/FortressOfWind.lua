function FoWLeftDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end
function FoWRightDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 2 ) then
		return 1
	else
		return 0
	end 
end
function FoWMiddleDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 3 ) then
		return 1
	else
		return 0
	end 
end
function FoWLastDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end
function FoWBossDoor() 
	if ( has("fow_bigkey") ) then
		return 1
	else
		return 0
	end 
end