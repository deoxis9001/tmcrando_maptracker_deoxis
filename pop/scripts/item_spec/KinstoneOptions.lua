KinstoneOptions = CustomItem:extend()
function KinstoneOptions:init(name, code, imagePathActive, imagePathDesactive, id)
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
		self.ItemInstance.Icon = self.activeImage
		if self.id == 0 then
			clouds:Switch(true, 9)
			falls:Switch(true, 0)
			wilds:Switch(true, 0)
		elseif self.id == 1 then
			countredW = 24
			if has("fusionblue_removed") then
				countredW = countredW - 1
			end
			if has("fusiongold_removed") then
				countredW = countredW - 1
			end
			redE:Switch(true, 0)
			redV:Switch(true, 0)
			redW:Switch(true, countredW)
		elseif self.id == 2 then
			countgreenC = 49
			if has("fusionblue_removed") then
				countgreenC = countgreenC - 1
				countgreenC = countgreenC - 1
			end
			if has("fusiongold_removed") then
				countgreenC = countgreenC - 1
				countgreenC = countgreenC - 2
			end
			if has("fusiongold_removed") and has("fusionred_removed") then
				countgreenC = countgreenC - 2
				countgreenC = countgreenC - 1
			end
			greenG:Switch(true, 0)
			greenC:Switch(true, countgreenC)
			greenP:Switch(true, 0)
		elseif self.id == 3 then
			blueL:Switch(true, 18)
			blueS:Switch(true, 0)
		end
	else
		self.ItemInstance.Icon = self.disabledImage
		if self.id == 0 then
			clouds:Switch(false, 5)
			falls:Switch(false, 1)
			wilds:Switch(false, 3)
		elseif self.id == 1 then
			countredW = 9
			countredV = 7
			if has("fusionblue_removed") then
				countredW = countredW - 1
			end
			if has("fusiongold_removed") then
				countredV = countredV - 1
			end
			redE:Switch(false, 8)
			redV:Switch(false, countredV)
			redW:Switch(false, countredW)
		elseif self.id == 2 then
			countgreenG = 16
			countgreenC = 17
			countgreenP = 16
			if has("fusionblue_removed") then
				countgreenC = countgreenC - 1
				countgreenP = countgreenP - 1
			end
			if has("fusiongold_removed") then
				countgreenC = countgreenC - 1
				countgreenG = countgreenG - 2
			end
			if has("fusiongold_removed") and has("fusionred_removed") then
				countgreenG = countgreenG - 2
				countgreenP = countgreenP - 1
			end
			greenG:Switch(false, countgreenG)
			greenC:Switch(false, countgreenC)
			greenP:Switch(false, countgreenP)
		elseif self.id == 3 then
			blueL:Switch(false, 9)
			blueS:Switch(false, 9)
		end
	end
end
function KinstoneOptions:updateMax()
	if self:getActive() then
		if self.id == 1 then
			countredW = 24
			if has("fusionblue_removed") then
				countredW = countredW - 1
			end
			if has("fusiongold_removed") then
				countredW = countredW - 1
			end
			redW:update_count(countredW)
		elseif self.id == 2 then
			countgreenC = 49
			if has("fusionblue_removed") then
				countgreenC = countgreenC - 1
				countgreenC = countgreenC - 1
			end
			if has("fusiongold_removed") then
				countgreenC = countgreenC - 1
				countgreenC = countgreenC - 2
			end
			if has("fusiongold_removed") and has("fusionred_removed") then
				countgreenC = countgreenC - 2
				countgreenC = countgreenC - 1
			end
			greenC:update_count(countgreenC)
		end
	elseif self.id == 1 then
		countredW = 9
		countredV = 7
		if has("fusionblue_removed") then
			countredW = countredW - 1
		end
		if has("fusiongold_removed") then
			countredV = countredV - 1
		end
		redV:update_count(countredV)
		redW:update_count(countredW)
	elseif self.id == 2 then
		countgreenG = 16
		countgreenC = 17
		countgreenP = 16
		if has("fusionblue_removed") then
			countgreenC = countgreenC - 1
			countgreenP = countgreenP - 1
		end
		if has("fusiongold_removed") then
			countgreenC = countgreenC - 1
			countgreenG = countgreenG - 2
		end
		if has("fusiongold_removed") and has("fusionred_removed") then
			countgreenG = countgreenG - 2
			countgreenP = countgreenP - 1
		end
		greenG:update_count(countgreenG)
		greenC:update_count(countgreenC)
		greenP:update_count(countgreenP)
	end
end
function KinstoneOptions:onLeftClick()
	if self:getActive() then
		self:setActive(false)
	else
		self:setActive(true)
	end
end
function KinstoneOptions:onRightClick()
	if self:getActive() then
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
	saveData.active = self:getActive()
	return saveData
end
function KinstoneOptions:load(data)
	if data.active ~= nil then
		self:setActive(data.active)
	end
	return true
end
function KinstoneOptions:propertyChanged(key, value)
	self:updateIcon()
end
