import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar2 extends StatelessWidget {
  const CustomAppBar2({super.key});

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
            'Community',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                //cspell:disable-next-line
                "assets/svg/add_person.svg",
              ),
              SvgPicture.asset(
                //cspell:disable-next-line
                "assets/svg/user-add.svg",
                alignment: Alignment.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
