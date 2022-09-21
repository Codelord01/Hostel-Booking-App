// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_accommodation/screens/room_info.dart';
import '../constants.dart';

class HostelDetails extends StatelessWidget {
  const HostelDetails({Key? key}) : super(key: key);
  static const routeName = '/hostel-details';
  void routeToRoomDetail(BuildContext context) {
    Navigator.of(context).pushNamed(RoomDetail.routeName);
  }

  Widget roomsAvailable(String roomType, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20, left: 10, top: 15),
          child: Text(
            roomType,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: () {
            routeToRoomDetail(context);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 112, 99, 4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'View',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hostel Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.5,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/hostel1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.38,
                left: size.width * 0.17,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: size.width * 0.6,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Nana Adoma Hostel",
                            style: TextStyle(
                              color: backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.location_on,
                                        color: Color.fromARGB(255, 112, 99, 4),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Kotei",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: backgroundColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 112, 99, 4),
                                  ),
                                  Text(
                                    "4.8",
                                    style: TextStyle(
                                        color: backgroundColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 5, left: 12),
            child: const Text(
              "Hostel Description",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12),
            child: const Text(
              "This hostel is one of the top notch hostels around campus and it is the best option to make in term of uitilites, security, and affordablity",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, top: 25),
            child: const Text(
              "Rooms Available",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                roomsAvailable("2 in 1", context),
                roomsAvailable("3 in 1", context),
                roomsAvailable("4 in 1", context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
