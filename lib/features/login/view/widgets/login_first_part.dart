


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginFirstPart extends StatelessWidget {
  const LoginFirstPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/Ellipse 1226.png",
          height: 300,
          width: 500,
          alignment: Alignment.centerRight,
        ),
        Column(
          children: [
            SvgPicture.asset(
              //cspell:disable-next-line
              "assets/svg/Logo -uihut.svg",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Connect friends easily and quickly",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 68,
                  fontFamily: "Caros",
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
