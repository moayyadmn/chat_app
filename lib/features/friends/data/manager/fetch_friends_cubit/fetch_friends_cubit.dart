import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/models/chat_list_card_model.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/features/friends/data/manager/fetch_friends_cubit/fetch_friends_state.dart';

class FetchFriendsCubit extends Cubit<FetchFriendsSate> {
  FetchFriendsCubit() : super(FetchFriendsInitial());
  final db =
      FirebaseFirestore.instance.collection('chat_rooms').where(Filter.or(
          Filter(
            'fromUid',
            isEqualTo: currentUser!.uid,
          ),
          Filter('toUid', isEqualTo: currentUser!.uid)));

  void fetchUsers() {
    emit(FetchFriendsLoading());
    db.orderBy("lastTime", descending: true).snapshots().listen((event) {
      List<ChatListCardModel> dataList = [];
      for (var user in event.docs) {
        dataList.add(ChatListCardModel.fromDocument(user));
      }
      emit(FetchFriendsSuccess(userDataList: dataList));
    });
  }
}
