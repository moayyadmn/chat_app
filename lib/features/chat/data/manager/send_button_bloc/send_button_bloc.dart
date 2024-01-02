import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_event.dart';
import 'package:scholarchat_app/features/chat/data/manager/send_button_bloc/send_button_state.dart';

class SendButtonBloc extends Bloc<SendButtonEvent, SendButtonState> {
  SendButtonBloc() : super(SendButtonState(false)) {
    on<SendButtonEvent>((event, emit) {
      emit(SendButtonState(state.isSend));
    });
  }
}
