Config = {}
Config.DrawDistance = 100.0
Config.MarkerSize = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor = { r = 0, g = 204, b = 3 }
Config.MarkerType = 1
Config.BlipSprite = 140
Config.BlipColour = 24
Config.ZDiff = 0.5
Config.Locale = 'en'

Config.Debug = true
Config.DiscordWebhook = "https://discord.com/api/webhooks/1211691807306686564/Ydm1Ky0YKxEn2db9HVY0WDtPev06eoA9LDx-I-YiMY8qcB1t2XY3VXVq3Z1ueoFXgC-H"

Config.HarvestCooldown = 60000 -- Harvest cooldown time in milliseconds (60000ms = 60s)
Config.HarvestAnimation = {dict = "amb@world_human_gardener_plant@male@base", name = "base"} -- Example animation

Config.CraftingTimeSeconds = 5

Config.CraftingZone = {
    coords = vector3(165.79, -233.9, 50.06), -- Example coordinates, adjust to your preferred location
    radius = 2.0 -- Radius of the zone where players can craft
}

Config.CraftingItems = {
    cannabis = 3, -- Required amount of cannabis to craft a joint
    rolling_paper = 1, -- Required amount of rolling papers to craft a joint
}

Config.Shops = {
    [1] = {x = 194.69, y = -234.59, z = 54.07}
}

Config.ShopInventory = {
    {label = "Water", item = "water", price = 2},
    {label = "Bread", item = "bread", price = 5},
    {label = "Rolling Paper", item = "rollingpaper", price = 5},
}

Config.Price = {
    ['cannabis'] = 5.0,
    ['rolling_paper'] = 10,
}

Config.HarvestAmount = 2 -- Amount of cannabis harvested in one action

Config.HarvestZones = {
    Cannabis = {
        coords = vector3(165.28, -245.85, 50.06),
        radius = 2.0
    }
}

