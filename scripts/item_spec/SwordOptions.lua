SwordOptions = CustomItem:extend()

function SwordOptions:init(name, code, imagePathActive, imagePathDesactive)
    self:createItem(name)
    self.code = code
    self:setProperty("Active", true)
    self.activeImage = ImageReference:FromPackRelativePath(imagePathActive)
    self.disabledImage = ImageReference:FromPackRelativePath(imagePathDesactive)
    self.noImage = nil
    self.ItemInstance.PotentialIcon = self.activeImage
	-- sword.ItemInstance.PotentialIcon = sword.activeImage
	-- self.ItemInstance.Icon = self.activeImage

    self:updateIcon()    
end

function SwordOptions:setActive(active)
    self:setProperty("Active", active)
end

function SwordOptions:getActive()
    return self:getProperty("Active")
end

function SwordOptions:updateIcon()
    if self:getActive() then
		local countNumberSword = 0
		if foursword.InfoActive == true then
			countNumberSword = 5
		elseif bluesword.InfoActive == true then
			countNumberSword = 4
		elseif redsword.InfoActive == true then
			countNumberSword = 3
		elseif greensword.InfoActive == true then
			countNumberSword = 2
		elseif smithsword.InfoActive == true then
			countNumberSword = 1
		else
			countNumberSword = 0
		end
        self.ItemInstance.Icon = self.activeImage
        smithsword.ItemInstance.Icon = smithsword.noImage
        greensword.ItemInstance.Icon = greensword.noImage
        redsword.ItemInstance.Icon = redsword.noImage
        bluesword.ItemInstance.Icon = bluesword.noImage
        foursword.ItemInstance.Icon = foursword.noImage
        sword.ItemInstance.Icon = sword.info
		sword:setActive(countNumberSword)
		smithsword:setProperty("Active", false)
		greensword:setProperty("Active", false)
		redsword:setProperty("Active", false)
		bluesword:setProperty("Active", false)
		foursword:setProperty("Active", false)
    else
		local ActiveFour = false
		local ActiveBlue = false
		local ActiveRed = false
		local ActiveGreen = false
		local ActiveSmith = false
		-- print("InfoStage:",sword.InfoStage)
		if sword.InfoStage >= 5 then
			smithsword.ItemInstance.Icon = smithsword.activeImage
			greensword.ItemInstance.Icon = greensword.activeImage
			redsword.ItemInstance.Icon = redsword.activeImage
			bluesword.ItemInstance.Icon = bluesword.activeImage
			foursword.ItemInstance.Icon = foursword.activeImage
			ActiveFour = true
			ActiveBlue = true
			ActiveRed = true
			ActiveGreen = true
			ActiveSmith = true
		elseif sword.InfoStage >= 4 then
			smithsword.ItemInstance.Icon = smithsword.activeImage
			greensword.ItemInstance.Icon = greensword.activeImage
			redsword.ItemInstance.Icon = redsword.activeImage
			bluesword.ItemInstance.Icon = bluesword.activeImage
			foursword.ItemInstance.Icon = foursword.disabledImage
			ActiveFour = false
			ActiveBlue = true
			ActiveRed = true
			ActiveGreen = true
			ActiveSmith = true
		elseif sword.InfoStage >= 3 then
			smithsword.ItemInstance.Icon = smithsword.activeImage
			greensword.ItemInstance.Icon = greensword.activeImage
			redsword.ItemInstance.Icon = redsword.activeImage
			bluesword.ItemInstance.Icon = bluesword.disabledImage
			foursword.ItemInstance.Icon = foursword.disabledImage
			ActiveFour = false
			ActiveBlue = false
			ActiveRed = true
			ActiveGreen = true
			ActiveSmith = true
		elseif sword.InfoStage >= 2 then
			smithsword.ItemInstance.Icon = smithsword.activeImage
			greensword.ItemInstance.Icon = greensword.activeImage
			redsword.ItemInstance.Icon = redsword.disabledImage
			bluesword.ItemInstance.Icon = bluesword.disabledImage
			foursword.ItemInstance.Icon = foursword.disabledImage
			ActiveFour = false
			ActiveBlue = false
			ActiveRed = false
			ActiveGreen = true
			ActiveSmith = true
		elseif sword.InfoStage >= 1 then
			smithsword.ItemInstance.Icon = smithsword.activeImage
			greensword.ItemInstance.Icon = greensword.disabledImage
			redsword.ItemInstance.Icon = redsword.disabledImage
			bluesword.ItemInstance.Icon = bluesword.disabledImage
			foursword.ItemInstance.Icon = foursword.disabledImage
			ActiveFour = false
			ActiveBlue = false
			ActiveRed = false
			ActiveGreen = false
			ActiveSmith = true
		else
			smithsword.ItemInstance.Icon = smithsword.disabledImage
			greensword.ItemInstance.Icon = greensword.disabledImage
			redsword.ItemInstance.Icon = redsword.disabledImage
			bluesword.ItemInstance.Icon = bluesword.disabledImage
			foursword.ItemInstance.Icon = foursword.disabledImage
			ActiveFour = false
			ActiveBlue = false
			ActiveRed = false
			ActiveGreen = false
			ActiveSmith = false
		end
        self.ItemInstance.Icon = self.disabledImage
        sword.ItemInstance.Icon = sword.noImage
		sword:setActive(0)
		sword.code=sword.code0
		smithsword:setProperty("Active", ActiveSmith)
		greensword:setProperty("Active", ActiveGreen)
		redsword:setProperty("Active", ActiveRed)
		bluesword:setProperty("Active", ActiveBlue)
		foursword:setProperty("Active", ActiveFour)
    end
end

function SwordOptions:onLeftClick()
	if (self:getActive()) then
		self:setActive(false)
	else
		self:setActive(true)
	end
end

function SwordOptions:onRightClick()
	if (self:getActive()) then
		self:setActive(false)
	else
		self:setActive(true)
	end
end

function SwordOptions:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function SwordOptions:providesCode(code)
    if code == self.code and self:getActive() then
        return 1
    end
    return 0
end

function SwordOptions:advanceToCode(code)
    if code == nil or code == self.code then
        self:setActive(true)
    end
end

function SwordOptions:save()
    local saveData = {}
    saveData["active"] = self:getActive()
    return saveData
end

function SwordOptions:Load(data)
    if data["active"] ~= nil then
        self:setActive(data["active"])
    end
    return true
end

function SwordOptions:propertyChanged(key, value)
    self:updateIcon()
end