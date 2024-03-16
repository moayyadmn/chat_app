import 'package:chatbox/features/friends/functions/handle_other_user.dart';
import 'package:chatbox/features/status/data/manager/cubit/status_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbox/core/utils/firebase_ref.dart';
import 'package:chatbox/features/friends/data/models/chat_list_card_model.dart';
import 'package:chatbox/features/friends/data/manager/fetch_friends_cubit/fetch_friends_state.dart';
import 'package:get/get.dart';

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
    db.orderBy("lastTime", descending: true).snapshots().listen((event) async {
      List<ChatListCardModel> dataList = [];

      for (var user in event.docs) {
        dataList.add(ChatListCardModel.fromDocument(user));
        await StatusCubit.get(Get.context).fetchStatus(
            HandleOtherUser(ChatListCardModel.fromDocument(user)).getId());
      }

      emit(FetchFriendsSuccess(userDataList: dataList));
    });
  }
}
