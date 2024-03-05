import 'package:scholarchat_app/core/utils/firebase_ref.dart';

class ChatRoom {
  // Get the id of the chat room
  static String getChatRoomId(String otherUserId) {
    final String currentUid = currentUser!.uid;
    List<String> ids = [currentUid, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return chatRoomId;
  }
}
