import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xff645ce6),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(photo!),
            ),
            const SizedBox(
              width: 13,
            ),
            Text(
              userName!,
              style: const TextStyle(
                  fontFamily: 'Default',
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
        ],
      ),
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
                    physics: const BouncingScrollPhysics(),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(message: data, email: email, docUid: docUid!);
                controller.clear();
                _controller.jumpTo(
                  0,
                );
              },
              cursorColor: kMainColor,
              decoration: InputDecoration(
                hintText: 'Enter message',
                suffixIcon: IconButton(
                  onPressed: () {
                    BlocProvider.of<ChatCubit>(context).sendMessage(
                        message: controller.text,
                        email: email,
                        docUid: docUid!);
                    controller.clear();
                    _controller.jumpTo(
                      0,
                    );
                  },
                  icon: const Icon(Icons.send),
                  color: kMainColor,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kMainColor, width: 4),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: kMainColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
