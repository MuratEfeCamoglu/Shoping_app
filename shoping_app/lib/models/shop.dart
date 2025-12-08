import 'package:flutter/material.dart';
import 'package:shoping_app/models/proudct.dart';

class Shop extends ChangeNotifier {

  // Shop'taki ürünler
  final List<Proudct> _shopItems = [
    Proudct(
      name: 'Laptop',
      description: 'A high-performance laptop for all your computing needs.',
      price: 999.99,
      imageUrl: 'https://example.com/laptop.jpg',
    ),
    Proudct(
      name: 'Smartphone',
      description: 'A sleek smartphone with the latest features.',
      price: 699.99,
      imageUrl: 'https://example.com/smartphone.jpg',
    ),
    Proudct(
      name: 'Headphones',
      description: 'Noise-cancelling headphones for immersive sound experience.',
      price: 199.99,
      imageUrl: 'https://example.com/headphones.jpg',
    ),
    Proudct(
      name: 'Smartwatch',
      description: 'A stylish smartwatch to keep you connected on the go.',
      price: 249.99,
      imageUrl: 'https://example.com/smartwatch.jpg',
    ),
  ];

  // Sepet
  final List<Proudct> _cart = [];

  // Getter'lar
  List<Proudct> get shopItems => _shopItems;
  List<Proudct> get cart => _cart;

  // Sepete ekle
  void addToCart(Proudct product) {
    _cart.add(product);
    notifyListeners();
  }

  // Sepetten çıkar
  void removeFromCart(Proudct product) {
    _cart.remove(product);
    notifyListeners();
  }
}
