function CoF1stDoor()
	if ( Tracker:ProviderCountForCode("cof_smallkey") >= 2 or (CoFNoBlueWarp()==1 and Tracker:ProviderCountForCode("cof_smallkey") >= 1 ) ) then
		return 1
	else
		return 0
	end 
end
function CoF2ndDoor() 
	if ( Tracker:ProviderCountForCode("cof_smallkey") >= 2 ) then
		return 1
	else
		return 0
	end 
end
function CoFBossDoor()
	if ( has("cof_bigkey") ) then
		return 1
	else
		return 0
	end 
end