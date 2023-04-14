// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/models/user_data_model.dart';
import '../widgets/user_card_widget.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final currentUid = FirebaseAuth.instance.currentUser!.uid;
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chaty'),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await GoogleSignIn().disconnect();
                  await GoogleSignIn().signOut();
                  Get.offAndToNamed(kLoginRoute);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: StreamBuilder(
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
        ));
  }
}
