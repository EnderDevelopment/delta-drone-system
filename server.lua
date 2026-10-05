local ESX = nil

TriggerEvent(Config.ESXSharedObject, function(obj) ESX = obj end)

RegisterServerEvent('delta_drone:spawnDrone')
AddEventHandler('delta_drone:spawnDrone', function(droneModel)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        MySQL.Async.execute('INSERT INTO delta_drones (owner_id, drone_model) VALUES (@owner_id, @drone_model)', {
            ['@owner_id'] = xPlayer.identifier,
            ['@drone_model'] = droneModel
        }, function(rowsChanged)
            if rowsChanged > 0 then
                print('Drone spawned for player ' .. xPlayer.identifier)
            end
        end)
    end
end)