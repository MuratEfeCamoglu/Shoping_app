import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/components/my_button.dart';
import 'package:shoping_app/models/shop.dart';
import 'package:shoping_app/models/proudct.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Ürün silme fonksiyonu
  void removeItemFromCart(BuildContext context, Proudct product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Remove this item from cart?'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
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

  // Ödeme butonu fonksiyonu
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text('Payment Successful!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    // Temadan renkleri alıyoruz
    final Color textColor = Theme.of(context).colorScheme.inversePrimary;
    final Color itemBackgroundColor = Theme.of(context).colorScheme.secondary;
    final Color backgroundColor = Theme.of(context).colorScheme.surface; // veya background

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: textColor, // Başlık rengi koyu
        title: const Text('Cart Page'),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Sepet Listesi
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(
                        color: textColor, // Boş sepet yazısını görünür yaptık
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      // Liste elemanı tasarımı
                      return Container(
                        decoration: BoxDecoration(
                          color: itemBackgroundColor, // Beyaz kart
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: ListTile(
                          title: Text(
                            item.name,
                            style: TextStyle(
                              color: textColor, // Koyu yazı rengi
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: textColor, // Koyu yazı rengi
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: textColor, // İkon rengi
                            ),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Ödeme Butonu (Pay Now)
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPressed(context),
              child: Text(
                'Pay Now',
                style: TextStyle(
                   color: textColor, // Buton içindeki yazının rengi
                   fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}