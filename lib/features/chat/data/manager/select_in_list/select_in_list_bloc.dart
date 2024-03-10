import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_event.dart';
import 'package:scholarchat_app/features/chat/data/manager/select_in_list/select_in_list_state.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';

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
  }
}
