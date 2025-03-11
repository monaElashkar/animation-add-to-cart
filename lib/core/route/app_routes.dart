import 'package:bluezone_task/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../feature/home/presentation/screens/home_screen.dart';

class Routers {
  static const String inital = '/';
  static const String homeScreen = '/HomeScreen';
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
