import 'package:chatbox/features/friends/data/models/chat_list_card_model.dart';

abstract class FetchFriendsSate {}

class FetchFriendsInitial extends FetchFriendsSate {}

class FetchFriendsLoading extends FetchFriendsSate {}

class FetchFriendsSuccess extends FetchFriendsSate {
  final List<ChatListCardModel> userDataList;
  FetchFriendsSuccess({required this.userDataList});
}
