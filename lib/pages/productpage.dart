// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:freshdoor/component/button.dart';
import 'package:freshdoor/component/cartprovider.dart';
import 'package:freshdoor/pages/cartpage.dart';
import 'package:provider/provider.dart';

import '../component/product.dart';
import 'paymentpage.dart';

class Productpage extends StatelessWidget {
  String url;
  String price;
  String name;
  Productpage(
      {Key? key, required this.price, required this.url, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<Cartprovider>(listen: false, context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(url))),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "RS : " + price,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text("Rating : 3.5",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("name      :",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Price       : " + price,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Quantity : 1",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Quality    : Grade 1",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Rating     : 4.7",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                    text: "Add to cart",
                    color: Colors.white,
                    onTap: () {
                      var item = product(
                          image: url, price: price.toString(), name: name);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Done"))
                                ],
                                title:
                                    Text("One Item Successfully Added to cart"),
                              ));

                      cartprovider.AddToCart(item);
                    }),
                Button(
                  text: "Buy Now",
                  color: Colors.green,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => Paymentpage()));
                  },
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
