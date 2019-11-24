import 'package:objd/core.dart';

class StopFile extends Widget {
  @override
  generate(Context context) {
    return For.of([
      Tag("moving", entity: Entity.Player()).remove(),
      Kill(Entity(tags: ["camera"])),
      SetGamemode(Gamemode.creative, target: Entity.Player()),
    ]);
  }
}
