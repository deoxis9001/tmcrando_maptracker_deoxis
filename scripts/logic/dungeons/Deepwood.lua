function Deepwood_2F_Chest()
	if (function_Cached("DeepwoodDungeons") == 1 and function_Cached("DeepwoodWeb") == 1) then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			function_Cached("DeepwoodWeb") == 1)
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_SlugTorches_Chest()
	if (function_Cached("DeepwoodDungeons") == 1) then
		return 1
	elseif (function_Cached("DeepwoodDungeons") == 2) then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_BarrelRoom_Chest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and
			(function_Cached("Deepwood1stDoor") == 1 or function_Cached("DeepwoodPreMadderpillar") == 1) and
			function_Cached("BlowDust") == 1)
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("Deepwood1stDoor") == 1 or
				(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2)) and
			(function_Cached("BlowDust") == 1 or function_Cached("BlowDust") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_West_BigChest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and
			(function_Cached("Deepwood1stDoor") == 1 or function_Cached("DeepwoodPreMadderpillar") == 1))
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("Deepwood1stDoor") == 1 or
				(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2)))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_West_StatuePuzzle_Chest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and
			(function_Cached("Deepwood1stDoor") == 1 or function_Cached("DeepwoodPreMadderpillar") == 1))
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("Deepwood1stDoor") == 1 or
				(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2)))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_East_MulldozerFight_Item()
	if
		(function_Cached("DeepwoodDungeons") == 1 and
			(function_Cached("Deepwood1stDoor") == 1 or function_Cached("DeepwoodPreMadderpillar") == 1) and
			function_Cached("Deepwood2ndDoor") == 1 and
			function_Cached("DeepwoodMulldozers") == 1)
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("Deepwood1stDoor") == 1 or
				(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2)) and
			(function_Cached("Deepwood2ndDoor") == 1 or function_Cached("Deepwood2ndDoor") == 2) and
			(function_Cached("DeepwoodMulldozers") == 1 or function_Cached("DeepwoodMulldozers") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_NorthEast_Chest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and function_Cached("DeepwoodPreMadderpillar") == 1 and
			function_Cached("DeepwoodNWChest") == 1)
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2) and
			(function_Cached("DeepwoodNWChest") == 1 or function_Cached("DeepwoodNWChest") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_B1_SwitchRoom_BigChest()
	if (function_Cached("DeepwoodDungeons") == 1 and function_Cached("DeepwoodPreMadderpillar") == 1) then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_B1_SwitchRoom_Chest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and
			((function_Cached("DeepwoodPreMadderpillar") == 1 and has("cape")) or
				(function_Cached("Deepwood1stDoor") == 1 and has("gust"))))
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(((function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2) and
				has("cape")) or
				(function_Cached("Deepwood1stDoor") == 1 and has("gust"))))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_BlueWarp_HP()
	if
		(function_Cached("DeepwoodDungeons") == 1 and function_Cached("DeepwoodPreMadderpillar") == 1 and
			function_Cached("DeepwoodWarpSwitch") == 1)
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2) and
			(function_Cached("DeepwoodWarpSwitch") == 1 or function_Cached("DeepwoodWarpSwitch") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_BlueWarp_Chest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and function_Cached("DeepwoodPreMadderpillar") == 1 and
			function_Cached("DeepwoodWarpChests") == 1)
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2) and
			(function_Cached("DeepwoodWarpChests") == 1 or function_Cached("DeepwoodWarpChests") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_Madderpillar_BigChest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and function_Cached("DeepwoodPreMadderpillar") == 1 and
			function_Cached("DeepwoodMadderpillarDoor") == 1 and
			function_Cached("DeepwoodMadderpillarFight") == 1)
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2) and
			(function_Cached("DeepwoodMadderpillarDoor") == 1 or function_Cached("DeepwoodMadderpillarDoor") == 2) and
			(function_Cached("DeepwoodMadderpillarFight") == 1 or function_Cached("DeepwoodMadderpillarFight") == 2))
	 then
		return 2
	else
		return 0
	end
end

function Deepwood_1F_Madderpillar_HP()
	if (function_Cached("DeepwoodDungeons") == 1 and function_Cached("DeepwoodMadderHP") == 1) then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("DeepwoodMadderHP") == 1 or function_Cached("DeepwoodMadderHP") == 2))
	 then
		return 2
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			( function_Cached("Deepwood1stDoor") == 1 ))
	 then
		return 3
	else
		return 0
	end
end

function Deepwood_B1_West_BigChest()
	if
		(function_Cached("DeepwoodDungeons") == 1 and
			(function_Cached("DeepwoodRedWarp") == 1 or
				((function_Cached("Deepwood1stDoor") == 1 or function_Cached("DeepwoodPreMadderpillar") == 1) and has("gust") and
					function_Cached("DeepwoodBasementDoor") == 1)))
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and
			(function_Cached("DeepwoodRedWarp") == 1 or
				((function_Cached("Deepwood1stDoor") == 1 or
					(function_Cached("DeepwoodPreMadderpillar") == 1 or function_Cached("DeepwoodPreMadderpillar") == 2)) and
					has("gust") and
					(function_Cached("DeepwoodBasementDoor") == 1 or function_Cached("DeepwoodBasementDoor") == 2))))
	 then
		return 2
	else
		return 0
	end
end

function CompleteDeepwood()
	if (has("dws")) then
		return 1
	else
		return 0
	end
end

function Deepwood_BossItem()
	if
		(function_Cached("DeepwoodDungeons") == 1 and has("gust") and function_Cached("HasChuDamage") == 1 and
			function_Cached("DeepwoodBossDoor") == 1)
	 then
		return 1
	elseif
		((function_Cached("DeepwoodDungeons") == 1 or function_Cached("DeepwoodDungeons") == 2) and has("gust") and
			(function_Cached("HasChuDamage") == 1 or function_Cached("HasChuDamage") == 2) and
			function_Cached("DeepwoodBossDoor") == 1)
	 then
		return 2
	else
		return 0
	end
end
