// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:freshdoor/component/imagetile.dart';
import 'package:freshdoor/mainpage.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Sign in to Your Account"),
              SizedBox(
                height: 30,
              ),
              TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Email", border: OutlineInputBorder())),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: password,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.visibility),
                      suffixIconColor: Colors.grey,
                      hintText: "Password",
                      border: OutlineInputBorder())),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: Text("Forgot Password"))),
                ],
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "---or---",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Imagetile(
                    imagepath: "lib/image/google.png",
                  ),
                  Imagetile(
                    imagepath: "lib/image/fb.png",
                  )
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Signup",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Mainpage()));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Skip & Continue",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
