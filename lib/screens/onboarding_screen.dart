import 'package:flutter/material.dart';
import '../data/onboarding.dart';
import '../widgets/custom_button.dart';
import '../widgets/line_page_indicator.dart';
import '../screens/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _imagePageController = PageController();
  int currentIndex = 0;

  void _nextPage() {
    if (currentIndex < onboardingPages.length - 1) {
      _imagePageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = onboardingPages[currentIndex];
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: screenHeight * 0.50,

                width: double.infinity,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _imagePageController,
                      itemCount: onboardingPages.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            child: Image.asset(
                              onboardingPages[index].imagePath,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 8,
                      right: 20,
                      child: TextButton(
                        onPressed: _nextPage,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontFamily: 'Gill Sans MT',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            height: 24 / 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.048),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Image.asset(
                  content.image,
                  width: screenWidth * 0.80,
                  height: screenHeight * 0.10,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: screenHeight * 0.0095),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  content.subtitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontFamily: 'Gill Sans MT',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.2,
                    height: 24 / 14,

                    color: Color(0xFF7D848D),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),
              LinePageIndicator(
                currentIndex: currentIndex,
                pageCount: onboardingPages.length,
              ),

              SizedBox(height: screenHeight * 0.04),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  text: currentIndex == onboardingPages.length - 1
                      ? 'Get Started'
                      : 'Next',
                  onPressed: _nextPage,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
