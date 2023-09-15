import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/models/user_data_model.dart';
import 'fetch_user_state.dart';

class FetchUserCubit extends Cubit<FetchUserState> {
  FetchUserCubit() : super(FetchUserInitial());
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void fetchUsers() {
    emit(FetchUserLoading());
    users.snapshots().listen((event) {
      List<UserDataModel> dataList = [];
      for (var user in event.docs) {
        dataList.add(UserDataModel.fromDocument(user));
      }
      emit(FetchUserSuccess(userDataList: dataList));
    });
  }
}
