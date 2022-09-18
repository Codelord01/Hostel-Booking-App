import 'package:flutter/material.dart';
import 'package:my_accommodation/constants.dart';

class MakePaymentPromt extends StatelessWidget {
  const MakePaymentPromt({Key? key}) : super(key: key);
  static const routeName = '/make-payment-prompt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: const Text(
                  'You have selected room 101 in Nana Adoma Hostel which costs 2500.',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/payment');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  fixedSize: MaterialStateProperty.all(
                    const Size(double.infinity, 50),
                  ),
                ),
                child: Text(
                  'Proceed to make Payment',
                  style: TextStyle(
                    color: backgroundColor,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
