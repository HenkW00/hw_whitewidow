
fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

version '1.1.1'
author 'HenkW'
description 'White Widow job for ESX'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/hw_whitewidow.server.lua',
    'locales/fr.lua',
    'locales/en.lua',
    'server/version.lua',
    'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client/hw_whitewidow.client.lua',
    'client/hw_whitewidow_gui.client.lua',
    'locales/fr.lua',
    'locales/en.lua',
    'config.lua'
}

shared_script '@es_extended/imports.lua'
