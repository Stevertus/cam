execute if entity @s[tag=!cam.pointSwitch] run function cam:p1
execute if entity @s[tag=cam.pointSwitch] run function cam:p2
execute if entity @s[tag=cam.pointSwitch] run tag @s add cam.objd_temp
execute if entity @s[tag=cam.objd_temp] run tag @s remove cam.pointSwitch
execute if entity @s[tag=!cam.objd_temp] run tag @s add cam.pointSwitch
tag @s remove cam.objd_temp
scoreboard players reset @s cam.objd_click