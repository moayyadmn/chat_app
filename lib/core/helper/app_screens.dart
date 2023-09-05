import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/features/community/view/community_view.dart';
import '../../features/friends/view/friends_view.dart';
import '../utils/constants.dart';
import '../../features/chat/view/chat_screen.dart';
import '../../features/login/view/login_screen.dart';
import '../../root_screen.dart';
import '../../features/setting/view/setting_screen.dart';

List<Widget> views = <Widget>[
  const FriendsView(),
  const CommunityView(),
  SettingScreen(),
];

List<BottomNavigationBarItem> itemsList = [
  BottomNavigationBarItem(
    label: "Friends",
    icon: SvgPicture.asset("assets/svg/Message.svg"),
  ),
  BottomNavigationBarItem(
    label: "Community",
    icon: SvgPicture.asset("assets/svg/Call.svg"),
  ),
  BottomNavigationBarItem(
    label: "Setting",
    icon: SvgPicture.asset("assets/svg/settings.svg"),
  ),
];

List<GetPage<dynamic>> routeList = [
  GetPage(name: kUserChatRoute, page: () => const RootScreen()),
  GetPage(name: kChatRoute, page: () => const ChatScreen()),
  GetPage(name: kLoginRoute, page: () => const LogInScreen()),
  GetPage(name: kLoginRoute, page: () => const FriendsView())
];
