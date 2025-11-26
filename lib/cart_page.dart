import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product Card Demo")),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://picsum.photos/300/200",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 16),

                // Title
                const Text(
                  "Awesome Product",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Price
                const Text(
                  "€ 19.99",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 16),

                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
