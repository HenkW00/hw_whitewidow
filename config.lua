-------------------------
----------CONFIG---------
-------------------------
Config = {}
Config.DrawDistance = 100.0
Config.MarkerSize = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor = { r = 0, g = 204, b = 3 }
Config.MarkerType = 1
Config.BlipSprite = 140
Config.BlipColour = 24
Config.ZDiff = 0.5
Config.Locale = 'en'

-------------------------
----------UTILS----------
-------------------------
Config.Debug = true
Config.DiscordWebhook = "https://discord.com/api/webhooks/1211691807306686564/Ydm1Ky0YKxEn2db9HVY0WDtPev06eoA9LDx-I-YiMY8qcB1t2XY3VXVq3Z1ueoFXgC-H"

----------------------------
----------CRAFTING----------
----------------------------
Config.CraftingTimeSeconds = 5

Config.CraftingZone = {
    coords = vector3(165.79, -233.9, 50.06), -- Example coordinates, adjust to your preferred location
    radius = 2.0 -- Radius of the zone where players can craft
}

Config.CraftingItems = {
    cannabis = 3, -- Required amount of cannabis to craft a joint
    rolling_paper = 1, -- Required amount of rolling papers to craft a joint
}

-------------------------
----------HARVEST--------
-------------------------
Config.HarvestAmount = 1 -- Amount of cannabis harvested in one action

Config.HarvestZones = {
    Cannabis = {
        coords = vector3(165.28, -245.85, 50.06),
        radius = 2.0
    }
}

-------------------------
----------SHOP-----------
-------------------------
Config.Shops = {
    [1] = {x = 194.69, y = -234.59, z = 54.07}
}

Config.ShopInventory = {
    {label = "Water", item = "water", price = 2},
    {label = "Bread", item = "bread", price = 5},
    {label = "Rolling Paper", item = "rollingpaper", price = 5},
}