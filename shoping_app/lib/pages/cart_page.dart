import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/components/my_button.dart';
import 'package:shoping_app/models/shop.dart';
import 'package:shoping_app/models/proudct.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Proudct product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from cart?'),
        actions: [
          // Cancel
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),

          // Yes
          MaterialButton(
            onPressed: () {
              context.read<Shop>().removeFromCart(product);
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    // Payment logic here
    showDialog(context: context,builder:(context)=> AlertDialog(
      content: const Text('Payment Successful!'),
     
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child:Center(
              child: cart.isEmpty
              ?Text("Your cart is empty")
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
              
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => removeItemFromCart(context, item),
                    ),
                  );
                },
              ),
            ),
          ),
          // pay button
          
          
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap:()=> payButtonPressed(context), child: const Text('Pay Now')),
          ),






        ],
      ),
    );
  }
}
