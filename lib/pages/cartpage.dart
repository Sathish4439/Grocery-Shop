// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:freshdoor/component/cartprovider.dart';
import 'package:freshdoor/pages/Homepage.dart';
import 'package:freshdoor/pages/deleiverypage.dart';
import 'package:freshdoor/pages/favroitepage.dart';
import 'package:freshdoor/pages/proccesspage.dart';
import 'package:provider/provider.dart';

import '../mainpage.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text("My Orders"),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Mainpage())));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  )),
            ),
            body: Consumer<Cartprovider>(
              builder: (context, value, child) {
                final item = value.Products;
                return Column(
                  children: [
                    TabBar(
                        labelColor: Colors.red,
                        indicatorColor: Colors.red,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.shopping_cart,
                            ),
                            text: "Completed",
                          ),
                          Tab(
                            icon: Icon(
                              Icons.favorite,
                            ),
                            text: "favroite",
                          ),
                          Tab(
                            icon: Icon(
                              Icons.delivery_dining,
                            ),
                            text: "cancelled",
                          )
                        ]),
                    Expanded(
                      child: TabBarView(
                          children: [Process(), Favpage(), Delivery()]),
                    )
                  ],
                );
              },
            )));
  }
}
//  ListView.builder(
//                         itemCount: item.length,
//                         itemBuilder: ((context, index) {
//                           final prod = item[index];
//                           return Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Colors.black,
//                                   ),
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                     backgroundImage: NetworkImage(prod.image)),
//                                 title: Text("Rs." + prod.price),
//                                 trailing: Text("palced"),
//                                 subtitle: Text(DateTime.now().toString()),
//                               ),
//                             ),
//                           );
//                         }))
