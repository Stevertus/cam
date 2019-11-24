execute store result entity @s Motion[0] double 0.001 run scoreboard players get dX cam.pos
execute store result entity @s Motion[1] double 0.001 run scoreboard players get dY cam.pos
execute store result entity @s Motion[2] double 0.001 run scoreboard players get dZ cam.pos
execute store result score @s cam.pos run data get entity @s Rotation[0] 1000
scoreboard players operation @s cam.pos += dRotX cam.pos
execute store result entity @s Rotation[0] float 0.001 run scoreboard players get @s cam.pos
execute store result score @s cam.pos run data get entity @s Rotation[1] 1000
scoreboard players operation @s cam.pos += dRotY cam.pos
execute store result entity @s Rotation[1] float 0.001 run scoreboard players get @s cam.pos
scoreboard players add @s cam.duration 1
execute if score @s cam.duration > current cam.duration run function cam:stop
execute as @p run execute as @s[distance=0.4..,tag=!cam.tp] run function cam:stop
execute as @p run execute as @s[tag=cam.tp] run tp @s ~ ~ ~ ~ ~