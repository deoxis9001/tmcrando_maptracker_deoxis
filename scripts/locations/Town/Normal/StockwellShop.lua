function Town_N_StockwellShop_WalletSpot()
  if Town_Shop_80Item()==1 then
    return 1
  else
    return 1, AccessibilityLevel.Inspect
  end
end

function Town_N_StockwellShop_BoomerangSpot()
  if Town_Shop_300Item()==1 then
    return 1
  else
    return 1, AccessibilityLevel.Inspect
  end
end


function Town_N_StockwellShop_QuiverSpot()
  if Town_Shop_600Item()==1 then
    return 1
  else
    return 1, AccessibilityLevel.Inspect
  end
end

function Town_N_StockwellShop_AtticChest()
  if Town_Shop_AtticChest()==1 then
    return 1
  else
    return 0
  end
end

function Town_N_StockwellShop_DogFoodBottleSpot()
  if Town_Shop_BehindCounterItem()==1 then
    return 1
  else
    return 1, AccessibilityLevel.Inspect
  end
end
