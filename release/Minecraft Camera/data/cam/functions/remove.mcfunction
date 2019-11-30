execute as @a run function cam:stop
kill @e[tag=cam.point]
scoreboard objectives remove cam.duration
scoreboard objectives remove cam.pos
scoreboard objectives remove cam.objd_consts
scoreboard objectives remove cam.objd_click
tellraw @s [{"text":"Minecraft Camera Pack has been disabled and removed!","color":"dark_red"}]
datapack disable "file/Minecraft Camera"
datapack disable "file/Minecraft Camera.zip"