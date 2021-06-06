function canDamage()
  if Tracker:ProviderCountForCode("sword") > 0 then
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
function canDamage_off()
  if Tracker:ProviderCountForCode("sword") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("bow") > 0 then
    return 1
  elseif Tracker:ProviderCountForCode("lights") > 0 then
    return 1
  else
    return Tracker:ProviderCountForCode("bombs")
  end
end
function CanDownthrust()
  if has("sword") and has("cape") and has("downthrust") then
    return 1
  else
    return 0
  end
end
function CanBeam()
  if has("swordbeam") then
    return 1
  elseif has("perilbeam") then
    return 1
  else
    return 0
  end
end
function hasNoGust()
  if Tracker:ProviderCountForCode("gust") > 0 then
    return 0
  else
    return 1
  end
end



function OneElement()
  if Tracker:ProviderCountForCode("earth") > 0
  or Tracker:ProviderCountForCode("fire") > 0
  or Tracker:ProviderCountForCode("water") > 0
  or Tracker:ProviderCountForCode("wind") > 0
  then
    return 1
  else
    return 0
  end
end

function TwoElements()
  if Tracker:ProviderCountForCode("earth") > 0 and Tracker:ProviderCountForCode("fire") > 0
  or Tracker:ProviderCountForCode("earth") > 0 and Tracker:ProviderCountForCode("water") > 0
  or Tracker:ProviderCountForCode("earth") > 0 and Tracker:ProviderCountForCode("wind") > 0
  or Tracker:ProviderCountForCode("fire") > 0 and Tracker:ProviderCountForCode("water") > 0
  or Tracker:ProviderCountForCode("fire") > 0 and Tracker:ProviderCountForCode("wind") > 0
  or Tracker:ProviderCountForCode("water") > 0 and Tracker:ProviderCountForCode("wind") > 0
  then
    return 1
  else
    return 0
  end
end

function ThreeElements()
  if Tracker:ProviderCountForCode("earth") > 0 and Tracker:ProviderCountForCode("fire") > 0 and Tracker:ProviderCountForCode("water") > 0
  or Tracker:ProviderCountForCode("earth") > 0 and Tracker:ProviderCountForCode("fire") > 0 and Tracker:ProviderCountForCode("wind") > 0
  or Tracker:ProviderCountForCode("earth") > 0 and Tracker:ProviderCountForCode("water") > 0 and Tracker:ProviderCountForCode("wind") > 0
  or Tracker:ProviderCountForCode("fire") > 0 and Tracker:ProviderCountForCode("water") > 0 and Tracker:ProviderCountForCode("wind") > 0
  then
    return 1
  else
    return 0
  end
end

function FourElements()
  if Tracker:ProviderCountForCode("earth") > 0 and Tracker:ProviderCountForCode("fire") > 0 and Tracker:ProviderCountForCode("water") > 0 and Tracker:ProviderCountForCode("wind") > 0
  then
    return 1
  else
    return 0
  end
end

function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)
  amount = tonumber(amount)
  if not amount then
    return count > 0
  else
    return count == amount
  end
end
function hasNoCloudtop()
  local item = Tracker:FindObjectForCode("clouds")
  local TopRight = Tracker:FindObjectForCode("@Top Right Fusion/Top Right Fusion")
  local TopLeft = Tracker:FindObjectForCode("@Top Left Fusion/Top Left Fusion")
  local BottomRight = Tracker:FindObjectForCode("@Bottom Right Fusion/Bottom Right Fusion")
  local BottomLeft = Tracker:FindObjectForCode("@Bottom Left Fusion/Bottom Left Fusion")
  local Central = Tracker:FindObjectForCode("@Central Fusion/Central Fusion")
  local compte = 0
  if TopRight.AvailableChestCount == 0 then
	compte = 1 + compte
  end
  if TopLeft.AvailableChestCount == 0 then
	compte = 1 + compte
  end
  if BottomRight.AvailableChestCount == 0 then
	compte = 1 + compte
  end
  if BottomLeft.AvailableChestCount == 0 then
	compte = 1 + compte
  end
  if Central.AvailableChestCount == 0 then
	compte = 1 + compte
  end
  if item.AcquiredCount <= compte then
    return 0
  else
    return 1
  end
end
