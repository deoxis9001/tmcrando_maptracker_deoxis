
function RuinsFusion()
	if (has("fusiongold_complet")) then
		return 1
	elseif (Tracker:ProviderCountForCode("clouds") >= 9 and fusiongoldcombined:getActive())	 then
		return 1
	elseif (Tracker:ProviderCountForCode("wilds") >= 3 and not fusiongoldcombined:getActive()) then
		return 1
	elseif (has("fusiongold_out_on") and Tracker:ProviderCountForCode("clouds") >= 3 and fusiongoldcombined:getActive()) then
		return 2
	elseif (has("fusiongold_out_on") and function_Cached("FusionsGoldSwampNumber") < Tracker:ProviderCountForCode("wilds")) then
		return 2
	elseif
		(has("fusiongold_out_on") and fusiongoldcombined:getActive() and
			function_Cached("FusionsGoldSwampNumber") < Tracker:ProviderCountForCode("clouds"))
	 then
		return 2
	else
		return 0
	end
end
function CloudFusions()
	if
		((Tracker:ProviderCountForCode("clouds") >= 5 and fusiongoldcombined:getActive() == false) or
			(Tracker:ProviderCountForCode("clouds") >= 9 and fusiongoldcombined:getActive()) or
			has("fusiongold_complet"))
	 then
		return 1
	elseif
		(has("fusiongold_out_on") and fusiongoldcombined:getActive() and
			function_Cached("FusionsGoldCloudNumber") < Tracker:ProviderCountForCode("clouds") and
			(Tracker:ProviderCountForCode("clouds") >= 6 or
				(Tracker:ProviderCountForCode("clouds") >= 5 and has("fallswindcrest_yes"))))
	 then
		return 2
	elseif
		(has("fusiongold_out_on") and function_Cached("FusionsGoldCloudNumber") < Tracker:ProviderCountForCode("clouds"))
	 then
		return 2
	else
		return 0
	end
end
function OpenWindTribe()
	if (has("open_wind_tribe_yes")) then
		return 1
	else
		return 0
	end
end
function CryptDoor()
	if (Tracker:ProviderCountForCode("rc_smallkey") >= 1) then
		return 1
	elseif (has("small_key_none")) then
		return 1
	else
		return 0
	end
end
function CryptBlocks()
	if (Tracker:ProviderCountForCode("rc_smallkey") >= 3) then
		return 1
	elseif (has("small_key_none")) then
		return 1
	else
		return 0
	end
end
function FallsFusion()
	if (has("fusiongold_complet") and function_Cached("OverworldBlocks") == 1) then
		return 1
	elseif
		((fusiongoldcombined:getActive() == false and has("falls", 1)) or
			(fusiongoldcombined:getActive() and Tracker:ProviderCountForCode("clouds") >= 4)) and
			function_Cached("OverworldBlocks") == 1
	 then
		return 1
	elseif
		has("fusiongold_out_on") and fusiongoldcombined:getActive() and Tracker:ProviderCountForCode("clouds") >= 1 and
			function_Cached("OverworldBlocks") == 1
	 then
		return 2
	else
		return 0
	end
end
function DeepwoodPreMadderpillar()
	if
		(function_Cached("DeepwoodBlueWarp") == 1 or
			(function_Cached("Deepwood1stDoor") == 1 and
				(function_Cached("Deepwood2ndDoor") == 1 or Tracker:ProviderCountForCode("dws_smallkey") >= 2 or has("gust"))))
	 then
		return 1
	elseif
		(function_Cached("DeepwoodBlueWarp") == 1 or
			(function_Cached("Deepwood1stDoor") == 1 and
				((function_Cached("Deepwood2ndDoor") == 1 or function_Cached("Deepwood2ndDoor") == 2) or
					Tracker:ProviderCountForCode("dws_smallkey") >= 2 or
					has("gust"))))
	 then
		return 2
	else
		return 0
	end
end
function ToDMainRoom()
	if
		(function_Cached("ToDBigDoor") == 1 or
			(function_Cached("ToDBlueWarp") == 1 and function_Cached("ToDScissorBeetles") == 1) or
			(function_Cached("ToDRedWarp") == 1 and function_Cached("BombWalls") == 1 and function_Cached("ToDWeb") == 1 and
				function_Cached("ToDMadderpillars") == 1))
	 then
		return 1
	elseif
		(function_Cached("ToDBigDoor") == 1 or
			(function_Cached("ToDBlueWarp") == 1 and
				(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2)) or
			(function_Cached("ToDRedWarp") == 1 and function_Cached("BombWalls") == 1 and function_Cached("ToDWeb") == 1 and
				(function_Cached("ToDMadderpillars") == 1 or function_Cached("ToDMadderpillars") == 2)))
	 then
		return 2
	else
		return 0
	end
end
function ToDLeftPath()
	if
		(has("flippers") and function_Cached("ToDWestDoor") == 1 and function_Cached("ToDLeftMushroomSwitch") == 1 and
			function_Cached("ToDLeftPillars") == 1 and
			function_Cached("ToDLeftIceRoom") == 1)
	 then
		return 1
	elseif
		(has("flippers") and (function_Cached("ToDWestDoor") == 1 or function_Cached("ToDWestDoor") == 2) and
			function_Cached("ToDLeftMushroomSwitch") == 1 and
			function_Cached("ToDLeftPillars") == 1 and
			(function_Cached("ToDLeftIceRoom") == 1 or function_Cached("ToDLeftIceRoom") == 2))
	 then
		return 2
	else
		return 0
	end
end
function ToDLilypadEnd()
	if
		((function_Cached("ToDBlueWarp") == 1 and function_Cached("ToDScissorBeetles") == 1) or
			(function_Cached("ToDMainRoom") == 1 and
				(function_Cached("ToDLeftPath") == 1 or (function_Cached("ToDRightPath") == 1 and has("cape")) or
					function_Cached("ToDEitherPath") == 1)))
	 then
		return 1
	elseif
		((function_Cached("ToDBlueWarp") == 1 and
			(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2)) or
			((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
				((function_Cached("ToDLeftPath") == 1 or function_Cached("ToDLeftPath") == 2) or
					((function_Cached("ToDRightPath") == 1 or function_Cached("ToDRightPath") == 2) and has("cape")) or
					function_Cached("ToDEitherPath") == 1)))
	 then
		return 2
	else
		return 0
	end
end
function ToDRightPath()
	if
		(function_Cached("ToDRightIceBlock") == 1 and function_Cached("ToDRightIce") == 1 and
			function_Cached("DarkRooms") == 1 and
			function_Cached("ToDScissorBeetles") == 1 and
			function_Cached("ToDDarkMaze") == 1 and
			function_Cached("ToDDarkDoor") == 1)
	 then
		return 1
	elseif
		((function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2) and
			function_Cached("ToDRightIce") == 1 and
			(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2) and
			(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
			function_Cached("ToDDarkMaze") == 1 and
			(function_Cached("ToDDarkDoor") == 1 or function_Cached("ToDDarkDoor") == 2))
	 then
		return 2
	else
		return 0
	end
end
function ToDEitherPath_settings()
	if
		(function_Cached("ToDEitherDoor") == 1 and has("flippers") and function_Cached("ToDLeftPillars") == 1 and
			function_Cached("ToDRightIce") == 1 and
			function_Cached("DarkRooms") == 1 and
			function_Cached("ToDScissorBeetles") == 1 and
			function_Cached("ToDDarkMaze") == 1 and
			has("cape"))
	 then
		return 1
	elseif
		((function_Cached("ToDEitherDoor") == 1 or function_Cached("ToDEitherDoor") == 2) and has("flippers") and
			function_Cached("ToDLeftPillars") == 1 and
			function_Cached("ToDRightIce") == 1 and
			(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2) and
			(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
			function_Cached("ToDDarkMaze") == 1 and
			has("cape"))
	 then
		return 2
	else
		return 0
	end
end
function ToDEitherPath()
	if
		(function_Cached("ToDEitherDoor") == 1 and has("flippers") and function_Cached("ToDLeftPillars") == 1 and
			function_Cached("ToDRightIceBlock") == 1 and
			function_Cached("ToDRightIce") == 1 and
			function_Cached("DarkRooms") == 1 and
			function_Cached("ToDScissorBeetles") == 1 and
			function_Cached("ToDDarkMaze") == 1 and
			has("cape"))
	 then
		return 1
	elseif
		((function_Cached("ToDEitherDoor") == 1 or function_Cached("ToDEitherDoor") == 2) and has("flippers") and
			function_Cached("ToDLeftPillars") == 1 and
			(function_Cached("ToDRightIceBlock") == 1 or function_Cached("ToDRightIceBlock") == 2) and
			function_Cached("ToDRightIce") == 1 and
			(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2) and
			(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
			function_Cached("ToDDarkMaze") == 1 and
			has("cape"))
	 then
		return 2
	else
		return 0
	end
end
function ToDDarkMazeDoor()
	if (has("small_key_none")) then
		return 1
	elseif (Tracker:ProviderCountForCode("tod_smallkey") >= 4) then
		return 1
	elseif (Tracker:ProviderCountForCode("tod_smallkey") >= 1) then
		return 2
	else
		return 0
	end
end
function ToD2ndRupeePath()
	if
		((function_Cached("ToDMainRoom") == 1 and
			((function_Cached("ToDLeftPath") == 1 and has("cape")) or function_Cached("ToDRightPath") == 1 or
				function_Cached("ToDEitherPath") == 1)) or
			(function_Cached("ToDBlueWarp") == 1 and function_Cached("ToDScissorBeetles") == 1 and has("cape") and
				function_Cached("DarkRooms") == 1))
	 then
		return 1
	elseif
		(((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
			(((function_Cached("ToDLeftPath") == 1 or function_Cached("ToDLeftPath") == 2) and has("cape")) or
				(function_Cached("ToDRightPath") == 1 or function_Cached("ToDRightPath") == 2) or
				function_Cached("ToDEitherPath") == 1)) or
			(function_Cached("ToDBlueWarp") == 1 and
				(function_Cached("ToDScissorBeetles") == 1 or function_Cached("ToDScissorBeetles") == 2) and
				has("cape") and
				(function_Cached("DarkRooms") == 1 or function_Cached("DarkRooms") == 2)))
	 then
		return 2
	else
		return 0
	end
end
function AccessOcto()
	if
		(function_Cached("ToDMainRoom") == 1 and function_Cached("ToDEastSwitch") == 1 and
			function_Cached("ToDWestSwitch") == 1)
	 then
		return 1
	elseif
		((function_Cached("ToDMainRoom") == 1 or function_Cached("ToDMainRoom") == 2) and
			(function_Cached("ToDEastSwitch") == 1 or function_Cached("ToDEastSwitch") == 2) and
			(function_Cached("ToDWestSwitch") == 1 or function_Cached("ToDWestSwitch") == 2))
	 then
		return 2
	else
		return 0
	end
end
function PoW2ndHalf()
	if
		((function_Cached("PoWBlueWarp") == 1 and function_Cached("PoWDarknut") == 1) or
			(has("cape") and (function_Cached("CanSplit3") == 1 or function_Cached("CanSplit4") == 1) and
				function_Cached("PoWJump") == 1 and
				function_Cached("PoW1stDoor") == 1 and
				function_Cached("PoWBossDoor") == 1))
	 then
		return 1
	elseif
		((function_Cached("PoWBlueWarp") == 1 and (function_Cached("PoWDarknut") == 1 or function_Cached("PoWDarknut") == 2)) or
			(has("cape") and (function_Cached("CanSplit3") == 1 or function_Cached("CanSplit4") == 1) and
				(function_Cached("PoWJump") == 1 or function_Cached("PoWJump") == 2) and
				(function_Cached("PoW1stDoor") == 1 or function_Cached("PoW1stDoor") == 2) and
				(function_Cached("PoWBossDoor") == 1 or function_Cached("PoWBossDoor") == 2)))
	 then
		return 2
	else
		return 0
	end
end
function LibraryWorld()
	if (has("lakewindcrest_yes")) then
		return 1
	elseif (has("open_library_yes")) then
		return 1
	else
		return 0
	end
end