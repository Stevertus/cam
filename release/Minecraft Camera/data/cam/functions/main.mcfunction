################################################
#
# Author:
#  Stevertus
#
# Description:    
#  The main File
#
# Called in:
#  Tick File
#
# Context:
#  Global
#
################################################
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{cam:1b}}},scores={cam.objd_click=1..}] at @s run function cam:events/click
execute as @e[tag=cam.point] at @s run particle minecraft:bubble_pop ~ ~ ~ 0 0 0 0.0 1 normal @a[tag=!cam.moving]
execute as @e[tag=cam.mover] at @s run function cam:objd/execute1
execute as @e[tag=cam.camera] at @s run function cam:objd/execute2
execute as @e[tag=cam.point2] as @e[tag=cam.point1] at @s facing entity @e[tag=cam.point2] feet run execute unless entity @e[tag=cam.point2,distance=..0.5] run function cam:objd/doloop1