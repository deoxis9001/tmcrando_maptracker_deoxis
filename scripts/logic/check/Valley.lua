function Valley_PreValleyFusion_Chest() 
	if ( AccessValley()==1) then
		return 1
	else
		return 0
	end 
end

function Valley_GreatFairy_NPC() 
	if ( AccessValley()==1 and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Valley_LostWoods_Chest() 
if ( AccessValley()==1 and DarkRooms()==1 ) then
    return 1
	else
		return 0
	end 
end

function Valley_Dampe_NPC() 
	if ( AccessValley()==1 and DarkRooms()==1) then
		return 1
	elseif ( AccessValley()==1 and DarkRooms()==2) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardButterflyFusion_Item() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end

function Valley_GraveyardLeftFusion_Chest() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end

function Valley_GraveyardLeftGrave_HP() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end

function Valley_GraveyardRightFusion_Chest() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end

function Valley_GraveyardRightGraveFusion_Chest() 
	if ( AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end
