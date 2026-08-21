ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")

local function truthy(v)
    if v == true then return true end
    return (tonumber(v) or 0) > 0
end

local function apply_location(store, id)
    local path = CHECK_CODES[id]
    if not path then return end
    local obj = Tracker:FindObjectForCode(path)
    if not obj then
        print("autotracking: seção não encontrada: " .. path)
        return
    end
    -- estado absoluto (idempotente): UAT manda o estado, não um evento
    if truthy(store:ReadVariable("loc/" .. id)) then
        obj.AvailableChestCount = 0
    else
        obj.AvailableChestCount = obj.ChestCount
    end
end

local function update_items(store)
    for var, def in pairs(UAT_ITEM_MAPPING) do
        local obj = Tracker:FindObjectForCode(def.code)
        if obj then
            local v = store:ReadVariable(var)
            if def.kind == "toggle" then
                obj.Active = truthy(v)
            else
                local n = tonumber(v) or 0
                if def.max and n > def.max then n = def.max end
                obj.AcquiredCount = n
            end
        end
    end
    local pm = tonumber(store:ReadVariable("item/PmArtifact")) or 0
    local mundo = Tracker:FindObjectForCode("artefato_pm")
    if mundo then mundo.AcquiredCount = math.min(pm, 7) end
end

local function on_change(store, changed)
    local any_item = false
    for _, var in ipairs(changed) do
        if var:sub(1, 4) == "loc/" then
            apply_location(store, var:sub(5))
        else
            any_item = true
        end
    end
    if any_item then update_items(store) end
end

local watched = {}
for var, _ in pairs(UAT_ITEM_MAPPING) do
    watched[#watched + 1] = var
end
watched[#watched + 1] = "item/PmArtifact"
for id, _ in pairs(CHECK_CODES) do
    watched[#watched + 1] = "loc/" .. id
end

ScriptHost:AddVariableWatch("infinitevania", watched, on_change, 250)
print(string.format("autotracking UAT ativo: %d variáveis observadas", #watched))
