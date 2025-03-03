function WindTribe_1F_Chest() 
	if ( function_Cached("StrangerFusion")==1 or function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( function_Cached("AccessWindTribe")==2 ) then
		return 2
	else
		return 0
	end 
end

function WindTribe_2F_Chest() 
	if ( ( function_Cached("StrangerFusion")==1 or function_Cached("AccessWindTribe")==1 ) ) then
		return 1
	elseif ( function_Cached("AccessWindTribe")==2 ) then
		return 2
	else
		return 0
	end 
end

function WindTribe_2F_Gregal_NPC1() 
	if ( function_Cached("Gregal")==1 and ( function_Cached("StrangerFusion")==1 or function_Cached("AccessWindTribe")==1 ) ) then
		return 1
	elseif ( function_Cached("Gregal")==1 and  function_Cached("AccessWindTribe")==2 ) then
		return 2
	else
		return 0
	end 
end

function WindTribe_2F_Gregal_NPC2() 
	if ( function_Cached("Gregal")==1 and function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( function_Cached("Gregal")==1 and  function_Cached("AccessWindTribe")==2 ) then
		return 2
	else
		return 0
	end 
end

function WindTribe_3F_Chest() 
	if ( function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( function_Cached("AccessWindTribe")==2 ) then
		return 2
	else
		return 0
	end 
end

function WindTribe_4F_Chest() 
	if ( function_Cached("AccessWindTribe")==1 ) then
		return 1
	elseif ( function_Cached("AccessWindTribe")==2 ) then
		return 2
	else
		return 0
	end 
end