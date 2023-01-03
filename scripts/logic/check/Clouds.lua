function Clouds_FreeChest()
	if ( AccessClouds()==1 ) then
		return 1
	else
		return 0
	end 
end

function Clouds_NorthEast_DigSpot() 
	if ( AccessClouds()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Clouds_North_Kill() 
	if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) and CloudsKill()==1) then
		return 1
	else
		return 0
	end 
end

function Clouds_NorthWest_Chest() 
	if ( AccessClouds()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Clouds_NorthWest_DigSpot() 
	if ( AccessClouds()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Clouds_NorthWest_BottomChest() 
    if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) ) then
        return 1
	else
		return 0
	end 
end

function Clouds_South_Chest() 
    if ( AccessClouds()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Clouds_South_DigSpot() 
    if ( AccessClouds()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Clouds_South_MiddleChest() 
    if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) ) then
        return 1
	else
		return 0
	end 
end

function Clouds_South_MiddleDigSpot() 
    if ( AccessClouds()==1 and has("mitts") ) then
        return 1
	else
		return 0
	end 
end

function Clouds_South_Kill() 
    if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) and CloudsKill()==1 ) then   
        return 1
	else
		return 0
	end 
end

function Clouds_South_RightChest() 
    if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) ) then
        return 1
	else
		return 0
	end 
end

function Clouds_South_RightDigSpot()
    if ( AccessClouds()==1 and has("mitts") ) then
        return 1
	else
		return 0
	end 
end

function Clouds_SouthEast_BottomDigSpot()
    if ( AccessClouds()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Clouds_SouthEast_TopDigSpot() 
    if ( AccessClouds()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end


function Clouds_Fusion_TopRight() 
	if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	else
		return 0
	end 
end

function Clouds_Fusion_TopLeft() 
	if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	else
		return 0
	end 
end

function Clouds_Fusion_BottomRight() 
	if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	else
		return 0
	end 
end

function Clouds_Fusion_BottomLeft() 
	if ( AccessClouds()==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	else
		return 0
	end 
end

function Clouds_Fusion_Center() 
	if ( AccessClouds()==1 ) then
		return 1
	else
		return 0
	end 
end
