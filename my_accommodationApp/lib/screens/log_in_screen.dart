import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/hostels_screen.dart';
import '../screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var obscureTextStatus = true;
  bool isPasswordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  double textFieldBorderRadius = 10.0;

  String errorMessage = '';
  bool isError = true;

  Future<void> _signIn() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (userCredential.user != null) {
        Navigator.of(context).pushReplacementNamed(HostelsScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
        setState(() {
          errorMessage = errorMessage;
        });
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
        setState(() {
          errorMessage = errorMessage;
        });
      }
    }
  }

  Widget errorText() {
    return Text(
      errorMessage,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void selectHostelsScreen() {
      Navigator.of(context).pushNamed(HostelsScreen.routeName);
    }

    return Scaffold(
      body: ListView(children: [
        Column(children: [
          Container(
            padding: EdgeInsets.only(top: size.height * 0.05),
            height: size.height * 0.5,
            child: SvgPicture.asset(
              'assets/images/image1.svg',
              width: size.width,
              height: size.height,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: size.width * 0.12, bottom: size.height * 0.04),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Login',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(textFieldBorderRadius),
                  ),
                ),
                hintText: 'abcd@gmail.com',
                labelText: 'Email',
                fillColor: const Color.fromARGB(255, 2, 16, 25),
                filled: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
            width: size.width * 0.8,
            child: TextField(
              controller: _passwordController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(textFieldBorderRadius),
                  ),
                ),
                // errorText: 'Password is incorrect',
                hintText: '***********',
                labelText: 'Password',
                fillColor: const Color.fromARGB(255, 2, 16, 25),
                filled: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        obscureTextStatus = !obscureTextStatus;
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              obscureText: obscureTextStatus,
            ),
          ),
          Container(
            height: size.height * 0.095,
            width: size.width * 0.93,
            padding: EdgeInsets.only(
                right: size.width * 0.065,
                top: size.height * 0.02,
                left: size.width * 0.065),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(textFieldBorderRadius),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 7, 133, 236),
                ),
                onPressed: () {
                  _signIn();
                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  child: TextButton(
                      child: const Text('Sign up'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      }),
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
