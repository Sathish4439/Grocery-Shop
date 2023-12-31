import 'package:flutter/material.dart';

class Carosalcomponent extends StatelessWidget {
  String url;
  Carosalcomponent({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(url)),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
