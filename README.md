# Minecraft Camera V2

This datapack contains a simple camera interface. With it a player can interpolate between two points in a given time.
As result you can get very interesting camera motions, pans and cinematic recordings.

> The Minecraft version 1.15 is required for this datapack to work!


## Install
Download the datapack in the release tab or with dManager: [dmanager.stevertus.com](https://dmanager.stevertus.com/pack/open/stevertus:cam)

Put it in your worlds datapacks folder.

## Setting the points
After reloading you can set the points. The datapack will create a little bubble at the selected location and rotation.

To set the first point use:
```mcfunction
function cam:p1
```

And the same goes with the second point:
To set the first point use:
```mcfunction
function cam:p2
```

After the two points are created, you can see a preview of the camera path.

You can also set the points quickly using a carrot on a stick and toggling the points with rightclick:

```mcfunction
give @s minecraft:carrot_on_a_stick{cam:1b}
```
## Duration

To set the duration(in seconds), you have to change the scoreboard `cam.duration`.

```mcfunction
scoreboard players set @s cam.duration 10
```

## Starting and Stopping

Now you can start the camera with:
```mcfunction
function cam:start
```

The camera will automatically stop when the destination is reached. However you can also manually stop it using:

```mcfunction
function cam:stop
```

## Modes

By default the pack sets you as a spectator of a camera entity that is moved with motion and rotation. 
Due to a threshold in the specators rotation this could stutter sometimes with little rotation increases.

To fix this, you can switch to old teleporting:

```mcfunction
tag @s add cam.tp
```

Remember be in flying mode while activating the camera that way to get the best results.

In case you dont want to have the particles showing up, you can disable them using:

```mcfunction
tag @s add cam.hideParticles
```

You can also remove the interpolation between rotations by adding the tag `cam.noRotation`:

```mcfunction
tag @s add cam.noRotation
```

In spectator mode the camera is fixed to the first points rotation and in teleport mode you can rotate freely around and move the camera yourself.

## Removing Points or the entire Pack

To delete the current points, just kill the responsible entities: 
```mcfunction
kill @e[tag="cam.point"]
```

You can remove all scoreboards and the disable the pack with 

```mcfunction
function cam:remove
```