import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/models/other_user_model.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_app_bar.dart';
import 'package:scholarchat_app/features/chat/view/widgets/custom_box_message.dart';
import '../data/manager/chat_cubit/chat_cubit.dart';
import '../data/manager/chat_cubit/chat_state.dart';
import 'widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  late OtherUserModel otherUserModel;
  late String email;
  @override
  void initState() {
    otherUserModel = Get.arguments;
    email = currentUser!.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appBar(context, otherUserModel.otherUserAvatar,
          otherUserModel.otherUserName, otherUserModel.otherUserId),
      body: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
        Widget chatWidget() {
          if (state is ChatSuccess) {
            if (state.messageList.isNotEmpty) {
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  reverse: true,
                  controller: scrollController,
                  itemCount: state.messageList.length,
                  itemBuilder: (context, index) {
                    return state.messageList[index].email == email
                        ? ChatBubbleWidget(
                            message: state.messageList[index],
                          )
                        : ChatBubbleWidgetForFriend(
                            message: state.messageList[index],
                          );
                  });
            } else {
              return const Center(
                child: Text("you don`t have messages"),
              );
            }
          } else {
            return const Center(
              child: Text("sorry, please try again at a different time"),
            );
          }
        }

        return Column(
          children: [
            Expanded(
              child: chatWidget(),
            ),
            CustomBoxMessage(
              otherUid: otherUserModel.otherUserId,
              scrollController: scrollController,
            ),
          ],
        );
      }),
    );
  }
}
