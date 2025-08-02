import 'package:flutter/material.dart';
import 'package:travelapp/screens/schedule_screen.dart';
import 'package:travelapp/screens/search_screen.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../screens/home_screen.dart';
//import '../screens/popular_places.dart';
//import '../models/homescreen_model.dart';
import '../screens/profile_screen.dart';
import '../screens/messages_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.1207,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.1207,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.only(
                top: screenHeight * 0.0098,
                left: screenWidth * 0.068,
                right: screenWidth * 0.068,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem(
                    context,
                    iconPath: 'assets/png/Home.png',
                    label: 'Home',
                    index: 0,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    screen: const HomeScreen(),
                  ),
                  _buildNavItem(
                    context,
                    iconPath: 'assets/png/Calendar.png',
                    label: 'Calendar',
                    index: 1,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    screen: const ScheduleScreen(),
                  ),
                  SizedBox(width: screenWidth * 0.1493),
                  _buildNavItem(
                    context,
                    iconPath: 'assets/png/Chat.png',
                    label: 'Messages',
                    index: 2,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    screen: const MessagesScreen(),
                  ),
                  _buildNavItem(
                    context,
                    iconPath: 'assets/png/profile_home.png',
                    label: 'Profile',
                    index: 3,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    screen: const ProfileScreen(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.0209,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SearchScreen()),
                );
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              shape: const CircleBorder(),
              elevation: 4,
              child: Image.asset(
                'assets/png/search.png',
                width: screenWidth * 0.0453,
                height: screenWidth * 0.0453,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String iconPath,
    required String label,
    required int index,
    required double screenWidth,
    required double screenHeight,
    required Widget screen,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: label,
          icon: Image.asset(
            iconPath,
            height: screenWidth * 0.064,
            color: selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          splashRadius: screenWidth * 0.064,
        ),
        Text(label, style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}
