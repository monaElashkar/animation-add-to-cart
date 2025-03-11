import 'dart:convert';

class Product {
  final int id;
  final String name;
  final double price;
  final String image;
  final String? offerMessage;
  Product(
      {required this.name,
      required this.price,
      required this.image,
      this.offerMessage,
      required this.id});

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
      id: jsonData['id'],
      name: jsonData['name'],
      price: jsonData['price'],
      image: jsonData['image'],
      offerMessage: jsonData['offerMessage'],
    );
  }

  static Map<String, dynamic> toMap(Product product) => {
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'image': product.image,
        'offerMessage': product.offerMessage,
      };

  static String encode(List<Product> product) => json.encode(
        product
            .map<Map<String, dynamic>>((product) => Product.toMap(product))
            .toList(),
      );

  static List<Product> decode(String product) =>
      (json.decode(product) as List<dynamic>)
          .map<Product>((item) => Product.fromJson(item))
          .toList();
}
