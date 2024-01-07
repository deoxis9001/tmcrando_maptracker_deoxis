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

function Crenel_VineTop_GoldenTektite() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3b") ) ) and function_Cached("AccessCrenel")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3b") ) ) and function_Cached("AccessCrenel")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_BridgeCave_Chest() 
	if ( function_Cached("AccessCrenel")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_FairyCave_HP() 
	if ( function_Cached("AccessCrenel")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end


function Crenel_BelowCoF_GoldenTektite() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0d") ) ) and function_Cached("AccessCrenel")==1 and function_Cached("HasSword")==1 and ( has("grip") or has("bombs") or function_Cached("CrenelMushroom")==1 or function_Cached("CrenelWindCrest")==1 ) ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0d") ) ) and ( function_Cached("AccessCrenel")==1 or function_Cached("AccessCrenel")==2 ) and function_Cached("HasSword")==1 and ( has("grip") or has("bombs") or ( function_Cached("CrenelMushroom")==1 or function_Cached("CrenelMushroom")==2 ) or function_Cached("CrenelWindCrest")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Scrub_NPC()
	if ( function_Cached("AccessCrenel")==1 and function_Cached("BombWalls")==1 and ( has("grip") or has("bombs") or function_Cached("CrenelMushroom")==1 or function_Cached("CrenelWindCrest")==1 ) and function_Cached("Scrubs")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessCrenel")==1 or function_Cached("AccessCrenel")==2 ) and function_Cached("BombWalls")==1 and ( has("grip") or has("bombs") or ( function_Cached("CrenelMushroom")==1 or function_Cached("CrenelMushroom")==2 ) or function_Cached("CrenelWindCrest")==1 ) and function_Cached("Scrubs")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Dojo_Chest() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Dojo_HP() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("CrenelDojo")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Dojo_NPC() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("CrenelDojo")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("CrenelDojo")==1 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_GreatFairy_NPC()
	if ( function_Cached("AccessCrenel")==1 and has("grip") and function_Cached("BombWalls")==1 and ( has("bombs") or function_Cached("HasBottle")==1 ) ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and function_Cached("BombWalls")==1 and ( has("bombs") or function_Cached("HasBottle")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Crenel_ClimbFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions62") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions62") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_DigCave_HP() 
	if ( function_Cached("AccessCrenel")==1 and has("grip") and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessCrenel")==2 and has("grip") and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_RainPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions43") ) ) and function_Cached("AccessCrenel")==1 and has("grip") ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions43") ) ) and function_Cached("AccessCrenel")==2 and has("grip") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_UpperBlock_Chest() 
	if ( function_Cached("AccessMelari")==1 ) then
		return 1
	elseif ( function_Cached("AccessMelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_MinesPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions45") ) ) and function_Cached("AccessMelari")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions45") ) ) and function_Cached("AccessMelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Melari_Mining() 
	if ( function_Cached("AccessMelari")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMelari")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Crenel_Melari_NPC() 
	if ( function_Cached("CompleteCoF")==1 ) then
		return 1
	else
		return 0
	end 
end

function CrenelBase_EntranceVine()
	if function_Cached("AccessTrilby")==1 then
		return 1
	elseif function_Cached("AccessTrilby")==2 then
		return 2
	else
		return 0
	end
end

function CrenelBase_FairyCave_Item()
	if ( function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 ) or ( function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or has("grip") ) and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_GreenWaterFusion_Chest()
	if ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 1
	elseif ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or has("grip") ) and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 1
	elseif ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and function_Cached("OverworldBlocks")==1 then
		return 2
	else
		return 0
	end
end

function CrenelBase_WestFusion_Chest()
	if( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) then
		return 1
	elseif ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) then
		return 1
	elseif( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_WaterCave_Chest()
	if function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and ( has("bombs") or has("cape") ) then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("BombWalls")==1 and ( has("bombs") or has("cape") ) then
		return 1
	elseif function_Cached("AccessTrilby")==2 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and ( has("bombs") or has("cape") ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_WaterCave_HP()
	if ( function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and function_Cached("CrenelWaterCaveHP")==1 ) then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("BombWalls")==1 and function_Cached("CrenelWaterCaveHP")==1 then
		return 1
	elseif ( ( function_Cached("AccessTrilby")==1 or function_Cached("AccessTrilby")==2 ) and function_Cached("LowerBean")==1 and function_Cached("BombWalls")==1 and ( function_Cached("CrenelWaterCaveHP")==1 or function_Cached("CrenelWaterCaveHP")==2) ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_MinishVineHole_Chest()
	if function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif ( function_Cached("AccessTrilby")==1 or function_Cached("AccessTrilby")==2 ) and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	else
		return 0
	end
end

function CrenelBase_MinishCrack_Chest()
	if function_Cached("AccessTrilby")==1 and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and function_Cached("CrenelDust")==1 then
		return 1
	elseif ( function_Cached("AccessTrilby")==1 or function_Cached("AccessTrilby")==2 ) and function_Cached("LowerBean")==1 and ( function_Cached("BombWalls")==1 or has("cape") ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	elseif function_Cached("CrenelWindCrest")==1 and ( function_Cached("UpperBean")==1 or ( has("grip") and ( function_Cached("BombWalls")==1 or has("cape") ) ) ) and ( function_Cached("CrenelDust")==1 or function_Cached("CrenelDust")==2 ) then
		return 2
	else
		return 0
	end
end

function Falls_Entrance_HP()
	if ( function_Cached("FallsHP")==1 ) then
		return 1
	elseif ( function_Cached("FallsHP")==2 ) then
		return 2
	elseif ( function_Cached("FallsHP")==3 ) then
		return 3
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_HP()
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and function_Cached("CapeExtension")==1 ) or ( function_Cached("AccessFalls")==1 and has("grip") and ( has("flippers") or ( has("cape") and function_Cached("DarkRooms")==1 ) ) ) ) and has("mitts") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) or ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2 ) and has("grip") and ( has("flippers") or ( has("cape") and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) ) ) ) ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_Chest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and function_Cached("CapeExtension")==1 ) or ( function_Cached("AccessFalls")==1 and has("grip") and ( has("flippers") or ( has("cape") and function_Cached("DarkRooms")==1 ) ) ) ) and has("mitts") ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and ( ( function_Cached("OverworldBlocks")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) or ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2 ) and has("grip") and ( has("flippers") or ( has("cape") and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) ) ) ) ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Falls_1stCave_Chest()
	if ( function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and function_Cached("BombWalls")==1 ) or ( function_Cached("AccessFalls")==1 and has("grip") and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==2 or function_Cached("FallsFusion")==1 ) and ( function_Cached("DarkRooms")==2 or function_Cached("DarkRooms")==1 ) and function_Cached("BombWalls")==1 ) or ( function_Cached("AccessFalls")==2  and has("grip") and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Falls_Cliff_Chest()
	if ( function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and function_Cached("BombWalls")==1 and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) or ( function_Cached("AccessFalls")==1 and has("grip") and function_Cached("BombWalls")==1 and function_Cached("DarkRooms")==1 and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==2 or function_Cached("FallsFusion")==1 ) and ( function_Cached("DarkRooms")==2 or function_Cached("DarkRooms")==1 ) and function_Cached("BombWalls")==1 and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) or ( ( function_Cached("AccessFalls")==1 or function_Cached("AccessFalls")==2) and has("grip") and function_Cached("BombWalls")==1 and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and ( function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Falls_SouthDigSpot()
	if ( function_Cached("OverworldBlocks")==1 and function_Cached("FallsFusion")==1 and function_Cached("DarkRooms")==1 and has("mitts") ) or ( function_Cached("AccessFalls")==1 and has("grip") and has("mitts") ) then
		return 1
	elseif ( function_Cached("OverworldBlocks")==1 and ( function_Cached("FallsFusion")==2 or function_Cached("FallsFusion")==1 ) and ( function_Cached("DarkRooms")==2 or function_Cached("DarkRooms")==1 ) and has("mitts") ) or ( function_Cached("AccessFalls")==2 and has("grip") and has("mitts") ) then
		return 2
	else
		return 0
	end 
end 

function Falls_GoldenTektite() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4a") ) ) and has("golden_enemy_on") and function_Cached("AccessFalls")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4a") ) ) and has("golden_enemy_on") and function_Cached("AccessFalls")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Falls_NorthDigSpot()
	if ( function_Cached("AccessFalls")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Falls_RockFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions61") ) ) and function_Cached("AccessFalls")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions61") ) ) and function_Cached("AccessFalls")==2 ) then
		return 2
	else
		return 0
	end 
end

function Falls_WaterfallFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions13") ) ) and function_Cached("AccessFalls")==1 and has("flippers") ) then 
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions13") ) ) and function_Cached("AccessFalls")==2 and has("flippers") ) then 
		return 2
	else
		return 0
	end 
end

function Falls_RupeeCave_Item() 
	if ( function_Cached("AccessFalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 ) then
		return 2
	else
		return 0
	end 
end

function Falls_RupeeCave_Underwater() 
	if ( function_Cached("AccessFalls")==1 and has("flippers") ) then 
		return 1
	elseif ( function_Cached("AccessFalls")==2 and has("flippers") ) then 
		return 2
	else
		return 0
	end 
end

function Falls_TopCave_BombWall_Chest() 
	if ( function_Cached("AccessFalls")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Falls_TopCave_Chest() 
	if ( function_Cached("AccessFalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessFalls")==2 ) then
		return 2
	else
		return 0
	end 
end
function FallsLower_LonLonFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions60") ) ) and function_Cached("AccessMinishWoods")==1 and has("cane") ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions60") ) ) and function_Cached("AccessMinishWoods")==2 and has("cane") ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_HP() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_WaterfallFusion_DojoNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1d") ) ) and function_Cached("AccessMinishWoods")==1 and has("cane") and has("flippers") and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1d") ) ) and function_Cached("AccessMinishWoods")==2 and has("cane") and has("flippers") and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_RockItem1() 
	if ( function_Cached("LowerFallsItems")==1 ) then
		return 1
	elseif ( function_Cached("LowerFallsItems")==2 ) then
		return 2
	elseif ( function_Cached("Falls_Entrance_HP")==1 ) then
		return 3
	else
		return 0
	end 
end

function FallsLower_RockItem2() 
	if ( function_Cached("LowerFallsItems")==1 ) then
		return 1
	elseif ( function_Cached("LowerFallsItems")==2 ) then
		return 2
	elseif ( function_Cached("Falls_Entrance_HP")==1 ) then
		return 3
	else
		return 0
	end 
end

function FallsLower_RockItem3() 
	if ( function_Cached("LowerFallsItems")==1 ) then
		return 1
	elseif ( function_Cached("LowerFallsItems")==2 ) then
		return 2
	elseif ( function_Cached("Falls_Entrance_HP")==1 ) then
		return 3
	else
		return 0
	end 
end

function FallsLower_DigCave_LeftChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end
function FallsLower_DigCave_RightChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") and ( has("cape") or has("flippers") ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end


function Hylia_SunkenHP() 
	if ( function_Cached("AccessLonLon")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_DogNPC() 
	if ( function_Cached("AccessLonLon")==1 and has("dogbottle") ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and has("dogbottle") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_SmallIsland_HP() 
	if ( function_Cached("AccessLonLon")==1 and function_Cached("LakeIslandHP")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessLonLon")==1 or function_Cached("AccessLonLon")==2 ) and ( function_Cached("LakeIslandHP")==1 or function_Cached("LakeIslandHP")==2) ) then
		return 2
	elseif ( function_Cached("AccessLonLon")==1 ) then
		return 3
	else
		return 0
	end 
end

function Hylia_CapeCave_Chest() 
	if ( function_Cached("AccessTreasureCave")==1 ) then
		return 1
	elseif ( function_Cached("AccessTreasureCave")==2 ) then
		return 2
	else
		return 0
	end 
end

function Hylia_CapeCave_LonLonHP() 
	if ( function_Cached("AccessTreasureCave")==1 ) then
		return 1
	elseif ( function_Cached("AccessTreasureCave")==2 ) then
		return 2
	elseif ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) then
		return 3
	else
		return 0
	end 
end

function Hylia_BeanstalkFusion_HP() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==1 and function_Cached("FusionsBlue")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==2 and function_Cached("FusionsBlue")==1 ) then
		return 2
	else
		return 0
	end 
end

function Hylia_BeanstalkFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==1 and function_Cached("FusionsBlue")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and function_Cached("AccessTreasureCave")==2 and function_Cached("FusionsBlue")==1 ) then
		return 2
	else
		return 0
	end 
end

function Hylia_MiddleIslandFusion_DigCaveChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions34") ) ) and ( function_Cached("AccessLonLon")==1 and has("mitts") and function_Cached("CapeExtension")==1 ) ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions34") ) ) and ( ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) and has("mitts") and ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) ) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_BottomHP() 
	if ( function_Cached("LakeSouthHP")==1 ) then
		return 1
	elseif ( function_Cached("LakeSouthHP")==2 ) then
		return 2
	elseif ( function_Cached("LakeSouthHP")==3 ) then
		return 3
	else
		return 0
	end 
end

function Hylia_Dojo_HP() 
	if ( function_Cached("AccessLonLon")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("LakeShortcut")==1 ) ) then
		return 1
	elseif ( ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) and ( ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) or function_Cached("LakeShortcut")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_Dojo_NPC() 
	if ( function_Cached("AccessLonLon")==1 and has("10hearts") and function_Cached("HasSword")==1 and ( function_Cached("CapeExtension")==1 or function_Cached("LakeShortcut")==1 ) ) then
		return 1
	elseif ( ( function_Cached("AccessLonLon")==2 or function_Cached("AccessLonLon")==1 ) and has("10hearts") and function_Cached("HasSword")==1 and ( ( function_Cached("CapeExtension")==1 or function_Cached("CapeExtension")==2 ) or function_Cached("LakeShortcut")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function Hylia_CrackFusion_LibrariNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions12") ) ) and has("ocarina") and ( has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function Hylia_NorthMinishHole_Chest() 
	if ( function_Cached("AccessSouthLake")==1 and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 ) and has("flippers") ) then
		return 1
	elseif ( ( function_Cached("AccessSouthLake")==2 or function_Cached("AccessSouthLake")==1 ) and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 or function_Cached("LakeMinish")==2 ) and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_SouthMinishHole_Chest() 
	if ( function_Cached("AccessSouthLake")==1 and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 ) and has("flippers") ) then
		return 1
	elseif ( ( function_Cached("AccessSouthLake")==2 or function_Cached("AccessSouthLake")==1 ) and ( function_Cached("BonkedTrees")==1 or function_Cached("LakeMinish")==1 or function_Cached("LakeMinish")==2 ) and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function Hylia_CabinPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions51") ) ) and function_Cached("AccessSouthLake")==1 and ( ( function_Cached("BonkedTrees")==1 and function_Cached("CabinSwim")==1 ) or ( function_Cached("LakeMinish")==1 and has("flippers") and function_Cached("CabinSwim")==1 ) ) )then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions51") ) ) and ( function_Cached("AccessSouthLake")==1 or function_Cached("AccessSouthLake")==2 ) and ( ( function_Cached("BonkedTrees")==1 and ( function_Cached("CabinSwim")==1 or function_Cached("CabinSwim")==2 ) ) or ( ( function_Cached("LakeMinish")==1 or function_Cached("LakeMinish")==2 ) and has("flippers") and ( function_Cached("CabinSwim")==1 or function_Cached("CabinSwim")==2 ) ) ) )then
		return 2
	else
		return 0
	end 
end

function Hylia_MayorCabin_Item() 
	if ( function_Cached("AccessSouthLake")==1 and function_Cached("MayorCabin")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessSouthLake")==1 or function_Cached("AccessSouthLake")==2 ) and ( function_Cached("MayorCabin")==1 or function_Cached("MayorCabin")==2 ) ) then
		return 2
	elseif ( ( function_Cached("AccessSouthLake")==1 or function_Cached("AccessSouthLake")==2 ) ) then
		return 3
	else
		return 0
	end 
end

function MinishWoods_GreatFairy_NPC() 
	if ( function_Cached("AccessMinishWoods")==1 and has("cane") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("cane") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_GoldenOcto() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions56") ) ) and function_Cached("AccessNorthMinish")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions56") ) ) and function_Cached("AccessNorthMinish")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_WitchHut_Item() 
	if ( function_Cached("AccessNorthMinish")==1 ) then
		return 1
	elseif ( function_Cached("AccessNorthMinish")==2 ) then
		return 2
	else
		return 0
	end 
end

function WitchDiggingCave_Chest() 
	if ( function_Cached("AccessNorthMinish")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessNorthMinish")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_NorthFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions44") ) ) and function_Cached("AccessNorthMinish")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions44") ) ) and function_Cached("AccessNorthMinish")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_TopHP() 
	if ( function_Cached("MinishNorthHP")==1 ) then
		return 1
	elseif ( function_Cached("MinishNorthHP")==2 ) then
		return 2
	elseif ( function_Cached("MinishNorthHP")==3 ) then
		return 3
	else
		return 0
	end 
end

function MinishWoods_WestFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions47") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions47") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_LikeLikeDiggingCave_LeftChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("mitts") and function_Cached("LikeLike")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and has("mitts") and ( function_Cached("LikeLike")==1 or function_Cached("LikeLike")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_LikeLikeDiggingCave_RightChest() 
	if ( function_Cached("AccessMinishWoods")==1 and has("mitts") and function_Cached("LikeLike")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessMinishWoods")==1 or function_Cached("AccessMinishWoods")==2 ) and has("mitts") and ( function_Cached("LikeLike")==1 or function_Cached("LikeLike")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_EastFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions46") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions46") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_SouthFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions39") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions39") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_BottomHP() 
	if ( function_Cached("MinishSouthHP")==1 ) then
		return 1
	elseif ( function_Cached("MinishSouthHP")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_CrackFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4e") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4e") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_MinishPathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions37") ) ) and function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions37") ) ) and function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishVillage_BarrelHouse_Item() 
	if ( function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishVillage_HP() 
	if ( function_Cached("AccessMinishWoods")==1 ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_BombMinish_NPC1() 
	if ( function_Cached("AccessBelari")==1 ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_BombMinish_NPC2() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1c") ) ) and function_Cached("AccessBelari")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1c") ) ) and function_Cached("AccessBelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_PostVillageFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions38") ) ) and function_Cached("AccessBelari")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions38") ) ) and function_Cached("AccessBelari")==2 ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_MiddleChest() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_RightChest() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_LeftChest() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function MinishWoods_FlipperHole_HP() 
	if ( function_Cached("AccessBelari")==1 and has("flippers") ) then
		return 1
	elseif ( function_Cached("AccessBelari")==2 and has("flippers") ) then
		return 2
	else
		return 0
	end 
end

function Ruins_ButterflyFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions20") ) ) and function_Cached("AccessRuins")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions20") ) ) and function_Cached("AccessRuins")==2 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_BombCave_Chest() 
	if ( function_Cached("AccessRuins")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessRuins")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_MinishHome_Chest()
	if ( function_Cached("AccessRuins")==1 ) then
		return 1
	elseif ( function_Cached("AccessRuins")==2 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_PillarsFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions64") ) ) and function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions64") ) ) and function_Cached("AccessRuins")==2 and function_Cached("RuinsArmos")==1 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_BeanStalkFusion_BigChest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions17") ) ) and function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 and function_Cached("RuinsTektites")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions17") ) ) and ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 )  and function_Cached("RuinsArmos")==1 and ( function_Cached("RuinsTektites")==1 or function_Cached("RuinsTektites")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_CrackFusion_Chest()
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions41") ) ) and function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 and function_Cached("RuinsTektites")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions41") ) ) and ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 )  and function_Cached("RuinsArmos")==1 and ( function_Cached("RuinsTektites")==1 or function_Cached("RuinsTektites")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_MinishCave_HP() 
	if ( function_Cached("AccessRuins")==1 and function_Cached("RuinsArmos")==1 and function_Cached("RuinsTektites")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 )  and function_Cached("RuinsArmos")==1 and ( function_Cached("RuinsTektites")==1 or function_Cached("RuinsTektites")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_ArmosKill_Chest() 
	if ( function_Cached("AccessRuins")==1 and function_Cached("HasDamageSource")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessRuins")==1 or function_Cached("AccessRuins")==2 ) and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Ruins_GoldenOcto() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions54") ) ) and has("golden_enemy_on") and function_Cached("AccessRuins")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions54") ) ) and has("golden_enemy_on") and function_Cached("AccessRuins")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Ruins_NearFoWFusion_Chest()
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0a") ) ) and function_Cached("AccessRuins")==1 and function_Cached("HasSword")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0a") ) ) and function_Cached("AccessRuins")==2 and function_Cached("HasSword")==1 ) then
		return 2
	else
		return 0
	end 
end

function Smith_House_Chest() 
 return 1
end
function Smith_Floor_Item1() 
 return 1
end
function Smith_Floor_Item2() 
 return 1
end
function SouthField_PuddleFusion_Item()
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions58") ) ) and ( function_Cached("CanDestroyTrees")==1 or has("cape") or has("flippers") or function_Cached("AccessWestern")==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SouthField_Fusion_Chest()
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions53") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions53") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 2
	else
		return 0
	end 
end
function SouthField_TreeFusion_HP()
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions32") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions32") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 2
	else
		return 0
	end 
end
function SouthField_MinishSize_WaterHole_HP() 
	if ( has("flippers") and function_Cached("CanDestroyTrees")==1 and function_Cached("BonkedTrees")==1 ) then
		return 1
	else
		return 0
	end 
end
function SouthField_Tingle_NPC() 
	if ( has("cane") and has("trophy") and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( has("cane") and has("trophy") and function_Cached("AccessEasternHills")==2 ) then
		return 2
	else
		return 0
	end 
end
function Town_CafeLady_NPC() 
	return 1
end
function Town_Shop_80Item() 
	return 1
end
function Town_Shop_300Item() 
	if ( has("wallet") ) then
		return 1
	else
		return 0
	end 
end
function Town_Shop_600Item() 
	if ( has("wallet3") ) then
		return 1
	else
		return 0
	end 
end
function Town_Shop_BehindCounterItem() 
	if ( function_Cached("ShopBack")==1 ) then
		return 1
	elseif ( function_Cached("ShopBack")==2 ) then
		return 2
	else
		return 0
	end 
end
function Town_Shop_AtticChest() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Bakery_AtticChest() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_BackdoorHP() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_LedgeChest() 
	if ( function_Cached("InnLedge")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_Pot() 
		return 1
end
function Town_Well_RightChest() 
	return 1
end
function Town_GoronShop_Set1_Item2() 
	if ( has("goron_eu") and function_Cached("Town_GoronShop_Set1_Item1")==1 and has("wallet") ) then
		return 1
	elseif ( has("goron_jp") and function_Cached("Town_GoronShop_Set1_Item1")==1 and has("wallet") ) then
		return 1
	else
		return 0
	end 
end

function Town_GoronShop_Set1_Item1() 
	if ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions33") ) ) then
		return 1
	else
		return 0
	end 
end

function Town_GoronShop_Set2_Items()
	if function_Cached("Town_GoronShop_Set1_Item1")==1 and has("goron_eu") and has("wallet") then
		return 1
	elseif function_Cached("Town_GoronShop_Set1_Item1")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set3_Item1()
	if function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_eu") and has("wallet2") then
		return 1
	elseif function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set3_Items()
	if function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_eu") and has("wallet") then
		return 1
	elseif function_Cached("Town_GoronShop_Set2_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set4_Items()
	if function_Cached("Town_GoronShop_Set3_Items")==1 and has("goron_eu") and has("wallet2") then
		return 1
	elseif function_Cached("Town_GoronShop_Set3_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set5_Item1()
	if function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_eu") and has("wallet3") then
		return 1
	elseif function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_GoronShop_Set5_Items()
	if function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_eu") and has("wallet2") then
		return 1
	elseif function_Cached("Town_GoronShop_Set4_Items")==1 and has("goron_jp") and has("wallet") then
		return 1
	else
		return 0
	end
end

function Town_Dojo_NPC1() 
	if ( function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC2() 
	if ( function_Cached("HasWhiteSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC3() 
	if ( function_Cached("HasSword")==1 and has("boots") ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC4() 
	if ( function_Cached("HasSword")==1 and has("cape") ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_TopChest() 
	if ( has("bombs") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Roof_Chest() 
	if ( has("cane") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_PathFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions36") ) ) and has("cane") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_Chest() 
	if ( has("cane") and function_Cached("CanSplit4")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_HP() 
	if ( function_Cached("SchoolHP")==1 ) then
		return 1
	elseif ( function_Cached("SchoolHP")==2 ) then
		return 2
	elseif ( function_Cached("SchoolHP")==3 ) then
		return 3
	else
		return 0
	end 
end
function Town_Digging() 
	if ( has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_LeftChest() 
	if ( function_Cached("WellPillar")==1 or has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function Town_Bell_HP() 
	if ( has("cape") ) then
		return 1
	else
		return 0
	end 
end
function Town_WaterfallFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions42") ) ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Town_Carlov_NPC() 
	if ( function_Cached("TownDog")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_BottomChest() 
	if ( function_Cached("WellPillar")==1 or has("flippers") or has("cape") ) then
		return 1
	else
		return 0
	end 
end
function Town_Cuccos_NPC() 
	if ( has("cape") or has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Town_Jullieta_Item() 
	if ( function_Cached("Julietta")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Simulation_Chest() 
	if ( function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_ShoeShop_NPC() 
	if ( has("mushroom") ) then
		return 1
	else
		return 0
	end 
end
function Town_MusicHouse() 
	if ( function_Cached("MusicHouse")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_MusicHouse_HP() 
	if ( function_Cached("MusicHouseHP")==1 ) then
		return 1
	elseif ( function_Cached("MusicHouseHP")==2 ) then
		return 2
	elseif ( function_Cached("MusicHouseHP")==3 ) then
		return 3
	else
		return 0
	end 
end
function Town_Well_PillarChest() 
	if ( function_Cached("WellPillar")==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_DrLeft_AtticItem() 
	if ( function_Cached("DrLeft")==1 and function_Cached("TownDog")==1 ) then
		return 1
	elseif ( function_Cached("DrLeft")==2 and function_Cached("TownDog")==1 ) then
		return 2
	else
		return 0
	end 
end
function Town_Fountain_BigChest() 
	if ( function_Cached("TownMulldozers")==1 ) then
		return 1
	elseif ( function_Cached("TownMulldozers")==2 ) then
		return 2
	else
		return 0
	end 
end
function Town_Fountain_SmallChest() 
	if ( function_Cached("Fountain")==1 and ( has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_HP() 
	if ( function_Cached("Fountain")==1 and function_Cached("FountainHP")==1 ) then
		return 1
	elseif ( function_Cached("Fountain")==1 and function_Cached("FountainHP")==2 ) then
		return 2
	elseif ( function_Cached("Fountain")==1 ) then
		return 3
	else
		return 0
	end 
end
function Town_Library_YellowMinish_NPC() 
	if ( function_Cached("Library")==1 and has("cane") and has("book3") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_FrozenChest() 
	if ( function_Cached("Library")==1 and has("flippers") and has("cane") and has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_BigChest() 
	if ( ( function_Cached("Library")==1 and has("cane") and function_Cached("HasDamageSource")==1 and ( has("flippers") or ( has("book3") and has("grip") and ( has("gust") or has("cape") ) ) ) ) ) then
		return 1
	elseif ( ( function_Cached("Library")==1 and has("cane") and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) and ( has("flippers") or ( has("book3") and has("grip") and ( has("gust") or has("cape") ) ) ) ) ) then
		return 2
	else
		return 0
	end 
end
function Town_UnderLibrary_Underwater() 
	if ( function_Cached("Library")==1 and has("flippers") and has("cane") ) then
		return 1
	else
		return 0
	end 
end
function NorthField_DigSpot() 
	if ( has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function NorthField_HP() 
	if ( function_Cached("OverworldBlocks")==1 or function_Cached("CapeExtension")==1 ) then
		return 1
	elseif ( function_Cached("CapeExtension")==2 ) then
		return 2
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopLeftChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions59") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopRightChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions40") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomLeftChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4d") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomRightChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5a") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_CenterBigChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions59") and has("fusions40") and has("fusions5a") and has("fusions4d") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_WaterfallFusion_DojoNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions15") ) ) and has("flippers") and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_Moat_LeftChest() 
	if ( has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Castle_Moat_RightChest() 
	if ( has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Castle_GoldenRope() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3c") ) ) and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_RightFountainFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions18") ) ) ) then
		return 1
	else
		return 0
	end 
end

function Castle_Dojo_HP() 
		return 1 
end

function Castle_Dojo_NPC() 
	if ( function_Cached("CastleDojo")==1 and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_RightFountainFusion_MinishHoleChest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions18") ) ) and function_Cached("BonkedTrees")==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_LeftFountainFusion_MinishHoleChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions35") ) ) and function_Cached("BonkedTrees")==1 ) then
		return 1
	else
		return 0
	end 
end

function Hills_GoldenRope() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions55") ) ) and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end
function Hills_Fusion_Chest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions16") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions16") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 2
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_LeftChest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 2
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_HP() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_RightChest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") ) ) and function_Cached("AccessEasternHills")==2 ) then
		return 1
	else
		return 0
	end 
end

function Hills_BombCave_Chest() 
	if ( function_Cached("AccessEasternHills")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessEasternHills")==2 and function_Cached("BombWalls")==1 ) then
		return 2
	else
		return 0
	end 
end

function Hills_FarmDigCave_Item() 
	if ( function_Cached("AccessMinishWoods")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessMinishWoods")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function LonLon_RanchPot() 
	if ( function_Cached("CanDestroyTrees")==1 or has("ocarina") ) then
		return 1
	elseif ( function_Cached("CanDestroyTrees")==2 or has("ocarina") ) then
		return 2
	else
		return 0
	end 
end

function LonLon_PuddleFusion_BigChest() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1e") ) ) and function_Cached("AccessLonLon")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1e") ) ) and function_Cached("AccessLonLon")==2 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_Cave_Chest() 
	if ( function_Cached("AccessLonLon")==1 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) ) then
		return 2
	else
		return 0
	end 
end

function LonLon_CaveSecret_Chest() 
	if ( function_Cached("AccessLonLon")==1 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("BombWalls")==1 and function_Cached("LonLonSecret")==1 ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( function_Cached("CanSplit2")==1 or function_Cached("CanSplit3")==1 or function_Cached("CanSplit4")==1 ) and function_Cached("BombWalls")==1 and function_Cached("LonLonSecret")==1 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_Path_FusionChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions50") ) ) and function_Cached("AccessLonLon")==1 and function_Cached("BonkedTrees")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions50") ) ) and function_Cached("AccessLonLon")==2 and function_Cached("BonkedTrees")==1 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_Path_HP() 
	if ( function_Cached("AccessLonLon")==1 and function_Cached("BonkedTrees")==1 ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and function_Cached("BonkedTrees")==1 ) then
		return 2
	else
		return 0
	end 
end

function LonLon_DigSpot() 
	if ( function_Cached("AccessLonLon")==1 and ( has("cane") or has("cape") ) and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( has("cane") or has("cape") ) and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function LonLon_NorthMinishCrack_Chest() 
	if ( function_Cached("AccessLonLon")==1 and ( has("cane") or has("cape") ) ) then
		return 1
	elseif ( function_Cached("AccessLonLon")==2 and ( has("cane") or has("cape") ) ) then
		return 2
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_SmallChest() 
	if has("fusionblue_vanilla") then
		GoronNumber=0;
		if ( has("fusions25") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions26") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions29") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2a") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2b") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2f") ) then
			GoronNumber = GoronNumber + 1
		end
	elseif has("fusionblue_complet") then
		GoronNumber = 6
	else
		GoronNumber = 0
	end
	if ( GoronNumber >=4 and function_Cached("GoronCave")==1 and ( function_Cached("CanDestroyTrees")==1 or has("ocarina") ) ) then
		return 1
	elseif ( GoronNumber >=4 and ( function_Cached("GoronCave")==1 or function_Cached("GoronCave")==2 ) and (  function_Cached("CanDestroyTrees")==1 or function_Cached("CanDestroyTrees")==2 or has("ocarina") ) ) then
		return 2
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_BigChest() 
	if has("fusionblue_vanilla") then
		local GoronNumber=0;
		if ( has("fusions25") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions26") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions29") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2a") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2b") ) then
			GoronNumber = GoronNumber + 1
		end
		if ( has("fusions2f") ) then
			GoronNumber = GoronNumber + 1
		end
	elseif has("fusionblue_complet") then
		GoronNumber = 6
	else
		GoronNumber = 0
	end

	if ( GoronNumber>=6 and function_Cached("GoronCave")==1 and ( function_Cached("CanDestroyTrees")==1 or has("ocarina") ) ) then
		return 1
	elseif ( GoronNumber >=6 and ( function_Cached("GoronCave")==1 or function_Cached("GoronCave")==2 ) and (  function_Cached("CanDestroyTrees")==1 or function_Cached("CanDestroyTrees")==2 or has("ocarina") ) ) then
		return 2
	else
		return 0
	end 
end

function Swamp_ButterflyFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions10") ) ) and function_Cached("AccessSwamp")==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_CenterCave_DarknutChest() 
	if ( function_Cached("AccessSwamp")==1 and function_Cached("SwampDarknut")==1 ) then
		return 1
	elseif ( function_Cached("AccessSwamp")==1 and ( function_Cached("SwampDarknut")==1 or function_Cached("SwampDarknut")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Swamp_CenterChest() 
	if ( function_Cached("AccessSwamp")==1 and function_Cached("HasBow")==1 ) then
		return 1
	else
		return 0
	end 
end


function Swamp_GoldenRope() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions49") ) ) and function_Cached("AccessSwamp")==1 and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NearWaterfall_CaveHP() 
	if ( function_Cached("AccessSwamp")==1 and ( function_Cached("SwampNorthShortcut")==1 or function_Cached("HasBow")==1 ) and ( has("cape") or has("flippers") ) ) then
		return 1 
	else
		return 0
	end 
end

function Swamp_WaterfallFusion_DojoNPC() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0c") ) ) and function_Cached("AccessSwamp")==1 and ( function_Cached("SwampNorthShortcut")==1 or function_Cached("HasBow")==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NorthCave_Chest() 
	if ( function_Cached("AccessSwamp")==1 and ( function_Cached("SwampNorthShortcut")==1 or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_DiggingCave_Chest() 
	if ( function_Cached("AccessSwamp")==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Underwater() 
	if ( function_Cached("AccessSwamp")==1 and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_SouthCave_Chest() 
	if ( function_Cached("AccessSwamp")==1 and ( has("flippers") or has("cape") or ( function_Cached("HasBow")==1 and has("boots") ) or ( function_Cached("SwampShortcut")==1 and function_Cached("SwampSouthShortcut")==1 ) or ( function_Cached("SwampWindCrest")==1 and ( function_Cached("HasBow")==1 or function_Cached("SwampSouthShortcut")==1 ) ) ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Dojo_HP()
	if ( ( function_Cached("AccessSwamp")==1 and ( has("cape") or function_Cached("HasBow")==1 or ( has("boots") and has("flippers") ) ) ) or ( function_Cached("SwampWindCrest")==1 and has("boots") ) ) then
		return 1
	else
		return 0
	end 
end
function Swamp_Dojo_NPC() 
	if ( ( function_Cached("AccessSwamp")==1 and ( has("cape") or function_Cached("HasBow")==1 or ( has("boots") and has("flippers") ) ) and function_Cached("GotScrolls")==1 and function_Cached("HasSword")==1 ) or ( function_Cached("SwampWindCrest")==1 and has("boots") and function_Cached("GotScrolls")==1 and function_Cached("HasSword")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4b") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Minish_Mulldozer_BigChest() 
	if ( function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and ( has("flippers") or has("gust") ) and function_Cached("HasDamageSource")==1 ) then
		return 1
	elseif ( function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and ( has("flippers") or has("gust") ) and ( function_Cached("HasDamageSource")==1 or function_Cached("HasDamageSource")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthWestCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5b") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and ( has("flippers") or has("gust") ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WestCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_VineCrack_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3e") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_HP() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and function_Cached("AccessSwamp")==1 and ( has("boots") or has("cape") or function_Cached("HasBow")==1 ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end


function Swamp_Fusion() 
	if ( function_Cached("AccessSwamp")==1 and function_Cached("RuinsFusion")==1 ) then
		return 1
	elseif ( function_Cached("AccessSwamp")==1 and function_Cached("RuinsFusion")==2 ) then
		return 2
	else
		return 0
	end 
end

function Trilby_MiddleFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5e") ) ) and function_Cached("AccessTrilby")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5e") ) ) and function_Cached("AccessTrilby")==2 ) then
		return 2
	else
		return 0
	end 
end

function Trilby_TopFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions52") ) ) and function_Cached("AccessTrilby")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions52") ) ) and function_Cached("AccessTrilby")==2 ) then
		return 2
	else
		return 0
	end 
end

function Trilby_DigCave_LeftChest() 
	if ( function_Cached("AccessTrilby")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Trilby_DigCave_RightChest() 
	if ( function_Cached("AccessTrilby")==1 and has("mitts") ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and has("mitts") ) then
		return 2
	else
		return 0
	end 
end

function Trilby_DigCave_WaterFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions22") ) ) and function_Cached("AccessTrilby")==1 and has("mitts") and ( has("cape") or has("flippers") ) ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions22") ) ) and function_Cached("AccessTrilby")==2 and has("mitts") and ( has("cape") or has("flippers") ) ) then
		return 2
	else
		return 0
	end 
end

function Trilby_Scrub_NPC() 
	if ( function_Cached("AccessTrilby")==1 and function_Cached("BombWalls")==1 and function_Cached("Scrubs")==1 ) then
		return 1
	elseif ( function_Cached("AccessTrilby")==2 and function_Cached("BombWalls")==1 and function_Cached("Scrubs")==1 ) then
		return 2
	else
		return 0
	end 
end

function Trilby_BombCave_Chest() 
	if ( function_Cached("AccessWestern")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	else
		return 0
	end 
end

function Trilby_PuddleFusion_Item() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3f") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end
function Valley_PreValleyFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5f") ) ) and function_Cached("AccessValley")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5f") ) ) and function_Cached("AccessValley")==2 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GreatFairy_NPC() 
	if ( function_Cached("AccessValley")==1 and function_Cached("BombWalls")==1 ) then
		return 1
	elseif ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and function_Cached("BombWalls")==1  then
		return 2
	else
		return 0
	end 
end

function Valley_LostWoods_Chest() 
	if ( function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 ) then
		return 1
	elseif ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) then
		return 2
	else
		return 0
	end 
end

function Valley_Dampe_NPC() 
	if ( function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 ) then
		return 1
	elseif ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardButterflyFusion_Item() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions19") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions19") ) ) and( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardLeftFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5c") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5c") ) ) and ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardLeftGrave_HP() 
	if ( function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 and function_Cached("LeftGraveHP")==1 ) then
		return 1
	elseif ( ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 and ( function_Cached("LeftGraveHP")==1 or function_Cached("LeftGraveHP")==2 ) ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardRightFusion_Chest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5d") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5d") ) ) and ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end

function Valley_GraveyardRightGraveFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions30") ) ) and function_Cached("AccessValley")==1 and function_Cached("DarkRooms")==1 and function_Cached("Graveyard")==1 ) then
		return 1
	elseif ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions30") ) ) and ( function_Cached("AccessValley")==1 or function_Cached("AccessValley")==2 ) and ( function_Cached("DarkRooms")==1 or function_Cached("DarkRooms")==2 ) and function_Cached("Graveyard")==1 ) then
		return 2
	else
		return 0
	end 
end
function WesternWoods_FusionChest() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3a") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TreeFusion_HP() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions11") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TopDig() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions48") ) ) and function_Cached("AccessWestern")==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_PercyFusion_Moblin() 
	if ( function_Cached("AccessWestern")==1 and function_Cached("Percy")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_PercyFusion_Percy() 
	if ( function_Cached("AccessWestern")==1 and function_Cached("Percy")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BottomDig() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4c") ) ) and function_Cached("AccessWestern")==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_GoldenOcto() 
	if ( ( has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3d") ) ) and function_Cached("AccessWestern")==1 and function_Cached("HasSword")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BeanstalkFusion_Chest() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions24") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BeanstalkFusion_Item() 
	if ( ( has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions24") ) ) and function_Cached("AccessWestern")==1 ) then
		return 1
	else
		return 0
	end 
end

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




