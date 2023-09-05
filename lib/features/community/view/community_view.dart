import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/helper/sized_box.dart';
import 'package:scholarchat_app/core/widgets/content_area.dart';
import 'package:scholarchat_app/features/community/view/widgets/custom_app_bar.dart';
import '../../../core/utils/constants.dart';
import '../../../core/models/user_data_model.dart';
import '../../../core/utils/theme/colors.dart';
import 'widgets/user_card_widget.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: customScaffoldColor(),
      body: Column(
        children: [
          17.spaceY,
          const CustomAppBar2(),
          15.spaceY,
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
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
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
                                  userDataList
                                      .add(UserDataModel.fromDocument(doc));
                                }
                                return UserCardWidget(
                                    user: userDataList[index]);
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
