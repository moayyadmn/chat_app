import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  const ContentArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xff121414) : Colors.white),
        child: child,
      ),
    );
  }
}
