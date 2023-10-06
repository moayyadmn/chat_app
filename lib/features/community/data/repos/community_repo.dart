import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CommunityRepo {
  StreamSubscription<QuerySnapshot<Object?>> fetchUsers(
      void Function(QuerySnapshot<Object?>)? onData);
}
