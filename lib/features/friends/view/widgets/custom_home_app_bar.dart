import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/1465940329/photo/portrait-of-a-blind-man-at-a-subway-station.webp?b=1&s=170667a&w=0&k=20&c=CRj1NXFSBxxXJqWSkQEjejQrGDw4qba7qsxe1h40ggw="),
                  fit: BoxFit.cover),
            ),
          )
        ],
      ),
    );
  }
}
