function CanSplit2()
  if Tracker:ProviderCountForCode("sword3") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("redsword") then
    return 1
  else
    return 0
  end
end

function CanSplit3()
  if Tracker:ProviderCountForCode("sword4") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("sword5") > 0 then
    return 1
  elseif has("bluesword") then
    return 1
  else
    return 0
  end
end
