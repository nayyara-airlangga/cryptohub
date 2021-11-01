import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
    headline3: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 24),
    bodyText2: TextStyle(fontSize: 16),
  ),
  primaryColor: const Color.fromRGBO(0, 21, 41, 1),
  primaryColorLight: Colors.blue.withOpacity(1),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(0, 21, 41, 1),
    titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
  ),
  backgroundColor: Colors.white.withOpacity(1),
  scaffoldBackgroundColor: Colors.white.withOpacity(1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color.fromRGBO(0, 21, 41, 1),
    selectedItemColor: Colors.blue.withOpacity(1),
    unselectedItemColor: Colors.white.withOpacity(1),
  ),
);
