local figurinemaximage = "images/options/figurineMax.png"
local figurine50image = "images/options/figurine50.png"
local figurine10image = "images/options/figurine10.png"

RichButton = CustomItem:extend()

function RichButton:init(name, code, value)
	self:createItem(name) 
	self.code = code
	self.value = value
    self:setProperty("active", true)
	if self.value == 136 then
		self.currentImage = figurinemaximage
	elseif self.value == 50 then
		self.currentImage = figurine50image
	elseif self.value == 10 then
		self.currentImage = figurine10image
	end
	self.ItemInstance.PotentialIcon = ImageReference:FromPackRelativePath(self.currentImage)
	self:updateIcon()
end

function RichButton:canProvideCode(code)
    if code == self.code then
        return true
    else
        return false
    end
end

function RichButton:providesCode(code)
    if code == self.code then
        return 1
    end
    return 0
end

function RichButton:onLeftClick()
	item = Tracker:FindObjectForCode("figurine_option")
	counter=item.AcquiredCount + tonumber(self.value)
	if counter < item.MinCount then
		counter = item.MinCount
	elseif counter > item.MaxCount then
		counter = item.MaxCount
	end
	item.AcquiredCount = counter

end

function RichButton:onRightClick()
	item = Tracker:FindObjectForCode("figurine_option")
	counter=item.AcquiredCount - tonumber(self.value)
	if counter < item.MinCount then
		counter = item.MinCount
	elseif counter > item.MaxCount then
		counter = item.MaxCount
	end
	item.AcquiredCount = counter
end

function RichButton:updateIcon()
	if self.value == 136 then
		self.currentImage = figurinemaximage
	elseif self.value == 50 then
		self.currentImage = figurine50image
	elseif self.value == 10 then
		self.currentImage = figurine10image
	end
	self.ItemInstance.Icon = ImageReference:FromPackRelativePath(self.currentImage, self.currentOverlay)
end