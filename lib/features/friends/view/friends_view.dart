import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/features/friends/view/widgets/chat_card_widget.dart';

import '../../../core/models/chat_list_card_model.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({super.key});
  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> msgList = [];
  final currentUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final db =
        FirebaseFirestore.instance.collection('messages').where(Filter.or(
            Filter(
              'fromUid',
              isEqualTo: currentUid,
            ),
            Filter('toUid', isEqualTo: currentUid)));

    return StreamBuilder(
      stream: db.snapshots(),
      builder: (context, snapshot) {
        List<ChatListCardModel> msgList = [];
        if (snapshot.hasData) {
          for (var doc in snapshot.data!.docs) {
            msgList.add(ChatListCardModel.fromDocument(doc));
          }
          return ListView.builder(
            itemCount: msgList.length,
            itemBuilder: (context, index) {
              return ChatCardWidget(
                chatListCardModel: msgList[index],
              );
            },
          );
        } else {
          return const Center(child: Text('no Data'));
        }
      },
    );
  }
}
