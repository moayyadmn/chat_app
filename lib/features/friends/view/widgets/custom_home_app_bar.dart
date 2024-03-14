import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:chatbox/core/utils/firebase_ref.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            //cspell:disable-next-line
            "assets/svg/search_icon.svg",
          ),
          Text(
            'Home',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(currentUser!.photoURL!),
                  fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
