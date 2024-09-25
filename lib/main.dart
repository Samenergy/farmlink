import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import the Welcome Page
import 'Homepage.dart'; // Import the Home Page

void main() => runApp(FarmlinkApp());

class FarmlinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(), // Set WelcomePage as the home page initially
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomePage(), // Define route for HomePage
      },
    );
  }
}
