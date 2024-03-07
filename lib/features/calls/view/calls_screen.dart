import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarchat_app/core/helper/extensions.dart';
import 'package:scholarchat_app/core/utils/widgets/custom_app_bar.dart';
import 'widgets/call_card_widget.dart';
import '../../../core/utils/widgets/content_area.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).primaryColor,
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
          const ContentArea(
            child: CallCardWidget(),
          ),
        ],
      ),
    );
  }
}
