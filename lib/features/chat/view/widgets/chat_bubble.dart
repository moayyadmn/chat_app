import 'package:flutter/material.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';

import '../../../../core/models/message.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: const BoxDecoration(
                color: kChatBubbleColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )),
            child: SelectableText(
              message.message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${message.sentAt.hour.toString()}:",
                  style: const TextStyle(color: kGreyColor, fontSize: 10),
                ),
                Text(
                  message.sentAt.minute.toString(),
                  style: const TextStyle(color: kGreyColor, fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChatBubbleWidgetForFriend extends StatelessWidget {
  const ChatBubbleWidgetForFriend({Key? key, required this.message})
      : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: const BoxDecoration(
              color: kChatBubbleColor2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: SelectableText(
              message.message,
              style: const TextStyle(color: Color(0xff000E08), fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${message.sentAt.hour.toString()}:",
                  style: const TextStyle(color: kGreyColor, fontSize: 10),
                ),
                Text(
                  message.sentAt.minute.toString(),
                  style: const TextStyle(color: kGreyColor, fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
