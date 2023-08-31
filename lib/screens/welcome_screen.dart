import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants.dart';
import '../widgets/welcome_screen_custom_container.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double currentIndex = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            reverse: false,
            onPageChanged: ((index) {
              currentIndex = index.toDouble();
              setState(() {});
            }),
            controller: PageController(
                initialPage: 0, keepPage: false, viewportFraction: 1),
            pageSnapping: true,
            physics: const ClampingScrollPhysics(),
            children: [
              const WelcomeScreenCustomContainer(
                image: 'assets/images/image_1.png',
                text: 'Welcome to Chaty App',
                text2: 'Practice English With New Friends',
                height: 50,
              ),
              const WelcomeScreenCustomContainer(
                image: 'assets/images/image_2.png',
                text: 'Find Your New Friends',
                text2: 'Chat _ VoiceCall _ VideoCall',
                height: 50,
              ),
              Stack(alignment: Alignment.bottomCenter, children: [
                const WelcomeScreenCustomContainer(
                  image: 'assets/images/image_3.png',
                  text: 'Get Started',
                  text2: 'start with logging in or sign up',
                  height: 30,
                ),
                Positioned(
                  bottom: 60,
                  child: GestureDetector(
                    onTap: () {
                      Get.offAndToNamed(kLoginRoute);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kMainColor,
                      ),
                      width: 100,
                      height: 50,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ])
            ],
          ),
          Positioned(
            bottom: 20,
            child: DotsIndicator(
              position: currentIndex,
              dotsCount: 3,
              reversed: false,
              mainAxisAlignment: MainAxisAlignment.center,
              decorator: DotsDecorator(
                  activeColor: kMainColor,
                  activeSize: const Size(18, 9),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
        ],
      ),
    );
  }
}
