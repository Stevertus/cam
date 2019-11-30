execute store result score @s cam.pos run data get entity @s Rotation[0] 1000
scoreboard players operation @s cam.pos += dRotX cam.pos
execute store result entity @s Rotation[0] float 0.001 run scoreboard players get @s cam.pos
execute store result score @s cam.pos run data get entity @s Rotation[1] 1000
scoreboard players operation @s cam.pos += dRotY cam.pos
execute store result entity @s Rotation[1] float 0.001 run scoreboard players get @s cam.pos