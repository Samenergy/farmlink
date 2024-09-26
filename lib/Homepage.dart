import 'package:flutter/material.dart';
import 'custom_navigation_bar.dart'; // Import the CustomNavigationBar
import 'all_products_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages to switch between when an item is selected
  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    BrowseProductsPage(),
    ProfilePage(),
  ];

  // Method to handle navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart page
            },
          ),
        ],
        backgroundColor: const Color(0xFF00af88),
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Body changes based on selected navbar item
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// Updated HomeContent Widget
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Welcome Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color(0xFF00af88), // Primary color
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Farmlink!',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Connecting you to fresh produce from local farmers.',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Action Buttons Section
            Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    HomeActionButton(
      icon: Icons.local_florist, // Icon for Vegetables
      label: 'Vegetables',
      onTap: () {
      },
    ),
    HomeActionButton(
      icon: Icons.apple, // Use another available icon for Fruits
      label: 'Fruits',
      onTap: () {
        // Action: Navigate to fruits page or category
      },
    ),
    HomeActionButton(
      icon: Icons.category, // Icon for Others
      label: 'Others',
      onTap: () {
        // Action: Navigate to other products or categories page
      },
    ),
  ],
),

            SizedBox(height: 30),

            // Featured Products Section with View All Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
  'Featured Products',
  style: TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
),
SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navigate to the complete featured products page
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: const Color(0xFF00af88),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(
                    productName: 'Fresh Tomatoes',
                    imagePath: 'assets/tomatoes.png',
                    price: 'RWF 1500/kg',
                  ),
                  ProductCard(
                    productName: 'Organic Carrots',
                    imagePath: 'assets/carrots.png',
                    price: 'RWF 1200/kg',
                  ),
                  ProductCard(
                    productName: 'Potatoes',
                    imagePath: 'assets/potatoes.png',
                    price: 'RWF 1000/kg',
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Farmlink Picks Section for discounts or offers
            Text(
              'Farmlink Picks',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ProductCard(
                    productName: 'Discounted Avocados',
                    imagePath: 'assets/avocados.png',
                    price: 'RWF 900/kg (20% OFF)',
                  ),
                  ProductCard(
                    productName: 'Fresh Spinach',
                    imagePath: 'assets/spinach.png',
                    price: 'RWF 800/kg (10% OFF)',
                  ),
                  ProductCard(
                    productName: 'Sweet Apples',
                    imagePath: 'assets/apples.png',
                    price: 'RWF 2500/kg (15% OFF)',
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Sustainability Section
            Text(
              'Sustainability Tips',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Learn how Farmlink is helping reduce waste and support sustainable farming practices.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to sustainability page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00af88),
              ),
              child: Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder widget for Browse Products Page
class BrowseProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Browse Products Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Placeholder widget for Profile Page
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Custom HomeActionButton Widget
class HomeActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const HomeActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Fix: Add a comma after onTap
      child: Column( // Fix: Missing colon before Column
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundColor: const Color(0xFF00af88),
            child: Icon(icon, color: Colors.white, size: 30.0),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


// Custom ProductCard Widget
class ProductCard extends StatelessWidget {
  final String productName;
  final String imagePath;
  final String price;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
