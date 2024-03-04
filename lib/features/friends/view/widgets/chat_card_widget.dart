import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:scholarchat_app/core/models/other_user_model.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/format_date.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/chat/data/manager/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/friends/data/models/chat_list_card_model.dart';
import 'package:scholarchat_app/features/friends/functions/handle_other_user.dart';
import 'package:get/get.dart';

class ChatCardWidget extends StatelessWidget {
  const ChatCardWidget({
    required this.chatListCardModel,
    Key? key,
  }) : super(key: key);

  final ChatListCardModel chatListCardModel;
  @override
  Widget build(BuildContext context) {
    HandleOtherUser otherUser = HandleOtherUser(chatListCardModel);
    OtherUserModel data = OtherUserModel(
        otherUserId: otherUser.getId(),
        otherUserName: otherUser.getName(),
        otherUserAvatar: otherUser.getImage());
    return Card(
      child: ListTile(
        onTap: () {
          BlocProvider.of<ChatCubit>(context).getMessages(otherUser.getId());
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
                otherUser.getImage(),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          otherUser.getName(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: MyFontFamily.caros),
        ),
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
