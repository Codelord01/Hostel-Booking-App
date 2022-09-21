import 'package:flutter/material.dart';
import 'package:my_accommodation/constants.dart';
import '../screens/hostel_details.dart';

class Hostel extends StatelessWidget {
  final String hostelName;
  final String hostelLocation;
  final String hostelImage;
  final String hostelRate;
  final String hostelDescription;
  final List roomTypes;

  const Hostel({
    required this.hostelName,
    required this.hostelLocation,
    required this.hostelImage,
    required this.hostelRate,
    required this.hostelDescription,
    required this.roomTypes,
  });
  void routeToDetailScreen(BuildContext context) {
    Navigator.of(context).pushNamed(
      HostelDetails.routeName,
      arguments: {
        'hostelName': hostelName,
        'hostelLocation': hostelLocation,
        'hostelImage': hostelImage,
        'hostelRate': hostelRate,
        'hostelDescription': hostelDescription,
        'roomTypes': roomTypes,
      },
    );
  }

  void routeToGoogleMapScreen(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 10, bottom: 7, left: 15, right: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            offset: Offset(6, 6),
            blurRadius: 7,
          ),
          BoxShadow(
            color: Color.fromARGB(255, 1, 14, 23),
            offset: Offset(-6, -6),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => routeToDetailScreen(context),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber,
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(hostelImage)),
                ),
                Positioned(
                  left: size.width * 0.67,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    width: size.width * 0.15,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 175, 158, 11)
                          .withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          hostelRate,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8, left: 5),
                  child: InkWell(
                    onTap: () => routeToDetailScreen(context),
                    child: Text(
                      hostelName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 7),
                      child: IconButton(
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        onPressed: () => routeToGoogleMapScreen(context),
                      ),
                    ),
                    InkWell(
                      onTap: () => routeToGoogleMapScreen(context),
                      child: Text(
                        hostelLocation,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
