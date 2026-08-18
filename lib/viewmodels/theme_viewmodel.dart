import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  static final ThemeViewModel instance = ThemeViewModel._internal();
  ThemeViewModel._internal();

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}