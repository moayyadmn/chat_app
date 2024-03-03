// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  late ScrollController scrollController;
  final CollectionReference chatRooms =
      FirebaseFirestore.instance.collection('chat_rooms');
  final String? currentUEmail = currentUser!.email;

  // Get the id of the chat room
  String getChatRoomId(String otherUserId) {
    final String currentUid = currentUser!.uid;
    List<String> ids = [currentUid, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return chatRoomId;
  }

  //Send text message
  Future<void> sendMessage(String otherUserId, String message) async {
    String chatRoomId = getChatRoomId(otherUserId);
    await chatRooms.doc(chatRoomId).collection('messages').add({
      'message': message,
      'type': 'text',
      'sentAt': DateTime.now().toString(),
      'id': currentUEmail!,
    });
    await chatRooms.doc(chatRoomId).update({
      'lastMessage': message,
      'lastTime': DateTime.now().toString(),
    });
  }

  //Send an Image
  Future<void> sendImage(String otherUserId, String docName) async {
    String chatRoomId = getChatRoomId(otherUserId);
    await chatRooms.doc(chatRoomId).collection('messages').doc(docName).set({
      'message': '',
      'type': 'photo',
      'sentAt': DateTime.now().toString(),
      'id': currentUEmail!,
    });
    await chatRooms.doc(chatRoomId).update({
      'lastMessage': 'photo',
      'lastTime': DateTime.now().toString(),
    });
  }

  Future<String> uploadImageToFirebase(
      File imageFile, String otherUserId) async {
    String chatRoomId = getChatRoomId(otherUserId);
    try {
      Random random = Random();
      String randomNumber = '${random.nextInt(1000)}';
      String fileName = '$randomNumber${path.basename(imageFile.path)}';
      Reference storageReference = storageRef.child('chat_images/$fileName');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      await sendImage(otherUserId, fileName);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String imageUrl = await taskSnapshot.ref.getDownloadURL().then((message) {
        chatRooms.doc(chatRoomId).collection('messages').doc(fileName).update({
          'message': message,
        });
        return message;
      });
      return imageUrl;
    } catch (error) {
      // Handle the error here, e.g. log it or display an error message
      return 'Error uploading image: $error';
    }
  }

  //Get messages
  void getMessages(String otherUserId) {
    String chatRoomId = getChatRoomId(otherUserId);
    chatRooms
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('sentAt', descending: true)
        .snapshots()
        .listen((event) {
      List<MessageModel> messagesList = [];
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJason(doc));
      }
      emit(ChatSuccess(messageList: messagesList));
    });
  }
}
