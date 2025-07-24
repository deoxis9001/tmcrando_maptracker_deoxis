function CoF1stDoor()
	if Tracker:ProviderCountForCode("cof_smallkey") >= 2 then
		return 1
	elseif  function_Cached("CoFNoBlueWarp") == 1 and Tracker:ProviderCountForCode("cof_smallkey") >= 1 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif function_Cached("CoFNoBlueWarp") == 1 and Tracker:ProviderCountForCode("ud_smallkey") >= 27 then
		return 1
	elseif (has("small_key_none")) then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("cof_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 then
		return 2
	else
		return 0
	end
end
function CoF2ndDoor()
	if  Tracker:ProviderCountForCode("cof_smallkey") >= 2 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif (has("small_key_none")) then
		return 1
	elseif
		(has("small_key_out_on") and Tracker:ProviderCountForCode("cof_smallkey") >= 1 and function_Cached("CoFBlueWarp") == 1)
	 then
		return 2
	elseif
		(has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 and function_Cached("CoFBlueWarp") == 1)
	 then
		return 2
	elseif
		(has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2)
	 then
		return 2
	else
		return 0
	end
end
function CoFBossDoor()
	if (has("cof_bigkey") and ( has("big_key_shuffle") or has("big_key_vanilla") ) ) then
		return 1
	elseif (has("ud_bigkey") and has("big_key_universal") ) then
		return 1
	elseif (has("big_key_none")) then
		return 1
	else
		return 0
	end
end
