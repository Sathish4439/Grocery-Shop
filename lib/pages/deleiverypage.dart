import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/cartprovider.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Cartprovider>(builder: (context, value, child) {
      final item = value.Products;
      return Expanded(
        child: ListView.builder(
            itemCount: item.length,
            itemBuilder: ((context, index) {
              final prod = item[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    leading:
                        CircleAvatar(backgroundImage: NetworkImage(prod.image)),
                    title: Text(prod.name),
                    trailing: IconButton(
                        onPressed: () {
                          value.RemoveFromCart(prod);
                        },
                        icon: Icon(Icons.delete)),
                    subtitle: Text(prod.price),
                  ),
                ),
              );
            })),
      );
    }));
  }
}
