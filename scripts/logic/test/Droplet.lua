function ToDRightBlock() 
	return 1 
end
function ToDLeftBlock() 
	if ( has("tod_bigkey") and Tracker:ProviderCountForCode("tod_smallkey") >= 4 )  then
		return 1
	elseif ( hasnot("tod_bigkey") and Tracker:ProviderCountForCode("tod_smallkey") >= 1 ) then
		return 1
	elseif ( ( has("big_key_vanilla") or has("small_key_vanilla") ) and Tracker:ProviderCountForCode("tod_smallkey") >= 1 ) then
		return 1
	else
		return 0
	end 
end
function ToDBigDoor() 
	if ( has("tod_bigkey") ) then
		return 1
	else
		return 0
	end 
end
function ToDWestDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end
function ToDDarkDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end
function ToDEitherDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 3 ) then
		return 1
	else
		return 0
	end 
end
function ToDChuDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end