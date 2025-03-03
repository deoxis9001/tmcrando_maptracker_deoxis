
function Library()
	if (function_Cached("LakeWindCrest") == 1) then
		return 1
	elseif (has("open_library_yes")) then
		return 1
	else
		return 0
	end
end
function CrenelWindCrest()
	if (has("crenelwindcrest_yes") and has("ocarina")) then
		return 1
	else
		return 0
	end
end
function FallsWindCrest()
	if (has("fallswindcrest_yes") and has("ocarina")) then
		return 1
	else
		return 0
	end
end
function CloudWindCrest()
	if (has("cloudwindcrest_yes") and has("ocarina")) then
		return 1
	else
		return 0
	end
end
function LakeWindCrest()
	if (has("lakewindcrest_yes") and has("ocarina")) then
		return 1
	else
		return 0
	end
end
function SwampWindCrest()
	if (has("swampwindcrest_yes") and has("ocarina")) then
		return 1
	else
		return 0
	end
end
function SHFWindCrest()
	if (has("shfwindcrest_yes") and has("ocarina")) then
		return 1
	else
		return 0
	end
end
function MinishWindCrest()
	if (has("minishwindcrest_yes") and has("ocarina")) then
		return 1
	else
		return 0
	end
end
function DeepwoodWarpSwitch()
	if (has("dws_warps_blue")) then
		return 1
	elseif (function_Cached("BlowDust") == 1) then
		return 1
	elseif (function_Cached("BlowDust") == 2) then
		return 2
	else
		return 0
	end
end
function DeepwoodBlueWarp()
	if (has("dws_warps_blue")) then
		return 1
	else
		return 0
	end
end
function DeepwoodRedWarp()
	if (has("dws_warps_red")) then
		return 1
	else
		return 0
	end
end
function CoFNoBlueWarp()
	if (function_Cached("CoFBlueWarp") == 1) then
		return 0
	else
		return 1
	end
end
function CoFBlueWarp()
	if (has("cof_warps_blue")) then
		return 1
	else
		return 0
	end
end
function CoFRedWarp()
	if (has("cof_warps_red")) then
		return 1
	else
		return 0
	end
end
function FoWBlueWarp()
	if (has("fow_warps_blue")) then
		return 1
	else
		return 0
	end
end
function ToDBlueWarp()
	if (has("tod_warps_blue")) then
		return 1
	else
		return 0
	end
end
function ToDNoWarp()
	if (has("tod_warps_blue")) then
		return 0
	elseif (has("tod_warps_red")) then
		return 0
	else
		return 1
	end
end
function ToDRedWarp()
	if (has("tod_warps_red")) then
		return 1
	else
		return 0
	end
end
function PoWNoWarps()
	if (has("pow_warps_blue")) then
		return 0
	elseif (has("pow_warps_red")) then
		return 0
	else
		return 1
	end
end
function PoWBlueWarp()
	if (has("pow_warps_blue")) then
		return 1
	else
		return 0
	end
end
function PoWRedWarp()
	if (has("pow_warps_red")) then
		return 1
	else
		return 0
	end
end
function DHCNoWarps()
	if (has("dhc_warps_blue")) then
		return 0
	elseif (has("dhc_warps_red")) then
		return 0
	else
		return 1
	end
end
function DHCBlueWarp()
	if (has("dhc_warps_blue")) then
		return 1
	else
		return 0
	end
end
function DHCRedWarp()
	if (has("dhc_warps_red")) then
		return 1
	else
		return 0
	end
end
