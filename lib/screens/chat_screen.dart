import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/screens/cubits/chat_cubit/chat_cubit.dart';
import '../models/message.dart';
import '../widgets/chat_buble_widget.dart';
import 'cubits/chat_cubit/chat_state.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  List<Message> messageList = [];
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final _controller = ScrollController();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff645ce6),
        centerTitle: true,
        title: const Text(
          'Chat',
          style: TextStyle(fontFamily: 'title', letterSpacing: 1, fontSize: 25),
        ),
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
                    reverse: true,
                    controller: _controller,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBubleWidget(
                              message: messageList[index],
                            )
                          : ChatBubleWidgetForFreind(
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
                    .sendMessage(message: data, email: email);
                controller.clear();
                _controller.jumpTo(
                  0,
                );
              },
              cursorColor: const Color(0xff645ce6),
              decoration: InputDecoration(
                hintText: 'Enter message',
                suffixIcon: IconButton(
                  onPressed: () {
                    BlocProvider.of<ChatCubit>(context)
                        .sendMessage(message: controller.text, email: email);
                    controller.clear();
                    _controller.jumpTo(
                      0,
                    );
                  },
                  icon: const Icon(Icons.send),
                  color: const Color(0xff645ce6),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xff645ce6), width: 4),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff645ce6),
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
