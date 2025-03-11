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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Bluezone',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        onGenerateRoute: RoutersGenerated.onGenerateRoute,
      ),
    );
  }
}



