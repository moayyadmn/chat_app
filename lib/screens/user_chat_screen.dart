// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/cubits/user_chat_screen_cubit/user_chat_screen_cubit.dart';
import 'package:scholarchat_app/cubits/user_chat_screen_cubit/user_chat_screen_state.dart';
import 'package:scholarchat_app/models/user_card_model.dart';
import '../widgets/user_card_widget.dart';

class UserChatScreen extends StatefulWidget {
  const UserChatScreen({super.key});

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  List<UserCardModel> usersList = [];
  @override
  void initState() {
    BlocProvider.of<UserChatScreenCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chaty'),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacementNamed(kLoginRoute);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: BlocBuilder<UserChatScreenCubit, UserChatScreenState>(
          builder: (context, state) {
            usersList = BlocProvider.of<UserChatScreenCubit>(context).usersList;
            
            if (usersList.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: kMainColor,
                ),
              );
            } else if (state is UserChatScreenSuccess) {
              return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  return UserCardWidget(user: usersList[index]);
                },
              );
            } else {
              return const Text('fail data');
            }
          },
        ));
  }
}
