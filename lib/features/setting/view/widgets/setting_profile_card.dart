import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scholarchat_app/core/utils/firebase_ref.dart';

class SettingProfileCard extends StatelessWidget {
  const SettingProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: CachedNetworkImage(
            imageUrl: currentUser!.photoURL!,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
        title: Text(currentUser!.displayName!,
            style: Theme.of(context).textTheme.titleMedium),
        subtitle: const Text(
          "Never give up 💪",
          style: TextStyle(color: Color(0xff797C7B)),
        ),
        trailing: SvgPicture.asset("assets/svg/qr_code.svg"),
      ),
    );
  }
}
