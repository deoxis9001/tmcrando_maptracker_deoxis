-- Configuration --------------------------------------

AP_AUTOTRACKER_ENABLE_DEBUG_SLOT = TMC_AUTOTRACKER_DEBUG_SLOT
AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION_NOFOUND=TMC_AUTOTRACKER_DEBUG_LOCATION_NOFOUND
AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION=TMC_AUTOTRACKER_DEBUG_LOCATION
AP_AUTOTRACKER_ENABLE_DEBUG_ITEM=TMC_AUTOTRACKER_DEBUG_ITEM
AP_AUTOTRACKER_ENABLE_DEBUG_ITEM_NOFOUND=TMC_AUTOTRACKER_DEBUG_ITEM_NOFOUND
AP_AUTOTRACKER_ENABLE_DEBUG_EVENT= TMC_AUTOTRACKER_DEBUG_EVENT
AP_AUTOTRACKER_ENABLE_DEBUG_RESET = TMC_AUTOTRACKER_DEBUG_RESET
AP_AUTOTRACKER_ENABLE_DEBUG_LOGGING=AP_AUTOTRACKER_ENABLE_DEBUG_SLOT or AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION_NOFOUND or AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION or AP_AUTOTRACKER_ENABLE_DEBUG_ITEM or AP_AUTOTRACKER_ENABLE_DEBUG_EVENT or AP_AUTOTRACKER_ENABLE_DEBUG_RESET or AP_AUTOTRACKER_ENABLE_DEBUG_ITEM_NOFOUND
-------------------------------------------------------
print("")
print("Active Auto-Tracker Configuration")
print("---------------------------------------------------------------------")
print("Enable Item Tracking:          ", AUTOTRACKER_ENABLE_ITEM_TRACKING)
print("Enable Location Tracking:      ", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
if AP_AUTOTRACKER_ENABLE_DEBUG_LOGGING then
    print("Enable Debug AP:               ", AP_AUTOTRACKER_ENABLE_DEBUG_LOGGING)
    print("Enable Debug RESET:            ", AP_AUTOTRACKER_ENABLE_DEBUG_RESET)
    print("Enable Debug Slot:             ", AP_AUTOTRACKER_ENABLE_DEBUG_SLOT)
    print("Enable Debug Location:         ", AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION)
    print("Enable Debug Location No Found:", AP_AUTOTRACKER_ENABLE_DEBUG_LOCATION_NOFOUND)
    print("Enable Debug Item:             ", AP_AUTOTRACKER_ENABLE_DEBUG_ITEM)
    print("Enable Debug Item:             ", AP_AUTOTRACKER_ENABLE_DEBUG_ITEM_NOFOUND)
    
    print("Enable Debug Event:            ", AP_AUTOTRACKER_ENABLE_DEBUG_EVENT)
end

print("---------------------------------------------------------------------")
print("")

-- loads the AP autotracking code
ScriptHost:LoadScript(ScriptAutotracking.."archipelago.lua")
ScriptHost:LoadScript(ScriptLuaConnector.."autotracking.lua")