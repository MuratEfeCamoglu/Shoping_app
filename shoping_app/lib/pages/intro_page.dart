import 'package:flutter/material.dart';
import 'package:shoping_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            Text(
              "Minimal Shop",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Premium Quality Products",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop'),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
