import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/colored/print_colored_text_in_flutter.dart';
import 'package:scholarchat_app/core/colored/print_manager.dart';
import 'package:scholarchat_app/core/helper/chat_room.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_event.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_state.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';

// to handle the state of selection mode
class SelectInListBloc extends Bloc<SelectInListEvent, SelectInListState> {
  List<MessageModel> selectedMessageList = [];

  SelectInListBloc() : super(SelectInListInitial()) {
    on<StartSelectMode>((event, emit) {
      if (selectedMessageList.contains(event.messageModel)) {
        selectedMessageList.remove(event.messageModel);
      } else {
        selectedMessageList.add(event.messageModel);
      }
      emit(StartSelectState());
    });

    on<EndSelectMode>((event, emit) {
      emit(EndSelectState());
    });
    on<StartDeletingMode>((event, emit) {
      emit(StartDeleting());
    });
    on<EndDeletingMode>((event, emit) {
      emit(EndDeleting());
    });
  }

  static SelectInListBloc get(context) => BlocProvider.of(context);
  //to delete selected messages from database
  void deleteMessages(List<MessageModel> messageList, String otherUserId) {
    add(StartDeletingMode());
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    firestore.runTransaction((transaction) async {
      for (MessageModel message in messageList) {
        var docId = await messagesRf(chatRoomId).doc(message.id);
        if (message.type == 'photo') {
          await storageRef.child('chat_images/${message.id}').delete();
        }
        transaction.delete(docId);
      }
    }).then((value) {
      add(EndDeletingMode());
      printColoredText('Documents deleted successfully', ConsoleColor.green);
    }).catchError((error) {
      printColoredText('Error deleting documents: $error', ConsoleColor.red);
    });
  }
}
