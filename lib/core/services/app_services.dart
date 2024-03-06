import 'package:get/get.dart';
import 'package:scholarchat_app/core/services/service_locator.dart';
import 'package:scholarchat_app/core/utils/permission_handler.dart';
import 'package:scholarchat_app/features/calls/functions/call_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
  setup();
  checkPermission();
  onUserLogin();
}
