import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class ChatCardWidget extends StatelessWidget {
  ChatCardWidget({
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
    }
  }

  getName() {
    if (messageList['fromName'] == currentUsDe!.photoURL) {
      messageList['toName'];
    } else {
      messageList['fromName'];
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(messageList['lastTime']);
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
          title: Text(messageList['fromName']),
          subtitle: Text(messageList['lastMessage']),
          trailing: Text(DateFormat('MMM d, h:mm a').format(date).toString()),
        ),
      ),
    );
  }
}
