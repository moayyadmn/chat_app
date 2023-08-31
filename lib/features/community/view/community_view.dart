import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../core/models/user_data_model.dart';
import 'widgets/user_card_widget.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder(
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
    );
  }
}
