import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference chatRoomsRF = firestore.collection('chat_rooms');
CollectionReference userRf = firestore.collection('users');
CollectionReference messagesRf(String chatRoomId) =>
    chatRoomsRF.doc(chatRoomId).collection('messages');
//auth
User? currentUser = FirebaseAuth.instance.currentUser;
//firebase storage
final storageRef = FirebaseStorage.instance.ref();
