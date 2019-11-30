execute store result entity @s Motion[0] double 0.001 run scoreboard players get dX cam.pos
execute store result entity @s Motion[1] double 0.001 run scoreboard players get dY cam.pos
execute store result entity @s Motion[2] double 0.001 run scoreboard players get dZ cam.pos
execute if entity @p[distance=..1,tag=!cam.noRotation] run function cam:objd/if1
scoreboard players add @s cam.duration 1
execute if score @s cam.duration > current cam.duration run tellraw @a [{"text":"Console > ","color":"dark_aqua"},{"text":"stop1"}]
execute if score @s cam.duration > current cam.duration run function cam:stop
execute as @p run function cam:objd/execute3