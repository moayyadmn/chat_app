import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
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

  void getMessages(String docUid) {
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
