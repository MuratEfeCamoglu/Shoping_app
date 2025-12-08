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
      drawer: const Drawer(),
      backgroundColor: Theme.of(context).colorScheme.background,

      body: ListView(
        children: [
          const SizedBox(height: 25),

          // Shop subtitle
          Center(
            child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // list of products
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
