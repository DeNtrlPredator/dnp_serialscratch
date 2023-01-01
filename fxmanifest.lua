
fx_version 'cerulean'

author 'DeNtrlPredator'
description 'QB-Core weapon serial scratching system'
version '1.2'

game 'gta5'

shared_scripts {
    'config.lua',
	'@ox_lib/init.lua'
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

lua54 'yes'