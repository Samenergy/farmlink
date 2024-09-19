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
      'imagePath': 'assets/hand.png'
    },
    {
      'title': 'Discover Fresh Produce',
      'description':
          'Browse real-time listings of fresh products from farmers across Rwanda!',
      'buttonText': 'Next',
      'imagePath': 'assets/farm.png'
    },
    {
      'title': 'Support Local Farmers',
      'description':
          'By purchasing through Farmlink, you’re directly supporting Rwandan farmers!',
      'buttonText': 'Next',
      'imagePath': 'assets/Frame.png'
    },
    {
      'title': 'Reduce Waste & Help the Planet',
      'description':
          'Together, we’re building a sustainable future. Make a positive impact today!',
      'buttonText': 'Get Started!',
      'imagePath': 'assets/Frame (1).png'
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Disable swipe
        itemCount: welcomeData.length,
        itemBuilder: (context, index) => WelcomeContent(
          title: welcomeData[index]['title']!,
          description: welcomeData[index]['description']!,
          buttonText: welcomeData[index]['buttonText']!,
          imagePath: welcomeData[index]['imagePath']!,
          currentPage: currentPage,
          totalPages: welcomeData.length,
          onPressed: nextPage,
        ),
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  final String title, description, buttonText, imagePath;
  final VoidCallback onPressed;
  final int currentPage;
  final int totalPages;

  const WelcomeContent({
    Key? key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.imagePath,
    required this.onPressed,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            // Title at the top
            Text(
              title,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00af88)
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Image in the center
            Expanded(
              child: Image.asset(
                imagePath,
                height: 250,
              ),
            ),
            SizedBox(height: 20),
            // Description below the image
            Text(
              description,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalPages, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentPage
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            // Button at the bottom
            ElevatedButton(
              onPressed: onPressed,
              child: Text(
              buttonText,
              style: TextStyle(color: Colors.white, fontSize:25.0), // Set text color to white
            ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00af88),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
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
