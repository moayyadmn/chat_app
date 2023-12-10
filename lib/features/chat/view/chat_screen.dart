import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_app_bar.dart';
import 'package:scholarchat_app/features/chat/view/widgets/custom_box_message.dart';
import 'manager/chat_cubit/chat_cubit.dart';
import 'manager/chat_cubit/chat_state.dart';
import 'widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = currentUser!.email;
    var data = BlocProvider.of<ChatCubit>(context);
    return Scaffold(
      backgroundColor: isDarkMode ? kBlackColor : kWhiteColor,
      appBar: appBar(context, data.photo!, data.userName!),
      body: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
        return Column(
          children: [
            Expanded(
                child: state is ChatSuccess
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        reverse: true,
                        controller: data.controller,
                        itemCount: state.messageList.length,
                        itemBuilder: (context, index) {
                          return state.messageList[index].email == email
                              ? ChatBubbleWidget(
                                  message: state.messageList[index],
                                )
                              : ChatBubbleWidgetForFriend(
                                  message: state.messageList[index],
                                );
                        })
                    : const Center(child: Text("you don`t have messages"))),
            CustomBoxMessage(
              otherUid: data.otherUserId!,
              controller2: data.controller,
            ),
          ],
        );
      }),
    );
  }
}
