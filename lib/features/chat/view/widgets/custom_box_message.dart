import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/features/chat/view/widgets/chat_text_field.dart';
import 'package:scholarchat_app/features/chat/view/widgets/dynamic_buttons.dart';

class CustomBoxMessage extends StatelessWidget {
  CustomBoxMessage({
    super.key,
    required this.otherUid,
    required this.scrollController,
  });
  final String otherUid;
  final ScrollController scrollController;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(kClipChatIcon),
            ),
            ChatTextField(
              textEditingController,
            ),
            DynamicButtons(
              otherUid: otherUid,
              textEditingController: textEditingController,
              scrollController: scrollController,
            ),
          ],
        ));
  }
}
