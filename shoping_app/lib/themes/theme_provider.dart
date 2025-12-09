import 'package:flutter/material.dart';
   // Kendi tema dosya yolun

class ThemeProvider extends ChangeNotifier {
  // Başlangıç teması: Light Mode
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == ThemeData.dark();

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == ThemeData.light()) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }
}