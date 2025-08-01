import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:travelapp/models/homescreen_model.dart';
import '../widgets/placecard_widget.dart';
import '../data/homescreen_data.dart';
import '../widgets/custom_bottom_navbar.dart';
import '../screens/details_screen.dart';
import '../screens/view_all_acreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.0533,
            top: screenHeight * 0.0246,
            right: screenWidth * 0.0533,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/png/profile_homepage.png',
                        width: screenWidth * 0.3147,
                        height: screenHeight * 0.0542,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/png/Ellipse 674.png',
                          width: screenWidth * 0.1173,
                          height: screenWidth * 0.1173,
                          color: Colors.grey.shade100,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/png/Notifications.png',
                            width: screenWidth * 0.064,
                            height: screenWidth * 0.064,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.0296),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/png/homescreen_text.png',
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.1256,
                  ),
                ),

                SizedBox(height: screenHeight * 0.0369),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Destination',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ViewAllDestinationsScreen(
                              destinations: destinations,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View all',
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.0197),
                CarouselSlider.builder(
                  itemCount: destinations.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.04),
                      child: PlaceCard(
                        destination: destinations[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                destination: destinations[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 0.83,
                    height: screenHeight * 0.48,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: false,
                  ),
                ),
                // Container(height: 80, color: Colors.red),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: _selectedIndex),
    );
  }
}
