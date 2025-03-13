import 'package:bluezone_task/feature/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];
  double total = 0;
  double totalDiscounted = 0;
  getCart(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cart = prefs.getString('cart');
    cartList.clear();
    cartList = CartModel.decode(cart);
    print('getCart');
    totalPriceCalculated();
    discountedPriceCalculated(code);
    notifyListeners();
  }

  removeFromCart(CartModel product, String code) {
    cartList.remove(product);
    saveCart();
    totalPriceCalculated();
    discountedPriceCalculated(code);
    notifyListeners();
  }

  saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cart', CartModel.encode(cartList));
    print('saved');
  }

  totalPriceCalculated() {
    total = 0;
    cartList.forEach((item) {
      total +=
          item.quantity * (item.product.discountedPrice ?? item.product.price);
    });
    notifyListeners();
  }

  discountedPriceCalculated(String code) {
    totalDiscounted = 0;
    if (code == 'quant') {
      totalDiscounted = total * 0.1; // 10% discount
    } else if (code == 'value') {
      totalDiscounted = total - 100; // 100$ discount
    } else if (code == 'none') {
      totalDiscounted = total; // no discount
    } else {
      totalDiscounted = total; // no discount
    }
    totalDiscounted;
    notifyListeners();
  }
}
