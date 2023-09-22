import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/models/chat_list_card_model.dart';
import '../utils/constants.dart';
import '../models/user_data_model.dart';

class HandleCommunityMembers {
  FirebaseFirestore db = FirebaseFirestore.instance;

  goChat(UserDataModel friendsData) async {
    var fromMessage = await db
        .collection('messages')
        .where('fromUid', isEqualTo: currentUser!.uid)
        .where('toUid', isEqualTo: friendsData.id)
        .get();

    var toMessage = await db
        .collection('messages')
        .where('fromUid', isEqualTo: friendsData.id)
        .where('toUid', isEqualTo: currentUser!.uid)
        .get();

    if (fromMessage.docs.isEmpty && toMessage.docs.isEmpty) {
      Map<String, dynamic> msgData = {
        'fromUid': currentUser!.uid,
        'toUid': friendsData.id,
        'fromName': currentUser!.displayName!,
        'toName': friendsData.userName,
        'fromAvatar': currentUser!.photoURL!,
        'toAvatar': friendsData.photoUrl,
        'lastMessage': '',
        'lastTime': DateTime.now().toString()
      };
      db.collection('messages').add(msgData).then((value) => {
            Get.toNamed(kChatRoute, parameters: {
              'docUid': value.id,
              'toUid': friendsData.id,
              'toName': friendsData.userName,
              'toAvatar': friendsData.photoUrl,
            })
          });
    } else {
      if (fromMessage.docs.isNotEmpty) {
        Get.toNamed(kChatRoute, parameters: {
          'docUid': fromMessage.docs.first.id,
          'toUid': friendsData.id,
          'toName': friendsData.userName,
          'toAvatar': friendsData.photoUrl,
        });
      }
      if (toMessage.docs.isNotEmpty) {
        Get.toNamed(kChatRoute, parameters: {
          'docUid': toMessage.docs.first.id,
          'toUid': friendsData.id,
          'toName': friendsData.userName,
          'toAvatar': friendsData.photoUrl,
        });
      }
    }
  }
}

class HandleFriendsMembers {
  FirebaseFirestore db = FirebaseFirestore.instance;

  goChat(ChatListCardModel friendsData) async {
    var messages = await db
        .collection('messages')
        .where('fromUid', isEqualTo: friendsData.fromUid)
        .where('toUid', isEqualTo: friendsData.toUid)
        .get();

    if (messages.docs.isNotEmpty) {
      Get.toNamed(kChatRoute, parameters: {
        'docUid': messages.docs.first.id,
        'toUid': friendsData.toUid,
        'toName': friendsData.toName,
        'toAvatar': friendsData.fromAvatar,
      });
    }
  }
}
