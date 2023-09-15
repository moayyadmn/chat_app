import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarchat_app/features/setting/view/widgets/setting_card.dart';

class SettingItems extends StatelessWidget {
  const SettingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingCard(
                leading: SvgPicture.asset("assets/svg/setting_key.svg"),
                title: "Account",
                subTitle: "Privacy, security, change number"),
            SettingCard(
                leading: SvgPicture.asset("assets/svg/setting_chat.svg"),
                title: "Chat",
                subTitle: "Chat history,theme,wallpapers"),
            SettingCard(
                leading:
                    SvgPicture.asset("assets/svg/setting_notification.svg"),
                title: "Notification",
                subTitle: "Messages, group and others"),
            SettingCard(
                leading: SvgPicture.asset("assets/svg/setting_help.svg"),
                title: "Help",
                subTitle: "Help center,contact us, privacy policy"),
            SettingCard(
                leading: SvgPicture.asset("assets/svg/setting_data.svg"),
                title: "Storage and data",
                subTitle: "Network usage, storage usage"),
            SettingCard(
                leading: SvgPicture.asset("assets/svg/setting_invited.svg"),
                title: "Invite a friend",
                subTitle: "Share the app with your friends"),
          ],
        ),
      ),
    );
  }
}
