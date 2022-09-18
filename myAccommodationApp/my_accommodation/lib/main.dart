import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_accommodation/screens/make_payment_promt.dart';
import 'package:my_accommodation/screens/payment_page.dart';
import 'package:my_accommodation/screens/room_info.dart';
import 'package:my_accommodation/screens/select_room.dart';
import 'package:my_accommodation/screens/splash_screen.dart';
import '../screens/google_maps_page.dart';
import '../screens/hostel_details.dart';

import './constants.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/hostels_screen.dart';
import '../screens/log_in_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Accomodation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          color: backgroundColor,
          elevation: 0,
        ),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        WelcomeScreen.routeName: (ctx) => const WelcomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
        HostelsScreen.routeName: (context) => HostelsScreen(),
        HostelDetails.routeName: (context) => const HostelDetails(),
        GoogleMapScreen.routeName: (context) => const GoogleMapScreen(),
        RoomDetail.routeName: (context) => const RoomDetail(),
        Select_Room.routeName: (context) => const Select_Room(),
        MakePaymentPromt.routeName: (context) => const MakePaymentPromt(),
        Payment.routeName: (context) => const Payment(),
      },
    );
  }
}
