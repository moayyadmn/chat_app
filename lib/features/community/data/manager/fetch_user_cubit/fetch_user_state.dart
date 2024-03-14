import 'package:chatbox/features/community/data/models/user_data_model.dart';

abstract class FetchUserState {}

class FetchUserInitial extends FetchUserState {}

class FetchUserLoading extends FetchUserState {}

class FetchUserSuccess extends FetchUserState {
  final List<UserDataModel> userDataList;

  FetchUserSuccess({required this.userDataList});
}
