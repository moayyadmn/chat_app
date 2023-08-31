import 'package:flutter/material.dart';

class WelcomeScreenCustomContainer extends StatelessWidget {
  const WelcomeScreenCustomContainer(
      {Key? key,
      required this.image,
      required this.text,
      required this.text2,
      required this.height})
      : super(key: key);
  final String image, text, text2;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset(image),
          Text(
            text,
            style: const TextStyle(fontSize: 30, fontFamily: 'WelcTitle'),
          ),
          SizedBox(
            height: height,
          ),
          Text(
            text2,
            style: const TextStyle(fontSize: 20, fontFamily: 'Default'),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
