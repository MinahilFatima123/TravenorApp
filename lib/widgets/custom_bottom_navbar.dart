import 'package:flutter/material.dart';
import 'package:travelapp/screens/home_screen.dart';
import 'package:travelapp/screens/schedule_screen.dart';
import 'package:travelapp/screens/messages_screen.dart';
import 'package:travelapp/screens/profile_screen.dart';
import 'package:travelapp/screens/search_screen.dart';

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({super.key});

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ScheduleScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SearchScreen()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        elevation: 4,
        child: Image.asset(
          'assets/png/search.png',
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Home.png',
              height: 20,
              color: _selectedIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Calendar.png',
              height: 20,
              color: _selectedIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Chat.png',
              height: 20,
              color: _selectedIndex == 2
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/profile_home.png',
              height: 20,
              color: _selectedIndex == 3
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
