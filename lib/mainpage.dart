import 'package:flutter/material.dart';
import 'package:freshdoor/component/mybottomnavbar.dart';

import 'pages/Homepage.dart';
import 'pages/cartpage.dart';
import 'pages/notificationpage.dart';
import 'pages/profilepage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int _selectedindex = 0;

  void  Mypagenav(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List _pages = [Homepage(), Cartpage(), Savepage(), Profilepage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => Mypagenav(index),
      ),
    );
  }
}
