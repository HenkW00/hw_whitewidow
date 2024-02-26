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

-------------------------
----------UTILS----------
-------------------------
Config.Locale = 'en'
Config.Debug = true
Config.DiscordWebhook = "https://discord.com/api/webhooks/1211691807306686564/Ydm1Ky0YKxEn2db9HVY0WDtPev06eoA9LDx-I-YiMY8qcB1t2XY3VXVq3Z1ueoFXgC-H"


-------------------------
----------BLIP-----------
-------------------------
Config.WeedShopBlip = {
    coords = vector3(197.01, -242.68, 54.07),
    sprite = 140,
    color = 2,
    scale = 0.8,
    label = "White Widow"
}

-------------------------
----------JOB------------
-------------------------
Config.Job = 'whitewidow'

-------------------------
----------TEXT-----------
-------------------------
Config.WeedShopText = {
    coords = vector3(198.58, -240.7, 54.07),
    textLines = {
        "~g~Welcome to White Widow",
        "~w~Have a look around",
        "~y~Someone will be helping you soon",
        "~b~Open daily: 10am - 10pm"
    }
}


----------------------------
----------CRAFTING----------
----------------------------
Config.CraftingTimeSeconds = 5

Config.CraftingZone = {
    coords = vector3(165.79, -233.9, 50.06),
    radius = 2.0
}

Config.CraftingItems = {
    cannabis = 3,
    rolling_paper = 1,
}

-------------------------
----------HARVEST--------
-------------------------
Config.HarvestAmount = 1

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

-------------------------
----------DEALER---------
-------------------------
Config.DealerPrice = 50 
Config.DealerLocation = vector3(157.49, -254.45, 51.4) 