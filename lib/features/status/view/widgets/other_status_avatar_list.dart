import 'package:chatbox/core/helper/extensions.dart';
import 'package:chatbox/features/status/data/models/status_model.dart';
import 'package:chatbox/features/status/view/status_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_view/status_view.dart';

class OtherStatusAvatarList extends StatelessWidget {
  const OtherStatusAvatarList({super.key, required this.statusList});
  final List<List<StatusModel>> statusList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          itemCount: statusList.length,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        MyStatusView(
                          storyItems: statusList[index],
                        ),
                      );
                    },
                    child: StatusView(
                      radius: 30,
                      spacing: 15,
                      strokeWidth: 2,
                      indexOfSeenStatus: 1,
                      numberOfStatus: statusList[index].length,
                      centerImageUrl: statusList[index][0].url,
                      seenColor: Colors.grey,
                      unSeenColor: Colors.grey,
                    ),
                  ),
                ),
                5.spaceY,
                Text(
                  statusList[index][0].userName.getFirstName(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            );
          }),
    );
  }
}


/* 

Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kGreyColor, width: 2),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: statusList[index][0].url,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
               
                  ],
                ))
 */