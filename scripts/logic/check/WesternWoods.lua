function WesternWoods_FusionChest() 
	if ( AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TreeFusion_HP() 
	if ( AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TopDig() 
	if ( AccessWestern()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BottomDig() 
	if ( AccessWestern()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_PercyFusion_Moblin() 
	if ( AccessWestern()==1 and Percy()==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_PercyFusion_Percy() 
	if ( AccessWestern()==1 and Percy()==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BeanstalkFusion_Chest() 
	if ( AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BeanstalkFusion_Item() 
	if ( AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end
--pas dans la logique de base
function WesternWoods_OctoGolden_KillOcto() 
	if ( Fusions()==1 and has("golden_enemy_on") and AccessWestern()==1 and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and AccessWestern()==1) then
		return 2
	else
		return 0
	end 
end

