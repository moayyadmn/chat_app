import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_root_event.dart';
import 'app_root_state.dart';

class AppRootBloc extends Bloc<AppRootEvent, AppRootState> {
  AppRootBloc() : super(AppRootState(index: 0)) {
    on<AppRootEvent>((event, emit) {
      emit(AppRootState(index: state.index));
    });
  }
}
