import 'package:flutter/material.dart';

class gridviewcomponet extends StatelessWidget {
  void Function()? onTap;
  void Function()? onDoubleTap;
  void Function()? onPressed;
  String url;
  String price;
  String Name;
  gridviewcomponet(
      {Key? key,
      required this.url,
      required this.onTap,
      required this.price,
      required this.Name,
      required this.onDoubleTap,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onDoubleTap: onDoubleTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        height: 100,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FittedBox(child: Image.network(url)),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "50% OFF",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "Rs." + price,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: IconButton(
                                onPressed: onPressed,
                                icon: Icon(Icons.favorite))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Add")),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
