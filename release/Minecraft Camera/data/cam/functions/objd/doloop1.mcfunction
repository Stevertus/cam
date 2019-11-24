particle minecraft:bubble_column_up ~ ~ ~ 0 0 0 0.0 1 normal @a[tag=!cam.moving]
execute unless entity @e[tag=cam.point2,distance=..0.5] positioned ^ ^ ^0.5 run function cam:objd/doloop1