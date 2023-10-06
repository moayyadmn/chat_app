import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/models/chat_list_card_model.dart';
import '../utils/constants.dart';

class HandleCommunityMembers {
  final CollectionReference chatRooms =
      FirebaseFirestore.instance.collection('chat_rooms');
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUid = currentUser!.uid;
    final String? currentUEmail = currentUser!.email;
    List<String> ids = [currentUid, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await chatRooms.doc(chatRoomId).collection('messages').add({
      'message': message,
      'sentAt': DateTime.now().toString(),
      'id': currentUEmail!,
    });
  }

}

class HandleFriendsMembers {
  FirebaseFirestore db = FirebaseFirestore.instance;

  goChat(ChatListCardModel friendsData) async {
    var fromMessages = await db
        .collection('messages')
        .where('fromUid', isEqualTo: currentUser!.uid)
        .where('toUid', isEqualTo: friendsData.toUid)
        .get();
    var toMessages = await db
        .collection('messages')
        .where('fromUid', isEqualTo: friendsData.fromUid)
        .where('toUid', isEqualTo: currentUser!.uid)
        .get();

    if (fromMessages.docs.isNotEmpty) {
      Get.toNamed(kChatRoute, parameters: {
        'docUid': fromMessages.docs.first.id,
        'toUid': friendsData.toUid,
        'toName': friendsData.toName,
        'toAvatar': friendsData.toAvatar,
      });
    }
    if (toMessages.docs.isNotEmpty) {
      Get.toNamed(kChatRoute, parameters: {
        'docUid': toMessages.docs.first.id,
        'toUid': friendsData.fromUid,
        'toName': friendsData.fromName,
        'toAvatar': friendsData.fromAvatar,
      });
    }
  }
}
