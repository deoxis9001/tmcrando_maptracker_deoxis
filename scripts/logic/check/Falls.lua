function Falls_Entrance_HP()
	if ( OverworldBlocks()==1 and CapeExtension()==1 ) or ( AccessFalls()==1 and has("grip") and ( has("flippers") or ( has("cape") and DarkRooms()==1 ) ) )
    then
		return 1
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_HP()
	if ( OverworldBlocks()==1 and CapeExtension()==1 and has("mitts") ) or ( AccessFalls()==1 and has("grip")==1 and ( has("flippers")==1 or ( has("cape")==1 and DarkRooms()==1 ) ) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_Chest() 
	if ( OverworldBlocks()==1 and CapeExtension()==1 and has("mitts") ) or ( AccessFalls()==1 and has("grip") and ( has("flippers")==1 or ( has("cape")==1 and DarkRooms()==1 ) ) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_1stCave_Chest()
	if ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and BombWalls()==1 ) or ( AccessFalls()==1 and has("grip") and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_Cliff_Chest()
	if ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and BombWalls()==1 and CanSplit3()==1 ) or ( AccessFalls()==1 and has("grip") and BombWalls()==1 and DarkRooms()==1 and CanSplit3()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_SouthDigSpot()
	if ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and has("mitts") ) or ( AccessFalls()==1 and has("grip") and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_NorthDigSpot()
	if ( AccessFalls()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_RockFusion_Chest() 
	if ( AccessFalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_WaterfallFusion_HP() 
    if ( AccessFalls()==1 and has("flippers") ) then   
        return 1
	else
		return 0
	end 
end

function Falls_RupeeCave_Item() 
	if ( AccessFalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_RupeeCave_Underwater() 
    if ( AccessFalls()==1 and has("flippers") ) then   
       return 1
	else
		return 0
	end 
end

function Falls_TopCave_BombWall_Chest() 
	if ( AccessFalls()==1 and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_TopCave_Chest() 
	if ( AccessFalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_TekiteGolden_KillTekite() 
	if ( Fusions()==1 and has("golden_enemy_on") and AccessNorthMinish()==1 and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and AccessNorthMinish()==1) then
		return 2
	else
		return 0
	end 
end