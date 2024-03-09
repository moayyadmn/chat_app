import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';

PreferredSizeWidget? appBar(
    BuildContext context, String photo, String userName, String otherId) {
  return AppBar(
    leadingWidth: 60,
    leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Get.back();
        },
        icon: Row(
          children: [
            Icon(Icons.arrow_back),
            CircleAvatar(
              radius: 18,
              backgroundImage: CachedNetworkImageProvider(photo),
            ),
          ],
        )),
    title: Column(
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
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/svg/default_call.svg",
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/svg/video_call.svg",
          colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
    ],
  );
}
