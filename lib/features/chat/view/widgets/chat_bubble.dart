import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scholarchat_app/features/chat/data/models/message_model.dart';
import 'package:scholarchat_app/core/utils/theme/colors.dart';
import 'package:photo_view/photo_view.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({Key? key, required this.message}) : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          message.type == 'text'
              ? Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  decoration: const BoxDecoration(
                      color: kChatBubbleColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )),
                  child: SelectableText(
                    message.message,
                    style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16),
                  ),
                )
              : message.message.isEmpty
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: kGreenColor,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.to(
                          () => ImagePreview(
                            imageUrl: message.message,
                          ),
                          transition: Transition.downToUp,
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kGreyColor,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(message.message),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('h:mm a').format(message.sentAt).toString(),
                  style: const TextStyle(
                      color: kGreyColor, fontSize: 10, fontFamily: "Default"),
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
  const ChatBubbleWidgetForFriend({Key? key, required this.message})
      : super(key: key);
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          message.type == 'text'
              ? Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
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
                    style:
                        const TextStyle(color: Color(0xff000E08), fontSize: 16),
                  ),
                )
              : message.message.isEmpty
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: kGreenColor,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.to(
                          () => ImagePreview(
                            imageUrl: message.message,
                          ),
                          transition: Transition.downToUp,
                        );
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kGreyColor,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(message.message),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  DateFormat('h:mm a').format(message.sentAt).toString(),
                  style: const TextStyle(
                      color: kGreyColor, fontSize: 10, fontFamily: "Default"),
                ),
              ],
            ),
          ),
        ],
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
        imageProvider: NetworkImage(imageUrl),
      ),
    );
  }
}
