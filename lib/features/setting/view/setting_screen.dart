import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:chatbox/core/helper/extensions.dart';
import 'package:chatbox/core/utils/theme/colors.dart';
import 'package:chatbox/features/setting/view/widgets/setting_app_bar.dart';
import 'package:chatbox/features/setting/view/widgets/setting_items.dart';
import 'package:chatbox/features/setting/view/widgets/setting_profile_card.dart';
import '../../../core/utils/widgets/content_area.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Get.theme.brightness == Brightness.dark
            ? Colors.black
            : Colors.white));
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          17.spaceY,
          const SettingAppBar(),
          15.spaceY,
          ContentArea(
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingProfileCard(),
                  Divider(
                    color: kGreyColor,
                  ),
                  SettingItems(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
