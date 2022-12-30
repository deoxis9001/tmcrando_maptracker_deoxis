function Trilby_MiddleFusion_Chest() 
	if ( AccessTrilby()==1) then
		return 1
	else
		return 0
	end 
end

function Trilby_TopFusion_Chest() 
	if ( AccessTrilby()==1) then
		return 1
	else
		return 0
	end 
end

function Trilby_DigCave_LeftChest() 
	if ( AccessTrilby()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end

function Trilby_DigCave_RightChest() 
	if ( AccessTrilby()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Trilby_DigCave_WaterFusion_Chest() 
	if ( AccessTrilby()==1 and has("mitts") and ( has("cape") or has("flippers") ) ) then
		return 1
	else
		return 0
	end 
end

function Trilby_Scrub_NPC() 
	if ( AccessTrilby()==1 and BombWalls()==1 and Scrubs()==1) then
		return 1
	else
		return 0
	end 
end

function Trilby_BombCave_Chest() 
	if ( AccessWestern()==1 and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Trilby_PuddleFusion_Item() 
	if ( AccessWestern()==1 ) then
		return 1
	else
		return 0
	end 
end
