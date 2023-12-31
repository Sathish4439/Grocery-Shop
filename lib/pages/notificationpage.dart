import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import '../mainpage.dart';

class Savepage extends StatelessWidget {
  const Savepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Mainpage())));
            }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Text("Notification page"),
      ),
    );
  }
}
