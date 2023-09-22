import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_app_bar.dart';
import 'package:scholarchat_app/features/chat/view/widgets/custom_box_message.dart';
import '../data/chat_cubit/chat_cubit.dart';
import '../data/chat_cubit/chat_state.dart';
import 'widgets/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = currentUser!.email;
    var data = context.read<ChatCubit>();

    return Scaffold(
      backgroundColor: isDarkMode ? kBlackColor : kWhiteColor,
      appBar: appBar(context, data.photo!, data.userName!),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatSuccess) {
                  return ListView.builder(
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
                      });
                } else {
                  return const Text("you don`t have messages");
                }
              },
            ),
          ),
          CustomBoxMessage(
            email: email,
            docUid: data.docUid,
            controller2: data.controller,
          ),
        ],
      ),
    );
  }
}
