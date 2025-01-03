function DHC1stDoor()
	if (Tracker:ProviderCountForCode("dhc_smallkey") >= 1 and function_Cached("DHCNoWarps") == 1) then
		return 1
	elseif (Tracker:ProviderCountForCode("dhc_smallkey") >= 5) then
		return 1
	elseif (has("small_key_none")) then
		return 1
	elseif (has("small_key_out_on") and Tracker:ProviderCountForCode("dhc_smallkey") >= 1) then
		return 2
	else
		return 0
	end
end
function DHCBigBlock()
	if (Tracker:ProviderCountForCode("dhc_smallkey") >= 5) then
		return 1
	elseif (has("small_key_none")) then
		return 1
	elseif
		(has("small_key_out_on") and Tracker:ProviderCountForCode("dhc_smallkey") >= 4 and function_Cached("DHCRedWarp") == 1)
	 then
		return 2
	else
		return 0
	end
end
function DHCBossDoor()
	if (has("dhc_bigkey")) then
		return 1
	elseif (has("big_key_none")) then
		return 1
	else
		return 0
	end
end
