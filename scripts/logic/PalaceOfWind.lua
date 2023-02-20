function PoWPreKeyDoor() 
	return 1 
end
function PoWPostKeyDoor() 
	if ( PoW1stDoor()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWFans() 
	if ( Tracker:ProviderCountForCode("pow_smallkey") >= 5 ) then
		return 1
	else
		return 0
	end 
end
function PoWBigChest() 
	if ( Tracker:ProviderCountForCode("pow_smallkey") >= 6 ) then
		return 1
	else
		return 0
	end 
end
function PoWBigDoor() 
	if ( has("pow_bigkey") ) then
		return 1
	else
		return 0
	end 
end

function PoW1stDoor() 
	if ( Tracker:ProviderCountForCode("pow_smallkey") >= 1 and PoWNoWarps()==1 ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("pow_smallkey") >= 4 and PoWBlueWarp()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoW2ndHalf1stDoor() 
	if ( Tracker:ProviderCountForCode("pow_smallkey") >= 4 and PoWNoWarps()==1 ) then
		return 1
	elseif ( Tracker:ProviderCountForCode("pow_smallkey") >= 6 and PoWRedWarp()==1 ) then
		return 1
	else
		return 0
	end 
end
function PoWRedWarpDoor() 
	if ( Tracker:ProviderCountForCode("pow_smallkey") >= 5 ) then
		return 1
	else
		return 0
	end 
end
function PoWLastDoor() 
	if ( Tracker:ProviderCountForCode("pow_smallkey") >= 6 ) then
		return 1
	else
		return 0
	end 
end
function PoWBossDoor() 
	if ( has("pow_bigkey") ) then
		return 1
	else
		return 0
	end 
end