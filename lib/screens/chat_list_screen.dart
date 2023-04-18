import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widgets/chat_card_widget.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> msgList = [];
  final currentUid = FirebaseAuth.instance.currentUser!.uid;
  getUserDocument() async {
    var fromUid = await FirebaseFirestore.instance
        .collection('messages')
        .where('fromUid', isEqualTo: currentUid)
        .get();
    var toUid = await FirebaseFirestore.instance
        .collection('messages')
        .where('toUid', isEqualTo: currentUid)
        .get();
    msgList.clear();
    if (fromUid.docs.isNotEmpty) {
      msgList.addAll(fromUid.docs);
    }
    if (toUid.docs.isNotEmpty) {
      msgList.addAll(toUid.docs);
    }
  }

  //smart refrech
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  void onRefresh() async {
    await getUserDocument().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
      setState(() {});
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() async {
    await getUserDocument().then((_) {
      refreshController.loadComplete();
    }).catchError((_) {
      refreshController.loadFailed();
    });
  }

  //end

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: onRefresh,
      onLoading: onLoading,
      header: const WaterDropHeader(),
      child: ListView.builder(
        itemCount: msgList.length,
        itemBuilder: (context, index) {
          return ChatCardWidget(
            messageList: msgList[index],
          );
        },
      ),
    );
  }
}