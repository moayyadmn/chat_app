import 'dart:math';

import 'package:chatbox/core/utils/firebase_ref.dart';

class ChatRoom {
  // Get the id of the chat room
  static String getChatRoomId(String otherUserId) {
    final String currentUid = currentUser!.uid;
    List<String> ids = [currentUid, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return chatRoomId;
  }

  static String generateId() {
    String randId = Random().nextInt(999999999).toString();
    return randId;
  }
}
