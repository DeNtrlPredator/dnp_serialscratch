local QBCore = exports['qb-core']:GetCoreObject()
local visfunc = exports["visn_are"]:GetSharedFunctions()

local ScratchTable = nil

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DeleteEntity(ScratchTable)
    end
end)

local function ShowWeapons()
    local playeritems = QBCore.Functions.GetPlayerData().items
    if IsPedArmed(cache.ped, 7) then
        TriggerEvent('weapons:ResetHolster')
        SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, true)
    end

    local registeredMenu = {
        id = 'dnp_serialscratch',
        title = 'Available Weapons',
        options = {}
    }
    local options = {}
    for _, v in pairs(playeritems) do
        if QBCore.Shared.Items[v.name]["type"] == 'weapon' and v.info.serie ~= 'Scratched' then
            options[#options+1] = {
                title = QBCore.Shared.Items[v.name]["label"],
                description = 'Scratch Weapon Serial',
                metadata = {
                    {label = 'Ammo', value = v.info.ammo},
                    {label = 'Weapon', value = v.name},
                    {label = 'Quality', value = v.info.quality},
                    {label = 'Serial', value = v.info.serie},
                    {label = 'Slot', value = v.slot},
                },
                event = 'dnp_serialscratch:scratchcheck',
                args = {
                    ammo = v.info.ammo,
                    weapon = v.name,
                    quality = v.info.quality,
                    serial = v.info.serie,
                    slot = v.slot
                }
            }
        end
    end

    registeredMenu["options"] = options
    lib.registerContext(registeredMenu)
    lib.showContext('dnp_serialscratch')
end

CreateThread(function ()
    for k, v in pairs(Config.Locations['scratch']) do
        local coords = vector4(v.x, v.y, v.z, v.h)
        local hash = Config.ScratchModel
        QBCore.Functions.LoadModel(hash)
        ScratchTable = CreateObject(hash, coords.x, coords.y, coords.z - 2.3, true, true, true)
        SetEntityHeading(ScratchTable, coords.w)
        FreezeEntityPosition(ScratchTable, true)

        exports['qb-target']:AddTargetEntity(ScratchTable, {
            options = {
                {
                    icon = 'fas fa-screwdriver',
                    label = 'Use Tools',
                    action = function()
                        ShowWeapons()
                    end,
                },
            },
            distance = 2.0
        })
        end
end)

RegisterNetEvent('dnp_serialscratch:scratchcheck', function (data)
    local player = PlayerPedId()
    local hasadvanced = QBCore.Functions.HasItem(Config.AdvancedTool)
    local chance = math.random()

    if hasadvanced then
        if Config.SkillCheck == 'ps-ui' then
            exports['ps-ui']:Circle(function(success)
                if success then
                    TriggerServerEvent('dnp_serialscratch:scratchserialfull', data)
                else
                    if Config.VisnAre then
                        ApplyDamageToPed(player, 2, false)
                        --visfunc.AddInjury ('puncture_wound')
                        --visfunc.SetInjuryLevel ("LEFT_ARM", 'puncture_wound', '0.4')
                    else
                        ApplyDamageToPed(player, 2, false)
                    end
                    QBCore.Functions.Notify('You messed up and cut yourself', "error")
                end
            end, 3, 20)

        elseif Config.SkillCheck == 'ox_lib' then
            local success = lib.skillCheck({'easy', 'easy', 'medium'})
            if success then
                TriggerServerEvent('dnp_serialscratch:scratchserialfull', data)
            else
                if Config.VisnAre then
                    ApplyDamageToPed(player, 2, false)
                    --visfunc.AddInjury ('puncture_wound')
                    --visfunc.SetInjuryLevel ("LEFT_ARM", 'puncture_wound', '0.4')
                else
                    ApplyDamageToPed(player, 2, false)
                end
                QBCore.Functions.Notify('You messed up and cut yourself', "error")
            end
        end
    else
        local hasfile = QBCore.Functions.HasItem(Config.ScratchTool)

        if hasfile then
            if Config.SkillCheck == 'ps-ui' then
                exports['ps-ui']:Circle(function(success)
                    if success then
                        TriggerServerEvent('dnp_serialscratch:scratchserialpartial', data)
                    else
                        if Config.VisnAre then
                            ApplyDamageToPed(player, 2, false)
                            --visfunc.AddInjury ('puncture_wound')
                            --visfunc.SetInjuryLevel ("LEFT_ARM", 'puncture_wound', '0.4')
                        else
                            ApplyDamageToPed(player, 2, false)
                        end
                        QBCore.Functions.Notify('You messed up and cut yourself', "error")
                    end
                end, 3, 20)

            elseif Config.SkillCheck == 'ox_lib' then
                local success = lib.skillCheck({'easy', 'easy', 'medium'})
                if success then
                    TriggerServerEvent('dnp_serialscratch:scratchserialpartial', data)
                else
                    if Config.VisnAre then
                          ApplyDamageToPed(player, 2, false)
                        --visfunc.AddInjury ('puncture_wound')
                        --visfunc.SetInjuryLevel ("LEFT_ARM", 'puncture_wound', '0.4')
                    else
                        ApplyDamageToPed(player, 2, false)
                    end
                    QBCore.Functions.Notify('You messed up and cut yourself', "error")
                end
            end
        else
            QBCore.Functions.Notify('You don\'t have the right tools', "error")
        end
    end
end)
