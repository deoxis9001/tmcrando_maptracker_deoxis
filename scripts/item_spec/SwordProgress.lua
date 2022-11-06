SwordProgress = CustomItem:extend()

function SwordProgress:init(name, code)
	self:createItem(name) 
	self.code = code
	-- self.CurrentStage = 0
	self.InfoStage = 0
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
	self.ItemInstance.Icon=self.disabledImage
    self:updateIcon()    
end

function SwordProgress:setActive(active)
	if self.ItemInstance.Icon == self.noImage then
	else
		self:setProperty("CurrentStage", active)
		self.InfoStage = active
		self:updateIcon()
		self.info = self.ItemInstance.Icon

	end
end

function SwordProgress:getActive()
-- print(self.code)
    return self:getProperty("CurrentStage")
end

function SwordProgress:updateIcon()
-- print("icon:" , self.ItemInstance.Icon)
-- print("noimage:" , self.noImage)
-- print("getactive:" , self:getActive())
-- print("code:" , self.code)
-- print("info:" , self.info)
-- print("InfoStage:" , self.InfoStage)
	if self.ItemInstance.Icon == self.noImage then
		if self:getActive()== 0 then
			self.code=self.code0
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 1 then
			self.code=self.code1
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 2 then
			self.code=self.code2
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 3 then
			self.code=self.code3
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 4 then
			self.code=self.code4
			self.info = self.ItemInstance.Icon
		else
			self.code=self.code5
			self.info = self.ItemInstance.Icon
		end
	else
		if self:getActive()== 0 then
			self.code=self.code0
			self.ItemInstance.Icon = self.disabledImage
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 1 then
			self.code=self.code1
			self.ItemInstance.Icon = self.activeImage
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 2 then
			self.code=self.code2
			self.ItemInstance.Icon = self.activeImage1
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 3 then
			self.code=self.code3
			self.ItemInstance.Icon = self.activeImage2
			self.info = self.ItemInstance.Icon
		elseif self:getActive()== 4 then
			self.code=self.code4
			self.ItemInstance.Icon = self.activeImage3
			self.info = self.ItemInstance.Icon
		else
			self.code=self.code5
			self.ItemInstance.Icon = self.activeImage4
			self.info = self.ItemInstance.Icon
		end
	end
end

function SwordProgress:onLeftClick()
	if self:getActive()<5 then
		count=self:getActive()+1
		self:setActive(count)
	end
end

function SwordProgress:onRightClick()
	if self:getActive()>0 then
		count=self:getActive()-1
		self:setActive(count)
	end
end

function SwordProgress:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function SwordProgress:providesCode(code)
    if code == self.code and self:getActive() then
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
    saveData["active"] = self:getActive()
    return saveData
end

function SwordProgress:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function SwordProgress:propertyChanged(key, value)
    self:updateIcon()
end