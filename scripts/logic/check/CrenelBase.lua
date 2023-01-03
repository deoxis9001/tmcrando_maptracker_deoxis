function CrenelBase_EntranceVine()
    if AccessTrilby()==1 then
        return 1
    elseif AccessTrilby()==2 then
        return 2
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
    if AccessTrilby()==1 and LowerBean()==1 and BombWalls()==1 and OverworldBlocks()==1 then
        return 1
    elseif WindCrest()==1 and (UpperBean()==1 or has("grip") ) and BombWalls()==1 and OverworldBlocks()==1 then
        return 1
    else
        return 0
    end
end

function CrenelBase_WestFusion_Chest()
    if AccessTrilby()==1 and LowerBean()==1 and (BombWalls()==1 or has("cape")) then
        return 1
    elseif WindCrest()==1 and ( UpperBean()==1 or ( has("grip") and ( BombWalls()==1  or has("cape") ) ) ) then
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


