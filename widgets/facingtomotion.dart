import 'package:objd/core.dart';

class FacingToMotion extends Widget {

  Entity facing;
  double speed;

  FacingToMotion(this.facing,{this.speed = 1});

  @override
  generate(Context context) {
    return For.of([
      Execute.facing(facing,facing: Facing.feet,children: [
        AreaEffectCloud(Location.local(z: speed),tags: ["posToMotion"]),
      ]).positioned(Location.glob()),
      Data.modify(Entity.Self(),path: "Motion[0]",modify: DataModify.set(Entity(tags: ["posToMotion"],limit: 1),fromPath: "Pos[0]"),),
      Data.copy(Entity.Self(),path: "Motion[1]",from: Entity(tags: ["posToMotion"],limit: 1),fromPath: "Pos[1]"),
      Data.copy(Entity.Self(),path: "Motion[2]",from: Entity(tags: ["posToMotion"],limit: 1),fromPath: "Pos[2]"),

      Title.actionbar(Entity.All(),show: [TextComponent.entityNbt(Entity.Self(),path: "Motion")])
    ]);
  }

}