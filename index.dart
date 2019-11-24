// import the core of the framework:
import 'package:objd/core.dart';
// import the custom pack:
import './packs/camera_pack.dart';

void main(List<String> args) {
  Scoreboard.prefix = "cam.";
  Tag.prefix = "cam.";
  Comment.Author = "Stevertus";
  createProject(
    Project(
      name: 'release/Minecraft Camera',
      target: "./", // path for where to generate the project
      generate: CameraPack(), // The starting point of generation
    ),
    args,
  );
}
