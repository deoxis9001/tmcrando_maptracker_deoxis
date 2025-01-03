function NoCloudtop()
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
