	Tracker:AddLayouts("layouts/tracker.json")
	
if (string.find(Tracker.ActiveVariantUID, "_h")) then
    Tracker:AddLayouts("layouts/standard_h_broadcast.json")
else
    Tracker:AddLayouts("layouts/standard_broadcast.json")
end
