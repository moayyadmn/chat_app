import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/features/community/view/community_view.dart';
import '../../features/friends/view/friends_view.dart';
import '../utils/constants.dart';
import '../../features/chat/view/chat_screen.dart';
import '../../features/login/view/login_screen.dart';
import '../../screens/root_screen.dart';
import '../../screens/setting_screen.dart';

List<Widget> views = <Widget>[
  const FriendsView(),
  const CommunityView(),
  SettingScreen(),
];

List<BottomNavigationBarItem> itemsList = [
  const BottomNavigationBarItem(
    label: "Friends",
    icon: Icon(Icons.person),
  ),
  const BottomNavigationBarItem(
    label: "Community",
    icon: Icon(Icons.people_alt),
  ),
  const BottomNavigationBarItem(
    label: "Setting",
    icon: Icon(Icons.settings),
  ),
];

List<GetPage<dynamic>> routeList = [
  GetPage(name: kUserChatRoute, page: () => const RootScreen()),
  GetPage(name: kChatRoute, page: () => const ChatScreen()),
  GetPage(name: kLoginRoute, page: () => const LogInScreen()),
  GetPage(name: kLoginRoute, page: () => const FriendsView())
];
