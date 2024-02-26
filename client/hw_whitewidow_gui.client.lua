ESX = exports["es_extended"]:getSharedObject()

-- ====================================================================================================================
-- Local function
-- ====================================================================================================================
function OpenShopMenu()
  ESX.UI.Menu.CloseAll()

  local elements = {
    { 
      label = _U('cannabis') .. ' : [' .. Config.Price['cannabis'] .. '$]',
      value = { name = 'cannabis',    price = Config.Price['cannabis'] } 
    }
  }

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
      css =  'superete',
	  title    = _U('drugstore'),
      align    = 'top-left',
      elements = elements
    }, function(data, menu)
      local element = data.current.value

      ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
          css =  'valider',
		  title = _U('valid_this_purchase'),
          align = 'top-left',
          elements = {
            { label = _U('yes'), value = 'yes' },
            { label = _U('no'),  value = 'no'  }
          }
        }, function(data2, menu2)
          if data2.current.value == 'yes' then
            TriggerServerEvent('hw_whitewidow:buyItem', element.name, element.price)
          end
          
          menu2.close()
          setCurrentAction('weed_shop', _U('press_menu'), {})
        end, function(data2, menu2)
          menu2.close()
        end
      )

    end, function(data, menu)
      menu.close()
    end
  )

end