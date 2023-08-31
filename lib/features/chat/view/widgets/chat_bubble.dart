import 'package:flutter/material.dart';
import 'package:scholarchat_app/constants.dart';

import '../../../../core/models/message.dart';


class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({Key? key, required this.message}) : super(key: key);
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          margin: const EdgeInsets.all(5),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                message.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${message.sentAt.hour.toString()}:",
                    style: const TextStyle(color: Colors.white60, fontSize: 10),
                  ),
                  Text(
                    message.sentAt.minute.toString(),
                    style: const TextStyle(color: Colors.white60, fontSize: 10),
                  ),
                ],
              )
            ],
          )),
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
      child: Container(
          margin: const EdgeInsets.all(5),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          decoration: const BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                message.message,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${message.sentAt.hour.toString()}:",
                    style: const TextStyle(color: Colors.white60, fontSize: 10),
                  ),
                  Text(
                    message.sentAt.minute.toString(),
                    style: const TextStyle(color: Colors.white60, fontSize: 10),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
