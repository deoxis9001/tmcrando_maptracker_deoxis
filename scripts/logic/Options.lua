function FigurineOpen()
  if Tracker:ProviderCountForCode("figurine") >= Tracker:ProviderCountForCode("figurine_option") then
    return 1
  else
    return 0
  end
end

function Dungeons()
	local count = 0
	if has("dws") then
		count = count + 1
	end
	if has("cof") then
		count = count + 1
	end
	if has("fow") then
		count = count + 1
	end
	if has("tod") then
		count = count + 1
	end
	if has("rc") then
		count = count + 1
	end
	if has("pow") then
		count = count + 1
	end
	
	if count >= Tracker:ProviderCountForCode("dungeons") then
		return 1
	else
		return 0
	end
end

function NeededSwords()
  if has("sword0needed") then
    return 1
  elseif Sword1()==1 and has("sword1needed") then
    return 1
  elseif Sword2()==1 and has("sword2needed") then
    return 1
  elseif Sword3()==1 and has("sword3needed") then
    return 1
  elseif Sword4()==1 and has("sword4needed") then
    return 1
  elseif Sword5()==1 and has("sword5needed") then
    return 1
  else
    return 0
  end
end

function NeededElements()
  if has("element0Needed") then
    return 1
  elseif has("element1Needed") and OneElement()==1 then
    return 1
  elseif has("element2Needed") and TwoElements()==1 then
    return 1
  elseif has("element3Needed") and ThreeElements()==1 then
    return 1
  elseif has("element4Needed") and FourElements()==1 then
    return 1
  else
    return 0
  end
end

function NoElementsOrSwords()
  if has("element0Needed") and has("sword0needed") and Tracker:ProviderCountForCode("dungeons") == 0 and Tracker:ProviderCountForCode("figurine_option") == 0 then
    return 0
  else
    return 1
  end
end