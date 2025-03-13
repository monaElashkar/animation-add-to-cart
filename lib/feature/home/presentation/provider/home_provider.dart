import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_source/dummy_products.dart';
import '../../data/model/product_models.dart';

class CartProvider extends ChangeNotifier {
  GetProducts getProducts = GetProducts();
  List<Product> items = [];
  List<Product> products=[];

 GetProductsList()  {
    products= getProducts.getProducts();
  }
  getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cart = prefs.getString('cart');
    items.clear();
    items = Product.decode(cart);
    print('getCart');
    notifyListeners();
  }



  void addToCart(Product product) {
    items.add(product);
    saveCart();
    notifyListeners();
  }

  saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cart', Product.encode(items));
    print('saved');
  }
}
