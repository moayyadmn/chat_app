import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/format_date.dart';
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
              .getMessages(handleOtherUser.getId());
          Get.toNamed(kChatRoute, arguments: data);
        },
        leading: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kGreyColor,
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                handleOtherUser.getImage(),
              ),
              fit: BoxFit.cover,
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
        trailing: Text(FormatDate.formattedDate(chatListCardModel.lastTime)),
      ),
    );
  }
}
