import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:chatbox/core/helper/go_chat.dart';
import 'package:chatbox/core/models/other_user_model.dart';
import 'package:chatbox/core/utils/constants.dart';
import 'package:chatbox/core/utils/theme/colors.dart';
import 'package:chatbox/features/chat/data/manager/chat_cubit/chat_cubit.dart';
import 'package:chatbox/features/community/data/models/user_data_model.dart';

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
        OtherUserModel data = OtherUserModel(
            otherUserId: user.id,
            otherUserName: user.userName,
            otherUserAvatar: user.photoUrl);
        BlocProvider.of<ChatCubit>(context).getMessages(user.id);
        Get.toNamed(kChatRoute, arguments: data);
        GoChat().goChat(user);
      },
      child: ListTile(
        minVerticalPadding: 24,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kGreyColor,
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                user.photoUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          user.userName,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: MyFontFamily.caros),
        ),
      ),
    );
  }
}
