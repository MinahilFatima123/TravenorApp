import 'package:flutter/material.dart';
import 'package:travelapp/screens/popular_package_screen.dart';
import '../screens/popular_places.dart';
import '../screens/favorite_screen.dart';
import '../data/homescreen_data.dart';
import '../screens/searching_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Destinations')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PopularPlaces(destinations: destinations),
                  ),
                );
              },
              child: const Text('Popular Places'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PopularPackageScreen()),
                );
              },
              child: const Text('PopularPageScreen'),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoritePlaces(destinations: destinations),
                  ),
                );
              },
              child: const Text('Favorites'),
            ),

            // Optional: Show a few horizontal popular items preview here (carousel or cards)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SearchingScreen()),
                );
              },
              child: const Text('Search Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
