import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

abstract class FriendsRepo {
  StreamSubscription<QuerySnapshot<Object?>> fetchFriends(
      void Function(QuerySnapshot<Object?>)? onData);
}
