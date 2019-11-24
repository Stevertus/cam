import 'package:objd/core.dart';

class ClickFile extends Widget {
  @override
  generate(Context context) {
    Tag t = Tag("pointSwitch");

    return For.of([
      If(Entity.Self().not(tags: ["pointSwitch"]), then: [
        File.execute(
          "p1",
          create: false,
        ),
      ]),
      If(t, then: [
        File.execute(
          "p2",
          create: false,
        ),
      ]),
      t.toggle(),
    ]);
  }
}
