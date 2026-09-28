import 'package:flutter/material.dart';
import 'package:shoping_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Logo
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

          // Shop
          MyListTile(
            title: "Shop",
            icon: Icons.home,
            // Zaten Shop sayfasındayız, sadece drawer'ı kapatalım
            onTap: () => Navigator.pop(context),
          ),

          // Cart
          MyListTile(
            title: "Cart",
            icon: Icons.shopping_cart,
            onTap: () {
              // Önce drawer'ı kapat, sonra sepet sayfasına git
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
    );
  }
}
