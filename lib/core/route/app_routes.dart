import 'package:bluezone_task/feature/home/data/model/product_models.dart';
import 'package:bluezone_task/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../feature/home/presentation/screens/home_screen.dart';
import '../../feature/home/presentation/screens/product_details_screen.dart';

class Routers {
  static const String inital = '/';
  static const String homeScreen = '/HomeScreen';
  static const String productDetailsScreen = '/ProductDetailsScreen';
}

class RoutersGenerated {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.inital:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case Routers.homeScreen:
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen()
        );
      case Routers.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) =>  ProductDetailsScreen(product:settings.arguments as Product)
        );
        // return MaterialPageRoute(
        //   builder: (_) =>  ProductDetailsScreen(product: ProductDetailsProvider().getProduct())
        // );       

      default:
        return MaterialPageRoute(builder: (_) => DefaultScreen());
    }
  }
}

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('404 - Not Found'),
      ),
    );
  }
}
