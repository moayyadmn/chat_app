import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/models/chat_list_card_model.dart';
import 'package:scholarchat_app/core/utils/constants.dart';

@immutable
class HandleOtherUser {
  final ChatListCardModel cardModel;

  const HandleOtherUser({required this.cardModel});
  String getImage() {
    if (cardModel.fromAvatar == currentUser!.photoURL) {
      return cardModel.toAvatar;
    } else {
      return cardModel.fromAvatar;
    }
  }

  String getName() {
    if (cardModel.fromName == currentUser!.displayName) {
      return cardModel.toName;
    } else {
      return cardModel.fromName;
    }
  }

  String getId() {
    if (cardModel.fromUid == currentUser!.uid) {
      return cardModel.toUid;
    } else {
      return cardModel.fromUid;
    }
  }
}
