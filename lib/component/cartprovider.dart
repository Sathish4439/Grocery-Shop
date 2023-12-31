

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product.dart';

class Cartprovider extends ChangeNotifier {
  final List<product> _product = [];
  final List<product> _favproduct = [];

  List<product> get Favproduct => _favproduct;
  List<product> get Products => _product;

  void AddTofavroite(product Product) {
    Favproduct.add(Product);
    ChangeNotifier();
  }

  void RemoveFromFavroitet(product Product) {
    Favproduct.remove(Product);
    ChangeNotifier();
  }

  void AddToCart(product Product) {
    Products.add(Product);
    ChangeNotifier();
  }

  void RemoveFromCart(product Product) {
    Products.remove(Product);
    ChangeNotifier();
  }
}
