function PoWFans()
	if Tracker:ProviderCountForCode("pow_smallkey") >= 5 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 27 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 2 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2 then
		return 2
	else
		return 0
	end
end
function PoWBigChest()
	if Tracker:ProviderCountForCode("pow_smallkey") >= 6 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 3 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 3 then
		return 2
	else
		return 0
	end
end

function PoW1stDoor()
	if Tracker:ProviderCountForCode("pow_smallkey") >= 4 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 26 then
		return 1
	elseif Tracker:ProviderCountForCode("pow_smallkey") >= 1 and function_Cached("PoWNoWarps") == 1 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 25 and function_Cached("PoWNoWarps") == 1 then
		return 1
	elseif (has("small_key_none")) then
		return 1
	elseif (has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 1) then
		return 2
	elseif (has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1) then
		return 2
	else
		return 0
	end
end
function PoW2ndHalf1stDoor()
	if Tracker:ProviderCountForCode("pow_smallkey") >= 4 and function_Cached("PoWNoWarps") == 1 or function_Cached("PoWBlueWarp") == 1 then
		return 1
	elseif Tracker:ProviderCountForCode("pow_smallkey") >= 6 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 26 and function_Cached("PoWNoWarps") == 1 or function_Cached("PoWBlueWarp") == 1 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 2 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 1 and function_Cached("PoWBlueWarp") == 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 and function_Cached("PoWBlueWarp") == 1 then
		return 2
	else
		return 0
	end
end
function PoWRedWarpDoor()
	if Tracker:ProviderCountForCode("pow_smallkey") >= 5 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 27 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 3 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 2 and function_Cached("PoWBlueWarp") == 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 1 and function_Cached("PoWRedWarp") == 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 3 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2 and function_Cached("PoWBlueWarp") == 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 and function_Cached("PoWRedWarp") == 1 then
		return 2
	else
		return 0
	end
end
function PoWLastDoor()
	if Tracker:ProviderCountForCode("pow_smallkey") >= 6 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 4 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 3 and function_Cached("PoWBlueWarp") == 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("pow_smallkey") >= 2 and function_Cached("PoWRedWarp") == 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 4 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 3 and function_Cached("PoWBlueWarp") == 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2 and function_Cached("PoWRedWarp") == 1 then
		return 2
	else
		return 0
	end
end
function PoWBossDoor()
	if (has("pow_bigkey")  and ( has("big_key_shuffle") or has("big_key_vanilla") )) then
		return 1
	elseif (has("ud_bigkey") and has("big_key_universal") ) then
		return 1
	elseif (has("big_key_none")) then
		return 1
	else
		return 0
	end
end
