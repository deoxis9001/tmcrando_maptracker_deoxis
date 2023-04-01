function tracker_on_accessibility_updating()
	if Cache_reset then
	else
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
	print("--	Tracker Configuration	--")
	print("")
	print("	Tracker is ready")
	Cache_reset=true
	print("	Enable Cache :			",Cache_reset)
	print("")
	print("--	Auto-Tracker Configuration  --")
	print("")
	print("	Enable Item:    		   ", AUTOTRACKER_ENABLE_ITEM_TRACKING)
	print("	Enable Location:    		   ", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
	print("	Enable Fusions:    		   ", AUTOTRACKER_ENABLE_FUZER_TRACKING)
	if TMC_AUTOTRACKER_DEBUG then
		print("")
		print("--	Debug Logging Configuration  --")
		print("")
		print("	Logging items:    		   ", TMC_AUTOTRACKER_DEBUG_ITEM)
		print("	Logging fusions:    		  ", TMC_AUTOTRACKER_DEBUG_FUZER)
		print("	Logging localisation: 	   ", TMC_AUTOTRACKER_DEBUG_LOCATION)
		print("	Logging no found localisation:", TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND)
	end
	print("")
end
function function_Cached(name)
	if function_data[name] ~= nil then
		return function_data[name]
	end
	local f=_G
	function_data[name]=f[name]()

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
		return count >= 1
	else
		has_item_data[item] = count >= amount
		return count >= amount
	end
end
function hasnot( item )
 local count = Tracker:ProviderCountForCode( item )
 return count == 0
end