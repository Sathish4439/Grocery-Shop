import 'package:flutter/material.dart';

class Mylist extends StatelessWidget {
  String img;
  String title;
  String Subtitle;
  void Function()? onPressed;
  Mylist(
      {super.key,
      required this.img,
      required this.onPressed,
      required this.title,
      required this.Subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(img),
      ),
      title: Text(title),
      trailing: IconButton(
          onPressed: onPressed, icon: Icon(Icons.add_shopping_cart_rounded)),
    );
  }
}
