import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarchat_app/core/helper/sized_box.dart';
import 'package:scholarchat_app/core/widgets/content_area.dart';
import 'package:scholarchat_app/core/widgets/custom_app_bar.dart';

import '../../../core/utils/theme/colors.dart';
import 'widgets/call_card_widget.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customScaffoldColor(),
      body: Column(
        children: [
          17.spaceY,
          CustomAppBar(
            text: 'Calls',
            icon: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  //cspell:disable-next-line
                  "assets/svg/circle_icon.svg",
                ),
                SvgPicture.asset(
                  //cspell:disable-next-line
                  "assets/svg/call_icon.svg",
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          15.spaceY,
          Expanded(
            child: ContentArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                  const CallCardWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
