import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.purple,

    fontFamily: 'Montserrat-Medium',
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,

    fontFamily: 'Montserrat-Medium',
  );
}

class ThemeProvider extends ChangeNotifier{
  static bool _isDark = false;

  bool isDarkTheme(){
    return _isDark;
  }

  void switchTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }
}