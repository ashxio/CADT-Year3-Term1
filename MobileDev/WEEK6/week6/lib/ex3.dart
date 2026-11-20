import 'package:flutter/material.dart';
enum Product {
  dart(
    title: 'Dart',
    description: 'The best object language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best framework for cross-platform apps',
    image: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best backend service from Google',
    image: 'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: const Text('Products')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product; // named, required

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.image, width: 40, height: 40),
              const SizedBox(height: 8),
              Text(
                product.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(product.description),
            ],
          ),
        ),
      ),
    );
  }
}