import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholarchat_app/features/community/data/repos/community_repo.dart';

class CommunityRepoImpl extends CommunityRepo {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  StreamSubscription<QuerySnapshot<Object?>> fetchUsers(onData) {
    return users.snapshots().listen(onData);
  }
}
