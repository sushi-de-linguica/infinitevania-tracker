Tracker:AddItems("items/filters.json")
Tracker:AddItems("items/items.json")

Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")

Tracker:AddLayouts("layouts/grids.json")
Tracker:AddLayouts("layouts/mapas.json")
Tracker:AddLayouts("layouts/tracker.json")

ScriptHost:LoadScript("scripts/generated/location_codes.lua")

if ScriptHost.AddVariableWatch then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
