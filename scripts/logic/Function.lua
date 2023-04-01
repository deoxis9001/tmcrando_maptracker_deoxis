function tracker_on_accessibility_updating()
	if Cache_reset then
		has_item_data = {}
		function_data = {}
	end
end
function tracker_on_begin_loading_save_file()
	print("--	Load Save File	--")
	Cache_reset=false
	print("")
	print("	Enable Cache :			",Cache_reset)
	print("")

end
function tracker_on_finish_loading_save_file()
end
function tracker_on_pack_ready()
	print("")
	print("--	Tracker Information	--")
	print("")
	if VERSION_ALPHA then
		print("	Type:				Alpha")
	elseif VERSION_BETA then
		print("	Type:				Beta")
	else
		print("	Type:				Official")
	end
	print("	Based on randomizer:	",VERSION_RANDO)
	print("	Create by Deoxis")
	print("	Thanks to Myth for logic")
	print("	Thanks to all the testers who gave me feedback")
	print("")
	print("--	Tracker Configuration	--")
	print("")
	print("	Tracker is ready")
	Cache_reset=true
	print("	Enable Cache :		",Cache_reset)
	if TMC_CACHE_DEBUG_FUNCTION or TMC_CACHE_DEBUG_ITEM then
		print("")
		print("--	Cache Debug Logging Configuration  --")
		print("")
		print("	Items:    		   ", TMC_CACHE_DEBUG_ITEM)
		print("	Functions:    		  ", TMC_CACHE_DEBUG_FUNCTION)
	end
	print("")
	print("--	Auto-Tracker Configuration  --")
	print("")
	print("	Enable Items:		", AUTOTRACKER_ENABLE_ITEM_TRACKING)
	print("	Enable Locations:	", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
	print("	Enable Fusions:	", AUTOTRACKER_ENABLE_FUZER_TRACKING)
	if TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND or TMC_AUTOTRACKER_DEBUG_LOCATION or TMC_AUTOTRACKER_DEBUG_ITEM then
		print("")
		print("--	Auto-Tracker Debug Logging Configuration  --")
		print("")
		print("	Items:    		   ", TMC_AUTOTRACKER_DEBUG_ITEM)
		print("	Fusions:    		  ", TMC_AUTOTRACKER_DEBUG_FUZER)
		print("	Localisations: 	   ", TMC_AUTOTRACKER_DEBUG_LOCATION)
		print("	No found localisations:", TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND)
	end
	print("")
end
function function_Cached(name)
	if function_data[name] ~= nil then
		return function_data[name]
	end
	local f=_G
	function_data[name]=f[name]()
	if TMC_CACHE_DEBUG_FUNCTION then
		print("Cache Function: ",name,function_data[name])
	end
	return function_data[name]
end
function has( item, amount )
	if has_item_data[item] ~= nil then
		return has_item_data[item]
	end
	local count = Tracker:ProviderCountForCode( item )
	amount = tonumber( amount )

	if not amount then
		has_item_data[item] = count >= 1
		if TMC_CACHE_DEBUG_ITEM then
			print("Cache Items: ",item,has_item_data[item])
		end
		return count >= 1
	else
		has_item_data[item] = count >= amount
		if TMC_CACHE_DEBUG_ITEM then
			print("Cache Items: ",item,has_item_data[item])
		end
		return count >= amount
	end
end
function hasnot( item )
 local count = Tracker:ProviderCountForCode( item )
 return count == 0
end