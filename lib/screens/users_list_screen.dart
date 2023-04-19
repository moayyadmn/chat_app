import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/models/user_data_model.dart';
import 'package:scholarchat_app/screens/setting_screen.dart';
import '../widgets/user_card_widget.dart';
import 'chat_list_screen.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final currentUid = FirebaseAuth.instance.currentUser!.uid;
  ScrollController controller = ScrollController();
  int selectedIndex = 0;
  PageController pageController = PageController();
  onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chaty'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          selectedIndex = value;
          setState(() {
            selectedIndex = value;
          });
        },
        children: [
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kMainColor,
        onTap: onTapped,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            label: "chat",
            icon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            label: "contact",
            icon: Icon(Icons.contact_page_rounded),
          ),
          BottomNavigationBarItem(
            label: "setting",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
