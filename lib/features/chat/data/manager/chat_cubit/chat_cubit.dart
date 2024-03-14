import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbox/core/helper/chat_room.dart';
import 'package:chatbox/core/utils/firebase_ref.dart';
import 'package:chatbox/features/chat/data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  late ScrollController scrollController;
  final String? currentUEmail = currentUser!.email;

  static ChatCubit get(context) => BlocProvider.of(context);

  //Send text message
  Future<void> sendMessage(String otherUserId, String message) async {
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    String randomId = ChatRoom.generateId();
    MessageModel messageModel = MessageModel(
      randomId,
      message,
      'text',
      currentUEmail!,
      DateTime.now().toString(),
    );
    await messagesRf(chatRoomId).doc(randomId).set(messageModel.toJson());
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
