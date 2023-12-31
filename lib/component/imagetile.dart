import 'package:flutter/material.dart';

class Imagetile extends StatelessWidget {
  final String imagepath;

  const Imagetile({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5)),
        height: 50,
        width: 50,
        child: Image.asset(imagepath),
      ),
    );
  }
}
