import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:photo_view/photo_view.dart';
import 'package:scholarchat_app/features/chat/view/widgets/custom_image_builder.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget(
      {Key? key, required this.message, required this.isSelected})
      : super(key: key);
  final MessageModel message;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          message.type == 'text'
              ? TextBubble(
                  message: message,
                  color: kChatBubbleColor,
                )
              : ImageBubble(message: message),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('h:mm a')
                      .format(DateTime.parse(message.sentAt))
                      .toString(),
                  style: const TextStyle(color: kGreyColor, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubbleWidgetForFriend extends StatelessWidget {
  const ChatBubbleWidgetForFriend(
      {Key? key, required this.message, required this.isSelected})
      : super(key: key);
  final MessageModel message;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          message.type == 'text'
              ? TextBubble(
                  message: message, color: kChatBubbleColor2, isBlackText: true)
              : ImageBubble(message: message),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('h:mm a')
                      .format(DateTime.parse(message.sentAt))
                      .toString(),
                  style: const TextStyle(color: kGreyColor, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageBubble extends StatelessWidget {
  const ImageBubble({
    super.key,
    required this.message,
  });

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: kBorderSideColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: CustomImageBuilder(
          image: message.message,
          onClick: () {
            Get.to(
              () => ImagePreview(
                imageUrl: message.message,
              ),
              transition: Transition.downToUp,
            );
          },
        ));
  }
}

class TextBubble extends StatelessWidget {
  const TextBubble(
      {super.key,
      required this.message,
      required this.color,
      this.isBlackText = false});

  final MessageModel message;
  final bool isBlackText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          )),
      child: Text(
        message.message,
        style: TextStyle(
            color: isBlackText ? Colors.black : Colors.white, fontSize: 16),
      ),
    );
  }
}

class ImagePreview extends StatelessWidget {
  final String imageUrl;
  const ImagePreview({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(imageUrl),
      ),
    );
  }
}
