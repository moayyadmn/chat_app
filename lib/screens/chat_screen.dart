import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message.dart';
import '../widgets/chat_buble_widget.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  final _controller = ScrollController();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('sentAt', descending: true).snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJason(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff645ce6),
                centerTitle: true,
                title: const Text(
                  'Chat',
                  style: TextStyle(
                      fontFamily: 'title', letterSpacing: 1, fontSize: 25),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
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
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          'message': data,
                          'sentAt': DateTime.now(),
                          'id': email,
                        });

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
                            messages.add({
                              'message': controller.text,
                              'sentAt': DateTime.now(),
                              'id': email,
                            });
                            controller.clear();
                            _controller.jumpTo(
                              0,
                            );
                          },
                          icon: const Icon(Icons.send),
                          color: const Color(0xff645ce6),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff645ce6), width: 4),
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
