import 'package:flutter/material.dart';
import 'package:travelapp/screens/popular_package_screen.dart';
import '../screens/popular_places.dart';
import '../screens/favorite_screen.dart';
import '../data/homescreen_data.dart';
import '../screens/searching_screen.dart';
import '../widgets/custom_appbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Explore'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNavigationButton(
              context,
              title: 'Popular Places',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PopularPlaces(destinations: destinations),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildNavigationButton(
              context,
              title: 'Popular Packages',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PopularPackageScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildNavigationButton(
              context,
              title: 'Favorites',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoritePlaces(destinations: destinations),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildNavigationButton(
              context,
              title: 'Search Destinations',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SearchingScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          foregroundColor: Colors.white,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
