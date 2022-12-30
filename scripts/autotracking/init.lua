if _VERSION == "Lua 5.3" then
  ScriptHost:LoadScript(ScriptAutotracking.."autotracking.lua")
else
  print("Your tracker version does not support autotracking")
end
