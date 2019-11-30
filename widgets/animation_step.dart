import 'package:objd/core.dart';

class AnimationStep extends Widget {
  Entity camera;

  AnimationStep(this.camera);

  @override
  generate(Context context) {
    Scoreboard pos = Scoreboard("pos");
    Scoreboard dur = Scoreboard("duration");

    return camera.asat(children: [
      Data.fromScore(
        Entity.Self(),
        score: pos["dX"],
        path: "Motion[0]",
        scale: 0.001,
        datatype: "double",
      ),
      Data.fromScore(
        Entity.Self(),
        score: pos["dY"],
        path: "Motion[1]",
        scale: 0.001,
        datatype: "double",
      ),
      Data.fromScore(
        Entity.Self(),
        score: pos["dZ"],
        path: "Motion[2]",
        scale: 0.001,
        datatype: "double",
      ),
      If(
          Entity.Player(distance: Range(to: 1), tags: ["moving"]).not(
            tags: ["noRotation"],
          ),
          then: [
            // Rotation X
            pos[Entity.Self()].setToData(
                Data.get(Entity.Self(), path: "Rotation[0]", scale: 1000)),
            pos[Entity.Self()] + pos["dRotX"],
            Data.fromScore(
              Entity.Self(),
              score: pos[Entity.Self()],
              path: "Rotation[0]",
              scale: 0.001,
              datatype: "float",
            ),

            // Rotation Y
            pos[Entity.Self()].setToData(
                Data.get(Entity.Self(), path: "Rotation[1]", scale: 1000)),
            pos[Entity.Self()] + pos["dRotY"],
            Data.fromScore(
              Entity.Self(),
              score: pos[Entity.Self()],
              path: "Rotation[1]",
              scale: 0.001,
              datatype: "float",
            ),
          ]),
      dur[Entity.Self()] + 1,
      If(dur[Entity.Self()] > dur["current"], then: [
        Log("stop1"),
        File.execute("stop", create: false),
      ]),
      Execute.as(Entity.Player(), children: [
        Execute.as(
          Entity.Self(distance: Range(from: 2)).not(tags: ["tp"]),
          children: [
            Log("stop2"),
            File.execute("stop", create: false),
          ],
        ),
        Execute.as(
          Entity.Self(tags: ["tp"]).not(tags: ["noRotation"]),
          children: [
            Tp(
              Entity.Self(),
              to: Location.here(),
              rot: Rotation.here(),
            ),
          ],
        ),
        Execute.as(
          Entity.Self(tags: ["tp", "noRotation"]),
          children: [
            Tp(
              Entity.Self(),
              to: Location.here(),
            ),
          ],
        ),
      ]),
    ]);
  }
}
