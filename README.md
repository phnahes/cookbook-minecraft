cookbook-minecraft
==================

Chef Cookbook to install and configure a Minecraft Server.

```
{
  "minecraft": {
    "rcon.password":"pnahes",
    "server-name":"Minecraft - Nahes",
    "motd":"Servidor Nahes - Voce esta sendo Monitorado"
  },

  "run_list": [ "recipe[minecraft]" ]
}
```
