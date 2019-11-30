execute as @s[distance=2..,tag=!cam.tp] run tellraw @a [{"text":"Console > ","color":"dark_aqua"},{"text":"stop2"}]
execute as @s[distance=2..,tag=!cam.tp] run function cam:stop
execute as @s[tag=!cam.noRotation] run tp @s ~ ~ ~ ~ ~
execute as @s[tag=cam.tp,tag=cam.noRotation] run tp @s ~ ~ ~