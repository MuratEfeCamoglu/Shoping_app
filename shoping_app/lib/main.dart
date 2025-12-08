import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/models/shop.dart';
import 'themes/light_mode.dart';
import 'pages/intro_page.dart';
import 'pages/shop_page.dart';
import 'pages/cart_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create:(context) => Shop() ,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightModeTheme,
      home: const IntroPage(),
      routes: {
        '/intro': (context) => const IntroPage(),
        '/shop': (context) => const ShopPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
