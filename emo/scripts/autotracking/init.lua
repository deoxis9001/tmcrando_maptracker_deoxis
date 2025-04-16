if _VERSION == "Lua 5.3" then
    ScriptHost:LoadScript("scripts/autotracking/autotracking_testing.lua")
else
    print("Your tracker version does not support autotracking")
end
