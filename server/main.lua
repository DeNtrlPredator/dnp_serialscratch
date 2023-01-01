local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('dnp_serialscratch:scratchserialfull', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weapon = Player.Functions.GetItemBySlot(data.slot)
    if weapon.name ~= data.weapon then return end
    if data.serial ~= 'Scratched' then
        if not Player.Functions.RemoveItem(weapon.name, 1, weapon.slot) then return end
        TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[weapon.name], 'remove')
        Wait(400)
        local info = {}
        info.serie = 'Scratched'
        info.quality = data.quality
        info.ammo = data.ammo
        Player.Functions.AddItem(weapon.name, 1, weapon.slot, info)
        TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[weapon.name], 'add')
    end
end)

RegisterNetEvent('dnp_serialscratch:scratchserialpartial', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weapon = Player.Functions.GetItemBySlot(data.slot)
    if weapon.name ~= data.weapon then return end
    if data.serial ~= 'Scratched' then
        if not Player.Functions.RemoveItem(weapon.name, 1, weapon.slot) then return end
        TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[weapon.name], 'remove')
        Wait(400)
        local info = {}
        local partialserial = string.sub(tostring(data.serial) , 5)
        info.serie = ('Scratched-'..partialserial)
        info.quality = data.quality
        info.ammo = data.ammo
        Player.Functions.AddItem(weapon.name, 1, weapon.slot, info)
        TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items[weapon.name], 'add')
    end
end)