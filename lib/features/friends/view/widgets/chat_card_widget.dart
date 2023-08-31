import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../constants.dart';
import '../../../../core/models/chat_list_card_model.dart';

class ChatCardWidget extends StatelessWidget {
  ChatCardWidget({
    required this.chatListCardModel,
    Key? key,
  }) : super(key: key);
  final ChatListCardModel chatListCardModel;
  final currentUsDe = FirebaseAuth.instance.currentUser;
  String getImage() {
    if (chatListCardModel.fromAvatar == currentUsDe!.photoURL) {
      return chatListCardModel.toAvatar;
    } else {
      return chatListCardModel.fromAvatar;
    }
  }

  String getName() {
    if (chatListCardModel.fromName == currentUsDe!.displayName) {
      return chatListCardModel.toName;
    } else {
      return chatListCardModel.fromName;
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(chatListCardModel.lastTime);
    return Card(
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
        title: Text(getName()),
        subtitle: Text(
          chatListCardModel.lastMessage,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: Text(DateFormat('MMM d, h:mm a').format(date).toString()),
      ),
    );
  }
}
