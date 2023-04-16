Kinstone = CustomItem:extend()

function Kinstone:init(name, code, imagePathActive1, imagePathActive2, numbermax1,numbermax2)
	self:createItem(name) 
	self.codebase = code
	self.code = code
	self.image = 0
	self.choice = true
	self.InfoStage = 0
    self:setProperty("CurrentStage", 0)
	self:setProperty("count_max", numbermax1)
	self.countactive=numbermax1
    self.noImage = nil
    self.activeImage1 = ImageReference:FromPackRelativePath(imagePathActive1)
	if imagePathActive2==nil then
		self.activeImage2 = nil
		self.disabledImage2 = nil
    else
		self.activeImage2 = ImageReference:FromPackRelativePath(imagePathActive2)
		self.disabledImage2 = ImageReference:FromImageReference(self.activeImage2, "@disabled")
	end
    self.disabledImage1 = ImageReference:FromImageReference(self.activeImage1, "@disabled")
	self.info = self.disabledImage1
	self.ItemInstance.Icon=self.disabledImage1
    self:updateIcon()    
end

function Kinstone:setActive(active)
	if self:getActiveCount()<active then
		active=self:getActiveCount()
	end
	self:setProperty("CurrentStage", active)
	self.InfoStage=active 
	return true
end

function Kinstone:setActiveCount(active)
	self:setProperty("count_max", active)
	self:updateIcon()
end

function Kinstone:getActive()
    -- print(self:getProperty("CurrentStage"))
    return self:getProperty("CurrentStage")
end

function Kinstone:getActiveCount()
	return self:getProperty("count_max")
end

function Kinstone:Switch(choice,number)
	if self.choice == true and self.image==0 then
		self.image = 1
		self:setActive(0)
		self.choice = false
	elseif self.choice == false and self.image==1 then
		self.image = 0
		self:setActive(0)
		self.choice = true
	end
		--self:setActive(0)
		self:setActiveCount(number)
		self.countactive=number
	self:updateIcon()
end

function Kinstone:update_count(number)
-- print(self.code..":"..number)
	if (self:getActive()>number) then
		self:setActive(number)
	end
		self:setActiveCount(number)
		self.countactive=number
		self:updateIcon()
end


function Kinstone:updateIcon()
	if self:getActive()==1 then
		self.ItemInstance.BadgeText="1"
		self.code = self.codebase.."1"
	elseif self:getActive()==2 then
		self.ItemInstance.BadgeText="2"
		self.code = self.codebase.."2"
	elseif self:getActive()==3 then
		self.ItemInstance.BadgeText="3"
		self.code = self.codebase.."3"
	elseif self:getActive()==4 then
		self.ItemInstance.BadgeText="4"
		self.code = self.codebase.."4"
	elseif self:getActive()==5 then
		self.ItemInstance.BadgeText="5"
		self.code = self.codebase.."5"
	elseif self:getActive()==6 then
		self.ItemInstance.BadgeText="6"
		self.code = self.codebase.."6"
	elseif self:getActive()==7 then
		self.ItemInstance.BadgeText="7"
		self.code = self.codebase.."7"
	elseif self:getActive()==8 then
		self.ItemInstance.BadgeText="8"
		self.code = self.codebase.."8"
	elseif self:getActive()==9 then
		self.ItemInstance.BadgeText="9"
		self.code = self.codebase.."9"
	elseif self:getActive()==10 then
		self.ItemInstance.BadgeText="10"
	elseif self:getActive()==11 then
		self.ItemInstance.BadgeText="11"
	elseif self:getActive()==12 then
		self.ItemInstance.BadgeText="12"
	elseif self:getActive()==13 then
		self.ItemInstance.BadgeText="13"
	elseif self:getActive()==14 then
		self.ItemInstance.BadgeText="14"
	elseif self:getActive()==15 then
		self.ItemInstance.BadgeText="15"
	elseif self:getActive()==16 then
		self.ItemInstance.BadgeText="16"
	elseif self:getActive()==17 then
		self.ItemInstance.BadgeText="17"
	elseif self:getActive()==18 then
		self.ItemInstance.BadgeText="18"
	elseif self:getActive()==19 then
		self.ItemInstance.BadgeText="19"
	elseif self:getActive()==20 then
		self.ItemInstance.BadgeText="20"
	elseif self:getActive()==21 then
		self.ItemInstance.BadgeText="21"
	elseif self:getActive()==22 then
		self.ItemInstance.BadgeText="22"
	elseif self:getActive()==23 then
		self.ItemInstance.BadgeText="23"
	elseif self:getActive()==24 then
		self.ItemInstance.BadgeText="24"
	elseif self:getActive()==25 then
		self.ItemInstance.BadgeText="25"
	elseif self:getActive()==26 then
		self.ItemInstance.BadgeText="26"
	elseif self:getActive()==27 then
		self.ItemInstance.BadgeText="27"
	elseif self:getActive()==28 then
		self.ItemInstance.BadgeText="28"
	elseif self:getActive()==29 then
		self.ItemInstance.BadgeText="29"
	elseif self:getActive()==30 then
		self.ItemInstance.BadgeText="30"
	elseif self:getActive()==31 then
		self.ItemInstance.BadgeText="31"
	elseif self:getActive()==32 then
		self.ItemInstance.BadgeText="32"
	elseif self:getActive()==33 then
		self.ItemInstance.BadgeText="33"
	elseif self:getActive()==34 then
		self.ItemInstance.BadgeText="34"
	elseif self:getActive()==35 then
		self.ItemInstance.BadgeText="35"
	elseif self:getActive()==36 then
		self.ItemInstance.BadgeText="36"
	elseif self:getActive()==37 then
		self.ItemInstance.BadgeText="37"
	elseif self:getActive()==38 then
		self.ItemInstance.BadgeText="38"
	elseif self:getActive()==39 then
		self.ItemInstance.BadgeText="39"
	elseif self:getActive()==40 then
		self.ItemInstance.BadgeText="40"
	elseif self:getActive()==41 then
		self.ItemInstance.BadgeText="41"
	elseif self:getActive()==42 then
		self.ItemInstance.BadgeText="42"
	elseif self:getActive()==43 then
		self.ItemInstance.BadgeText="43"
	elseif self:getActive()==44 then
		self.ItemInstance.BadgeText="44"
	elseif self:getActive()==45 then
		self.ItemInstance.BadgeText="45"
	elseif self:getActive()==46 then
		self.ItemInstance.BadgeText="46"
	elseif self:getActive()==47 then
		self.ItemInstance.BadgeText="47"
	elseif self:getActive()==48 then
		self.ItemInstance.BadgeText="48"
	elseif self:getActive()==49 then
		self.ItemInstance.BadgeText="49"
	else
		self.ItemInstance.BadgeText=nil
		self.code = self.codebase
	end
	if self:getActiveCount()==self:getActive() then
		self.ItemInstance.BadgeTextColor="#0f0"
	else
		self.ItemInstance.BadgeTextColor="#fff"
	end
		self.code = self.codebase
		self.ItemInstance.Icon=self.disabledImage1
	if self.image == 0 then
		if self:getActive()== 0 then
			self.ItemInstance.Icon=self.disabledImage1
		else
			self.ItemInstance.Icon=self.activeImage1
		end
	else
		if self:getActive()== 0 then
			self.ItemInstance.Icon=self.disabledImage2
		else
			self.ItemInstance.Icon=self.activeImage2
		end
	end
end

function Kinstone:onLeftClick()
	if self:getActive()<self:getActiveCount() then
		count=self:getActive()+1
		self:setActive(count)
	end
end

function Kinstone:onRightClick()
	if self:getActive()>0 then
		count=self:getActive()-1
		self:setActive(count)
	end
end

function Kinstone:canProvideCode(code)
    if code == self.code then
		-- print("Kinstone->providesCode->code :"..self.code)
		-- print("Kinstone->self:getActive() :"..self:getActive())
        return true
    else
        return false
    end
end
function Kinstone:providesCode(code)
-- print("Kinstone->providesCode->code :"..self.code)
    if code == self.code then
		-- print("Kinstone->providesCode->code :"..self.code)
		-- print("Kinstone->self:getActive() :"..self:getActive())
        return self:getActive()
    end
    return 0
end


function Kinstone:advanceToCode(code)
    if code == self.code then
        return self:setActive((self:getActive()+1))
    end
	return 0
end

function Kinstone:save()
    local saveData = {}
    saveData["Choice"] = self.choice
    saveData["CurrentStage"] = self:getActive()
    saveData["CountMax"] = self:getActiveCount()
	saveData["Type"] = self.image
    return saveData
end

function Kinstone:load(data)
local gold=false
local blue=false
local red=false
local green=false
    if data["Choice"] ~= nil then
        self.choice = data["Choice"]
		if self.choice == false then
			if ( self.code == "clouds" or self.code == "wilds" or self.code == "falls" ) and gold==false then
				gold=true
				fusiongoldcombined:setActive(true)
			elseif ( self.code == "blueL" or self.code == "blueS" ) and blue==false then
				blue=true
				fusionbluecombined:setActive(true)
			elseif ( self.code == "redE" or self.code == "redV" or self.code == "redW" ) and red==false then
				red=true
				fusionredcombined:setActive(true)
			elseif ( self.code == "greenG" or self.code == "greenC" or self.code == "greenP" ) and green==false then
				green=true
				fusiongreencombined:setActive(true)
			end
		end
		
    end
    if data["CurrentStage"] ~= nil then
        self:setActive(data["CurrentStage"])
		
    end
    if data["CountMax"] ~= nil then
        self:setActiveCount(data["CountMax"])
		
    end
    if data["Type"] ~= nil then
        self.image=data["Type"]
        self:updateIcon()
    end
    return true
end

function Kinstone:propertyChanged(key, value)
    self:updateIcon()
end