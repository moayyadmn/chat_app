import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  late ScrollController scrollController;
  final CollectionReference chatRooms =
      FirebaseFirestore.instance.collection('chat_rooms');

  String? userName;
  String? photo;
  String? otherUserId;

  void setInformation(Map<String, String?> data) {
    scrollController = ScrollController();
    otherUserId = data['otherUserId'];
    userName = data['toName'];
    photo = data['toAvatar'];
  }

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUid = currentUser!.uid;
    final String? currentUEmail = currentUser!.email;
    List<String> ids = [currentUid, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await chatRooms.doc(chatRoomId).collection('messages').add({
      'message': message,
      'sentAt': DateTime.now().toString(),
      'id': currentUEmail!,
    });
    await chatRooms.doc(chatRoomId).update({
      'lastMessage': message,
      'lastTime': DateTime.now().toString(),
    });
  }

  void getMessages() {
    List<String> ids = [currentUser!.uid, otherUserId!];
    ids.sort();
    String chatRoomId = ids.join("_");
    chatRooms
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .listen((event) {
      List<MessageModel> messagesList = [];
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJason(doc));
      }
      emit(ChatSuccess(messageList: messagesList));
    });
  }
}
