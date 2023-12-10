import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/features/calls/view/calls_screen.dart';
import 'package:scholarchat_app/features/chat/view/manager/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/chat/view/manager/send_button_bloc/send_button_bloc.dart';
import 'package:scholarchat_app/features/chat/view/manager/send_button_bloc/send_button_event.dart';
import 'package:scholarchat_app/features/community/view/community_view.dart';
import '../../features/friends/view/friends_view.dart';
import '../utils/constants.dart';
import '../../features/chat/view/chat_screen.dart';
import '../../features/login/view/login_screen.dart';
import '../../root_screen.dart';
import '../../features/setting/view/setting_screen.dart';

List<Widget> views = <Widget>[
  const FriendsView(),
  const CallsScreen(),
  const CommunityView(),
  const SettingScreen(),
];

List<BottomNavigationBarItem> itemsList = [
  const BottomNavigationBarItem(
    label: "Friends",
    icon: Icon(Icons.chat_rounded),
  ),
  const BottomNavigationBarItem(
    label: "Calls",
    icon: Icon(
      Icons.call,
    ),
  ),
  const BottomNavigationBarItem(
    label: "Community",
    icon: Icon(
      Icons.person,
    ),
  ),
  const BottomNavigationBarItem(
    label: "Setting",
    icon: Icon(
      Icons.settings,
    ),
  ),
];

List<GetPage<dynamic>> routeList = [
  GetPage(name: kUserChatRoute, page: () => const RootScreen()),
  GetPage(name: kLoginRoute, page: () => const LogInScreen()),
  GetPage(
    name: kChatRoute,
    page: () => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatCubit()..setInformation(Get.parameters)..getMessages(),
        ),
        BlocProvider(
            create: (context) => SendButtonBloc()..add(SendButtonEvent())),
      ],
      child: const ChatScreen(),
    ),
  ),
];

Widget isLogged() {
  if (currentUser == null) {
    return const LogInScreen();
  } else {
    return const RootScreen();
  }
}
