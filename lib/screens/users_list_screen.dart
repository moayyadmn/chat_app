// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/models/user_data_model.dart';
import '../widgets/user_card_widget.dart';
import 'setting_screen.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final currentUid = FirebaseAuth.instance.currentUser!.uid;
  ScrollController controller = ScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kMainColor,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
              label: "chat",
              icon: Icon(Icons.chat),
            ),
            BottomNavigationBarItem(
              label: "setting",
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Chaty'),
        ),
        body: selectedIndex == 0
            ? StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('users').snapshots(),
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
              )
            : SettingScreen());
  }
}
