import 'package:scholarchat_app/features/chat/data/models/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
  List<MessageModel> messageList = [];
  ChatSuccess({required this.messageList});
}

class ChatUploadImage extends ChatState {
  double progress;
  ChatUploadImage({required this.progress});
}
