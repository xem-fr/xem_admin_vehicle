fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Cl� Admin System'
description 'Interactions admin pour donner des cl�s de v�hicule, r�parer, supprimer, et ravitailler'
version '1.0.0'

client_scripts {
    '@ox_lib/init.lua',
    'client.lua'
}

server_scripts {
    '@es_extended/imports.lua',
    'server.lua'
}
