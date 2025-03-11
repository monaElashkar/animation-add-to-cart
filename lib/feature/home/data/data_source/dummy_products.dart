import '../model/product_models.dart';

class GetProducts {
  List<Product> getProducts() {
    List<Product> resualt =
        products.map((product) => Product.fromJson(product)).toList();
    return resualt;
  }
}

List<Map<String, dynamic>> products = [
  {
    "id": 0,
    "name": "Dress",
    "price": 100.0,
    "image": "assets/images/logo.png",
    "offerMessage": "20% off"
  },
  {
    "id": 1,
    "name": "Shirt",
    "price": 50.0,
    "image": "assets/images/logo.png",
    "offerMessage": "10% off"
  },
  {
    "id": 2,
    "name": "Jeans",
    "price": 75.0,
    "image": "assets/images/logo.png",
    "offerMessage": "15% off"
  },
  {
    "id": 3,
    "name": "Jacket",
    "price": 120.0,
    "image": "assets/images/logo.png",
    "offerMessage": "25% off"
  },
  {
    "id": 4,
    "name": "Sweater",
    "price": 90.0,
    "image": "assets/images/logo.png",
    "offerMessage": "30% off"
  },
  {
    "id": 5,
    "name": "Shoes",
    "price": 110.0,
    "image": "assets/images/logo.png",
    "offerMessage": "20% off"
  },
  {
    "id": 6,
    "name": "Watch",
    "price": 200.0,
    "image": "assets/images/logo.png",
    "offerMessage": "15% off"
  },
  {
    "id": 7,
    "name": "Sunglasses",
    "price": 80.0,
    "image": "assets/images/logo.png",
    "offerMessage": "10% off"
  },
  {
    "id": 8,
    "name": "Hat",
    "price": 40.0,
    "image": "assets/images/logo.png",
    "offerMessage": "5% off"
  },
  {
    "id": 9,
    "name": "Backpack",
    "price": 130.0,
    "image": "assets/images/logo.png",
    "offerMessage": "20% off"
  },
  {
    "id": 10,
    "name": "Scarf",
    "price": 35.0,
    "image": "assets/images/logo.png",
    "offerMessage": "15% off"
  },
  {
    "id": 11,
    "name": "Gloves",
    "price": 50.0,
    "image": "assets/images/logo.png",
    "offerMessage": "10% off"
  },
  {
    "id": 12,
    "name": "Belt",
    "price": 45.0,
    "image": "assets/images/logo.png",
    "offerMessage": "10% off"
  },
  {
    "id": 13,
    "name": "Coat",
    "price": 150.0,
    "image": "assets/images/logo.png",
    "offerMessage": "25% off"
  },
  {
    "id": 14,
    "name": "Suit",
    "price": 250.0,
    "image": "assets/images/logo.png",
    "offerMessage": "30% off"
  },
  {
    "id": 15,
    "name": "Skirt",
    "price": 70.0,
    "image": "assets/images/logo.png",
    "offerMessage": "20% off"
  },
  {
    "id": 16,
    "name": "T-shirt",
    "price": 40.0,
    "image": "assets/images/logo.png",
    "offerMessage": "10% off"
  },
  {
    "id": 17,
    "name": "Leggings",
    "price": 60.0,
    "image": "assets/images/logo.png",
    "offerMessage": "15% off"
  },
  {
    "id": 18,
    "name": "Socks",
    "price": 20.0,
    "image": "assets/images/logo.png",
    "offerMessage": "5% off"
  },
  {
    "id": 19,
    "name": "Handbag",
    "price": 180.0,
    "image": "assets/images/logo.png",
    "offerMessage": "25% off"
  }
];
