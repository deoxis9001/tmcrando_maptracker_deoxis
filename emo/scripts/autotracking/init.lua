if _VERSION == "Lua 5.3" then
    -- Mode TEST autotracking avec connexion simulee Bizhawk-nwa-tool :
    -- decommenter la ligne suivante et commenter autotracking_testing.lua
    -- ScriptHost:LoadScript("scripts/autotracking/autotracking_test_ui.lua")
    ScriptHost:LoadScript("scripts/autotracking/autotracking_testing.lua")
else
    print("Your tracker version does not support autotracking")
end
