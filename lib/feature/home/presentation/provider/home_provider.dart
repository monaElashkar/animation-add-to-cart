import 'package:bluezone_task/feature/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_source/dummy_products.dart';
import '../../data/model/product_models.dart';

class HomeProvider extends ChangeNotifier {
  GetProducts getProducts = GetProducts();
  List<CartModel> items = [];
  List<Product> products=[];

 GetProductsList()  {
    products= getProducts.getProducts();
  }
  getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cart = prefs.getString('cart');
    items.clear();
    items = CartModel.decode(cart);
    print('getCart');
    notifyListeners();
  }



  void addToCart(CartModel product) {
    items.add(product);
    saveCart();
    notifyListeners();
  }

  saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cart', CartModel.encode(items));
    print('saved');
  }
}
