ESX = exports["es_extended"]:getSharedObject()

-- ESX = nil

-- TriggerEvent('esx:getSharedObject', function(obj) 
--     ESX = obj 
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

    -- Check if the player has the required job
    if xPlayer.job.name == Config.Job then
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
    else
        TriggerClientEvent('esx:showNotification', _source, "You don't have the required job to buy items.")
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

    -- Check if the player has the required job
    if xPlayer.job.name == Config.Job then
        xPlayer.addInventoryItem('cannabis', 2) 
        TriggerClientEvent('esx:showNotification', _source, 'Cannabis harvested.')
        if Config.Debug then
            print("^0[^1DEBUG^0] ^5Player harvested ^3cannabis^0")
        end
        SendDiscordLog("Harvesting Action", xPlayer.getName() .. " harvested cannabis.", 8311585) 
    else
        TriggerClientEvent('esx:showNotification', _source, "You don't have the required job to harvest cannabis.")
    end
end)

RegisterServerEvent('hw_whitewidow:craftJoint')
AddEventHandler('hw_whitewidow:craftJoint', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then
        TriggerClientEvent('esx:showNotification', _source, "Player not found")
        return
    end

    -- Check if the player has the required job
    if xPlayer.job.name == Config.Job then
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
    else
        TriggerClientEvent('esx:showNotification', _source, "You don't have the required job to craft joints.")
    end
end)

ESX.RegisterServerCallback('hw_whitewidow:sellToDealer', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jointCount = xPlayer.getInventoryItem('joint').count
    if jointCount > 0 then
        local pricePerJoint = Config.DealerPrice
        local totalSalePrice = jointCount * pricePerJoint
        xPlayer.removeInventoryItem('joint', jointCount)
        xPlayer.addMoney(totalSalePrice)
        cb(true, "Sold " .. jointCount .. " joints for $" .. totalSalePrice)
        SendDiscordLog("Joint Sale", xPlayer.getName() .. " sold " .. jointCount .. " joints to the dealer for $" .. totalSalePrice, 3447003) 
    else
        cb(false, "You don't have any joints to sell.")
    end
end)

-- Function to handle selling joints to the dealer
function SellJointsToDealer(_source)
    local xPlayer = ESX.GetPlayerFromId(_source)
    if not xPlayer then
        print("Player not found: " .. _source)
        return
    end

    -- Check if the player has the required job
    if xPlayer.job.name == Config.Job then
        local jointCount = xPlayer.getInventoryItem('joint').count
        if jointCount > 0 then
            local totalPrice = jointCount * Config.DealerPrice
            xPlayer.removeInventoryItem('joint', jointCount)
            xPlayer.addMoney(totalPrice)
            TriggerClientEvent('esx:showNotification', _source, 'Sold ' .. jointCount .. ' joints to the dealer for $' .. totalPrice)
            if Config.Debug then
                print("^0[^1DEBUG^0] ^5Player sold ^3" .. jointCount .. " joints^5 to the dealer for ^3$" .. totalPrice .. "^0")
            end
            SendDiscordLog("Joint Sale", xPlayer.getName() .. " sold " .. jointCount .. " joints to the dealer for $" .. totalPrice, 3447003) 
        else
            TriggerClientEvent('esx:showNotification', _source, 'You don\'t have any joints to sell.')
        end
    else
        TriggerClientEvent('esx:showNotification', _source, "You don't have the required job to sell joints to the dealer.")
    end
end




