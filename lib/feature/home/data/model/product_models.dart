import 'dart:convert';

import 'package:bluezone_task/feature/home/data/model/variants_model.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final double? discountedPrice;
  final String image;
  final String? offerMessage;
  final String? description;
  final List<Variants>? variants;
  Product(
      {required this.name,
      required this.price,
      required this.discountedPrice,
      required this.image,
      this.offerMessage,
      this.description,
      this.variants,
      required this.id});

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    List<Variants>? temp;
    if (jsonData['variants'] != null) {
      temp = <Variants>[];
      jsonData['variants'].forEach((v) {
        temp!.add(new Variants.fromJson(v));
      });
    }
    return Product(
      id: jsonData['id'],
      name: jsonData['name'],
      price: jsonData['price'],
      description: jsonData['description'],
      variants: temp,
      discountedPrice: jsonData['discountedPrice'],
      image: jsonData['image'],
      offerMessage: jsonData['offerMessage'],
    );
  }

  static Map<String, dynamic> toMap(Product product) => {
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'discountedPrice': product.discountedPrice,
        'image': product.image,
        'offerMessage': product.offerMessage,
        'description': product.description,
        'variants': product.variants != null
            ? product.variants!.map((v) => v.toJson()).toList()
            : null,
      };

  static String encode(List<Product> product) => json.encode(
        product
            .map<Map<String, dynamic>>((product) => Product.toMap(product))
            .toList(),
      );

  static List<Product> decode(String? product) {
    if (product == null) return [];
    return (json.decode(product) as List<dynamic>)
        .map<Product>((item) => Product.fromJson(item))
        .toList();
  }
}
