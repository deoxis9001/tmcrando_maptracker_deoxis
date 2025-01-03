function Sword1()
  if Tracker:ProviderCountForCode("sword") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword2") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("smithsword") then
    return 1
  elseif has("greensword") then
    return 1
  elseif has("redsword") then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end

function Sword2()
  if Tracker:ProviderCountForCode("sword2") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("greensword") then
    return 1
  elseif has("redsword") then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end

function Sword3()
  if Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("redsword") then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end
function Sword4()
  if Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("bluesword") then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end

function Sword5()
  if Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("foursword") then
    return 1
  else
    return 0
  end
end
