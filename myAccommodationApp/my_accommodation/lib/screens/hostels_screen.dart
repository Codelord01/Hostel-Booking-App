import 'package:flutter/material.dart';
import '../dummy_data.dart';

import '../widgets/hostel.dart';

class HostelsScreen extends StatelessWidget {
  HostelsScreen({Key? key}) : super(key: key);
  static const routeName = '/hostels-screen';
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 27),
            child: const Text(
              'Hi David, Let\'s ',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 27),
            child: const Text(
              'Find your favorite hostel',
              style: TextStyle(
                fontSize: 23,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                fillColor: Color.fromARGB(255, 2, 16, 25),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Search here...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: size.height * 0.48,
            child: ListView.builder(
              itemCount: availableHostels.length,
              itemBuilder: (context, index) {
                return Hostel(
                  hostelName: availableHostels[index].name,
                  hostelRate: availableHostels[index].rating,
                  hostelImage: availableHostels[index].frontimage,
                  hostelLocation: availableHostels[index].location,
                  hostelDescription: availableHostels[index].description,
                  roomTypes: availableHostels[index].roomTypes,
                );
              },
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Hostels'),
      ),
    );
  }
}
