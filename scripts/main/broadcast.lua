	Tracker:AddLayouts(JsLayouts.."tracker.json")
	
if (string.find(Tracker.ActiveVariantUID, "_h")) then
    Tracker:AddLayouts(JsLayouts.."standard_h_broadcast.json")
else
    Tracker:AddLayouts(JsLayouts.."standard_broadcast.json")
end
