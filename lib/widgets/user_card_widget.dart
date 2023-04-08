import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/cubits/chat_cubit/chat_cubit.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    required this.user,
    Key? key,
  }) : super(key: key);
  final QueryDocumentSnapshot user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ChatCubit>(context).getMessages();
        Navigator.of(context).pushNamed(kChatRoute);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(user['profPhoto']),
            ),
            title: Text(user['userName']),
            subtitle: const Text('How are you , how have you been'),
            trailing: const Text('23-2-2023'),
          ),
        ),
      ),
    );
  }
}
