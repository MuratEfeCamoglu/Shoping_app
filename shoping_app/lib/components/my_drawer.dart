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
              print('${product.name} added to cart.');
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: const Icon(Icons.favorite),
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
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${product.price.toStringAsFixed(2)}'),
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
            ],
          ),
        ],
      ),
    );
  }
}
