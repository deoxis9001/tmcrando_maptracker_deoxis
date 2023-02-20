ToggleItem = CustomItem:extend()

function ToggleItem:init(name, code, imagePath)
    self:createItem(name)
    self.code = code
    self:setProperty("Active", false)
    self.activeImage = ImageReference:FromPackRelativePath(imagePath)
    self.disabledImage = ImageReference:FromImageReference(self.activeImage, "@disabled")
    self.noImage = nil
    self.ItemInstance.PotentialIcon = self.activeImage
	self.ItemInstance.Icon=self.disabledImage
    self:updateIcon()    
end

function ToggleItem:setActive(active)
	if self.ItemInstance.Icon == self.activeImage or self.ItemInstance.Icon == self.disabledImage then
		self:setProperty("Active", active)
	end
end

function ToggleItem:getActive()
    return self:getProperty("Active")
end

function ToggleItem:updateIcon()
	if self.ItemInstance.Icon == self.activeImage or self.ItemInstance.Icon == self.disabledImage then
		if self:getActive() then
			self.ItemInstance.Icon = self.activeImage
			self.info = self.activeImage
			self.InfoActive = true
		else
			self.ItemInstance.Icon = self.disabledImage
			self.info = self.disabledImage
			self.InfoActive = false
		end
	end
end

function ToggleItem:onLeftClick()
    self:setActive(true)
end

function ToggleItem:onRightClick()
    self:setActive(false)
end

function ToggleItem:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function ToggleItem:providesCode(code)
    if code == self.code and self:getActive() then
        return 1
    end
    return 0
end

function ToggleItem:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function ToggleItem:save()
    local saveData = {}
    saveData["Active"] = self:getActive()
    return saveData
end

function ToggleItem:load(data)
    if data["Active"] ~= nil then
        self:setActive(data["Active"])
    end
    return true
end

function ToggleItem:propertyChanged(key, value)
    self:updateIcon()
end