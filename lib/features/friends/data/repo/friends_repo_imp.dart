import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/features/friends/data/repo/friends_repo.dart';

class FriendsRepoImpl extends FriendsRepo {
  final db = FirebaseFirestore.instance.collection('chat_rooms').where(Filter.or(
      Filter(
        'fromUid',
        isEqualTo: currentUser!.uid,
      ),
      Filter('toUid', isEqualTo: currentUser!.uid)));
  @override
  StreamSubscription<QuerySnapshot<Object?>> fetchFriends(onData) {
    return db.orderBy("lastTime", descending: true).snapshots().listen(onData);
  }
}
