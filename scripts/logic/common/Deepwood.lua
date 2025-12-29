function Deepwood1stDoor()
	if Tracker:ProviderCountForCode("dws_smallkey") >= 1 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 25 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif function_Cached("DeepwoodBlueWarp") == 1 then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 then
		return 2
	else
		return 0
	end
end
function Deepwood2ndDoor()
	if Tracker:ProviderCountForCode("dws_smallkey") >= 4 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif has("small_key_vanilla") and Tracker:ProviderCountForCode("dws_smallkey") >= 2 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and has("dws_warps_blue") and Tracker:ProviderCountForCode("dws_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("dws_smallkey") >= 2 then
		return 2
	elseif has("small_key_out_on") and has("dws_warps_blue") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2 then
		return 2
	else
		return 0
	end
end
function DeepwoodMadderpillarDoor()
	if Tracker:ProviderCountForCode("dws_smallkey") >= 4 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif function_Cached("DeepwoodMadderpillarWeb") == 1 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and has("dws_warps_blue") and Tracker:ProviderCountForCode("dws_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("dws_smallkey") >= 3 then
		return 2
	elseif has("small_key_out_on") and has("dws_warps_blue") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 3 then
		return 2
	else
		return 0
	end
end
function DeepwoodBasementDoor()
	if Tracker:ProviderCountForCode("dws_smallkey") >= 4 then
		return 1
	elseif Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif function_Cached("Deepwood2ndDoor") == 1 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and has("dws_warps_blue") and Tracker:ProviderCountForCode("dws_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("dws_smallkey") >= 2 then
		return 2
	elseif has("small_key_out_on") and has("dws_warps_blue") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2 then
		return 2
	else
		return 0
	end
end
function DeepwoodBossDoor()
	if (has("dws_bigkey")  and ( has("big_key_shuffle") or has("big_key_vanilla") ) ) then
		return 1
	elseif (has("ud_bigkey") and has("big_key_universal") ) then
		return 1
	elseif (has("big_key_none")) then
		return 1
	else
		return 0
	end
end
