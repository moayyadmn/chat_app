// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:scholarchat_app/models/user_data_model.dart';
import '../helper/handle_chat_members.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    required this.user,
    Key? key,
  }) : super(key: key);
  final UserDataModel user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HandleChatMembers().goChat(user);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: InkWell(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user.photoUrl),
              ),
            ),
            title: Text(user.userName),
            subtitle: const Text('How are you , how have you been'),
            trailing: const Text('23-2-2023'),
          ),
        ),
      ),
    );
  }
}
