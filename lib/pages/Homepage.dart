// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:freshdoor/component/carosal_components.dart';
import 'package:freshdoor/component/cartprovider.dart';
import 'package:freshdoor/component/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../component/gridview.dart';
import '../component/searchbar.dart';
import 'productpage.dart';
import 'profilepage.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<int> price = [
    250,
    450,
    450,
    233,
  ];

  List<String> teaname = ["chaska", "CTC Tea", "Sun Rice", "Ginger tea"];

  List<String> housecleanname = [
    "multipurposecleaner",
    "superclean",
    "lsimplegreen",
    "splash",
  ];

  List<String> drinks = [
    "lib/image/cococola.jpeg",
    "lib/image/7up.jpeg",
    "lib/image/sprit.jpeg",
    "lib/image/fanta.jpeg",
  ];

  List<String> fruits = [
    'https://www.bigbasket.com/media/uploads/p/m/40077518_1-fresho-cucumber.jpg?tr=w-1920,q=80',
    'https://www.bigbasket.com/media/uploads/p/m/10000074_19-fresho-cauliflower.jpg?tr=w-1920,q=80',
    "https://www.bigbasket.com/media/uploads/p/m/10000070_15-fresho-carrot-orange.jpg?tr=w-1920,q=80",
    "https://www.bigbasket.com/media/uploads/p/m/10000067_23-fresho-capsicum-green.jpg?tr=w-1920,q=80",
  ];

  List<String> vegname = [
    "cucumber",
    "cauliflower",
    "Carrot",
    "capsicum-green",
  ];

  List<String> drinksname = [
    "cococola",
    "7up",
    "Sprit",
    "Fanta",
  ];
  List<String> finalValue = [];

  List<String> _foundItems = [];

  void searchElement(String name) {
    setState(() {
      if (name.isEmpty) {
        _foundItems = finalValue;
      } else {
        _foundItems = finalValue
            .where((value) => value.toLowerCase().contains(name.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    for (var value in drinksname) {
      finalValue.add(value);
    }

    for (var value in vegname) {
      finalValue.add(value);
    }

    for (var value in housecleanname) {
      finalValue.add(value);
    }

    for (var x in teaname) {
      finalValue.add(x);
    }
    final cartprovider = Provider.of<Cartprovider>(context, listen: false);
    bool isSearchBarEnabled = false;
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: isSearchBarEnabled
            // ignore: dead_code
            ? TextField(
                controller: searchController,
                onChanged: searchElement,
                decoration: InputDecoration(
                  hintText: 'Search...',
                ),
              )
            : Text(
                "Fresh Door",
                style: GoogleFonts.poppins(),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchBarEnabled = !isSearchBarEnabled;
                if (!isSearchBarEnabled) {
                  searchController.clear();
                  _foundItems = finalValue;
                }
              });
            },
            icon: Icon(isSearchBarEnabled ? Icons.close : Icons.search),
          ),
        ],
        centerTitle: true,
        leading: Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(
                            "Hello",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Text("Sathish",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15))
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profilepage()));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("lib/image/person.jpg")),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  items: [
                    Carosalcomponent(url: "lib/image/1.jpg"),
                    Carosalcomponent(url: "lib/image/2.jpg"),
                    Carosalcomponent(url: "lib/image/3.jpg"),
                    Carosalcomponent(url: "lib/image/4.jpg"),
                    Carosalcomponent(url: "lib/image/5.jpg"),
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Fresh Vegitables",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: fruits.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return gridviewcomponet(
                              onDoubleTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Productpage(
                                            price: price[index].toString(),
                                            url: vegname[index],
                                            name: vegname[index])));
                              },
                              Name: vegname[index],
                              url: fruits[index],
                              onTap: () {
                                var item = product(
                                    image: fruits[index],
                                    price: price[index].toString(),
                                    name: vegname[index]);
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
                                          title: Text(
                                              "One Item Successfully Added to cart"),
                                        ));
                                cartprovider.AddToCart(item);
                              },
                              price: price[index].toString(),
                              onPressed: () {
                                var item = product(
                                    image: fruits[index],
                                    price: price[index].toString(),
                                    name: vegname[index]);
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
                                          title: Text(
                                              "One Item Successfully Added to favroite"),
                                        ));
                                cartprovider.AddTofavroite(item);
                              });
                        })),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Cool Drinks",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: drinks.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return gridviewcomponet(
                              onDoubleTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Productpage(
                                            price: price[index].toString(),
                                            url: drinks[index],
                                            name: drinksname[index])));
                              },
                              Name: drinksname[index],
                              url: drinks[index],
                              onTap: () {
                                var item = product(
                                    image: drinks[index],
                                    price: price[index].toString(),
                                    name: drinksname[index]);
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
                                          title: Text(
                                              "One Item Successfully Added to Cart"),
                                        ));
                                cartprovider.AddToCart(item);
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
                                          title: Text(
                                              "One Item Successfully Added to Cart"),
                                        ));
                              },
                              price: price[index].toString(),
                              onPressed: () {
                                var item = product(
                                    image: drinks[index],
                                    price: price[index].toString(),
                                    name: drinksname[index]);
                                cartprovider.AddTofavroite(item);
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
                                          title: Text(
                                              "One Item Successfully Added to favroite"),
                                        ));
                              });
                        })),
                  ),
                ),

                // houseclean

                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "House clean",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.200",
                                          url:
                                              "lib/image/multipurposecleaner.jpeg",
                                          name: "Multi purpose cleaner")));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage(
                                  "lib/image/multipurposecleaner.jpeg"),
                            ),
                            title: Text("Multi purpose cleaner"),
                            subtitle: Text("Rs.200"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart)),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.149",
                                          url: "lib/image/superclean.jpeg",
                                          name: "superclean")));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage("lib/image/superclean.jpeg"),
                            ),
                            title: Text("Super Clean"),
                            subtitle: Text("Rs.149"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart)),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.179",
                                          url: "lib/image/splash.jpeg",
                                          name: "splash")));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage("lib/image/splash.png"),
                            ),
                            title: Text("Splash"),
                            subtitle: Text("Rs.179"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart)),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.199",
                                          url: "lib/image/simplegreen.jpeg",
                                          name: "Simple Green")));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage("lib/image/simplegreen.jpg"),
                            ),
                            title: Text("Simple Green"),
                            subtitle: Text("Rs.199"),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_cart)),
                          ),
                        ],
                      )),
                ),
                // tea

                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Beverages",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.200",
                                          url: "lib/image/tea1.jpeg",
                                          name: "chaska")));
                            },

                            //"chaska","CTC Tea","Sun Rice","Ginger tea"
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage(
                                "lib/image/tea1.jpeg",
                              ),
                            ),
                            title: Text("Chaska"),
                            subtitle: Text("Rs.89"),
                            trailing: IconButton(
                                onPressed: () {
                                  var item = product(
                                      image: "lib/image/tea1.jpeg",
                                      price: "Rs.89",
                                      name: "Chaska Tea");
                                  cartprovider.AddToCart(item);
                                },
                                icon: Icon(Icons.shopping_cart)),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.79",
                                          url: "lib/image/tea2.jpeg",
                                          name: "CTC Tea")));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage(" lib/image/tea2.jpeg"),
                            ),
                            title: Text("CTC tea"),
                            subtitle: Text("Rs.112"),
                            trailing: IconButton(
                                onPressed: () {
                                  var item = product(
                                      image: "lib/image/tea2.jpeg",
                                      price: "Rs.112",
                                      name: "CTC tea");
                                  cartprovider.AddToCart(item);
                                },
                                icon: Icon(Icons.shopping_cart)),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.112",
                                          url: "lib/image/tea3.jpeg",
                                          name: "Sun Rice")));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage(
                                "lib/image/tea3.jpeg",
                              ),
                            ),
                            title: Text("Sun Rice"),
                            subtitle: Text("Rs.179"),
                            trailing: IconButton(
                                onPressed: () {
                                  var item = product(
                                      image: "lib/image/tea3.jpeg",
                                      price: "Rs.179",
                                      name: "Sun Rice");
                                  cartprovider.AddToCart(item);
                                },
                                icon: Icon(Icons.shopping_cart)),
                          ),
                          Divider(),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Productpage(
                                          price: "Rs.199",
                                          url: "lib/image/tea4.jpeg",
                                          name: "Ginger tea")));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage(
                                "lib/image/tea4.jpeg",
                              ),
                            ),
                            title: Text("Ginger Tea"),
                            subtitle: Text("Rs.199"),
                            trailing: IconButton(
                                onPressed: () {
                                  var item = product(
                                      image: "lib/image/tea4.jpeg",
                                      price: "Rs.199",
                                      name: "Ginger Tea");
                                  cartprovider.AddToCart(item);
                                },
                                icon: Icon(Icons.shopping_cart)),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
