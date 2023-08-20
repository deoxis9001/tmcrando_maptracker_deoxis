function ToDRightBlock() 
	return 1 
end
function ToDLeftBlock() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 and has("tod_bigkey") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("tod_smallkey") >= 1 and hasnot("tod_bigkey") ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( has("small_key_out_on") and Tracker:ProviderCountForCode("tod_smallkey") >= 1 ) then
		return 2
	else
		return 0
	end 
end
function ToDBigDoor() 
	if ( has("tod_bigkey") ) then
		return 1
	elseif ( has("big_key_none") ) then
		return 1
	else
		return 0
	end 
end
function ToDWestDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( has("small_key_out_on") and Tracker:ProviderCountForCode("tod_smallkey") >= 1 ) then
		return 2
	else
		return 0
	end 
end
function ToDDarkDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( has("small_key_out_on") and Tracker:ProviderCountForCode("tod_smallkey") >= 1 ) then
		return 2
	else
		return 0
	end 
end
function ToDEitherDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 3 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( has("small_key_out_on") and Tracker:ProviderCountForCode("tod_smallkey") >= 1 ) then
		return 2
	else
		return 0
	end 
end
function ToDChuDoor() 
	if ( Tracker:ProviderCountForCode("tod_smallkey") >= 4 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( has("small_key_out_on") and Tracker:ProviderCountForCode("tod_smallkey") >= 1 ) then
		return 2
	else
		return 0
	end 
end