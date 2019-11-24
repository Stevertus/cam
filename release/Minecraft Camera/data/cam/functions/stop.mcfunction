################################################
#
# Author:
#  Stevertus
#
# Description:    
#  stops all running cameras
#
# Called in:
#  Player / Player leaves spectate / Camera reaches end
#
################################################
tag @p remove cam.moving
kill @e[tag=cam.camera]
gamemode creative @p