import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);
  static const routeName = '/payment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Payment'),
      ),
      body: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              labelText: 'Card Number',
            ),
          ),
        ],
      ),
    );
  }
}
