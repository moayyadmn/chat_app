import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/models/chat_list_card_model.dart';
import 'package:scholarchat_app/widgets/chat_card_widget.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
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
