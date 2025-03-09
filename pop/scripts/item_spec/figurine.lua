FigurineButton = CustomItem:extend()
function FigurineButton:init(name, code, value, imagePath)
	self:createItem(name)
	self.code = code
	self.value = value
	self:setProperty("active", true)
	self.currentImage = imagePath
	self.ItemInstance.PotentialIcon = ImageReference:FromPackRelativePath(self.currentImage)
	self.ItemInstance.Icon = ImageReference:FromPackRelativePath(self.currentImage, self.currentOverlay)
end
function FigurineButton:canProvideCode(code)
	if code == self.code then
		return true
	else
		return false
	end
end
function FigurineButton:providesCode(code)
	if code == self.code then
		return 1
	end
	return 0
end
function FigurineButton:onLeftClick()
	item = Tracker:FindObjectForCode("figurine_option")
	counter = item.AcquiredCount + tonumber(self.value)
	if counter < item.MinCount then
		counter = item.MinCount
	elseif counter > item.MaxCount then
		counter = item.MaxCount
	end
	item.AcquiredCount = counter
end
function FigurineButton:onRightClick()
	item = Tracker:FindObjectForCode("figurine_option")
	counter = item.AcquiredCount - tonumber(self.value)
	if counter < item.MinCount then
		counter = item.MinCount
	elseif counter > item.MaxCount then
		counter = item.MaxCount
	end
	item.AcquiredCount = counter
end
