function Deepwood1stDoor() 
	if ( Tracker:ProviderCountForCode("dws_smallkey") >= 1 ) then
		return 1
	else
		return 0
	end 
end
function Deepwood2ndDoor() 
	if ( Tracker:ProviderCountForCode("dws_smallkey") >= 4 ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("dws_smallkey") >= 3  and has("key_vanilla_on")) then
		return 1
	else
		return 0
	end 
end
function DeepwoodMadderpillarDoor() 
	if ( DeepwoodMadderpillarWeb()==1 and Tracker:ProviderCountForCode("dws_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodBasementDoor()
	if ( Tracker:ProviderCountForCode("dws_smallkey") >= 4 ) then
		return 1
	else
		return 0
	end 
end
function DeepwoodBossDoor()
	if ( has("dws_bigkey") ) then
		return 1
	else
		return 0
	end 
end