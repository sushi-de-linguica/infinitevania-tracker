Tracker:AddItems("items/filters.json")
Tracker:AddItems("items/items.json")

-- numeração dos espíritos: o id do jogo (1..30, o mesmo de Spirit:N / item/SpiritN)
-- desenhado sobre o ícone, para achar cada um na grade sem decorar as artes
for i = 1, 30 do
    local spirit = Tracker:FindObjectForCode("espirito_" .. i)
    if spirit then spirit:SetOverlay(tostring(i)) end
end

Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")

Tracker:AddLayouts("layouts/grids.json")
Tracker:AddLayouts("layouts/mapas.json")
Tracker:AddLayouts("layouts/tracker.json")

ScriptHost:LoadScript("scripts/generated/location_codes.lua")

if ScriptHost.AddVariableWatch then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
