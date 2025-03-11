import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme{
    static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.primerColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
      ),
 
    );
  }
}