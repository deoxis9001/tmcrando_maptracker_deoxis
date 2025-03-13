Kinstone = CustomItem:extend()
function Kinstone:init(name, code, imagePathActive1, imagePathActive2, numbermax1, numbermax2)
	self:createItem(name)
	self.codebase = code
	self.code = code
	self.image = 0
	self.choice = true
	self.InfoStage = 0
	self.textnone = 0
	self:setProperty("CurrentStage", 0)
	self:setProperty("count_max", numbermax1)
	self.countactive = numbermax1
	self.noImage = nil
	self.activeImage1 = ImageReference:FromPackRelativePath(imagePathActive1)
	
	if imagePathActive2 == nil then
		self.activeImage2 = nil
		self.disabledImage2 = nil
	else
		self.activeImage2 = ImageReference:FromPackRelativePath(imagePathActive2)
		self.disabledImage2 = ImageReference:FromImageReference(self.activeImage2, "@disabled")
	end
	self.disabledImage1 = ImageReference:FromImageReference(self.activeImage1, "@disabled")
	self.info = self.disabledImage1
	self.ItemInstance.Icon = self.disabledImage1
	if PopVersion then
		self.poptracker = true
	else
		self.poptracker = false
	end
	self:updateIcon()
end
function Kinstone:setActive(active)
	if self:getActiveCount() < active then
		active = self:getActiveCount()
	end
	self:setProperty("CurrentStage", active)
	self.InfoStage = active
	return true
end
function Kinstone:setActiveCount(active)
	self:setProperty("count_max", active)
	self:updateIcon()
end
function Kinstone:getActive()
	return self:getProperty("CurrentStage")
end
function Kinstone:getActiveCount()
	return self:getProperty("count_max")
end
function Kinstone:Switch(choice, number)
	if self.choice == true and self.image == 0 then
		self.image = 1
		self:setActive(0)
		self.choice = false
	elseif self.choice == false and self.image == 1 then
		self.image = 0
		self:setActive(0)
		self.choice = true
	end
	self:setActiveCount(number)
	self.countactive = number
	self:updateIcon()
end
function Kinstone:update_count(number)
	if self:getActive() > number then
		self:setActive(number)
	end
	self:setActiveCount(number)
	self.countactive = number
	self:updateIcon()
end
function Kinstone:updateIconTexte(id)
		self.ItemInstance:SetOverlay(tostring(id))
end
function Kinstone:updateIcon()
	if self:getActive() == 0 and self.textnone > 0 then
		self:updateIconTexte(" ")
		self.textnone=0
	elseif self:getActive() > self.textnone or self:getActive() < self.textnone then
		self:updateIconTexte(self:getActive())
		self.textnone=self:getActive()
	end
	self.code = self.codebase..tostring(self:getActive())
	if self:getActiveCount() == self:getActive() then
		self.ItemInstance.BadgeTextColor = "#0f0"
	else
		self.ItemInstance.BadgeTextColor = "#fff"
	end
	self.code = self.codebase
	self.ItemInstance.Icon = self.disabledImage1
	if self.image == 0 then
		if self:getActive() == 0 then
			self.ItemInstance.Icon = self.disabledImage1
		else
			self.ItemInstance.Icon = self.activeImage1
		end
	elseif self:getActive() == 0 then
		self.ItemInstance.Icon = self.disabledImage2
	else
		self.ItemInstance.Icon = self.activeImage2
	end
end
function Kinstone:onLeftClick()
	if self:getActive() < self:getActiveCount() then
		count = self:getActive() + 1
		self:setActive(count)
	end
end
function Kinstone:onRightClick()
	if self:getActive() > 0 then
		count = self:getActive() - 1
		self:setActive(count)
	end
end
function Kinstone:canProvideCode(code)
	if code == self.code then
		return true
	else
		return false
	end
end
function Kinstone:providesCode(code)
	if code == self.code then
		return self:getActive()
	end
	return 0
end
function Kinstone:advanceToCode(code)
	if code == self.code then
		return self:setActive(self:getActive() + 1)
	end
	return 0
end
function Kinstone:save()
	local saveData = {}
	saveData.Choice = self.choice
	saveData.CurrentStage = self:getActive()
	saveData.CountMax = self:getActiveCount()
	saveData.Type = self.image
	return saveData
end
function Kinstone:load(data)
	local gold = false
	local blue = false
	local red = false
	local green = false
	if data.Choice ~= nil then
		self.choice = data.Choice
		if self.choice == false then
			if (self.code == "clouds" or self.code == "wilds" or self.code == "falls") and gold == false then
				gold = true
				fusiongoldcombined:setActive(true)
			elseif (self.code == "blueL" or self.code == "blueS") and blue == false then
				blue = true
				fusionbluecombined:setActive(true)
			elseif (self.code == "redE" or self.code == "redV" or self.code == "redW") and red == false then
				red = true
				fusionredcombined:setActive(true)
			elseif (self.code == "greenG" or self.code == "greenC" or self.code == "greenP") and green == false then
				green = true
				fusiongreencombined:setActive(true)
			end
		end
	end
	if data.CurrentStage ~= nil then
		self:setActive(data.CurrentStage)
	end
	if data.CountMax ~= nil then
		self:setActiveCount(data.CountMax)
	end
	if data.Type ~= nil then
		self.image = data.Type
		self:updateIcon()
	end
	return true
end
function Kinstone:propertyChanged(key, value)
	self:updateIcon()
end
