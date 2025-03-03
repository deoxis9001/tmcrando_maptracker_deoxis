function Clouds_FreeChest()
	if ( function_Cached("AccessClouds")==1 ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 ) then
		return 2
	else
		return 0
	end 
end

function Clouds_NorthEast_DigSpot() 
	if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_North_Kill()
	if ( function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) and function_Cached("CloudsKill")==1 ) then 
		return 1
	elseif ( ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) and ( has("cape") or has("mitts") ) and ( function_Cached("CloudsKill")==1 or function_Cached("CloudsKill")==2 ) ) then 
		return 2
	else
		return 0
	end 
end

function Clouds_NorthWest_Chest() 
	if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_NorthWest_DigSpot() 
	if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_NorthWest_BottomChest() 
    if ( function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) ) then
        return 1
	elseif ( function_Cached("AccessClouds")==2 and ( has("cape") or has("mitts") ) ) then
        return 2
	else
		return 0
	end 
end

function Clouds_South_Chest() 
 if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_South_DigSpot() 
 if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_South_MiddleChest() 
	if ( function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and ( has("cape") or has("mitts") ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_South_MiddleDigSpot() 
	if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_South_Kill() 
	if ( function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) and function_Cached("CloudsKill")==1 ) then 
		return 1
	elseif ( ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) and ( has("cape") or has("mitts") ) and ( function_Cached("CloudsKill")==1 or function_Cached("CloudsKill")==2 ) ) then 
		return 2
	else
		return 0
	end 
end

function Clouds_South_RightChest() 
	if ( function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and ( has("cape") or has("mitts") ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_South_RightDigSpot()
	if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_SouthEast_BottomDigSpot()
 if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Clouds_SouthEast_TopDigSpot() 
	if ( function_Cached("AccessClouds")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessClouds")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Clouds_Fusion_TopRight()
	if ( function_Cached("CloudFusions")==1 and function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	elseif ( ( function_Cached("CloudFusions")==1 or function_Cached("CloudFusions")==2 ) and ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) and ( has("cape") or has("mitts") ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_Fusion_TopLeft() 
	if ( function_Cached("CloudFusions")==1 and function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	elseif ( ( function_Cached("CloudFusions")==1 or function_Cached("CloudFusions")==2 ) and ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) and ( has("cape") or has("mitts") ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_Fusion_BottomRight() 
	if ( function_Cached("CloudFusions")==1 and function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	elseif ( ( function_Cached("CloudFusions")==1 or function_Cached("CloudFusions")==2 ) and ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) and ( has("cape") or has("mitts") ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_Fusion_BottomLeft() 
	if ( function_Cached("CloudFusions")==1 and function_Cached("AccessClouds")==1 and ( has("cape") or has("mitts") ) ) then
		return 1
	elseif ( ( function_Cached("CloudFusions")==1 or function_Cached("CloudFusions")==2 ) and ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) and ( has("cape") or has("mitts") ) ) then
		return 2
	else
		return 0
	end 
end

function Clouds_Fusion_Center() 
	if ( function_Cached("CloudFusions")==1 and function_Cached("AccessClouds")==1 ) then
		return 1
	elseif ( ( function_Cached("CloudFusions")==1 or function_Cached("CloudFusions")==2 ) and ( function_Cached("AccessClouds")==1 or function_Cached("AccessClouds")==2 ) ) then
		return 2
	else
		return 0
	end 
end