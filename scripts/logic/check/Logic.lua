function Castle_RightFountainFusion_HP() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions18") ) ) ) then
		return 1
	else
		return 0
	end 
end

function Castle_Dojo_HP() 
		return 1 
end

function Castle_Dojo_NPC() 
	if ( CastleDojo()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_RightFountainFusion_MinishHoleChest() 
	if (( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions18") ) ) and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function Castle_LeftFountainFusion_MinishHoleChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions35") ) ) and BonkedTrees()==1 ) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3c") ) ) and has("golden_enemy_on") and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

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

function Crenel_BridgeCave_Chest() 
	if ( AccessCrenel()==1 and  BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_FairyCave_HP() 
	if ( AccessCrenel()==1 and  BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Scrub_NPC()
	if ( AccessCrenel()==1 and BombWalls()==1 and  (has("grip") or has("bombs") or CrenelMushroom()==1 ) and Scrubs()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Dojo_Chest() 
	if ( AccessCrenel()==1 and has("grip") and CrenelDojo()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Dojo_HP() 
	if ( AccessCrenel()==1 and has("grip") and CrenelDojo()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Dojo_NPC() 
	if ( AccessCrenel()==1 and has("grip") and CrenelDojo()==1 and HasSword()==1) then
		return 1
	else
		return 0
	end 
end

function Crenel_GreatFairy_NPC()
	if ( AccessCrenel()==1 and has("grip") and BombWalls()==1 and (has("bombs") or HasBottle()==1) ) then
		return 1
	else
		return 0
	end 
end

function Crenel_ClimbFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions62") ) ) and AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_DigCave_HP() 
	if ( AccessCrenel()==1 and has("grip") and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_HP() 
	if ( (  has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_BeanstalkFusion_Item() 
	if ( (  has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1a") ) ) and AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_RainPathFusion_Chest() 
	if ( (  has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions43") ) ) and AccessCrenel()==1 and has("grip") ) then
		return 1
	else
		return 0
	end 
end

function Crenel_UpperBlock_Chest() 
	if ( AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_MinesPathFusion_Chest() 
	if ( (  has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions45") ) ) and AccessMelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_Melari_Mining() 
	if ( AccessMelari()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end

function Crenel_Melari_NPC() 
	if ( CompleteCoF()==1 ) then
		return 1
	else
		return 0
	end 
end

function Crenel_BelowCoF_GoldenTektite() 
	if ( ( has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0d") ) ) and has("golden_enemy_on") and AccessCrenel()==1 and HasSword()==1 and ( has("grip") or has("bombs") or CrenelMushroom()==1 or WindCrest()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function Crenel_VineTop_GoldenTektite() 
	if (  has("golden_enemy_on") and ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3b") ) ) and AccessCrenel()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function CrenelBase_EntranceVine()
    if AccessTrilby()==1 then
        return 1
    else
        return 0
    end
end

function CrenelBase_FairyCave_Item()
    if ( AccessTrilby()==1  and LowerBean()==1 and BombWalls()==1 ) or (WindCrest()==1 and (UpperBean()==1 or has("grip")) and BombWalls()==1) then
        return 1
    else
        return 0
    end
end

function CrenelBase_GreenWaterFusion_Chest()
    if ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and AccessTrilby()==1 and LowerBean()==1 and BombWalls()==1 and OverworldBlocks()==1 then
        return 1
    elseif ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4f") ) ) and WindCrest()==1 and (UpperBean()==1 or has("grip") ) and BombWalls()==1 and OverworldBlocks()==1 then
        return 1
    else
        return 0
    end
end

function CrenelBase_WestFusion_Chest()
    if( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and  AccessTrilby()==1 and LowerBean()==1 and (BombWalls()==1 or has("cape")) then
        return 1
    elseif ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions63") ) ) and WindCrest()==1 and ( UpperBean()==1 or ( has("grip") and ( BombWalls()==1  or has("cape") ) ) ) then
        return 1
    else
        return 0
    end
end

function CrenelBase_WaterCave_Chest()
    if AccessTrilby()==1 and LowerBean()==1 and BombWalls()==1 and ( has("bombs") or has("cape") ) then
        return 1
    elseif  WindCrest()==1 and ( UpperBean()==1 or ( has("grip") and ( Helpers.BombWalls()==1 or has("cape") ) ) ) and Helpers.BombWalls()==1 and ( has("bombs") or has("cape") ) then
        return 1
    else
        return 0
    end
end

function CrenelBase_WaterCave_HP()
    if AccessTrilby()==1 and LowerBean()==1 and BombWalls()==1 and ( has("bombs") or has("cape") or has("flippers") ) then
        return 1
    elseif WindCrest()==1 and ( UpperBean()==1 or ( has("grip") and ( BombWalls()==1 or has("cape") ) ) ) and BombWalls()==1 and ( has("bombs") or has("cape") or has("flippers") ) then
        return 1
    else
        return 0
    end
end

function CrenelBase_MinishVineHole_Chest()
    if AccessTrilby()==1 and LowerBean()==1 and ( BombWalls()==1 or has("cape") ) and CrenelDust()==1  then
        return 1
    elseif  WindCrest()==1 and ( UpperBean()==1 or ( has("grip") and ( BombWalls()==1 or has("cape") ) ) ) and CrenelDust()==1 then
        return 1
    else
        return 0
    end
end

function CrenelBase_MinishCrack_Chest()
    if AccessTrilby()==1 and LowerBean()==1 and ( BombWalls()==1 or has("cape") ) and CrenelDust()==1  then
        return 1
    elseif  WindCrest()==1 and ( UpperBean()==1 or ( has("grip") and ( BombWalls()==1 or has("cape") ) ) ) and CrenelDust()==1 then
        return 1
    else
        return 0
    end
end

function Falls_Entrance_HP()
	if ( OverworldBlocks()==1 and CapeExtension()==1 ) or ( AccessFalls()==1 and has("grip") and ( has("flippers") or ( has("cape") and DarkRooms()==1 ) ) )
    then
		return 1
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_HP()
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and OverworldBlocks()==1 and CapeExtension()==1 and has("mitts") ) or ( AccessFalls()==1 and has("grip")==1 and ( has("flippers")==1 or ( has("cape")==1 and DarkRooms()==1 ) ) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_WaterDigCaveFusion_Chest() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1f") ) ) and OverworldBlocks()==1 and CapeExtension()==1 and has("mitts") ) or ( AccessFalls()==1 and has("grip") and ( has("flippers")==1 or ( has("cape")==1 and DarkRooms()==1 ) ) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_1stCave_Chest()
	if ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and BombWalls()==1 ) or ( AccessFalls()==1 and has("grip") and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_Cliff_Chest()
	if ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and BombWalls()==1 and CanSplit3()==1 ) or ( AccessFalls()==1 and has("grip") and BombWalls()==1 and DarkRooms()==1 and CanSplit3()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_SouthDigSpot()
	if ( OverworldBlocks()==1 and FallsFusion()==1 and DarkRooms()==1 and has("mitts") ) or ( AccessFalls()==1 and has("grip") and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_NorthDigSpot()
	if ( AccessFalls()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Falls_RockFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions61") ) ) and AccessFalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_WaterfallFusion_HP() 
    if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions13") ) ) and AccessFalls()==1 and has("flippers") ) then   
        return 1
	else
		return 0
	end 
end

function Falls_RupeeCave_Item() 
	if ( AccessFalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_RupeeCave_Underwater() 
    if ( AccessFalls()==1 and has("flippers") ) then   
       return 1
	else
		return 0
	end 
end

function Falls_TopCave_BombWall_Chest() 
	if ( AccessFalls()==1 and BombWalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_TopCave_Chest() 
	if ( AccessFalls()==1 ) then
		return 1
	else
		return 0
	end 
end

function Falls_GoldenTektite() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4a") ) ) and has("golden_enemy_on") and AccessFalls()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_LonLonFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions60") ) ) and AccessMinishWoods()==1 and has("cane") ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_HP() 
	if ( AccessMinishWoods()==1 and has("cane") ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_WaterfallFusion_DojoNPC() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1d") ) ) and AccessMinishWoods()==1 and has("cane") and has("flippers") and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function FallsLower_RockItem1() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("flippers") or has("cape") ) ) then
		return 1
	elseif ( Falls_Entrance_HP()==1 ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_RockItem2() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("flippers") or has("cape") ) ) then
		return 1
	elseif ( Falls_Entrance_HP()==1 ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_RockItem3() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("flippers") or has("cape") ) ) then
		return 1
	elseif ( Falls_Entrance_HP()==1 ) then
		return 2
	else
		return 0
	end 
end

function FallsLower_DigCave_LeftChest() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("cape") or has("flippers")) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end
function FallsLower_DigCave_RightChest() 
	if ( AccessMinishWoods()==1 and has("cane") and (has("cape") or has("flippers")) and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Hills_Fusion_Chest() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions16") ) ) and ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_LeftChest() 
	if ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") )  and  ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_HP() 
	if ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") )  and  ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BeanstalkFusion_RightChest() 
	if ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions2e") )  and  ( CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

function Hills_BombCave_Chest() 
	if ( (CanDestroyTrees()==1 or WindCrest()==1) and BombWalls()==1) then
		return 1
	else
		return 0
	end 
end

function Hills_FarmDigCave_Item() 
	if ( has("rupees_on") and AccessMinishWoods()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Hills_GoldenRope() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions55") ) ) and has("golden_enemy_on") and HasSword()==1 and (CanDestroyTrees()==1 or WindCrest()==1) ) then
		return 1
	else
		return 0
	end 
end

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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions34") ) ) and (  AccessLonLon()==1 and has("mitts") and CapeExtension()==1 ) ) then
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
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions12") ) ) and has("ocarina") and ( has("flippers") or has("cape"))  ) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions51") ) ) and AccessSouthLake()==1 and ( (BonkedTrees()==1 and CabinSwim()==1 ) or ( LakeMinish()==1 and has("flippers") and CabinSwim()==1 )))then
		return 1
	elseif ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions51") ) ) and AccessSouthLake()==1 and ( (BonkedTrees()==1 and CabinSwim()==2 ) or ( LakeMinish()==1 and has("flippers") and CabinSwim()==2 )))then
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
	if ( ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and AccessTreasureCave()==1 and FusionsBlue()==1 ) then
		return 1
	else
		return 0
	end 
end

function Hylia_BeanstalkFusion_Chest() 
	if ( ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions23") ) ) and AccessTreasureCave()==1 and FusionsBlue()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_RanchPot() 
	if ( CanDestroyTrees()==1 or has("ocarina") ) then
		return 1
	else
		return 0
	end 
end

function LonLon_PuddleFusion_BigChest() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1e") ) ) and AccessLonLon()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_Cave_Chest() 
	if ( AccessLonLon()==1 and CanSplit2()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_CaveSecret_Chest() 
	if ( AccessLonLon()==1 and CanSplit2()==1  and BombWalls()==1 and has("lamp") ) then
		return 1
	else
		return 0
	end 
end

function LonLon_Path_FusionChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions50") ) ) and AccessLonLon()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_Path_HP() 
	if ( AccessLonLon()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end

function LonLon_DigSpot() 
	if ( AccessLonLon()==1 and ( has("cane") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function LonLon_NorthMinishCrack_Chest() 
	if ( AccessLonLon()==1 and ( has("cane") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_SmallChest() 
	if has("fusionblue_vanilla") then
		GoronNumber=0;
		if (has("fusions25")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions26")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions29")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions2a")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions2b")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions2f")) then
			GoronNumber = GoronNumber + 1
		end
	elseif has("openworld_on") or has("fusionblue_complet") then
		GoronNumber = 6
	else
		GoronNumber = 0
	end
	if ( GoronNumber >=4 and GoronCave()==1 and ( CanDestroyTrees()==1 or has("ocarina"))) then
		return 1
	else
		return 0
	end 
end

function LonLon_GoronCaveFusion_BigChest() 
	if has("fusionblue_vanilla") then
		local GoronNumber=0;
		if (has("fusions25")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions26")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions29")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions2a")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions2b")) then
			GoronNumber = GoronNumber + 1
		end
		if (has("fusions2f")) then
			GoronNumber = GoronNumber + 1
		end
	elseif has("openworld_on") or has("fusionblue_complet") then
		GoronNumber = 6
	else
		GoronNumber = 0
	end

	if ( GoronNumber>=6 and GoronCave()==1 and ( CanDestroyTrees()==1 or has("ocarina"))) then
		return 1
	else
		return 0
	end 
end

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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions44") ) ) and AccessNorthMinish()==1) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions47") ) ) and AccessMinishWoods()==1 and FusionsGreen()==1) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions46") ) ) and AccessMinishWoods()==1 ) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_SouthFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions39") ) ) and AccessMinishWoods()==1 and FusionsGreen()==1) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4e") ) ) and AccessMinishWoods()==1) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_MinishPathFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions37") ) ) and AccessMinishWoods()==1 ) then
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
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions1c") ) ) and AccessBelari()==1 ) then
		return 1
	else
		return 0
	end 
end

function MinishWoods_PostVillageFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions38") ) ) and AccessBelari()==1 ) then
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

function MinishWoods_GoldenOcto() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions56") ) ) and has("golden_enemy_on") and AccessNorthMinish()==1 and HasSword()==1 ) then
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
	if ( OverworldBlocks()==1 or CapeExtension()==1 ) then
		return 1
	elseif ( CapeExtension()==2 ) then
		return 2
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopLeftChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions59") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_TopRightChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions40") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomLeftChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4d") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_BottomRightChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5a") ) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_TreeFusion_CenterBigChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions59") and has("fusions40") and has("fusions5a") and has("fusions4d")) ) ) then
		return 1
	else
		return 0
	end 
end
function NorthField_WaterfallFusion_DojoNPC() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions15") ) ) and has("flippers") and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function Ruins_ButterflyFusion_Item() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions20") ) ) and AccessRuins()==1 ) then
		return 1
	else
		return 0
	end 
end

function Ruins_BombCave_Chest() 
    if ( AccessRuins()==1 and BombWalls()==1 ) then
        return 1
	else
		return 0
	end 
end

function Ruins_MinishHome_Chest()
	if ( AccessRuins()==1 ) then
		return 1
	else
		return 0
	end 
end

function Ruins_PillarsFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions64") ) ) and AccessRuins()==1 and RuinsShortcut()==1) then
		return 1
	else
		return 0
	end 
end

function Ruins_BeanStalkFusion_BigChest() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions17") ) ) and AccessRuins()==1 and RuinsShortcut()==1 and RuinsTektites()==1) then
		return 1
	else
		return 0
	end 
end

function Ruins_CrackFusion_Chest()
    if (( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions41") ) ) and  AccessRuins()==1 and RuinsShortcut()==1 and RuinsTektites()==1) then
        return 1
	else
		return 0
	end 
end

function Ruins_MinishCave_HP() 
    if ( AccessRuins()==1 and RuinsShortcut()==1 and RuinsTektites()==1) then
		return 1
	else
		return 0
	end 
end

function Ruins_ArmosKill_Chest() 
	if ( AccessRuins()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function Ruins_NearFoWFusion_Chest()
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0a") ) ) and AccessRuins()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end

function Ruins_GoldenOcto() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions54") ) ) and has("golden_enemy_on") and AccessRuins()==1 and HasSword()==1 ) then
		return 1
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions58") ) ) and  has("rupees_on") and ( CanDestroyTrees()==1 or has("cape") or has("flippers") or AccessWestern()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SouthField_Fusion_Chest()
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions53") ) ) and ( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SouthField_TreeFusion_HP()
	if ( ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions32") ) ) and( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function SouthField_MinishSize_WaterHole_HP() 
	if ( has("flippers") and CanDestroyTrees()==1 and BonkedTrees()==1 ) then
		return 1
	else
		return 0
	end 
end
function SouthField_Tingle_NPC() 
	if ( has("cane")  and has("trophy") and ( CanDestroyTrees()==1 or WindCrest()==1 ) ) then
		return 1
	else
		return 0
	end 
end
function Swamp_ButterflyFusion_Item() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions10") ) ) and AccessSwamp()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_CenterCave_DarknutChest() 
	if ( AccessSwamp()==1 and HasDamageSource()==1) then
		return 1
	else
		return 0
	end 
end

function Swamp_CenterChest() 
	if ( AccessSwamp()==1 and HasBow()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NearWaterfall_CaveHP() 
	if ( AccessSwamp()==1  and SwampNorthShortcut()==1 and ( has("cape") or has("flippers") ) ) then
		return 1 
	else
		return 0
	end 
end

function Swamp_WaterfallFusion_DojoNPC() 
	if ( (  has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions0c") ) ) and AccessSwamp()==1  and SwampNorthShortcut()==1 and ( has("cape") or has("flippers") ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_NorthCave_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4b") ) ) and AccessSwamp()==1 and SwampNorthShortcut()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_DiggingCave_Chest() 
	if ( AccessSwamp()==1 and has("mitts") ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Underwater() 
	if ( AccessSwamp()==1 and has("flippers")  ) then
		return 1
	else
		return 0
	end 
end

function Swamp_SouthCave_Chest() 
	if ( AccessSwamp()==1 and SwampShortcut()==1 and SwampSouthShortcut()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_Dojo_HP() 
	if ( (AccessSwamp()==1 and (has("cape") or HasBow()==1)  ) or (WindCrest()==1 and has("boots")) ) then
		return 1
	else
		return 0
	end 
end
function Swamp_Dojo_NPC() 
	if ( (AccessSwamp()==1 and (has("cape") or HasBow()==1) and GotScrolls()==1 and HasSword()==1  ) or (WindCrest()==1 and has("boots")  and GotScrolls()==1 and HasSword()==1) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthCrack_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 )) then
		return 1
	else
		return 0
	end 
end

function Swamp_Minish_Mulldozer_BigChest() 
	if ( AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and ( has("flippers") or has("gust") ) and HasDamageSource()==1 ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_NorthWestCrack_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5b") ) ) and AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and ( has("flippers") or has("gust") ) ) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WestCrack_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 )) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_VineCrack_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3e") and has("fusions57") ) ) and AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 )) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and has("flippers")) then
		return 1
	else
		return 0
	end 
end

function Swamp_MinishFusion_WaterHole_HP() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions57") ) ) and AccessSwamp()==1 and ( has("boots") or has("cape") or HasBow()==1 ) and has("flippers")) then
		return 1
	else
		return 0
	end 
end

function Swamp_GoldenRope() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions49") ) ) and has("golden_enemy_on") and AccessSwamp()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end


function Swamp_Fusion() 
	if ( AccessSwamp()==1 and RuinsFusion()==1 and ( has("boots") or ( has("cape") and has("flippers") ) ) ) then
		return 1
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
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_Pot() 
	if ( has("specialpot_on") ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_RightChest() 
	return 1
end
function Town_Dojo_NPC1() 
	if ( HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC2() 
	if ( Sword2()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC3() 
	if ( HasSword()==1 and has("boots") ) then
		return 1
	else
		return 0
	end 
end
function Town_Dojo_NPC4() 
	if ( HasSword()==1 and has("cape") ) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions36") ) ) and has("cane") ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_Chest() 
	if ( has("cane") and CanSplit4()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_School_Path_HP() 
	if ( has("cane") and CanSplit4()==1 ) then
		return 1
	elseif ( has("cane") ) then
		return 2
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
	if ( WellPillar()==1 or has("mitts") ) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions42") ) ) and has("flippers") ) then
		return 1
	else
		return 0
	end 
end
function Town_Carlov_NPC() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_BottomChest() 
	if ( WellPillar()==1 or has("flippers") or has("cape") ) then
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
	if ( Julietta()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Shop_AtticChest() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Bakery_AtticChest() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_BackdoorHP() 
	if ( TownDog()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Inn_LedgeChest() 
	if ( InnLedge()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Simulation_Chest() 
	if ( HasSword()==1 ) then
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
	if ( MusicHouse()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Well_PillarChest() 
	if ( WellPillar()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_DrLeft_AtticItem() 
	if ( DrLeft()==1 and TownDog()==1 )  then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_BigChest() 
	if ( TownMulldozers()==1 ) then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_SmallChest() 
	if ( Fountain()==1 and ( has("flippers") or has("cape") ) ) then
		return 1
	else
		return 0
	end 
end
function Town_Fountain_HP() 
	if ( Fountain()==1 and has("cape") ) then
		return 1
	elseif ( Fountain()==1 ) then
		return 2
	else
		return 0
	end 
end
function Town_Library_YellowMinish_NPC() 
	if ( Library()==1 and has("cane") and has("book3") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_FrozenChest() 
	if ( Library()==1 and has("flippers") and has("cane") and has("lamp") ) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_BigChest() 
	if ( ( Library()==1 and has("cane") and HasDamageSource()==1 and ( has("flippers") or  (has("book3") and has("grip") and ( has("gust") or has("cape")))))) then
		return 1
	else
		return 0
	end 
end
function Town_UnderLibrary_Underwater() 
	if ( has("rupees_on") and has("underwater_on") and Library()==1 and has("flippers") and has("cane") ) then
		return 1
	else
		return 0
	end 
end
function Trilby_MiddleFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5e") ) ) and AccessTrilby()==1) then
		return 1
	else
		return 0
	end 
end

function Trilby_TopFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions52") ) ) and AccessTrilby()==1) then
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
	if ( ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions22") ) ) and AccessTrilby()==1 and has("mitts") and ( has("cape") or has("flippers") ) ) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3f") ) ) and AccessWestern()==1 ) then
		return 1
	else
		return 0
	end 
end
function Valley_PreValleyFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5f") ) ) and AccessValley()==1) then
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
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions19") ) ) and AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end

function Valley_GraveyardLeftFusion_Chest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5c") ) ) and AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
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
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions5d") ) ) and AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end

function Valley_GraveyardRightGraveFusion_Chest() 
	if ( ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions30") ) ) and AccessValley()==1 and DarkRooms()==1 and Graveyard()==1 ) then
		return 1
	else
		return 0
	end 
end
function WesternWoods_FusionChest() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3a") ) ) and AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TreeFusion_HP() 
	if ( ( has("openworld_on") or has("fusionred_complet") or ( has("fusionred_vanilla") and has("fusions11") ) ) and AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_TopDig() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions48") ) ) and AccessWestern()==1 and has("mitts")) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BottomDig() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions4c") ) ) and AccessWestern()==1 and has("mitts")) then
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
	if ( ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions24") ) ) and AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_BeanstalkFusion_Item() 
	if ( ( has("openworld_on") or has("fusionblue_complet") or ( has("fusionblue_vanilla") and has("fusions24") ) ) and AccessWestern()==1) then
		return 1
	else
		return 0
	end 
end

function WesternWoods_GoldenOcto() 
	if ( ( has("openworld_on") or has("fusiongreen_complet") or ( has("fusiongreen_vanilla") and has("fusions3d") ) ) and has("golden_enemy_on") and AccessWestern()==1 and HasSword()==1 ) then
		return 1
	else
		return 0
	end 
end
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




