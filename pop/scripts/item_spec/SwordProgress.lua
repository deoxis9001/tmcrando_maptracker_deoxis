SwordProgress = CustomItem:extend()
function SwordProgress:init(name, code)
	self:createItem(name)
	self.code = code
	self.InfoStage = 0
	self.swordStop = false
	self:setProperty("CurrentStage", 0)
	self:setProperty("active", true)
	self.noImage = nil
	self.code0 = "sword0"
	self.code1 = "sword"
	self.code2 = "sword2"
	self.code3 = "sword3"
	self.code4 = "sword4"
	self.code5 = "sword5"
	self.activeImage = ImageReference:FromPackRelativePath("images/items/Smith's Sword.png")
	self.activeImage1 = ImageReference:FromPackRelativePath("images/items/Green Sword.png")
	self.activeImage2 = ImageReference:FromPackRelativePath("images/items/Red Sword.png")
	self.activeImage3 = ImageReference:FromPackRelativePath("images/items/Blue Sword.png")
	self.activeImage4 = ImageReference:FromPackRelativePath("images/items/Four Sword.png")
	self.disabledImage = ImageReference:FromImageReference(self.activeImage, "@disabled")
	self.info = self.disabledImage
	self.ItemInstance.Icon = self.activeImage
	self:updateIcon()
end
function SwordProgress:setActive(active)

	if self.swordStop then
	else
		if self:getActive(active)<=5 or self:getActive(active)>=0 then
			self:setProperty("CurrentStage", active)
			self.InfoStage = active
			--self:updateIcon()
			self.info = self.ItemInstance.Icon
		end
	end
end
function SwordProgress:getActive()
	return self:getProperty("CurrentStage")
end
function SwordProgress:updateIcon()
	if self.ItemInstance.Icon == self.noImage then
		if self:getActive() == 0 then
			self.info = self.ItemInstance.Icon
		elseif self:getActive() == 1 then
			self.info = self.ItemInstance.Icon
		elseif self:getActive() == 2 then
			self.info = self.ItemInstance.Icon
		elseif self:getActive() == 3 then
			self.info = self.ItemInstance.Icon
		elseif self:getActive() == 4 then
			self.info = self.ItemInstance.Icon
		else
			self.info = self.ItemInstance.Icon
		end
	elseif self:getActive() == 0 then
		self.ItemInstance.Icon = self.disabledImage
		self.info = self.ItemInstance.Icon
	elseif self:getActive() == 1 then
		self.ItemInstance.Icon = self.activeImage
		self.info = self.ItemInstance.Icon
	elseif self:getActive() == 2 then
		self.ItemInstance.Icon = self.activeImage1
		self.info = self.ItemInstance.Icon
	elseif self:getActive() == 3 then
		self.ItemInstance.Icon = self.activeImage2
		self.info = self.ItemInstance.Icon
	elseif self:getActive() == 4 then
		self.ItemInstance.Icon = self.activeImage3
		self.info = self.ItemInstance.Icon
	else
		self.ItemInstance.Icon = self.activeImage4
		self.info = self.ItemInstance.Icon
	end
end
function SwordProgress:onLeftClick()
	if self.swordStop then
		return
	end
	if self:getActive() < 5 then
		count = self:getActive() + 1
		self:setActive(count)
	end
end
function SwordProgress:onRightClick()
	if self.swordStop then
		return
	end
	if self:getActive() > 0 then
		count = self:getActive() - 1
		self:setActive(count)
	end
end
function SwordProgress:canProvideCode(code)
	if self.code1 == code and self:getActive()==1 then
		return true
	end
	if self.code2 == code and self:getActive()==2 then
		return true
	end
	if self.code3 == code and self:getActive()==3 then
		return true
	end
	if self.code4 == code and self:getActive()==4 then
		return true
	end
	if self.code5 == code and self:getActive()==5 then
		return true
	end
	if self.code == code then
		return true
	end
	return false
end
function SwordProgress:providesCode(code)
	if self.code1 == code and self:getActive()==1 then
		return 1
	end
	if self.code2 == code and self:getActive()==2 then
		return 1
	end
	if self.code3 == code and self:getActive()==3 then
		return 1
	end
	if self.code4 == code and self:getActive()==4 then
		return 1
	end
	if self.code5 == code and self:getActive()==5 then
		return 1
	end
	if self.code == code then
		return 1
	end
	return 0
end
function SwordProgress:advanceToCode(code)
	if code == nil or code == self.code then
		self:setActive(true)
	end
end
function SwordProgress:save()
	local saveData = {}
	saveData.CurrentStage = self:getActive()
	return saveData
end
function SwordProgress:load(data)
	if data.CurrentStage ~= nil then
		self:setActive(data.CurrentStage)
	end
	return true
end
function SwordProgress:propertyChanged(key, value)
	self:updateIcon()
end
