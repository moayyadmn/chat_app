import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/services/app_services.dart';
import 'package:scholarchat_app/core/utils/constants.dart';

class LoginMiddleware extends GetMiddleware {
  final AppServices _appServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (_appServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: kUserChatRoute);
    }
    return null;
  }
}
