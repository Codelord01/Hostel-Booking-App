import 'package:flutter/material.dart';
import 'package:my_accommodation/widgets/room_number.dart';

class Select_Room extends StatelessWidget {
  const Select_Room({Key? key}) : super(key: key);
  static const routeName = '/select-room';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Room'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Wrap(
                children: [
                  RoomNumber('101'),
                  RoomNumber('102'),
                  RoomNumber('103'),
                  RoomNumber('104'),
                  RoomNumber('105'),
                  RoomNumber('106'),
                  RoomNumber('107'),
                  RoomNumber('108'),
                  RoomNumber('109'),
                  RoomNumber('110'),
                  RoomNumber('111'),
                  RoomNumber('112'),
                  RoomNumber('113'),
                  RoomNumber('114'),
                  RoomNumber('115'),
                  RoomNumber('116'),
                ],
              ),
            ],
          )),
    );
  }
}
