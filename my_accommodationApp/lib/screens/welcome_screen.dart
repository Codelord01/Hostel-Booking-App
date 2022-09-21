import 'package:flutter/material.dart';

import '../screens/log_in_screen.dart';
import '../screens/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/welcome-screen';

  Widget welcomeMessage(String message) {
    return Text(
      message,
      style: const TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  void login(BuildContext context) {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  void signUp(BuildContext context) {
    Navigator.of(context).pushNamed(SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_page_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: size.height * 0.1, left: size.width * 0.1),
              child: Row(
                children: const [
                  Icon(Icons.house, color: Colors.white, size: 30),
                  Text(
                    'myAccommodation',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: size.height * 0.05, left: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeMessage('Find An'),
                  welcomeMessage('Available Hostel'),
                  welcomeMessage('to Stay'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: size.height * 0.05, left: size.width * 0.1),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Find your hostel easily at',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'anywhere and anytime',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.22,
                  right: size.width * 0.1,
                  top: size.height * 0.05,
                  bottom: size.height * 0.02),
              width: size.width * 0.85,
              height: size.height * 0.14,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(
                  onPressed: () {
                    signUp(context);
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    login(context);
                  },
                  child: const Text('Log in'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
