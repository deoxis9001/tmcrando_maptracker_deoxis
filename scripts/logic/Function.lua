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
-- This function is designed to cache the results of a function for future use
function function_Cached(name)
	-- Check if there is already a cached value for the requested function
	if function_data[name] ~= nil then
		-- If a cached value exists, return it
		return function_data[name]
	end

	-- If a cached value does not exist, get the function from the global environment
	local f=_G
	function_data[name]=f[name]()

	-- If the "out_logic_no" feature is enabled and the cached value is 2, replace it with 0
	if has("out_logic_no") then
		if function_data[name]==2 then
			function_data[name]=0
		end
	end

	-- If the TMC_CACHE_DEBUG_FUNCTION variable is set, print a debug message
	if TMC_CACHE_DEBUG_FUNCTION then
		print("Cache Function: ",name,function_data[name])
	end

	-- Return the cached value or the newly computed value
	return function_data[name]
end

-- This function checks whether the player has a certain item or a certain amount of that item
function has( item, amount )
	-- Check if a cached value for the item exists
	if has_item_data[item] ~= nil then
		-- If a cached value exists, return it
		return has_item_data[item]
	end

	-- Check if a developer option for the item exists
	if has_item_option_dev[item] ~= nil then
		-- If a developer option exists, return it
		return has_item_option_dev[item]
	end

	-- If no cached value or developer option exists, get the item count from the tracker
	local count = Tracker:ProviderCountForCode( item )
	amount = tonumber( amount )

	-- Check if the item count is at least 1 (or at least the specified amount, if provided)
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

-- This function checks whether the player does not have a certain item
function hasnot( item )
	-- Get the item count from the tracker
	local count = Tracker:ProviderCountForCode( item )

	-- Check if the item count is 0
	return count == 0
end
