import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/models/proudct.dart';
import 'package:shoping_app/models/shop.dart';

class MyProudctTile extends StatelessWidget {
  final Proudct product;

  const MyProudctTile({
    super.key,
    required this.product,
  });

  void addToCart(BuildContext context, Proudct product) {
    // ÖNEMLİ DÜZELTME 1:
    // Dialog açılmadan önce Shop sağlayıcısına erişiyoruz.
    // Böylece Dialog'un kendi context'i içinde kaybolmuyoruz.
    final shop = context.read<Shop>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog( // Buradaki isimi dialogContext yaptım karışmasın diye
        content: const Text('Add this item to cart?'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              // Yukarıda tanımladığımız 'shop' değişkenini kullanıyoruz
              shop.addToCart(product);
              
              Navigator.of(dialogContext).pop();
              
              // Kullanıcıya görsel geri bildirim (Opsiyonel ama önerilir)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.name} added to cart.')),
              );
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // DÜZELTME 2: Öğelerin arasını açmak için spaceBetween
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          // BURADAKİ GEREKSİZ 'COLUMN' KALDIRILDI
          // Eski kodda Column içinde Column olduğu için spaceBetween çalışmıyordu.
          
          // 1. Bölüm: Resim ve Yazılar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12), // Resim köşelerini de yuvarlayalım
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.description,
                style: TextStyle(
                  fontWeight:FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          
          // 2. Bölüm: Fiyat ve Buton (En alta itilecek)
          Padding( // Biraz boşluk ekleyelim
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => addToCart(context, product),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}