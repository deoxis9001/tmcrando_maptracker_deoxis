function FoWLeftDoor()
	if Tracker:ProviderCountForCode("fow_smallkey") >= 4 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("fow_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 then
		return 2
	else
		return 0
	end
end
function FoWRightDoor()
	if Tracker:ProviderCountForCode("fow_smallkey") >= 2 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 26 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("fow_smallkey") >= 1 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 1 then
		return 2
	else
		return 0
	end
end
function FoWMiddleDoor()
	if Tracker:ProviderCountForCode("fow_smallkey") >= 3 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 27 then
		return 1
	elseif has("small_key_none") then
		return 1
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("fow_smallkey") >= 2 then
		return 2
	elseif has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 2 then
		return 2
	else
		return 0
	end
end
function FoWLastDoor()
	if Tracker:ProviderCountForCode("fow_smallkey") >= 4 then
		return 1
	elseif  Tracker:ProviderCountForCode("ud_smallkey") >= 28 then
		return 1
	elseif (has("small_key_none")) then
		return 1
	elseif (has("small_key_out_on") and Tracker:ProviderCountForCode("fow_smallkey") >= 3) then
		return 2
	elseif (has("small_key_out_on") and Tracker:ProviderCountForCode("ud_smallkey") >= 3) then
		return 2
	else
		return 0
	end
end
function FoWBossDoor()
	if (has("fow_bigkey")  and ( has("big_key_shuffle") or has("big_key_vanilla") ) ) then
		return 1
	elseif (has("ud_bigkey") and has("big_key_universal") ) then
		return 1
	elseif (has("big_key_none")) then
		return 1
	else
		return 0
	end
end
