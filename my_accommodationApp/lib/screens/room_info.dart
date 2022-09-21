import 'package:flutter/material.dart';
import 'package:my_accommodation/screens/select_room.dart';

class RoomDetail extends StatelessWidget {
  const RoomDetail({Key? key}) : super(key: key);
  static const routeName = '/room-detail';

  Widget hostelMedia(String image, var width) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget roomSpecs(String spec) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
            child: const Icon(
              Icons.api,
              color: Colors.blue,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              spec,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void routeToSelectRoom(BuildContext context) {
    Navigator.of(context).pushNamed(Select_Room.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var hostelImageWidth = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Room Detail',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Text(
              'Nana Adoma Hostel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 25),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: size.height * 0.4,
            child: ListView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge,
              children: [
                hostelMedia(
                  'assets/images/hostel4.jpg',
                  hostelImageWidth,
                ),
                hostelMedia(
                  'assets/images/hostel2.jpg',
                  hostelImageWidth,
                ),
                hostelMedia(
                  'assets/images/hostel3.jpg',
                  hostelImageWidth,
                ),
                hostelMedia(
                  'assets/images/hostel1.jpg',
                  hostelImageWidth,
                ),
                hostelMedia(
                  'assets/images/hostel4.jpg',
                  hostelImageWidth,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10, left: 10),
            child: const Text(
              'Hostel Specification',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 22),
            ),
          ),
          roomSpecs("Wahsroom inside"),
          roomSpecs("kitched shared"),
          roomSpecs("Free light"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: EdgeInsets.only(left: 10, top: size.height * 0.1),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "2500",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () {
                  routeToSelectRoom(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  margin: EdgeInsets.only(right: 15, top: size.height * 0.1),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
