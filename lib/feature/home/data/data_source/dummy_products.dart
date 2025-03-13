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
    "discountedPrice": 80.0,
    "image": "assets/images/logo.png",
    "offerMessage": "20% off",
    "description": "Elegant dress made from soft and comfortable fabric, perfect for special occasions.",
    "variants": [
      {
        "id": 1,
        "name": "Color",
        "attributes": ["Red", "Green", "Blue"]
      },
      {
        "id": 2,
        "name": "Size",
        "attributes": ["S", "M", "L", "XL"]
      }
    ]
  },
  {
    "id": 1,
    "name": "Shirt",
    "price": 50.0,
    "discountedPrice": 45.0,
    "image": "assets/images/logo.png",
    "offerMessage": "10% off",
    "description": "Classic high-quality shirt, ideal for work and formal events.",
    "variants": [
      {
        "id": 1,
        "name": "Color",
        "attributes": ["White", "Black", "Blue"]
      },
      {
        "id": 2,
        "name": "Size",
        "attributes": ["S", "M", "L", "XL", "XXL"]
      }
    ]
  },
  {
    "id": 2,
    "name": "Jeans",
    "price": 75.0,
    "discountedPrice": 75.0,
    "image": "assets/images/logo.png",
    "description": "Trendy jeans with a comfortable design suitable for all occasions.",
    "variants": [
      {
        "id": 1,
        "name": "Color",
        "attributes": ["Blue", "Black", "Grey"]
      },
      {
        "id": 2,
        "name": "Size",
        "attributes": ["30", "32", "34", "36", "38"]
      }
    ]
  },
  {
    "id": 3,
    "name": "Jacket",
    "price": 120.0,
    "discountedPrice": 90.0,
    "image": "assets/images/logo.png",
    "offerMessage": "25% off",
    "description": "Warm winter jacket made from high-quality materials for protection against the cold.",
  },
  {
    "id": 4,
    "name": "Sweater",
    "price": 90.0,
    "discountedPrice": 63.0,
    "image": "assets/images/logo.png",
    "offerMessage": "30% off",
    "description": "Comfortable sweater with a modern design to keep you warm in winter.",
    "variants": [
      {
        "id": 1,
        "name": "Color",
        "attributes": ["Red", "Black", "Grey"]
      }
    ]
  },
  {
    "id": 5,
    "name": "Shoes",
    "price": 110.0,
    "discountedPrice": 110.0,
    "image": "assets/images/logo.png",
    "description": "High-quality sports shoes suitable for daily workouts and walking.",
    "variants": [
      {
        "id": 1,
        "name": "Size",
        "attributes": ["40", "41", "42", "43", "44"]
      }
    ]
  },
  {
    "id": 6,
    "name": "Watch",
    "price": 200.0,
    "discountedPrice": 200.0,
    "image": "assets/images/logo.png",
    "description": "Elegant watch with a luxurious design, adding a touch of beauty to your look.",
    "variants": [
      {
        "id": 1,
        "name": "Strap Material",
        "attributes": ["Leather", "Metal", "Silicone"]
      }
    ]
  },
  {
    "id": 7,
    "name": "Sunglasses",
    "price": 80.0,
    "discountedPrice": 72.0,
    "image": "assets/images/logo.png",
    "offerMessage": "10% off",
    "description": "Stylish sunglasses that protect your eyes from UV rays.",
  },
  {
    "id": 8,
    "name": "Hat",
    "price": 40.0,
    "discountedPrice": 38.0,
    "image": "assets/images/logo.png",
    "offerMessage": "5% off",
    "description": "Trendy hat that protects you from the sun with a stylish design.",
    "variants": [
      {
        "id": 1,
        "name": "Color",
        "attributes": ["Black", "Beige", "Brown"]
      }
    ]
  },
  {
    "id": 9,
    "name": "Backpack",
    "price": 130.0,
    "discountedPrice": 104.0,
    "image": "assets/images/logo.png",
    "offerMessage": "20% off",
    "description": "Durable backpack with large storage capacity, perfect for travel or school.",
  }
]

;
