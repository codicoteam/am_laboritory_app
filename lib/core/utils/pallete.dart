import 'package:flutter/material.dart';

class Pallete {
  static Color primaryColor = const Color.fromARGB(255, 8, 100, 238);  
  static Color secondaryColor = Colors.blue.shade200;
  static const Color whiteColor = Colors.white;
  static Color redColor = const Color.fromARGB(255, 236, 46, 33);

  static Color fadedRedColor = Colors.red.withOpacity(0.3);
  
  /////////////// TEXT COLOURS ///////////////
  static Color lightPrimaryTextColor = Colors.grey.shade800;
  static Color greyTextColor = Colors.grey.shade400;
  static Color blackTextColor = Colors.black;
  static Color darkPrimaryTextColor = Colors.grey.shade200;

  static ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: false,
    
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
    ),
    // Fixed CardTheme declaration (was CardThemeData)
  );
}