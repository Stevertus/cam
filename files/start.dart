import 'package:objd/core.dart';

class StartFile extends Widget {
  @override
  generate(Context context) {
    Entity nearestPoint1 =
        Entity(tags: ["point1"], limit: 1).sort(Sort.nearest);
    Entity nearestPoint2 =
        Entity(tags: ["point2"], limit: 1).sort(Sort.nearest);

    Scoreboard pos = Scoreboard("pos");
    Scoreboard dur = Scoreboard("duration");

    Score getDatatoScore(String entity, Entity source, String path) {
      return pos[entity].setToData(Data.get(
        source,
        path: path,
        scale: 1000,
      ));
    }

    List<Score> getDataToScores(Entity source, int i) => [
          getDatatoScore("pos${i}X", source, "Pos[0]"),
          getDatatoScore("pos${i}Y", source, "Pos[1]"),
          getDatatoScore("pos${i}Z", source, "Pos[2]"),
          getDatatoScore("rot${i}X", source, "Rotation[0]"),
          getDatatoScore("rot${i}Y", source, "Rotation[1]"),
        ];

    return For.of([
      Tag("moving"),
      dur["current"] >> dur[Entity.Self()],
      dur["current"] * 20,
      Execute.at(
        nearestPoint2,
        children: [
          ArmorStand(Location.here(), tags: ["camera"], invisible: true),
          Data.copy(
            Entity(tags: ["camera"], limit: 1),
            path: "Rotation",
            from: nearestPoint1,
            fromPath: "Rotation",
          ),

          ...getDataToScores(nearestPoint1, 1),
          ...getDataToScores(nearestPoint2, 2),

          // set to higher
          pos["dX"] >> pos["pos2X"],
          pos["dY"] >> pos["pos2Y"],
          pos["dZ"] >> pos["pos2Z"],
          pos["dRotX"] >> pos["rot2X"],
          pos["dRotY"] >> pos["rot2Y"],

          // calc delta
          pos["dX"] - pos["pos1X"],
          pos["dY"] - pos["pos1Y"],
          pos["dZ"] - pos["pos1Z"],
          pos["dRotX"] - pos["rot1X"],
          pos["dRotY"] - pos["rot1Y"],

          // divide by 20(every second)

          pos["dX"] / 20,
          pos["dY"] / 20,
          pos["dZ"] / 20,
          pos["dRotX"] / 20,
          pos["dRotY"] / 20,

          // divide by time(delta every tick)

          pos["dX"] / dur[Entity.Self()],
          pos["dY"] / dur[Entity.Self()],
          pos["dZ"] / dur[Entity.Self()],
          pos["dRotX"] / dur[Entity.Self()],
          pos["dRotY"] / dur[Entity.Self()],

          Execute.as(Entity.Player(), children: [
            SetGamemode(Gamemode.spectator),
            Spectate(
              Entity(tags: ["camera"], limit: 1),
            ),
          ]).as(Entity.Self().not(tags: ["tp"]))
        ],
      ).at(nearestPoint1),
    ]);
  }
}
