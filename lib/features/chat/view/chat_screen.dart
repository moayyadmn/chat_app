import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/data/send_button_bloc/send_button_bloc.dart';
import 'package:scholarchat_app/features/chat/data/send_button_bloc/send_button_event.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_app_bar.dart';
import 'package:scholarchat_app/features/chat/view/widgets/custom_box_message.dart';
import '../data/chat_cubit/chat_cubit.dart';
import '../data/chat_cubit/chat_state.dart';
import 'widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _controller = ScrollController();
  String? userName;
  String? photo;
  String? docUid;
  @override
  void initState() {
    Map<String, String?> data = Get.parameters;
    docUid = data['docUid'];
    userName = data['toName'];
    photo = data['toAvatar'];
    BlocProvider.of<ChatCubit>(context).getMessages(docUid!);
    BlocProvider.of<SendButtonBloc>(context).add(SendButtonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? email = currentUser!.email;
    return Scaffold(
      backgroundColor: isDarkMode ? kBlackColor : kWhiteColor,
      appBar: appBar(context, photo!, userName!),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatSuccess) {
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      reverse: true,
                      controller: _controller,
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
              email: email, docUid: docUid, controller2: _controller),
        ],
      ),
    );
  }
}
