import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/models/user_card_model.dart';
import 'user_chat_screen_state.dart';

class UserChatScreenCubit extends Cubit<UserChatScreenState> {
  UserChatScreenCubit() : super(UserChatScreenInitial());
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  List<UserCardModel> usersList = [];
  void getUsers() {
    users.snapshots().listen((event) {
      for (var doc in event.docs) {
        usersList.add(UserCardModel.formJason(doc));
      }
      
      emit(UserChatScreenSuccess());
    });
  }
}
