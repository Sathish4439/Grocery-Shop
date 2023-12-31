import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freshdoor/pages/Homepage.dart';
import 'package:freshdoor/pages/auth_page.dart';
import 'package:lottie/lottie.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Authpage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://lottie.host/5abdebac-72de-4ee5-8f2d-619066512814/VRrVu5M16j.json'),
            Lottie.network(
                'https://lottie.host/afecbd80-6739-450d-8c96-e1dab77f17ee/vOgfEVouT1.json')
          ],
        ),
      ),
    );
  }
}
