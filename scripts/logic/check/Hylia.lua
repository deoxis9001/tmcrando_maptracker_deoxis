function Hylia_SunkenHP() 
	if ( AccessLonLon()==1 and has("flippers")  ) then
		return 1
	else
		return 0
	end 
end

function Hylia_DogNPC() 
	if ( AccessLonLon()==1 and has("dogbottle")  ) then
		return 1
	else
		return 0
	end 
end

function Hylia_SmallIsland_HP() 
	if ( AccessLonLon()==1 and has("cape")  ) then
		return 1
	elseif ( AccessLonLon()==1 ) then
		return 3
	else
		return 0
	end 
end

function Hylia_MiddleIslandFusion_DigCaveChest() 
	if ( Fusions()==1 and (  AccessLonLon()==1 and has("mitts") and CapeExtension()==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Hylia_BottomHP() 
	if ( AccessLonLon()==1 and has("cape")  ) then
		return 1
	else
		return 0
	end 
end

function Hylia_Dojo_HP() 
	if ( AccessLonLon()==1 and (has("cape") or LakeShortcut()==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Hylia_Dojo_NPC() 
	if ( AccessLonLon()==1 and has("10hearts")  and HasSword()==1 and ( CapeExtension()==1 or LakeShortcut()==1 )) then
		return 1
	else
		return 0
	end 
end

function Hylia_CrackFusion_LibrariNPC() 
	if ( Fusions()==1 and has("ocarina") and ( has("flippers") or has("cape"))  ) then
		return 1
	else
		return 0
	end 
end

function Hylia_NorthMinishHole_Chest() 
	if ( AccessSouthLake()==1 and ( BonkedTrees()==1 or LakeMinish()==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Hylia_SouthMinishHole_Chest() 
	if ( AccessSouthLake()==1 and ( BonkedTrees()==1 or LakeMinish()==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Hylia_CabinPathFusion_Chest() 
	if ( AccessSouthLake()==1 and ( (BonkedTrees()==1 and CabinSwim()==1 ) or ( LakeMinish()==1 and has("flippers") and CabinSwim()==1 )))then
		return 1
	elseif ( AccessSouthLake()==1 and ( (BonkedTrees()==1 and CabinSwim()==2 ) or ( LakeMinish()==1 and has("flippers") and CabinSwim()==2 )))then
		return 2
	else
		return 0
	end 
end

function Hylia_MayorCabin_Item() 
	if ( AccessSouthLake()==1 and MayorCabin()==1  ) then
		return 1
	elseif ( AccessSouthLake()==1 and MayorCabin()==2  ) then
		return 2
	else
		return 0
	end 
end

function Hylia_CapeCave_Chest() 
	if ( AccessTreasureCave()==1 ) then
		return 1
	else
		return 0
	end 
end

function Hylia_CapeCave_HP() 
	if ( AccessTreasureCave()==1 ) then
		return 1
	else
		return 0
	end 
end

function Hylia_BeanstalkFusion_HP() 
	if ( AccessTreasureCave()==1 and Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end

function Hylia_BeanstalkFusion_Chest() 
	if ( AccessTreasureCave()==1 and Fusions()==1 ) then
		return 1
	else
		return 0
	end 
end