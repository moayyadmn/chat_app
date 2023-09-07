import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/helper/sized_box.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/friends/view/widgets/chat_card_widget.dart';
import 'package:scholarchat_app/features/friends/view/widgets/custom_home_app_bar.dart';
import '../../../core/models/chat_list_card_model.dart';
import '../../../core/widgets/content_area.dart';
import 'widgets/status_avatar.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUid = FirebaseAuth.instance.currentUser!.uid;
    final db =
        FirebaseFirestore.instance.collection('messages').where(Filter.or(
            Filter(
              'fromUid',
              isEqualTo: currentUid,
            ),
            Filter('toUid', isEqualTo: currentUid)));

    return Scaffold(
      backgroundColor: customScaffoldColor(),
      body: SafeArea(
        child: Column(
          children: [
            10.spaceY,
            const CustomHomeAppBar(),
            15.spaceY,
            const StatusAvatar(),
            30.spaceY,
            Expanded(
              child: ContentArea(
                child: Column(
                  children: [
                    10.spaceY,
                    Container(
                      height: 3,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6E6E6),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: db.snapshots(),
                        builder: (context, snapshot) {
                          List<ChatListCardModel> msgList = [];
                          if (snapshot.hasData) {
                            for (var doc in snapshot.data!.docs) {
                              msgList.add(
                                ChatListCardModel.fromDocument(doc),
                              );
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
                            return const Center(
                              child: Text('no Data'),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
