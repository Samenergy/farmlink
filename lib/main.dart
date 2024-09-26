import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import the Welcome Page
import 'Homepage.dart'; // Import the Home Page

void main() => runApp(const FarmlinkApp());

class FarmlinkApp extends StatelessWidget {
  const FarmlinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomePage(), // Set WelcomePage as the home page initially
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomePage(), // Define route for HomePage
      },
    );
  }
}
