import 'package:objd/core.dart';
import '../widgets/facingtomotion.dart';
import '../widgets/animation_step.dart';

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  Entity p1 = Entity(tags: ["point1"]);
  Entity p2 = Entity(tags: ["point2"]);

  Entity showParticles =
      Entity.All(tags: ["showParticles"]).not(tags: ["moving"]);

  @override
  Widget generate(Context context) {
    return For.of([
      // put your tick widgets here
      Execute.asat(
        Entity(
          tags: ['point'],
        ),
        children: [
          Particle(
            ParticleType.bubble_pop,
            location: Location.here(),
            delta: Location.glob(),
            player: showParticles,
          )
        ],
      ),
      Execute.asat(
        Entity(
          tags: ['mover'],
        ),
        children: [
          FacingToMotion(
              Entity(limit: 1).sort(Sort.nearest).not(
                tags: ["mover"],
                type: EntityType.player,
              ),
              speed: -0.5),
          Comment.Null(),
          Comment.Null(),
          If(
              Entity(distance: Range(to: 1))
                  .not(tags: ["mover"], type: EntityType.player),
              then: [Kill()])
        ],
      ),

      AnimationStep(Entity(tags: ["camera"])),

      Execute.as(
        p2,
        children: [
          Do.Until(p2.copyWith(distance: Range(to: 0.5)),
              then: [
                Particle(
                  ParticleType.bubble_column_up,
                  location: Location.here(),
                  delta: Location.glob(),
                  player: showParticles,
                )
              ],
              translate: Location.local(z: 0.5))
        ],
      ).asat(p1).facing(p2, facing: Facing.feet),
    ]);
  }
}
