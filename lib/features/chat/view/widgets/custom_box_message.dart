import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chatbox/core/utils/constants.dart';
import 'package:chatbox/features/chat/view/widgets/chat_text_field.dart';
import 'package:chatbox/features/chat/view/widgets/dynamic_buttons.dart';

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
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                kClipChatIcon,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary,
                  BlendMode.srcIn,
                ),
              ),
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
