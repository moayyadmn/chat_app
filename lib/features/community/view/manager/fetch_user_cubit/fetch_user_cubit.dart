import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/features/community/data/models/user_data_model.dart';
import 'package:scholarchat_app/features/community/data/repos/community_repo.dart';
import 'fetch_user_state.dart';

class FetchUserCubit extends Cubit<FetchUserState> {
  FetchUserCubit(this.communityRepo) : super(FetchUserInitial());
  final CommunityRepo communityRepo;
  void fetchUsers() {
    emit(FetchUserLoading());
    communityRepo.fetchUsers((event) {
      List<UserDataModel> dataList = [];
      for (var user in event.docs) {
        dataList.add(UserDataModel.fromDocument(user));
      }
      emit(FetchUserSuccess(userDataList: dataList));
    });
  }
}
