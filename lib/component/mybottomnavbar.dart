import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.grey.shade100,
      onTabChange: (value) => onTabChange!(value),
      color: Colors.black,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: "",
        ),
        GButton(
          icon: Icons.shopping_bag_outlined,
          text: "",
        ),
        GButton(
          icon: Icons.notifications,
          text: "",
        ),
        GButton(
          icon: Icons.person,
          text: "",
        ),
      ],
    );
  }
}
