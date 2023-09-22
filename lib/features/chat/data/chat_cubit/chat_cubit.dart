import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  late ScrollController controller;
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  String? userName;
  String? photo;
  String? docUid;

  void setInformation(Map<String, String?> data) {
    controller = ScrollController();
    docUid = data['docUid'];
    userName = data['toName'];
    photo = data['toAvatar'];
  }

  void sendMessage(
      {required String message, required var email, required String docUid}) {
    messages.doc(docUid).collection('messagesList').add({
      'message': message,
      'sentAt': DateTime.now().toString(),
      'id': email,
    });
    messages.doc(docUid).update(
        {'lastMessage': message, 'lastTime': DateTime.now().toString()});
  }

  void getMessages() {
    messages
        .doc(docUid)
        .collection('messagesList')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .listen((event) {
      List<MessageModel> messageList = [];
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJason(doc));
      }
      emit(ChatSuccess(messageList: messageList));
    });
  }
}
