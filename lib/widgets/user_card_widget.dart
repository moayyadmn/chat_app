import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/cubits/chat_cubit/chat_cubit.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ChatCubit>(context).getMessages();
        Navigator.of(context).pushNamed(kChatRoute);
      },
      child: const Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
            ),
            title: Text('Moayyad Nagib'),
            subtitle: Text('How are you , how have you been'),
            trailing: Text('23-2-2023'),
          ),
        ),
      ),
    );
  }
}
