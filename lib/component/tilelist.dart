import 'package:flutter/material.dart';

class draweritems extends StatelessWidget {
  void Function()? onTap;
  final Icon Icons;
  String title;

  draweritems(
      {Key? key, required this.Icons, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icons,
      title: Text(title),
      onTap: onTap,
    );
  }
}
