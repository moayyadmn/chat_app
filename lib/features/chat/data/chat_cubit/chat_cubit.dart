import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/message.dart';
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
      List<Message> messageList = [];
      for (var doc in event.docs) {
        messageList.add(Message.fromJason(doc));
      }
      emit(ChatSuccess(messageList: messageList));
    });
  }
}
