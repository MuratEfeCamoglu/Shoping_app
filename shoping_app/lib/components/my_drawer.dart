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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Add this item to cart?'),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          MaterialButton(
            onPressed: () {
              context.read<Shop>().addToCart(product);
              Navigator.of(context).pop();
              // Hata ayıklama için print yerine ScaffoldMessenger önerilir
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
    // Renk şemasını değişkene atayalım
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        // DÜZELTME 1: Arka planı 'primary' yerine 'surface' veya çok açık gri yapıyoruz
        color: colorScheme.surface, 
        borderRadius: BorderRadius.circular(12),
        // Kartın belirgin olması için hafif bir gölge ekleyebiliriz (isteğe bağlı)
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // DÜZELTME 2: İçerik dikeyde dağılsın diye spaceBetween kullanıyoruz
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Üst Kısım (Resim ve Metinler)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    // Resim alanı için ikincil renk uygun olabilir, ya da beyaz
                    color: colorScheme.secondary.withOpacity(0.1), 
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Icon(Icons.favorite, color: colorScheme.primary), // İkon rengi eklendi
                ),
              ),
              const SizedBox(height: 25),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // Metin rengini arka plana uygun hale getirdik
                  color: colorScheme.onSurface, 
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.description,
                style: TextStyle(
                  // Açıklama metni biraz daha silik olabilir
                  color: colorScheme.onSurfaceVariant, 
                ),
              ),
            ],
          ),
          
          // Alt Kısım (Fiyat ve Buton)
          // Spacer kullanmak yerine Column yapısını düzelttik
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => addToCart(context, product),
                    icon: Icon(
                      Icons.add, 
                      color: colorScheme.onSecondary // Buton üzerindeki ikon rengi
                    ),
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