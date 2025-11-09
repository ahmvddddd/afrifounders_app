import 'package:flutter/material.dart';
import 'text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    fontFamily: 'Aeonik',
    brightness: Brightness.light,
    primaryColor: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TexTheme.lightTextTheme(context),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    fontFamily: 'Aeonik',
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TexTheme.darkTextTheme(context),
  );
}