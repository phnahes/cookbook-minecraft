cookbook-minecraft
==================

Chef Cookbook to install and configure a Minecraft Server.


Below a simple example about how change using Roles.
```
{
  "minecraft": {
    "rcon.password":"password",
    "server-name":"Minecraft - Nahes",
    "motd":"Servidor Nahes - Voce esta sendo Monitorado"
  },

  "run_list": [ "recipe[minecraft]" ]
}
```
