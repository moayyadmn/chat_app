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
      ZegoSendCallInvitationButton(
        iconSize: const Size(22, 30),
        buttonSize: const Size(30, 30),

        icon: ButtonIcon(
          icon: SvgPicture.asset(
            "assets/svg/default_call.svg",
            color: Colors.black,
          ),
        ),
        isVideoCall: false,
        resourceID:
            "chat_app", //You need to use the resourceID that you created in the subsequent steps. Please continue reading this document.
        invitees: [
          ZegoUIKitUser(
            id: otherId,
            name: userName,
          ),
        ],
      ),
      ZegoSendCallInvitationButton(
        iconSize: const Size(28, 28),
        buttonSize: const Size(30, 30),
        margin: const EdgeInsets.only(left: 10, right: 10),
        icon: ButtonIcon(
          icon: SvgPicture.asset(
            "assets/svg/video_call.svg",
            color: Colors.black,
          ),
        ),
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
