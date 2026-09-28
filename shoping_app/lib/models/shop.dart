import 'package:flutter/material.dart';
import 'package:shoping_app/models/product.dart';

class Shop extends ChangeNotifier {

  // Shop'taki ürünler
  final List<Product> _shopItems = [
    Product(
      name: 'Sneakers',
      description: 'Lightweight, comfortable sneakers for everyday wear.',
      price: 999.99,
      imageUrl: "assets/shoes.jpg",
    ),
    Product(
      name: 'Watch',
      description: 'A classic wristwatch with a minimalist design.',
      price: 699.99,
      imageUrl: 'assets/watch.png',
    ),
    Product(
      name: 'Hoodies',
      description: 'A soft, warm hoodie for cool days.',
      price: 199.99,
      imageUrl: 'assets/hoodie.png',
    ),
    Product(
      name: 'Glasses',
      description: 'Stylish glasses with UV-protective lenses.',
      price: 249.99,
      imageUrl: 'assets/glases.png',
    ),
  ];

  // Sepet
  final List<Product> _cart = [];

  // Getter'lar
  List<Product> get shopItems => _shopItems;
  List<Product> get cart => _cart;

  // Sepete ekle
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  // Sepetten çıkar
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  // Sepeti boşalt
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
