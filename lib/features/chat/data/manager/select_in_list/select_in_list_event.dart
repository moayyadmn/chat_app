import 'package:scholarchat_app/features/chat/data/models/message_model.dart';

abstract class SelectInListEvent {}

class StartSelectMode extends SelectInListEvent {
  final MessageModel messageModel;
  StartSelectMode({required this.messageModel});
}

class EndSelectMode extends SelectInListEvent {}

class StartDeletingMode extends SelectInListEvent {}

class EndDeletingMode extends SelectInListEvent {}
