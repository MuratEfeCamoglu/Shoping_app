import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/models/shop.dart';
import 'package:shoping_app/components/my_proudct_tile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shopItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart-page');
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      // --- DÜZELTME BURADA BAŞLIYOR (DRAWER) ---
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            // Logo veya Başlık
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            
            const SizedBox(height: 25),

            // Shop Butonu
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Shop"),
              onTap: () {
                // Zaten Shop sayfasındayız, sadece drawer'ı kapatalım
                Navigator.pop(context);
              },
            ),

            // Cart Butonu
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Cart"),
              onTap: () {
                // Önce drawer'ı kapat
                Navigator.pop(context);
                // Sonra sepet sayfasına git
                Navigator.pushNamed(context, '/cart-page');
              },
            ),
          ],
        ),
      ),
      // --- DÜZELTME BİTİŞ ---
      
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary, // Renk görünürlüğü için
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProudctTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}