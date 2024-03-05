import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:scholarchat_app/features/friends/data/models/chat_list_card_model.dart';

class HandleOtherUser {
  final ChatListCardModel cardModel;

  const HandleOtherUser(this.cardModel);

  String getImage() {
    return cardModel.fromAvatar == currentUser?.photoURL
        ? cardModel.toAvatar
        : cardModel.fromAvatar;
  }

  String getName() {
    return cardModel.fromName == currentUser?.displayName
        ? cardModel.toName
        : cardModel.fromName;
  }

  String getId() {
    return cardModel.fromUid == currentUser?.uid
        ? cardModel.toUid
        : cardModel.fromUid;
  }
}
