import 'package:flutter/material.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);
  static const routeName = '/google-map';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map '),
      ),
      body: const Center(
        child: Text('Google map page'),
      ),
    );
  }
}
