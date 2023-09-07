import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/helper/sized_box.dart';
import 'package:scholarchat_app/core/widgets/content_area.dart';
import 'package:scholarchat_app/features/setting/view/widgets/setting_app_bar.dart';
import 'package:scholarchat_app/features/setting/view/widgets/setting_items.dart';
import 'package:scholarchat_app/features/setting/view/widgets/setting_profile_card.dart';
import '../../../core/utils/theme/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customScaffoldColor(),
      body: Column(
        children: [
          17.spaceY,
          const SettingAppBar(),
          15.spaceY,
          Expanded(
            child: ContentArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  10.spaceY,
                  Container(
                    height: 3,
                    width: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xffE6E6E6),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SettingProfileCard(),
                  const Divider(),
                  const Expanded(
                    child: SettingItems(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
