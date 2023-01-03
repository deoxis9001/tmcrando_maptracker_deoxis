function WindTribe_1F_Chest() 
	if ( LowerWindTribeKeys()==1 and ( WindPortal()==1 or AccessWindTribe()==1 )) then
		return 1
	else
		return 0
	end 
end

function WindTribe_2F_Chest() 
	if ( LowerWindTribeKeys()==1 and ( WindPortal()==1 or AccessWindTribe()==1 )) then
		return 1
	else
		return 0
	end 
end

function WindTribe_2F_Gregal_NPC1() 
	if ( Gregal()==1 and LowerWindTribeKeys()==1 and ( WindPortal()==1 or AccessWindTribe()==1 )) then
		return 1
	else
		return 0
	end 
end

function WindTribe_2F_Gregal_NPC2() 
	if ( Gregal()==1  and UpperWindTribeKeys()==1 and AccessWindTribe()==1) then
		return 1
	else
		return 0
	end 
end

function WindTribe_3F_Chest() 
	if ( UpperWindTribeKeys()==1 and AccessWindTribe()==1) then
		return 1
	else
		return 0
	end 
end

function WindTribe_4F_Chest() 
    if ( UpperWindTribeKeys()==1 and AccessWindTribe()==1) then
        return 1
	else
		return 0
	end 
end


