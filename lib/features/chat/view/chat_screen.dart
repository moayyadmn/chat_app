import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_app_bar.dart';
import '../../../core/models/message.dart';
import '../data/chat_cubit/chat_cubit.dart';
import '../data/chat_cubit/chat_state.dart';
import 'widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //

  bool isSend = false;

  //
  List<Message> messageList = [];

  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  final _controller = ScrollController();

  final TextEditingController controller = TextEditingController();
  String? userName;
  String? photo;
  String? docUid;
  @override
  void initState() {
    var data = Get.parameters;
    docUid = data['docUid'];
    userName = data['toName'];
    photo = data['toAvatar'];
    BlocProvider.of<ChatCubit>(context).getMessages(docUid!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? email = FirebaseAuth.instance.currentUser!.email;
    return Scaffold(
      backgroundColor: isDarkMode ? kBlackColor : kWhiteColor,
      appBar: appBar(context, photo!, userName!),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatCubit, ChatState>(
              listener: (context, state) {
                if (state is ChatSuccess) {
                  messageList = state.messageList;
                }
              },
              builder: (context, state) {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    reverse: true,
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].email == email
                          ? ChatBubbleWidget(
                              message: messageList[index],
                            )
                          : ChatBubbleWidgetForFriend(
                              message: messageList[index],
                            );
                    });
              },
            ),
          ),
          SizedBox(
            height: 90,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/svg/clip_chat.svg'),
                ),
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: kBlackColor, fontSize: 16),
                    onChanged: (value) {
                      value != ""
                          ? setState(() {
                              isSend = true;
                            })
                          : setState(() {
                              isSend = false;
                            });
                    },
                    controller: controller,
                    onSubmitted: (data) {
                      BlocProvider.of<ChatCubit>(context).sendMessage(
                          message: data, email: email, docUid: docUid!);
                      controller.clear();
                      _controller.jumpTo(
                        0,
                      );
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      fillColor: const Color(0xFFF3F6F6),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF3F6F6)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF3F6F6)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF3F6F6)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: 'Write your message',
                      hintStyle:
                          const TextStyle(color: kGreyColor, fontSize: 12),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svg/sticker.svg'),
                      ),
                    ),
                  ),
                ),
                isSend
                    ? IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/svg/send_icon.svg'),
                      )
                    : Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/camera.svg',
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/svg/microphone.svg'),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
