import 'package:objd/core.dart';
import '../widgets/animation_step.dart';

class MainFile extends Widget {
  /// The main file is put in a seperate widget to split the code in several files
  MainFile();

  Entity p1 = Entity(tags: ["point1"]);
  Entity p2 = Entity(tags: ["point2"]);

  Entity showParticles = Entity.All().not(tags: ["moving", "hideParticles"]);

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
