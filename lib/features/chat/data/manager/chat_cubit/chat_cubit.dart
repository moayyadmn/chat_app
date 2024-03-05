import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/helper/chat_room.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  late ScrollController scrollController;
  final String? currentUEmail = currentUser!.email;

  //Send text message
  Future<void> sendMessage(String otherUserId, String message) async {
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    await messagesRf(chatRoomId).add({
      'message': message,
      'type': 'text',
      'sentAt': DateTime.now().toString(),
      'id': currentUEmail!,
    });
    await chatRoomsRF.doc(chatRoomId).update({
      'lastMessage': message,
      'lastTime': DateTime.now().toString(),
    });
  }

  //Get messages
  void getMessages(String otherUserId) {
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    messagesRf(chatRoomId)
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
