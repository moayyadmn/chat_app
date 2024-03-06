// ignore_for_file: deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

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
      ZegoSendCallInvitationButton(
        iconSize: const Size(30, 30),
        buttonSize: const Size(30, 30),
        isVideoCall: true,
        resourceID:
            "chat_app", //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
        invitees: [
          ZegoUIKitUser(
            id: otherId,
            name: userName,
          ),
        ],
      ),
    ],
  );
}
