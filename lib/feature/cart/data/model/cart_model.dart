import 'dart:convert';

import 'package:bluezone_task/feature/home/data/model/product_models.dart';

class CartModel {
  final double quantity;
  final Product product;
  CartModel({
    required this.quantity,
    required this.product,
  });

  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
      quantity: jsonData['quantity'],
      product: Product.fromJson(jsonData['product']),
    );
  }

  static Map<String, dynamic> toMap(CartModel cart) =>
      {'quantity': cart.quantity, 'product': Product.toMap(cart.product)};

  static String encode(List<CartModel> cart) => json.encode(
        cart
            .map<Map<String, dynamic>>((cart) => CartModel.toMap(cart))
            .toList(),
      );

  static List<CartModel> decode(String? cart) {
    if (cart == null) return [];
    return (json.decode(cart) as List<dynamic>)
        .map<CartModel>((item) => CartModel.fromJson(item))
        .toList();
  }
}
