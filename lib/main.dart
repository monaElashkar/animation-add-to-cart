import 'package:bluezone_task/feature/cart/presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/route/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'feature/home/presentation/provider/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Bluezone',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        onGenerateRoute: RoutersGenerated.onGenerateRoute,
      ),
    );
  }
}
