import 'package:objd/core.dart';

class AddPoint extends Widget {
  int pID;

  AddPoint(this.pID);

  @override
  generate(Context context) {
    return For.of([
      Kill(Entity(tags: ['point$pID'] )),
      AreaEffectCloud.persistent(
        Location.here(),
        tags: ['point', 'point$pID'],
      ),
      Tp(Entity(tags: ['point$pID']),to: Location.here(), rot: Rotation.here()),
    ]);
  }
}
