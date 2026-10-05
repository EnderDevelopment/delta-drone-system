local ESX = nil
local drone = nil
local isFlying = false
local isExploding = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.ESXSharedObject, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then -- E key
            if drone == nil then
                SpawnDrone()
            else
                if isFlying then
                    LandDrone()
                else
                    FlyDrone()
                end
            end
        elseif IsControlJustPressed(0, 47) then -- G key
            if drone ~= nil and not isFlying then
                ExplodeDrone()
            end
        end
    end
end)

function SpawnDrone()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    RequestModel(GetHashKey(Config.DroneModel))
    while not HasModelLoaded(GetHashKey(Config.DroneModel)) do
        Citizen.Wait(0)
    end

    drone = CreateVehicle(GetHashKey(Config.DroneModel), coords.x, coords.y, coords.z, heading, true, false)
    SetVehicleEngineOn(drone, true, true, false)
    SetVehicleForwardSpeed(drone, Config.DroneSpeed)
    SetVehicleOnGroundProperly(drone)

    TriggerServerEvent('delta_drone:spawnDrone', Config.DroneModel)
end

function FlyDrone()
    if drone ~= nil then
        isFlying = true
        SetVehicleForwardSpeed(drone, Config.DroneSpeed)
        while isFlying do
            Citizen.Wait(0)
            if IsControlPressed(0, 32) then -- W key
                SetVehicleForwardSpeed(drone, GetEntitySpeed(drone) + Config.DroneAcceleration)
            elseif IsControlPressed(0, 33) then -- S key
                SetVehicleForwardSpeed(drone, GetEntitySpeed(drone) - Config.DroneAcceleration)
            end

            if IsControlPressed(0, 34) then -- A key
                SetEntityHeading(drone, GetEntityHeading(drone) - 1.0)
            elseif IsControlPressed(0, 35) then -- D key
                SetEntityHeading(drone, GetEntityHeading(drone) + 1.0)
            end

            if IsControlPressed(0, 22) then -- Space key
                SetEntityCoords(drone, GetEntityCoords(drone).x, GetEntityCoords(drone).y, GetEntityCoords(drone).z + 1.0)
            elseif IsControlPressed(0, 36) then -- Left Shift key
                SetEntityCoords(drone, GetEntityCoords(drone).x, GetEntityCoords(drone).y, GetEntityCoords(drone).z - 1.0)
            end
        end
    end
end

function LandDrone()
    if drone ~= nil then
        isFlying = false
        SetVehicleForwardSpeed(drone, 0.0)
    end
end

function ExplodeDrone()
    if drone ~= nil then
        isExploding = true
        AddExplosion(GetEntityCoords(drone).x, GetEntityCoords(drone).y, GetEntityCoords(drone).z, 2, Config.DroneExplosionDamage, true, false, Config.DroneExplosionRadius)
        DeleteEntity(drone)
        drone = nil
        isExploding = false
    end
end