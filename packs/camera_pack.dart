import 'package:objd/core.dart';
// import all the files:
import '../files/load.dart';
import '../files/main.dart';
import '../files/click.dart';
import '../files/start.dart';
import '../files/stop.dart';
import '../files/addpoint.dart';

class CameraPack extends Widget {
  CameraPack();

  @override
  Widget generate(Context context) {
    return Pack(
        name: 'cam',
        main: File(
          'main',
          child: MainFile(),
          header: Comment.FileHeader(
            "The main File",
            calledFrom: "Tick File",
            context: "Global",
          ),
        ),
        load: File('load', child: LoadFile()),
        modules: [
          ClickEvent(
            onClick: ClickFile(),
            name: "click",
            selectedItem: Item(
              ItemType.carrot_on_a_stick,
              nbt: {
                "cam": Byte(1),
              },
            ),
          )
        ],
        files: [
          File(
            'p1',
            child: AddPoint(1),
          ),
          File(
            'p2',
            child: AddPoint(2),
          ),
          File(
            'start',
            child: StartFile(),
            header: Comment.FileHeader(
              "summons a new aec and starts the camera",
              calledFrom: "Player",
            ),
          ),
          File(
            'stop',
            child: StopFile(),
            header: Comment.FileHeader(
              "stops all running cameras",
              calledFrom:
                  "Player / Player leaves spectate / Camera reaches end",
            ),
          ),
          File('remove',
              child: For.of([
                Execute.as(Entity.All(), children: [
                  File.execute("stop", create: false),
                ]),
                Kill(Entity(tags: ["point"])),
                Scoreboard.remove("duration"),
                Scoreboard.remove("pos"),
                Scoreboard.remove("objd_consts"),
                Scoreboard.remove("objd_click"),
                Tellraw(Entity.Self(), show: [
                  TextComponent(
                    "Minecraft Camera Pack has been disabled and removed!",
                    color: Color.DarkRed,
                  )
                ]),
                Command('datapack disable "file/Minecraft Camera"'),
                Command('datapack disable "file/Minecraft Camera.zip"'),
              ]))
        ]);
  }
}
