import 'package:flutter/material.dart';

ThemeData lightModeTheme = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,       // background yerine surface (yeni Flutter sürümü)
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade900, // Yazıları Koyu Gri/Siyah yaptık (Okunabilirlik için)
  ),
);