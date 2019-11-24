execute facing entity @e[limit=1,sort=nearest,type=!player,tag=!cam.mover] feet positioned 0 0 0 run summon area_effect_cloud ^ ^ ^-0.5 {Tags:["cam.posToMotion"]}
data modify entity @s Motion[0] set from entity @e[limit=1,tag=cam.posToMotion] Pos[0]
data modify entity @s Motion[1] set from entity @e[limit=1,tag=cam.posToMotion] Pos[1]
data modify entity @s Motion[2] set from entity @e[limit=1,tag=cam.posToMotion] Pos[2]
title @a actionbar [{"nbt":"Motion","entity":"@s"}]
execute if entity @e[distance=..1,type=!player,tag=!cam.mover] run kill