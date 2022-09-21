import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_accommodation/screens/log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var selectedValue = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final studentIdController = TextEditingController();
  final phoneController = TextEditingController();
  double textFieldBorderRadius = 10.0;
  late final String? studentName;

  Future createUserWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userCredential.user != null) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget textfield(String hintText, String labelText, IconData icon,
        TextEditingController controller) {
      return Container(
        padding: EdgeInsets.only(top: size.height * 0.03),
        width: size.width * 0.8,
        child: TextField(
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(textFieldBorderRadius),
              ),
            ),
            hintText: hintText,
            labelText: labelText,
            fillColor: const Color.fromARGB(255, 2, 16, 25),
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Icon(
                icon,
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
        ),
      );
    }

    Widget passwordTextField(
        String hintText, String labelText, TextEditingController controller) {
      return Container(
        padding: EdgeInsets.only(top: size.height * 0.03),
        width: size.width * 0.8,
        child: TextField(
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(textFieldBorderRadius),
              ),
            ),
            hintText: hintText,
            labelText: labelText,
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
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(
                  Icons.remove_red_eye,
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
        ),
      );
    }

    return Scaffold(
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: size.height * 0.03),
              height: size.height * 0.3,
              child: SvgPicture.asset(
                'assets/images/image2.svg',
                width: size.width,
                height: size.height,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.12,
                  bottom: size.height * 0.02,
                  top: size.height * 0.03),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            textfield('Full Name', 'Full Name', Icons.person, nameController),
            textfield('Email', 'Email', Icons.email, emailController),
            textfield(
                'Student ID', 'Student ID', Icons.code, studentIdController),
            textfield(
                'Phone Number', 'Phone Numer', Icons.phone, phoneController),
            passwordTextField('Password', 'Password', passwordController),
            passwordTextField('Confirm Password', 'Confirm Password',
                confirmPasswordController),
            Container(
              height: size.height * 0.095,
              width: size.width * 0.92,
              padding: EdgeInsets.only(
                  right: size.width * 0.065,
                  top: size.height * 0.02,
                  left: size.width * 0.065),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 7, 133, 236),
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    createUserWithEmailAndPassword();
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    child: TextButton(
                        child: const Text('Sign in'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        }),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
