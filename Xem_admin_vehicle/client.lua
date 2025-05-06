local ESX = exports.es_extended:getSharedObject()

CreateThread(function()
    while not ESX.IsPlayerLoaded() do Wait(100) end

    ESX.TriggerServerCallback('getPlayerGroup', function(group)
        local allowedGroups = { admin = true, superadmin = true }

        if not group or not allowedGroups[group] then return end

        local function isAdmin() 
            return allowedGroups[group] 
        end

        local options = {
            {
                name = 'admin_vehicle_key',
                icon = 'fa-solid fa-key',
                label = 'Récupérer la clé (admin)',
                canInteract = isAdmin,
                onSelect = function(data)
                    local vehicle = data.entity
                    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

                    TriggerServerEvent('giveVehicleKeyToAdmin', plate, model)

                    lib.notify({
                        title = '🔑 Clé obtenue',
                        description = 'Vous avez reçu la clé du véhicule : '..plate,
                        type = 'success'
                    })
                end
            },
            {
                name = 'admin_vehicle_delete',
                icon = 'fa-solid fa-trash',
                label = 'Supprimer le véhicule (admin)',
                canInteract = isAdmin,
                onSelect = function(data)
                    local vehicle = data.entity
                    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

                    local confirm = lib.alertDialog({
                        header = 'Confirmation',
                        content = 'Voulez-vous vraiment supprimer ce véhicule ('..plate..') ?',
                        centered = true,
                        cancel = true,
                        labels = { confirm = 'Supprimer', cancel = 'Annuler' }
                    })

                    if confirm == 'confirm' then
                        -- ✅ Action si confirmé
                        DeleteEntity(vehicle)
                        TriggerServerEvent('admin:deleteVehicleLog', plate, model)

                        lib.notify({
                            title = '🗑️ Véhicule supprimé',
                            description = 'Le véhicule '..plate..' a été supprimé avec succès.',
                            type = 'success'
                        })
                    else
                        -- ⛔ Action si annulé
                        lib.notify({ 
                            title = 'Annulation', 
                            description = 'Suppression annulée.', 
                            type = 'info' 
                        })
                    end

                end
            },
            {
                name = 'admin_vehicle_fixclean',
                icon = 'fa-solid fa-wrench',
                label = 'Réparer & Nettoyer (admin)',
                canInteract = isAdmin,
                onSelect = function(data)
                    local vehicle = data.entity
                    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
                    local coords = GetEntityCoords(vehicle)

                    SetVehicleFixed(vehicle)
                    SetVehicleDirtLevel(vehicle, 0.0)
                    WashDecalsFromVehicle(vehicle, 1.0)

                    TriggerServerEvent('admin:logFixCleanVehicle', plate, model, coords)

                    lib.notify({
                        title = '🔧 Entretien réussi',
                        description = 'Le véhicule a été réparé et nettoyé.',
                        type = 'success'
                    })
                end
            },
            {
                name = 'admin_vehicle_refuel',
                icon = 'fa-solid fa-gas-pump',
                label = 'Faire le plein (admin)',
                canInteract = isAdmin,
                onSelect = function(data)
                    local vehicle = data.entity
                    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

                    Entity(vehicle).state:set('fuel', 100.0, true)

                    TriggerServerEvent('admin:logRefuelVehicle', plate, model)

                    lib.notify({
                        title = '⛽ Réservoir plein',
                        description = 'Le réservoir a été rempli à 100%.',
                        type = 'success'
                    })
                end
            }
        }

        exports.ox_target:addGlobalVehicle(options)
    end)
end)
print("??????????????????????????????????????????????????????????????")
print("??  ^1Xem Dev^0  ?? Ce script est une cr�ation exclusive de ^1Xem^0.")
print("??  ^1Xem Dev^0  ?? Merci de ne pas le redistribuer sans autorisation.")
print("??????????????????????????????????????????????????????????????")
