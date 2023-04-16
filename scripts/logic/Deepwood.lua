function Deepwood1stDoor() 
	if ( Tracker:ProviderCountForCode("dws_smallkey") >= 1 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	else
		return 0
	end 
end
function Deepwood2ndDoor() 
	if ( Tracker:ProviderCountForCode("dws_smallkey") >= 4 ) then
		return 1
	elseif (has("small_key_vanilla") and Tracker:ProviderCountForCode("dws_smallkey") >= 2 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("dws_smallkey") >= 2 ) then
		return 2
	else
		return 0
	end 
end
function DeepwoodMadderpillarDoor() 
	if ( function_Cached("DeepwoodMadderpillarWeb")==1 or Tracker:ProviderCountForCode("dws_smallkey") >= 4 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("dws_smallkey") >= 3 ) then
		return 2
	else
		return 0
	end 
end
function DeepwoodBasementDoor()
	if ( Tracker:ProviderCountForCode("dws_smallkey") >= 4 or function_Cached("Deepwood2ndDoor")==1 ) then
		return 1
	elseif ( has("small_key_none") ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("dws_smallkey") >= 2 ) then
		return 2
	elseif ( function_Cached("Deepwood2ndDoor")==2 ) then
		return 2
	else
		return 0
	end 
end
function DeepwoodBossDoor()
	if ( has("dws_bigkey") ) then
		return 1
	elseif ( has("big_key_none") ) then
		return 1
	else
		return 0
	end 
end