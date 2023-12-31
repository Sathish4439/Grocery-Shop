import 'package:flutter/material.dart';

class Catarogylist extends StatelessWidget {
  const Catarogylist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text("data"),
          ),
        ),
       
      ],
    );
  }
}
