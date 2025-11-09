import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();
  //App Basic Colors
  static const Color primary = Color(0xFF4c3228);
  static const Color secondary = Color(0xFF765341);
  static const Color accent = Color(0xFFb0c7ff);
  static const Color alternate = Color(0xFF8b6c5c);

  //Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
        Color(0xFFF54545),
        Color(0xFFFE691E),
        Color(0xFFFF8A05),
      ],
  );


  //Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  //Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF121212);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static const Color darkContainer = Color(0xFF272727);
  
  //Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
  
  //Error and Validating Colors
  static const Color error = Color.fromARGB(255, 148, 16, 16);
  static const Color success = Color.fromARGB(255, 12, 92, 18);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
}