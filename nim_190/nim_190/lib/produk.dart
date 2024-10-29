import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  // Mock list of food products with names, prices, image URLs, and sold count
  final List<Map<String, dynamic>> foodProducts = [
    {
      'name': 'ASUS',
      'price': 12.99,
      'sold': 50,
      'images': 'https://via.placeholder.com/150', // Placeholder URL
    },
    {
      'name': 'LENOVO',
      'price': 8.50,
      'sold': 30,
      'images': 'https://via.placeholder.com/150', // Placeholder URL
    },
    {
      'name': 'HP',
      'price': 15.00,
      'sold': 20,
      'images': 'https://via.placeholder.com/150', // Placeholder URL
    },
    {
      'name': 'ACER',
      'price': 10.00,
      'sold': 15,
      'images': 'https://via.placeholder.com/150', // Placeholder URL
    },
    {
      'name': 'PREDATOR',
      'price': 10.00,
      'sold': 15,
      'images': 'https://via.placeholder.com/150', // Placeholder URL
    },
    {
      'name': 'MSI',
      'price': 10.00,
      'sold': 15,
      'images': 'https://via.placeholder.com/150', // Placeholder URL
    },
  ];

  Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: const Color.fromARGB(255, 236, 106, 26),
      ),
      body: ListView.builder(
        itemCount: foodProducts.length,
        itemBuilder: (context, index) {
          final product = foodProducts[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image widget with fallback for errors
                Image.network(
                  product['images'], // Use 'images' key for the image URL
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.red,
                        size: 50,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '\$${product['price'].toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    'Sold: ${product['sold']}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
