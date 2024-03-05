import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';
import 'package:scholarchat_app/features/community/data/models/user_data_model.dart';

class GoChat {
  FirebaseFirestore db = FirebaseFirestore.instance;

  goChat(UserDataModel friendsData) async {
    final String currentUid = currentUser!.uid;
    List<String> ids = [currentUid, friendsData.id];
    ids.sort();
    String chatRoomId = ids.join("_");
    var fromMessage = await db
        .collection('chat_rooms')
        .where('fromUid', isEqualTo: currentUser!.uid)
        .where('toUid', isEqualTo: friendsData.id)
        .get();

    var toMessage = await db
        .collection('chat_rooms')
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
      db.collection('chat_rooms').doc(chatRoomId).set(msgData);
    }
  }
}
