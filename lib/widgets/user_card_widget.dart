import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/cubits/handle_chat/handle_chat_cubit.dart';
import 'package:scholarchat_app/models/user_data_model.dart';

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
        BlocProvider.of<ChatCubit>(context).getMessages();
        BlocProvider.of<HandleChatCubit>(context).goChat(user);
        Navigator.of(context).pushNamed(kChatRoute);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(user.photoUrl),
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
