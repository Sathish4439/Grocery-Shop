import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/cartprovider.dart';

class Favpage extends StatelessWidget {
  const Favpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Cartprovider>(builder: (context, value, child) {
      final item = value.Favproduct;
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
                    trailing: TextButton(
                      onPressed: () {
                        value.RemoveFromFavroitet(prod);
                      },
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(8)),
                        child:const  Padding(
                          padding:  EdgeInsets.all(5),
                          child: Center(child: Text("Remove from favroite",style: TextStyle(fontSize: 10),)),
                        ),
                      ),
                    ),
                    subtitle: Text(DateTime.now().toString()),
                  ),
                ),
              );
            })),
      );
    }));
  }
}
