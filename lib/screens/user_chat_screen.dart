import 'package:flutter/material.dart';

import '../widgets/user_card_widget.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chaty')),
      body: const UserCardWidget(),
    );
  }
}
