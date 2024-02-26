ESX = exports["es_extended"]:getSharedObject()

-- ESX = nil

-- Citizen.CreateThread(function()
--     while ESX == nil do
--         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--         Citizen.Wait(0)
--     end
-- end)

-- Global flag to track harvesting status
local isHarvesting = false

-- Drawing markers for shops, crafting, and harvest zones
Citizen.CreateThread(function()
  while true do
      Wait(0)
      local playerCoords = GetEntityCoords(PlayerPedId())

      -- Shop markers
      for _, shop in pairs(Config.Shops) do
          if #(playerCoords - vector3(shop.x, shop.y, shop.z)) < Config.DrawDistance then
              DrawMarker(Config.MarkerType, shop.x, shop.y, shop.z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
          end
      end

      -- Crafting zone marker
      if #(playerCoords - Config.CraftingZone.coords) < Config.DrawDistance then
          DrawMarker(Config.MarkerType, Config.CraftingZone.coords.x, Config.CraftingZone.coords.y, Config.CraftingZone.coords.z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
      end

      -- Harvest zone markers
      for _, zone in pairs(Config.HarvestZones) do
          if #(playerCoords - zone.coords) < Config.DrawDistance then
              DrawMarker(Config.MarkerType, zone.coords.x, zone.coords.y, zone.coords.z, 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
          end
      end
  end
end)

-- Handling player's action when they are near a marker
Citizen.CreateThread(function()
  while true do
      Wait(0)
      local playerCoords = GetEntityCoords(PlayerPedId())
      local isInMarker, currentZone = false, nil

      for _, shop in pairs(Config.Shops) do
          if #(playerCoords - vector3(shop.x, shop.y, shop.z)) < Config.MarkerSize.x then
              isInMarker, currentZone = true, 'shop'
              break
          end
      end

      if #(playerCoords - Config.CraftingZone.coords) < Config.CraftingZone.radius then
          isInMarker, currentZone = true, 'crafting'
      end

      for name, zone in pairs(Config.HarvestZones) do
          if #(playerCoords - zone.coords) < zone.radius then
              isInMarker, currentZone = true, 'harvest'
              break
          end
      end

      if isInMarker and not HasAlreadyEnteredMarker then
          HasAlreadyEnteredMarker, LastZone = true, currentZone
          TriggerEvent('hw_whitewidow:playerEnteredMarker', currentZone)
      end

      if not isInMarker and HasAlreadyEnteredMarker then
          HasAlreadyEnteredMarker = false
          TriggerEvent('hw_whitewidow:playerExitedMarker', LastZone)
          LastZone = nil
      end
  end
end)

-- Event when player enters a marker zone
AddEventHandler('hw_whitewidow:playerEnteredMarker', function(zone)
  if zone == 'shop' then
      CurrentAction = function()
          local elements = {}
          
          for i=1, #Config.ShopInventory, 1 do
              table.insert(elements, {
                  label = Config.ShopInventory[i].label .. ' - $' .. Config.ShopInventory[i].price,
                  value = Config.ShopInventory[i].item,
                  price = Config.ShopInventory[i].price
              })
          end

          ESX.UI.Menu.CloseAll()

          -- Open the shop menu
          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_menu', {
              title    = 'Shop',
              align    = 'top-left',
              elements = elements
          }, function(data, menu)
              local item = data.current.value
              local price = data.current.price

              ESX.ShowNotification('Buying ' .. data.current.label)
              TriggerServerEvent('hw_whitewidow:buyItem', item, price)

          end, function(data, menu)
              menu.close()
              CurrentAction = nil
          end)
      end
  elseif zone == 'crafting' then
      CurrentAction = function()
          TriggerServerEvent('hw_whitewidow:craftJoint')
          ESX.ShowNotification("Crafting...")
      end
  elseif zone == 'harvest' then
      isHarvesting = true
      Citizen.CreateThread(function()
          while isHarvesting do
              TriggerServerEvent('hw_whitewidow:harvestCannabis')
              Citizen.Wait(5000) 
          end
      end)
  end
end)

-- Event when player exits a marker zone
AddEventHandler('hw_whitewidow:playerExitedMarker', function(zone)
  if zone == 'harvest' then
      isHarvesting = false
  end
  CurrentAction = nil
end)

-- Key press event handling for the current action
Citizen.CreateThread(function()
  while true do
      Wait(0)
      if CurrentAction then
          ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to interact.")
          if IsControlJustReleased(0, 38) then
              CurrentAction()
              CurrentAction = nil
          end
      end
  end
end)