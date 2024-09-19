import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import the Welcome Page

void main() => runApp(FarmlinkApp());

class FarmlinkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(), // Set WelcomePage as the home page
      debugShowCheckedModeBanner: false,
    );
  }
}
