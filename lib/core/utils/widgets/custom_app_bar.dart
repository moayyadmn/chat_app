import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final Widget icon;
  const CustomAppBar({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            //cspell:disable-next-line
            "assets/svg/search_icon.svg",
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          icon,
        ],
      ),
    );
  }
}
