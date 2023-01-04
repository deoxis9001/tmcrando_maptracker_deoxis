Tracker:AddItems(JsItems.."common.json")
Tracker:AddItems(JsItems.."dungeon_items.json")
Tracker:AddItems(JsItems.."keys.json")
Tracker:AddItems(JsItems.."options.json")
if(VERSION_ALPHA==true) then
	Tracker:AddItems(JsItems.."alpha.json")
elseif(VERSION_BETA==true) then
	Tracker:AddItems(JsItems.."beta.json")
end 