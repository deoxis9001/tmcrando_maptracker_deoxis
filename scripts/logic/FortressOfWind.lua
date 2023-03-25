function FoWLeftDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 4 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("fow_smallkey") >= 1 ) then
		return 2
	else
		return 0
	end 
end
function FoWRightDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 2 ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("fow_smallkey") >= 1 and CompleteFortress()==1 and ( CanSplit2()==1 or CanSplit3()==1)) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("fow_smallkey") >= 1 ) then
		return 2
	else
		return 0
	end 
end
function FoWMiddleDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 3 ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("fow_smallkey") >= 2 and CompleteFortress()==1 and ( CanSplit2()==1 or CanSplit3()==1)) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("fow_smallkey") >= 2 ) then
		return 2
	else
		return 0
	end 
end
function FoWLastDoor() 
	if ( Tracker:ProviderCountForCode("fow_smallkey") >= 4 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("fow_smallkey") >= 3 and CompleteFortress()==1 and ( CanSplit2()==1 or CanSplit3()==1)) then
		return 1
	elseif ( Tracker:ProviderCountForCode("fow_smallkey") >= 3 ) then
		return 2
	else
		return 0
	end 
end
function FoWBossDoor() 
	if ( has("fow_bigkey") ) then
		return 1
	elseif ( has("big_key_none") ) then
		return 1
	else
		return 0
	end 
end