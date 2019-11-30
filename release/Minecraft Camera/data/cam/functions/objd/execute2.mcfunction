summon armor_stand ~ ~ ~ {Invisible:1,Tags:["cam.camera"]}
data modify entity @e[limit=1,tag=cam.camera] Rotation set from entity @e[limit=1,tag=cam.point1,sort=nearest] Rotation
execute store result score pos1X cam.pos run data get entity @e[limit=1,tag=cam.point1,sort=nearest] Pos[0] 1000
execute store result score pos1Y cam.pos run data get entity @e[limit=1,tag=cam.point1,sort=nearest] Pos[1] 1000
execute store result score pos1Z cam.pos run data get entity @e[limit=1,tag=cam.point1,sort=nearest] Pos[2] 1000
execute store result score rot1X cam.pos run data get entity @e[limit=1,tag=cam.point1,sort=nearest] Rotation[0] 1000
execute store result score rot1Y cam.pos run data get entity @e[limit=1,tag=cam.point1,sort=nearest] Rotation[1] 1000
execute store result score pos2X cam.pos run data get entity @e[limit=1,tag=cam.point2,sort=nearest] Pos[0] 1000
execute store result score pos2Y cam.pos run data get entity @e[limit=1,tag=cam.point2,sort=nearest] Pos[1] 1000
execute store result score pos2Z cam.pos run data get entity @e[limit=1,tag=cam.point2,sort=nearest] Pos[2] 1000
execute store result score rot2X cam.pos run data get entity @e[limit=1,tag=cam.point2,sort=nearest] Rotation[0] 1000
execute store result score rot2Y cam.pos run data get entity @e[limit=1,tag=cam.point2,sort=nearest] Rotation[1] 1000
scoreboard players operation dX cam.pos = pos2X cam.pos
scoreboard players operation dY cam.pos = pos2Y cam.pos
scoreboard players operation dZ cam.pos = pos2Z cam.pos
scoreboard players operation dRotX cam.pos = rot2X cam.pos
scoreboard players operation dRotY cam.pos = rot2Y cam.pos
scoreboard players operation dX cam.pos -= pos1X cam.pos
scoreboard players operation dY cam.pos -= pos1Y cam.pos
scoreboard players operation dZ cam.pos -= pos1Z cam.pos
scoreboard players operation dRotX cam.pos -= rot1X cam.pos
scoreboard players operation dRotY cam.pos -= rot1Y cam.pos
execute if score dRotX cam.pos matches 181.. run function cam:objd/if2
execute if score dRotY cam.pos matches 181.. run function cam:objd/if3
execute if score dRotX cam.pos matches ..-181 run function cam:objd/if4
execute if score dRotY cam.pos matches ..-181 run function cam:objd/if5
scoreboard players operation dX cam.pos /= #20 cam.objd_consts
scoreboard players operation dY cam.pos /= #20 cam.objd_consts
scoreboard players operation dZ cam.pos /= #20 cam.objd_consts
scoreboard players operation dRotX cam.pos /= #20 cam.objd_consts
scoreboard players operation dRotY cam.pos /= #20 cam.objd_consts
scoreboard players operation dX cam.pos /= @s cam.duration
scoreboard players operation dY cam.pos /= @s cam.duration
scoreboard players operation dZ cam.pos /= @s cam.duration
scoreboard players operation dRotX cam.pos /= @s cam.duration
scoreboard players operation dRotY cam.pos /= @s cam.duration
execute as @p as @s[tag=!cam.tp] run gamemode spectator @s
execute as @p as @s[tag=!cam.tp] run spectate @e[limit=1,tag=cam.camera]