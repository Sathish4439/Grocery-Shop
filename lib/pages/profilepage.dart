// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:freshdoor/mainpage.dart';
import 'package:freshdoor/pages/Homepage.dart';
import 'package:freshdoor/pages/cartpage.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Mainpage())));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.update),
                        color: Colors.white,
                        iconSize: 30,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("lib/image/person.jpg"))),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "sathish",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "aravindsathish0885@gmail.com",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock),
                    title: Text("Change Password"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("My Account"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text("My Orders"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Cartpage())));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Testimonials"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text("Refer & join"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text("Notification Settings"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_emergency),
                    title: Text("Help & Contact us"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.policy),
                    title: Text("Privacy Policy"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.groups),
                    title: Text("About us"),
                    onTap: () {},
                  ),
                ],
              ))
        ],
      ),
    ));
  }
}
