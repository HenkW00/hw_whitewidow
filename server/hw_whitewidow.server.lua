-------------------------
----------SERVER---------
-------------------------
ESX = exports["es_extended"]:getSharedObject()

-- ESX = nil

-- Citizen.CreateThread(function()
--     while ESX == nil do
--         TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--         Citizen.Wait(0)
--     end
-- end)

function SendDiscordLog(title, message, color)
  local discordWebhook = Config.DiscordWebhook
  local embeds = {{
      ["title"] = title,
      ["description"] = message,
      ["type"] = "rich",
      ["color"] = color or 15158332,
      ["footer"] = {
          ["text"] = "HW Scripts | White Widow",
      },
  }}
  PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({embeds = embeds}), {['Content-Type'] = 'application/json'})
end

RegisterServerEvent('hw_whitewidow:buyItem')
AddEventHandler('hw_whitewidow:buyItem', function(itemName, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then
        print("Player not found: " .. _source)
        return
    end

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(itemName, 1)
        TriggerClientEvent('esx:showNotification', _source, "Item bought")
        SendDiscordLog("Item Purchased", xPlayer.getName() .. " purchased " .. itemName .. " for $" .. price, 3066993)
        if Config.Debug then
          print("^0[^1DEBUG^0] ^5Player bought: ^3" .. itemName .. " ^5for: ^3" .. price .. "$")
        end
    else
        TriggerClientEvent('esx:showNotification', _source, "Not enough money")
    end
end)

RegisterServerEvent('hw_whitewidow:harvestCannabis')
AddEventHandler('hw_whitewidow:harvestCannabis', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then
        print("Player not found: " .. _source)
        return
    end

    xPlayer.addInventoryItem('cannabis', 2) 
    TriggerClientEvent('esx:showNotification', _source, 'Cannabis harvested.')
    if Config.Debug then
      print("^0[^1DEBUG^0] ^5Player harvested ^3cannabis^0")
    end
    SendDiscordLog("Harvesting Action", xPlayer.getName() .. " harvested cannabis.", 8311585) 
end)

RegisterServerEvent('hw_whitewidow:craftJoint')
AddEventHandler('hw_whitewidow:craftJoint', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then
        TriggerClientEvent('esx:showNotification', _source, "Player not found")
        return
    end

    local cannabisItem = xPlayer.getInventoryItem('cannabis')
    local paperItem = xPlayer.getInventoryItem('rollingpaper') 

    if cannabisItem.count >= 3 and paperItem.count >= 1 then
        xPlayer.removeInventoryItem('cannabis', 3)
        xPlayer.removeInventoryItem('rollingpaper', 1)
        xPlayer.addInventoryItem('joint', 1)
        TriggerClientEvent('esx:showNotification', _source, "Crafted successfully")
        if Config.Debug then
          print("^0[^1DEBUG^0] ^5Player crafted succesfully a ^3joint^0")
        end
        SendDiscordLog("Crafting Action", xPlayer.getName() .. " crafted a joint.", 3447003) 
    else
        TriggerClientEvent('esx:showNotification', _source, "Not enough materials")
    end
end)

ESX.RegisterUsableItem('rollingpaper', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer then
      ESX.TriggerServerCallback('hw_whitewidow:tryCraftJoint', function(success, message)
          if success then
              TriggerClientEvent('esx:showNotification', source, message)
          else
              TriggerClientEvent('esx:showNotification', source, message)
          end
      end, source)
  end
end)