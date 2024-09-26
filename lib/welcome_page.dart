import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> welcomeData = [
    {
      'title': 'Welcome to ',
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
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  } else {
    Navigator.pushReplacementNamed(context, '/home');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
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
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.imagePath,
    required this.onPressed,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF00af88),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                if (currentPage == 0) const SizedBox(width: 0),
                if (currentPage == 0)
                  Image.asset(
                    'assets/logo1.png',
                    height: screenHeight * 0.2,
                    fit: BoxFit.contain,
                  ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: screenWidth,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              description,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(totalPages, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentPage
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                );
              }),
            ),
            SizedBox(height: screenHeight * 0.03),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00af88),
                minimumSize: Size(double.infinity, screenHeight * 0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.06,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }
}