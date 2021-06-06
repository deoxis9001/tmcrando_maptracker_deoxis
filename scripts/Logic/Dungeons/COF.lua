
function CofEnter()
    if has("bottle") and has("sword") and has("spinattack") and has("grip") and has("gust") and has("bombs") then
        return 1
    elseif has("bottle") and has("sword") and has("spinattack") and has("grip") and has("gust") and has("bow") then
        return 1
    elseif has("bottle") and has("sword") and has("spinattack") and has("grip") and has("gust") and has("boomerang") then
        return 1
    elseif has("bottle") and has("sword") and has("spinattack") and has("grip") and has("gust") and has("lights") then
        return 1
    elseif has("bottle") and has("sword") and has("spinattack") and has("grip") and has("gust") and CanBeam() then
        return 1
    elseif has("bottle") and has("sword") and has("spinattack") and has("grip") and has("gust") and has("cane") then
        return 1
    elseif has("bottle") and has("sword") and has("spinattack") and has("grip") and has("cane") then
        return 1
    elseif has("bottle") and has("sword") and has("spinattack") and has("bombs") and has("cane") then
        return 1
    elseif has("bottle") and has("flippers") and has("grip") and has("gust") and has("bombs") then
        return 1
    elseif has("bottle") and has("flippers") and has("grip") and has("gust") and has("bow") then
        return 1
    elseif has("bottle") and has("flippers") and has("grip") and has("gust") and has("boomerang") then
        return 1
    elseif has("bottle") and has("flippers") and has("grip") and has("gust") and has("lights") then
        return 1
    elseif has("bottle") and has("flippers") and has("grip") and has("gust") and has("sword") and CanBeam() then
        return 1
    elseif has("bottle") and has("flippers") and has("grip") and has("cane") then
        return 1
    elseif has("bottle") and has("flippers") and has("bombs") and has("cane") then
        return 1
    elseif has("bottle") and has("cape") and has("grip") then
        return 1
    elseif has("bottle") and has("cape") and has("bombs")  and has("cane")  then
        return 1
    else
        return 0
    end
end
function CofEnterHL()
    if has("bottle") and has("boots") and has("grip") and has("gust") and has("bombs") then
        return 1
    elseif has("bottle") and has("boots") and has("grip") and has("gust") and has("bow") then
        return 1
    elseif has("bottle") and has("boots") and has("grip") and has("gust") and has("boomerang") then
        return 1
    elseif has("bottle") and has("boots") and has("grip") and has("gust") and has("lights") then
        return 1
    elseif has("bottle") and has("boots") and has("grip") and has("gust") and has("sword") and CanBeam() then
        return 1
    elseif has("bottle") and has("boots") and has("grip") and has("gust") and has("cane") then
        return 1
    elseif has("bottle") and has("boots") and has("grip") and has("cane") then
        return 1
    elseif has("bottle") and has("boots") and has("bombs") and has("cane") then
        return 1
    else
        return 0
    end
end