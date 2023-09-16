import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/helper/extensions.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';

class ContentArea extends StatelessWidget {
  final Widget child;
  const ContentArea({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        clipBehavior: Clip.hardEdge,
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xff121414) : Colors.white),
          child: Column(
            children: [
              10.spaceY,
              Container(
                height: 3,
                width: 30,
                decoration: BoxDecoration(
                  color: const Color(0xffE6E6E6),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
