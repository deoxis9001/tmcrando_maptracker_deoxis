function MinishWoods_GreatFairy_NPC() 
	if ( AccessMinishWoods()==1 and has("cane")) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_WitchHut_Item() 
	if ( AccessNorthMinish()==1) then
		return 1
	else
		return 0
	end 
end

function WitchDiggingCave_Chest() 
	if ( AccessNorthMinish()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_NorthFusion_Chest() 
	if ( Fusions()==1 and AccessNorthMinish()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_TopHP() 
	if ( AccessNorthMinish()==1 ) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_WestFusion_Chest() 
	if ( AccessMinishWoods()==1 and Fusions()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_LikeLikeDiggingCave_LeftChest() 
	if ( AccessMinishWoods()==1 and has("mitts") and LikeLike()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_LikeLikeDiggingCave_RightChest() 
	if ( AccessMinishWoods()==1 and has("mitts") and LikeLike()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_EastFusion_Chest() 
	if ( AccessMinishWoods()==1 and Fusions()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_SouthFusion_Chest() 
	if ( AccessMinishWoods()==1 and Fusions()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_BottomHP() 
	if ( AccessMinishWoods()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_CrackFusion_Chest() 
	if ( AccessMinishWoods()==1 and Fusions()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_MinishPathFusion_Chest() 
	if ( AccessMinishWoods()==1 and Fusions()==1) then
		return 1
	else
		return 0
	end 
end

function MinishVillage_BarrelHouse_Item() 
	if ( AccessMinishWoods()==1) then
		return 1
	else
		return 0
	end 
end

function MinishVillage_HP() 
	if ( AccessMinishWoods()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_BombMinish_NPC1() 
	if ( AccessBelari()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_BombMinish_NPC2() 
	if ( AccessBelari()==1 and Fusions()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_PostVillageFusion_Chest() 
	if ( AccessBelari()==1 and Fusions()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_MiddleChest() 
	if ( AccessBelari()==1 and has("flippers")) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_RightChest() 
	if ( AccessBelari()==1 and has("flippers")) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_LeftChest() 
	if ( AccessBelari()==1 and has("flippers")) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_HP() 
	if ( AccessBelari()==1 and has("flippers")) then
		return 1
	else
		return 0
	end 
end
--pas dans la logique de base
function MinishWoods_OctoGolden_KillOcto() 
	if ( Fusions()==1 and has("golden_enemy_on") and AccessNorthMinish()==1 and HasSword()==1 ) then
		return 1
	elseif ( Fusions()==1 and has("golden_enemy_on") and ( has("bombs30") or HasBow()==1) and AccessNorthMinish()==1) then
		return 2
	else
		return 0
	end 
end
