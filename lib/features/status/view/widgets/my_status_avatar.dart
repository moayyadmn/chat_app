import 'package:chatbox/core/utils/firebase_ref.dart';
import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';

class MyStatusAvatar extends StatelessWidget {
  const MyStatusAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              StatusView(
                radius: 30,
                spacing: 15,
                strokeWidth: 2,
                indexOfSeenStatus: 1,
                numberOfStatus: 1,
                padding: 4,
                centerImageUrl: currentUser!.photoURL!,
                seenColor: Colors.grey,
              ),
              Icon(
                Icons.add_circle_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'My status',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
/* Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 2),
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: currentUser!.photoURL!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(20, 20),
                child: Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ), */