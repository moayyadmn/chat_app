<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scholarchat_app/models/chat_list_card_model.dart';
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
>>>>>>> b2c5731367e789945511ba48e45f84ef3d231e61
import '../constants.dart';

class ChatCardWidget extends StatelessWidget {
  ChatCardWidget({
<<<<<<< HEAD
    required this.chatListCardModel,
    Key? key,
  }) : super(key: key);
  final ChatListCardModel chatListCardModel;
  final currentUsDe = FirebaseAuth.instance.currentUser;
  getImage<String>() {
    if (chatListCardModel.fromAvatar == currentUsDe!.photoURL) {
      return chatListCardModel.toAvatar;
    } else {
      return chatListCardModel.fromAvatar;
=======
    required this.messageList,
    Key? key,
  }) : super(key: key);
  final QueryDocumentSnapshot<Map<String, dynamic>> messageList;
  final currentUsDe = FirebaseAuth.instance.currentUser;
  getImage<String>() {
    if (messageList['fromAvatar'] == currentUsDe!.photoURL) {
      return messageList['toAvatar'];
    } else {
      return messageList['fromAvatar'];
>>>>>>> b2c5731367e789945511ba48e45f84ef3d231e61
    }
  }

  getName() {
<<<<<<< HEAD
    if (chatListCardModel.fromName == currentUsDe!.displayName) {
      return chatListCardModel.toName;
    } else {
      return chatListCardModel.fromName;
=======
    if (messageList['fromName'] == currentUsDe!.photoURL) {
      messageList['toName'];
    } else {
      messageList['fromName'];
>>>>>>> b2c5731367e789945511ba48e45f84ef3d231e61
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    DateTime date = DateTime.parse(chatListCardModel.lastTime);
=======
    DateTime date = DateTime.parse(messageList['lastTime']);
>>>>>>> b2c5731367e789945511ba48e45f84ef3d231e61
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {},
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              getImage(),
              fit: BoxFit.cover,
              height: 50,
              width: 50,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Colors.grey,
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kMainColor,
                    ),
                  ),
                );
              },
            ),
          ),
<<<<<<< HEAD
          title: Text(getName()),
          subtitle: Text(chatListCardModel.lastMessage),
=======
          title: Text(messageList['fromName']),
          subtitle: Text(messageList['lastMessage']),
>>>>>>> b2c5731367e789945511ba48e45f84ef3d231e61
          trailing: Text(DateFormat('MMM d, h:mm a').format(date).toString()),
        ),
      ),
    );
  }
}
