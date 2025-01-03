CustomItem = class()
function CustomItem:init()
end
function CustomItem:createItem(name)
	local function invokeLeftClick(item)
		item.ItemState:onLeftClick()
	end
	local function invokeRightClick(item)
		item.ItemState:onRightClick()
	end
	local function invokeCanProvideCode(item, code)
		return item.ItemState:canProvideCode(code)
	end
	local function invokeProvidesCode(item, code)
		return item.ItemState:providesCode(code)
	end
	local function invokeAdvanceToCode(item, code)
		return item.ItemState:advanceToCode(code)
	end
	local function invokeSave(item)
		return item.ItemState:save()
	end
	local function invokeLoad(item, data)
		return item.ItemState:load(data)
	end
	local function invokePropertyChanged(item, key, value)
		return item.ItemState:propertyChanged(key, value)
	end
	self.ItemInstance = ScriptHost:CreateLuaItem()
	self.ItemInstance.Name = name
	self.ItemInstance.ItemState = self
	self.ItemInstance.OnLeftClickFunc = invokeLeftClick
	self.ItemInstance.OnRightClickFunc = invokeRightClick
	self.ItemInstance.CanProvideCodeFunc = invokeCanProvideCode
	self.ItemInstance.ProvidesCodeFunc = invokeProvidesCode
	self.ItemInstance.AdvanceToCodeFunc = invokeAdvanceToCode
	self.ItemInstance.SaveFunc = invokeSave
	self.ItemInstance.LoadFunc = invokeLoad
	self.ItemInstance.PropertyChangedFunc = invokePropertyChanged
end
function CustomItem:onLeftClick()
end
function CustomItem:onRightClick()
end
function CustomItem:canProvideCode(code)
	return false
end
function CustomItem:providesCode(code)
	return 0
end
function CustomItem:advanceToCode(code)
end
function CustomItem:save()
	return {}
end
function CustomItem:load(data)
	return true
end
function CustomItem:setProperty(key, value)
	return self.ItemInstance:Set(key, value)
end
function CustomItem:getProperty(key)
	return self.ItemInstance:Get(key)
end
function CustomItem:propertyChanged(key, value)
end
