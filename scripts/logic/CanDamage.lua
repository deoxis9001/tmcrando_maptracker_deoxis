function CanDamage()
  if Sword1() > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("weapons_on") > 0 then
    if Tracker:ProviderCountForCode("bow") > 0 then
	  return 1
    elseif Tracker:ProviderCountForCode("lights") > 0 then
	  return 1
    else
	  return Tracker:ProviderCountForCode("bombs")
    end
  else
    return 0
  end
end

function CanDamageOff()
  if Sword1() > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("bow") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("lights") > 0 then
    return 1
  else
    return Tracker:ProviderCountForCode("bombs")
  end
end