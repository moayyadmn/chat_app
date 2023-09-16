import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../utils/constants.dart';
import '../models/user_data_model.dart';

class HandleChatMembers {
  FirebaseFirestore db = FirebaseFirestore.instance;

  goChat(UserDataModel toUserData) async {
    var fromMessage = await db
        .collection('messages')
        .where('fromUid', isEqualTo: currentUser!.uid)
        .where('toUid', isEqualTo: toUserData.id)
        .get();

    var toMessage = await db
        .collection('messages')
        .where('fromUid', isEqualTo: toUserData.id)
        .where('toUid', isEqualTo: currentUser!.uid)
        .get();

    if (fromMessage.docs.isEmpty && toMessage.docs.isEmpty) {
      Map<String, dynamic> msgData = {
        'fromUid': currentUser!.uid,
        'toUid': toUserData.id,
        'fromName': currentUser!.displayName!,
        'toName': toUserData.userName,
        'fromAvatar': currentUser!.photoURL!,
        'toAvatar': toUserData.photoUrl,
        'lastMessage': '',
        'lastTime': DateTime.now().toString()
      };
      db.collection('messages').add(msgData).then((value) => {
            Get.toNamed(kChatRoute, parameters: {
              'docUid': value.id,
              'toUid': toUserData.id,
              'toName': toUserData.userName,
              'toAvatar': toUserData.photoUrl,
            })
          });
    } else {
      if (fromMessage.docs.isNotEmpty) {
        Get.toNamed(kChatRoute, parameters: {
          'docUid': fromMessage.docs.first.id,
          'toUid': toUserData.id,
          'toName': toUserData.userName,
          'toAvatar': toUserData.photoUrl,
        });
      }
      if (toMessage.docs.isNotEmpty) {
        Get.toNamed(kChatRoute, parameters: {
          'docUid': toMessage.docs.first.id,
          'toUid': toUserData.id,
          'toName': toUserData.userName,
          'toAvatar': toUserData.photoUrl,
        });
      }
    }
  }
}
