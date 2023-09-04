import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'login_button.dart';
import 'login_first_part.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LoginFirstPart(),
          const Text(
            "Our chat app is the perfect way to stay connected with friends and family.",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontFamily: "Caros"),
          ),
          const Spacer(),
          SvgPicture.asset(
            "assets/svg/Social.svg",
          ),
          const Spacer(),
          SvgPicture.asset(
            //cspell:disable-next-line
            "assets/svg/Or-uihut.svg",
          ),
          const Spacer(),
          const LoginButton(),
          const Spacer(),
        ],
      ),
    );
  }
}
