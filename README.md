# HW Scripts | White Widow

A simple white widow job that introduces a dynamic interaction system for shop purchases, item crafting, and continuous item harvesting within defined zones.
Comes with discord logging, and made it so u can change alot if you want. Or edit it to how you like!

## Features

- **Shop System**: Allows players to purchase predefined items from specific locations marked on the map.
- **Crafting System**: Enables item crafting, offering a simple interaction to create new items.
- **Harvesting System**: Implements a zone-based harvesting mechanism where players can collect specific items over time by staying within designated areas.

## Installation

1. Clone this repository into your `resources` directory.
2. Add `ensure esx_harvest_craft_shop` to your `server.cfg` file.
3. Configure the `config.lua` to suit your server's needs, including setting up shop inventories, crafting recipes, and harvest zones.

## Configuration

Edit the `config.lua` file to customize shop inventories, crafting recipes, and harvest zones. Here's an example configuration:

```lua
Config.Shops = {
    {x = 25.742, y = -1345.741, z = 29.497},
    -- Add more shop coordinates as needed
}

Config.CraftingZone = {
    coords = vector3(100.0, -2000.0, 20.0),
}

Config.HarvestZones = {
    Cannabis = {
        coords = vector3(105.0, -1950.0, 20.0),
        radius = 50.0
    },
    -- Add more harvest zones as needed
}

Config.ShopInventory = {
    {label = "Water", item = "water", price = 10},
    {label = "Bread", item = "bread", price = 5},
    -- Add more items as needed
}
```

## Usage
- Approach a Shop Marker to open the shop menu and purchase items.
- Enter the Crafting Zone to craft predefined items instantly.
- Stay within a Harvest Zone to continuously collect specific items over time.

## Dependencies
- es_extended (ESX)
Ensure you have the latest version of ESX installed and properly configured on your server.


## What will come next?
- Ill make changes to notify system
- Ill add actual job integration
- Ill make a bossmenu
- Maybe change some other stuff but ill have to see what will come 


## Support
For support, please open an issue
on this repository or contact us through the FiveM forums.

## Contributing

Contributions are welcome! Please feel free to submit pull requests with improvements or open issues with suggestions and feedback.

## License

Distributed under the MIT License. See `LICENSE` file for more information.

## Acknowledgments

- The ESX Framework Team for their continuous efforts in providing a solid RP framework.
- The FiveM community for their invaluable contributions and support.

Enjoy enhancing your server's roleplaying experience with the ESX Harvest Craft Shop!