import 'package:permission_handler/permission_handler.dart';

Future checkPermission() async {
  final camera = await Permission.camera.status;
  final audio = await Permission.audio.status;

  if (!camera.isGranted) {
    await Permission.camera.request().then((value) async {
      if (!audio.isGranted) {
        await Permission.audio.request();
      }
    });
  } else {
    if (!audio.isGranted) {
      await Permission.audio.request();
    }
  }
  return Future.value(true);
}
