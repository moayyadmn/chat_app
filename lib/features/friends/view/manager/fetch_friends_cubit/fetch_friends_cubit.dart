import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/models/chat_list_card_model.dart';
import 'package:scholarchat_app/features/friends/data/repo/friends_repo.dart';
import 'package:scholarchat_app/features/friends/view/manager/fetch_friends_cubit/fetch_friends_state.dart';

class FetchFriendsCubit extends Cubit<FetchFriendsSate> {
  final FriendsRepo friendsRepo;
  FetchFriendsCubit(this.friendsRepo) : super(FetchFriendsInitial());
  void fetchUsers() {
    emit(FetchFriendsLoading());
    friendsRepo.fetchFriends((event) {
      List<ChatListCardModel> dataList = [];
      for (var user in event.docs) {
        dataList.add(ChatListCardModel.fromDocument(user));
      }
      emit(FetchFriendsSuccess(userDataList: dataList));
    });
  }
}
