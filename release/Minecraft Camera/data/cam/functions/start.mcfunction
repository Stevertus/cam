################################################
#
# Author:
#  Stevertus
#
# Description:    
#  summons a new aec and starts the camera
#
# Called in:
#  Player
#
################################################
tag @s add cam.moving
scoreboard players operation current cam.duration = @s cam.duration
scoreboard players operation current cam.duration *= #20 cam.objd_consts
execute at @e[limit=1,tag=cam.point2,sort=nearest] at @e[limit=1,tag=cam.point1,sort=nearest] run function cam:objd/execute3