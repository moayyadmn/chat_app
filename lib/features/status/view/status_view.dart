import 'package:chatbox/features/status/data/models/status_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class MyStatusView extends StatefulWidget {
  MyStatusView({super.key, required this.storyItems});
  final List<StatusModel> storyItems;

  @override
  State<MyStatusView> createState() => _MyStatusViewState();
}

class _MyStatusViewState extends State<MyStatusView> {
  final StoryController controller = StoryController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<StoryItem> items = [];

    for (var i = 0; i < widget.storyItems.length; i++) {
      items.add(StoryItem.pageImage(
        url: widget.storyItems[i].url,
        caption: Text(
          widget.storyItems[i].text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        controller: this.controller,
      ));
    }
    return Scaffold(
      body: StoryView(
        storyItems: items,
        controller: controller,
        indicatorHeight: IndicatorHeight.small,
        onComplete: () {
          Get.back();
        },
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Get.back();
          }
        },
      ),
    );
  }
}
