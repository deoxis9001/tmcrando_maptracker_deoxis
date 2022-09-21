------------------------------------------------------------------
-- Configuration options for scripted systems in this pack
------------------------------------------------------------------
AUTOTRACKER_ENABLE_ITEM_TRACKING = true
AUTOTRACKER_ENABLE_LOCATION_TRACKING = true
TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND = true
TMC_AUTOTRACKER_DEBUG_LOCATION = true
TMC_AUTOTRACKER_DEBUG_ITEM = true
VERSION_BETA = true
if TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND == true or TMC_AUTOTRACKER_DEBUG_LOCATION == true or TMC_AUTOTRACKER_DEBUG_ITEM == true then
	TMC_AUTOTRACKER_DEBUG = true
else
	TMC_AUTOTRACKER_DEBUG = false
end