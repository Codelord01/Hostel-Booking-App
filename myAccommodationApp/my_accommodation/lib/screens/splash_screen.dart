import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:my_accommodation/constants.dart';
import 'package:my_accommodation/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnimatedSplashScreen(
      splash: SizedBox(
        height: size.height,
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Icon(
                    Icons.house,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                const Text(
                  'My Accommodation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          //   child: Lottie.network(
          //     'https://assets6.lottiefiles.com/packages/lf20_ydqecxxj.json',
          //     width: size.width * 0.8,
          //     height: size.height * 0.2,
          //     fit: BoxFit.fill,
          //   ),
          // ),
        ]),
      ),
      nextScreen: const WelcomeScreen(),
      splashTransition: SplashTransition.slideTransition,
      backgroundColor: backgroundColor,
      duration: 6000,
      centered: false,
    );
  }
}
