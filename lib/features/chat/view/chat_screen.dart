import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/models/other_user_model.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_event.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_app_bar.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_body.dart';
import 'package:scholarchat_app/features/chat/view/widgets/custom_box_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  late OtherUserModel otherUserModel;

  @override
  void initState() {
    otherUserModel = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          if (SelectInListBloc.get(context).selectedMessageList.isNotEmpty) {
            SelectInListBloc.get(context).selectedMessageList.clear();
            SelectInListBloc.get(context).add(EndSelectMode());
          } else {
            Get.back();
          }
        },
        child: Column(
          children: [
            CustomAppBar(
                photo: otherUserModel.otherUserAvatar,
                userName: otherUserModel.otherUserName,
                otherId: otherUserModel.otherUserId),
            ChatBody(scrollController: scrollController),
            CustomBoxMessage(
              otherUid: otherUserModel.otherUserId,
              scrollController: scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
