import 'package:flutter/material.dart';
import 'produk.dart'; // Import ProductDetailPage

// HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of food products with names, prices, images, and sold count
  final List<Map<String, dynamic>> foodProducts = [
    {
      'name': 'ASUS',
      'price': 12.99,
      'sold': 50,
      'images': '', // Placeholder URL
    },
    {
      'name': 'LENOVO',
      'price': 8.50,
      'sold': 30,
      'images': '', // Placeholder URL
    },
    {
      'name': 'HP',
      'price': 15,
      'sold': 20,
      'images': '', // Placeholder URL
    },
    {
      'name': 'ACER',
      'price': 10,
      'sold': 15,
      'images': '', // Placeholder URL
    },
    {
      'name': 'PREDATOR',
      'price': 10,
      'sold': 15,
      'images': '', // Placeholder URL
    },
    {
      'name': 'MSI',
      'price': 10,
      'sold': 15,
      'images': '', // Placeholder URL
    },
  ];

  // Function to load the product image using Image.network with error handling
  Widget loadProductImage(String imageUrl) {
    return AspectRatio(
      aspectRatio: 1.5, // Adjust aspect ratio for better fit
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: const Icon(
              Icons.broken_image,
              color: Colors.red,
              size: 50,
            ),
          );
        },
      ),
    );
  }

  void _onProductTapped(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Product(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: const Color.fromARGB(255, 236, 106, 26),
                    child: loadProductImage(''), // Display sample image
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'MELKY SINUN USEN',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '5220411190',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'MOBILE & WEB SERVICE PRAKTIK',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.76,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75, // Adjust childAspectRatio
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: foodProducts.length,
                itemBuilder: (context, index) {
                  final product = foodProducts[index];
                  return GestureDetector(
                    onTap: () =>
                        _onProductTapped(product), // Use function to handle tap
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          loadProductImage(product['images']),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '\$${product['price'].toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Sold: ${product['sold']}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
