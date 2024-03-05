// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/helper/chat_room.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:scholarchat_app/features/calls/view/video_call_screen.dart';

PreferredSizeWidget? appBar(
    BuildContext context, String photo, String userName, String otherId) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundImage: CachedNetworkImageProvider(photo),
        ),
        const SizedBox(
          width: 13,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              "Active now",
              style: TextStyle(color: kGreyColor, fontSize: 12),
            ),
          ],
        ),
      ],
    ),
    leadingWidth: 25,
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/svg/default_call.svg",
          color: Colors.black,
          width: 20,
          height: 20,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.to(VideoCallScreen(
              roomId: ChatRoom.getChatRoomId(otherId), name: userName));
        },
        icon: SvgPicture.asset(
          "assets/svg/video_call.svg",
          color: Colors.black,
        ),
      ),
    ],
  );
}
