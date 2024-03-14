import 'package:flutter/material.dart';
import 'package:chatbox/core/utils/constants.dart';

class SettingCard extends StatelessWidget {
  final void Function()? onTap;
  final Widget? leading;
  final String title;
  final String subTitle;

  const SettingCard({
    Key? key,
    this.leading,
    required this.onTap,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: leading,
          title: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontFamily: MyFontFamily.caros)),
          subtitle: Text(
            subTitle,
            style: const TextStyle(color: Color(0xff797C7B)),
          ),
        ),
      ),
    );
  }
}
