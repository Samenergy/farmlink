import 'package:flutter/material.dart';

class AllProductsPage extends StatelessWidget {
  // List of fruits with their corresponding images
  final List<Map<String, String>> fruits = [
    {'name': 'Apple', 'image': 'assets/images/apple.png'},
    {'name': 'Banana', 'image': 'assets/images/banana.png'},
    {'name': 'Orange', 'image': 'assets/images/orange.png'},
    {'name': 'Mango', 'image': 'assets/images/mango.png'},
    {'name': 'Grapes', 'image': 'assets/images/grapes.png'},
    {'name': 'Pineapple', 'image': 'assets/images/pineapple.png'},
    {'name': 'Strawberry', 'image': 'assets/images/strawberry.png'},
    {'name': 'Watermelon', 'image': 'assets/images/watermelon.png'},
    {'name': 'Blueberry', 'image': 'assets/images/blueberry.png'},
    {'name': 'Kiwi', 'image': 'assets/images/kiwi.png'},
  ];

  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        backgroundColor: const Color(0xFF00af88),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: fruits.length, // Use the length of the fruits list
          itemBuilder: (context, index) {
            return ProductCard(
              productName: fruits[index]['name']!,
              imagePath: fruits[index]['image']!, // Use the image path from the list
              price: 'RWF ${(index + 1) * 1000}/kg', // Placeholder price
            );
          },
        ),
      ),
    );
  }
}

// Reuse the ProductCard widget if already defined elsewhere
class ProductCard extends StatelessWidget {
  final String productName;
  final String imagePath;
  final String price;

  const ProductCard({
    super.key,
    required this.productName,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
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
