import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbox/core/colored/print_colored_text_in_flutter.dart';
import 'package:chatbox/core/colored/print_manager.dart';
import 'package:chatbox/core/helper/chat_room.dart';
import 'package:chatbox/core/utils/firebase_ref.dart';
import 'package:chatbox/features/chat/data/manager/select_in_list/select_in_list_event.dart';
import 'package:chatbox/features/chat/data/manager/select_in_list/select_in_list_state.dart';
import 'package:chatbox/features/chat/data/models/message_model.dart';

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

  Future<String> getLastMessage(String otherUserId) async {
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    var data = await chatRoomsRF.doc(chatRoomId).get();
    String lastMessage = data.get('lastMessage');
    return lastMessage;
  }

  //to delete selected messages from database
  void deleteMessages(
      List<MessageModel> messageList, String otherUserId) async {
    add(StartDeletingMode());
    String chatRoomId = ChatRoom.getChatRoomId(otherUserId);
    String lastMessage = await getLastMessage(otherUserId);
    firestore.runTransaction((transaction) async {
      for (MessageModel message in messageList) {
        var docId = await messagesRf(chatRoomId).doc(message.id);
        if (message.type == 'photo') {
          await storageRef.child('chat_images/${message.id}').delete();
        }
        if (lastMessage == message.message) {
          await chatRoomsRF.doc(chatRoomId).update({
            'lastMessage': 'Deleted Message',
          });
        }
        transaction.delete(docId);
      }
    }).then((value) {
      add(EndDeletingMode());
      add(EndSelectMode());
      selectedMessageList.clear();
      printColoredText('Documents deleted successfully', ConsoleColor.green);
    }).catchError((error) {
      add(EndDeletingMode());
      add(EndSelectMode());
      printColoredText('Error deleting documents: $error', ConsoleColor.red);
    });
  }
}
