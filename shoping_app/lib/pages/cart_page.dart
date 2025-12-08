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
              // ... CartPage kodunun geri kalanı aynı ...

            child: cart.isEmpty
                ? const Text("Your cart is empty") // const ekledim
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      // ListTile'ı Container içine alıp renk veriyoruz
                      return Container(
                        decoration: BoxDecoration(
                          // Kart rengi (Secondary daha açık bir renkse iyi durur)
                          color: Theme.of(context).colorScheme.secondary, 
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: ListTile(
                          title: Text(
                            item.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Theme.of(context).colorScheme.inversePrimary,
                            ),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        ),
                      );
                    },
                  ),

// ... Kalan kodlar ...
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
