KinstoneOptions = CustomItem:extend()

function KinstoneOptions:init(name, code, imagePathActive, imagePathDesactive,id)
    self:createItem(name)
    self.code = code
	self.id = id
    self:setProperty("Active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePathActive)
    self.disabledImage = ImageReference:FromPackRelativePath(imagePathDesactive)
    self.noImage = nil
    self.ItemInstance.PotentialIcon = self.activeImage

    self:updateIcon()    
end

function KinstoneOptions:setActive(active)
    self:setProperty("Active", active)
end

function KinstoneOptions:getActive()
    return self:getProperty("Active")
end

function KinstoneOptions:updateIcon()
    if self:getActive() then
		self.ItemInstance.Icon=self.activeImage
		if self.id == 0 then
			clouds:Switch(true,9)
			falls:Switch(true,0)
			wilds:Switch(true,0)
		elseif self.id == 1 then
		countredW=24
		if (has("fusionblue_removed")) then
			countredW=countredW-1
		end
		if (has("fusiongold_removed")) then
			countredW=countredW-1
		end
			redE:Switch(true,0)
			redV:Switch(true,0)
			redW:Switch(true,countredW)
		elseif self.id == 2 then
		countgreenV=49
		if (has("fusionblue_removed")) then
			countgreenV=countgreenV-1
			countgreenV=countgreenV-1
		end
		if (has("fusiongold_removed")) then
			countgreenV=countgreenV-1
			countgreenV=countgreenV-2
		end
		if (has("fusiongold_removed") and has("fusionred_removed")) then
			countgreenV=countgreenV-2
			countgreenV=countgreenV-1
		end
			greenN:Switch(true,0)
			greenV:Switch(true,countgreenV)
			greenZ:Switch(true,0)
		elseif self.id == 3 then
			blueL:Switch(true,18)
			blueS:Switch(true,0)
		end
	else
		self.ItemInstance.Icon=self.disabledImage
		if self.id == 0 then
			clouds:Switch(false,5)
			falls:Switch(false,1)
			wilds:Switch(false,3)
		elseif self.id == 1 then
		countredW=9
		countredV=8
		if (has("fusionblue_removed")) then
			countredW=countredW-1
		end
		if (has("fusiongold_removed")) then
			countredV=countredV-1
		end
			redE:Switch(false,8)
			redV:Switch(false,countredV)
			redW:Switch(false,countredW)
		elseif self.id == 2 then
		countgreenN=16
		countgreenV=17
		countgreenZ=9
		if (has("fusionblue_removed")) then
			countgreenV=countgreenV-1
			countgreenZ=countgreenZ-1
		end
		if (has("fusiongold_removed")) then
			countgreenV=countgreenV-1
			countgreenN=countgreenN-2
		end
		if (has("fusiongold_removed") and has("fusionred_removed")) then
			countgreenN=countgreenN-2
			countgreenZ=countgreenZ-1
		end
			greenN:Switch(false,countgreenN)
			greenV:Switch(false,countgreenV)
			greenZ:Switch(false,countgreenZ)
		elseif self.id == 3 then
			blueL:Switch(false,9)
			blueS:Switch(false,9)
		end
    end
end
function KinstoneOptions:updateMax()
    if self:getActive() then
		if self.id == 1 then
			countredW=24
			if (has("fusionblue_removed")) then
				countredW=countredW-1
			end
			if (has("fusiongold_removed")) then
				countredW=countredW-1
			end
			redW:update_count(countredW)
		elseif self.id == 2 then
			countgreenV=49
			if (has("fusionblue_removed")) then
				countgreenV=countgreenV-1
				countgreenV=countgreenV-1
			end
			if (has("fusiongold_removed")) then
				countgreenV=countgreenV-1
				countgreenV=countgreenV-2
			end
			if (has("fusiongold_removed") and has("fusionred_removed")) then
				countgreenV=countgreenV-2
				countgreenV=countgreenV-1
			end
			greenV:update_count(countgreenV)
		end
	else
		if self.id == 1 then
			countredW=9
			countredV=8
			if (has("fusionblue_removed")) then
				countredW=countredW-1
			end
			if (has("fusiongold_removed")) then
				countredV=countredV-1
			end
			redV:update_count(countredV)
			redW:update_count(countredW)
		elseif self.id == 2 then
			countgreenN=16
			countgreenV=17
			countgreenZ=9
			if (has("fusionblue_removed")) then
				countgreenV=countgreenV-1
				countgreenZ=countgreenZ-1
			end
			if (has("fusiongold_removed")) then
				countgreenV=countgreenV-1
				countgreenN=countgreenN-2
			end
			if (has("fusiongold_removed") and has("fusionred_removed")) then
				countgreenN=countgreenN-2
				countgreenZ=countgreenZ-1
			end
			greenN:update_count(countgreenN)
			greenV:update_count(countgreenV)
			greenZ:update_count(countgreenZ)
		end
    end
end
function KinstoneOptions:onLeftClick()
	if (self:getActive()) then
		self:setActive(false)
	else
		self:setActive(true)
	end
end

function KinstoneOptions:onRightClick()
	if (self:getActive()) then
		self:setActive(false)
	else
		self:setActive(true)
	end
end

function KinstoneOptions:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function KinstoneOptions:providesCode(code)
    if code == self.code and self:getActive() then
        return 1
    end
    return 0
end

function KinstoneOptions:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function KinstoneOptions:save()
    local saveData = {}
    saveData["active"] = self:getActive()
    return saveData
end

function KinstoneOptions:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function KinstoneOptions:propertyChanged(key, value)
    self:updateIcon()
end