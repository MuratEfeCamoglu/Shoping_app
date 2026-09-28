import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:shoping_app/main.dart';
import 'package:shoping_app/models/shop.dart';

Future<void> pumpApp(WidgetTester tester) async {
  // Ürün kartlarının tamamı ekrana sığsın diye büyük bir ekran kullanıyoruz
  tester.view.physicalSize = const Size(1200, 2000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

void main() {
  group('Shop', () {
    test('addToCart, removeFromCart and clearCart update the cart', () {
      final shop = Shop();
      final product = shop.shopItems.first;

      shop.addToCart(product);
      shop.addToCart(product);
      expect(shop.cart.length, 2);

      shop.removeFromCart(product);
      expect(shop.cart.length, 1);

      shop.clearCart();
      expect(shop.cart, isEmpty);
    });
  });

  testWidgets('intro -> shop -> add to cart -> remove from cart',
      (WidgetTester tester) async {
    await pumpApp(tester);

    // Intro sayfası
    expect(find.text('Minimal Shop'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    // Shop sayfası
    expect(find.text('Shop Page'), findsOneWidget);
    expect(find.text('Sneakers'), findsOneWidget);

    // İlk ürünü sepete ekle
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();
    expect(find.text('Sneakers added to cart.'), findsOneWidget);

    // Sepete git
    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Cart Page'), findsOneWidget);
    expect(find.text('Sneakers'), findsOneWidget);

    // Ürünü sepetten çıkar
    await tester.tap(find.byIcon(Icons.remove_circle_outline));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();
    expect(find.text('Your cart is empty'), findsOneWidget);
  });

  testWidgets('paying empties the cart; empty cart cannot be paid',
      (WidgetTester tester) async {
    await pumpApp(tester);

    final context = tester.element(find.byType(MaterialApp));
    final shop = Provider.of<Shop>(context, listen: false);

    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pumpAndSettle();

    // Boş sepet
    await tester.tap(find.text('Pay Now'));
    await tester.pumpAndSettle();
    expect(find.text('Add items to your cart before paying.'), findsOneWidget);
    expect(find.text('Payment Successful!'), findsNothing);

    // Dialog'u kapat
    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();

    // Dolu sepet
    shop.addToCart(shop.shopItems.first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pay Now'));
    await tester.pumpAndSettle();
    expect(find.text('Payment Successful!'), findsOneWidget);
    expect(shop.cart, isEmpty);
  });
}
