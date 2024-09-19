import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> welcomeData = [
    {
      'title': 'Welcome to Farmlink!',
      'description':
          'We’re connecting consumers with local farmers to reduce post-harvest losses. Let’s get started!',
      'buttonText': 'Next',
      'imagePath': 'assets/land.jpg' // Add your vector image here
    },
    {
      'title': 'Discover Fresh Produce',
      'description':
          'Browse real-time listings of fresh products from farmers across Rwanda!',
      'buttonText': 'Next',
      'imagePath': 'assets/farm.png' // Add your vector image here
    },
    {
      'title': 'Support Local Farmers',
      'description':
          'By purchasing through Farmlink, you’re directly supporting Rwandan farmers!',
      'buttonText': 'Next',
      'imagePath': 'assets/Frame.png' // Add your vector image here
    },
    {
      'title': 'Reduce Waste & Help the Planet',
      'description':
          'Together, we’re building a sustainable future. Make a positive impact today!',
      'buttonText': 'Get Started!',
      'imagePath': 'assets/Frame (1).png' // Add your vector image here
    },
  ];

  void nextPage() {
    if (currentPage < welcomeData.length - 1) {
      setState(() {
        currentPage++;
        _pageController.animateToPage(currentPage,
            duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
      });
    } else {
      // Navigate to home or other section after onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HomePage()), // Replace with your app's main page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics:
            NeverScrollableScrollPhysics(), // Disable swipe to control the flow by buttons
        itemCount: welcomeData.length,
        itemBuilder: (context, index) => WelcomeContent(
          title: welcomeData[index]['title']!,
          description: welcomeData[index]['description']!,
          buttonText: welcomeData[index]['buttonText']!,
          imagePath: welcomeData[index]['imagePath']!,
          onPressed: nextPage,
        ),
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  final String title, description, buttonText, imagePath;
  final VoidCallback onPressed;

  const WelcomeContent({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF00af88), // Align with your primary color
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Image.asset(
            imagePath,
            height: 250, // Placeholder for your vector images
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 16.0, color: const Color(0xFF000000)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00af88), // Button color
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Farmlink Home')),
      body: Center(child: Text('Welcome to the Home Page!')),
    );
  }
}
