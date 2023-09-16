import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/helper/extensions.dart';
import 'package:scholarchat_app/features/setting/view/widgets/setting_app_bar.dart';
import 'package:scholarchat_app/features/setting/view/widgets/setting_items.dart';
import 'package:scholarchat_app/features/setting/view/widgets/setting_profile_card.dart';
import '../../../core/utils/theme/colors.dart';
import '../../../core/utils/widgets/content_area.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customScaffoldColor,
      body: Column(
        children: [
          17.spaceY,
          const SettingAppBar(),
          15.spaceY,
          const ContentArea(
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SettingProfileCard(),
                  Divider(),
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
