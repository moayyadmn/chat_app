import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/data/manager/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/friends/functions/handle_other_user.dart';
import '../../../../core/models/chat_list_card_model.dart';
import 'package:get/get.dart';

class ChatCardWidget extends StatelessWidget {
  const ChatCardWidget({
    required this.chatListCardModel,
    Key? key,
  }) : super(key: key);

  final ChatListCardModel chatListCardModel;
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(chatListCardModel.lastTime);
    HandleOtherUser handleOtherUser =
        HandleOtherUser(cardModel: chatListCardModel);
    return Card(
      child: ListTile(
        onTap: () {
          var data = {
            'otherUserId': handleOtherUser.getId(),
            'toName': handleOtherUser.getName(),
            'toAvatar': handleOtherUser.getImage(),
          };
          BlocProvider.of<ChatCubit>(context)
            ..setInformation(data)
            ..getMessages();
          Get.toNamed(kChatRoute);
        },
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kGreyColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              handleOtherUser.getImage(),
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
                      color: kWhiteColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        title: Text(handleOtherUser.getName(),
            style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text(
          chatListCardModel.lastMessage,
          style: const TextStyle(color: kGreyColor),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        trailing: Text(DateFormat('MMM d, h:mm a').format(date).toString()),
      ),
    );
  }
}
