import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/screens/chat_list_screen.dart';
import '../../constants.dart';
import '../../models/user_data_model.dart';
import '../../screens/chat_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/root_screen.dart';
import '../../screens/setting_screen.dart';
import '../../widgets/user_card_widget.dart';

final currentUid = FirebaseAuth.instance.currentUser!.uid;
List<Widget> screens = <Widget>[
  const ChatListScreen(),
  StreamBuilder(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      List<UserDataModel> userDataList = [];
      if (snapshot.hasData) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var user = snapshot.data!.docs[index];
            if (user['id'] == currentUid) {
              return const SizedBox.shrink();
            } else {
              for (var doc in snapshot.data!.docs) {
                userDataList.add(UserDataModel.fromDocument(doc));
              }
              return UserCardWidget(user: userDataList[index]);
            }
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: kMainColor,
          ),
        );
      }
    },
  ),
  SettingScreen(),
];

List<BottomNavigationBarItem> itemsList = [
  const BottomNavigationBarItem(
    label: "chat",
    icon: Icon(Icons.chat),
  ),
  const BottomNavigationBarItem(
    label: "contact",
    icon: Icon(Icons.contact_page_rounded),
  ),
  const BottomNavigationBarItem(
    label: "setting",
    icon: Icon(Icons.settings),
  ),
];

List<GetPage<dynamic>> routeList = [
  GetPage(name: kUserChatRoute, page: () => const RootScreen()),
  GetPage(name: kChatRoute, page: () => const ChatScreen()),
  GetPage(name: kLoginRoute, page: () => const LogInScreen()),
  GetPage(name: kLoginRoute, page: () => const ChatListScreen())
];
