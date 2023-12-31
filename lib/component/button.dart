import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  void Function()? onTap;
  String text;
  Color color;
  Button(
      {super.key,
      required this.text,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.3,
          decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(2)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
