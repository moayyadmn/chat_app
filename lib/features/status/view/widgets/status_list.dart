import 'package:chatbox/features/status/data/models/status_model.dart';
import 'package:chatbox/features/status/view/widgets/my_status_avatar.dart';
import 'package:chatbox/features/status/view/widgets/other_status_avatar_list.dart';
import 'package:flutter/material.dart';

class StatusList extends StatelessWidget {
  const StatusList({super.key, required this.statusList});
  final List<List<StatusModel>> statusList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        padding: EdgeInsets.only(left: 15),
        scrollDirection: Axis.horizontal,
        children: [
          MyStatusAvatar(),
          OtherStatusAvatarList(
            statusList: this.statusList,
          ),
        ],
      ),
    );
  }
}
