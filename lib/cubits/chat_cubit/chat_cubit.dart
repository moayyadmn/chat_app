import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/models/message.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final CollectionReference messages = FirebaseFirestore.instance
      .collection('messages')
      .doc('fJRXrrSCWOSduVn6CKjp')
      .collection('messagesList');
  final String user = FirebaseAuth.instance.currentUser!.uid;
  void sendMessage({required String message, required var email}) {
    messages.add({
      'message': message,
      'sentAt': DateTime.now(),
      'id': email,
    });
  }

  void getMessages() {
    messages.orderBy('sentAt', descending: true).snapshots().listen((event) {
      List<Message> messageList = [];
      for (var doc in event.docs) {
        messageList.add(Message.fromJason(doc));
      }
      emit(ChatSuccess(messageList: messageList));
    });
  }
}
