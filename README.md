# Delta Drone System

A versatile drone system for FiveM with flying and explosive capabilities.

## Features

- Spawn and control drones with keyboard inputs
- Fly drones with acceleration and height control
- Explode drones to create damage and destruction

## Requirements

- FiveM server
- ESX framework
- MySQL database

## Installation

1. Download the script files
2. Place them in your FiveM server's resources folder
3. Add `start delta_drone` to your server.cfg file
4. Import the database.sql file into your MySQL database

## Usage

- Press E to spawn or control the drone
- Press G to make the drone explode
- Use WASD to control the drone's movement
- Use Space and Left Shift to control the drone's height

## Configuration

Configure the drone settings in the config.lua file:

```lua
Config = {}

-- Drone settings
Config.DroneModel = 'buzzard'
Config.DroneSpeed = 10.0
Config.DroneAcceleration = 5.0
Config.DroneMaxHeight = 50.0
Config.DroneExplosionRadius = 5.0
Config.DroneExplosionDamage = 100.0

-- ESX settings
Config.ESXSharedObject = 'esx:getSharedObject'
Config.ESXPlayerData = 'esx:playerLoaded'
Config.ESXPlayerSpawned = 'esx:playerSpawned'
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=delta-drone-system&utm_content=bottom) — describe it in one sentence and get the full source code.
