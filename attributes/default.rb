#
# Cookbook Name: Minecraft
# Attribute: default
#


ipaddress = node[:ipaddress]

default['minecraft']['install_dir']         = '/data/minecraft'
default['minecraft']['user']                = 'root'

default['minecraft']['jar']		    = ''

default['minecraft']['base_url']            = 'https://s3.amazonaws.com/MinecraftDownload/launcher'
default['minecraft']['checksum']            = '7a1abdac5d412b7eebefd84030d40c1591c17325801dba9cbbeb3fdf3c374553'
default['minecraft']['vanilla_jar']         = 'minecraft_server.jar'

default['minecraft']['use_bukkit']	    = true
default['minecraft']['bukkit_url']          = 'http://dl.bukkit.org/downloads/craftbukkit/get/02169_1.5.2-R1.0/craftbukkit.jar'
default['minecraft']['bukkit_jar']          = 'craftbukkit.jar'

default['minecraft']['ipv6']                = false
default['minecraft']['pid']                 = '/var/run/minecraft.pid'
default['minecraft']['xms']                 = '50M'
default['minecraft']['xmx']                 = '300M'
default['minecraft']['maxpermsize']         = '128M'
default['minecraft']['cpu_count']           = '1'

default['minecraft']['banned-ips']          = []
default['minecraft']['banned-players']      = []
default['minecraft']['ops']                 = []
default['minecraft']['white-list-users']    = []

default['minecraft']['allow-flight']        = false
default['minecraft']['allow-nether']        = false
default['minecraft']['debug']		    = false
default['minecraft']['difficulty']          = 1
default['minecraft']['enable-query']        = true
default['minecraft']['enable-rcon']	    = true
default['minecraft']['force-gamemode']	    = false
default['minecraft']['gamemode']            = 0
default['minecraft']['generate-structures'] = true
default['minecraft']['grow-trees']	    = false
default['minecraft']['hardcore']	    = false
default['minecraft']['level-name']          = 'Nahes'
default['minecraft']['level-seed']          = ''
default['minecraft']['level-type']          = 'DEFAULT'
default['minecraft']['max-build-height']    = 256
default['minecraft']['max-players']         = 5
default['minecraft']['motd']                = 'A Minecraft Server'
default['minecraft']['online-mode']         = false
default['minecraft']['player-idle-timeout'] = 10
default['minecraft']['pvp']                 = true
default['minecraft']['query.port']	    = "25565"
default['minecraft']['rcon.password']	    = "password"
default['minecraft']['rcon.port']	    = "25575"
default['minecraft']['server-ip']           = ipaddress
default['minecraft']['server-name']	    = "Minecraft Server"
default['minecraft']['server-port']         = 25565
default['minecraft']['snooper-enabled']     = false
default['minecraft']['spawn-animals']       = false
default['minecraft']['spawn-monsters']      = false
default['minecraft']['spawn-npcs']          = false
default['minecraft']['spawn-protection']    = 15
default['minecraft']['verify-names']	    = false
default['minecraft']['view-distance']       = 10
default['minecraft']['white-list']          = false
