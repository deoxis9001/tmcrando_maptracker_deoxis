function DHC1stDoor() 
	if ( Tracker:ProviderCountForCode("dhc_smallkey") >= 1 ) then
		return 1
	else
		return 0
	end 
end
function DHCBigBlock() 
	if ( Tracker:ProviderCountForCode("dhc_smallkey") >= 5 ) then
		return 1
	else
		return 0
	end 
end
function DHCBossDoor() 
	if ( has("dhc_bigkey") ) then
		return 1
	else
		return 0
	end 
end