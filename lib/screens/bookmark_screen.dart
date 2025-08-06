import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/homescreen_model.dart';
import '../widgets/place_card_widget.dart';
import '../data/homescreen_data.dart';
import '../widgets/custom_appbar.dart';
import '../screens/details_screen.dart';
import '../constants/key.dart';

class BookmarkedPlacesScreen extends StatefulWidget {
  const BookmarkedPlacesScreen({super.key});


  @override
  State<BookmarkedPlacesScreen> createState() => _BookmarkedPlacesScreenState();
}

class _BookmarkedPlacesScreenState extends State<BookmarkedPlacesScreen> {
  List<Destination> bookmarkedDestinations = [];


  @override
  void initState() {
    super.initState();
    _loadBookmarkedDestinations();
  }

  Future<void> _loadBookmarkedDestinations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedList = prefs.getStringList(StorageKeys.bookmarkedPlaces) ?? [];

    setState(() {
      bookmarkedDestinations = destinations
          .where((place) => savedList.contains(place.name))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Bookmarked Places'
      ),
      body: bookmarkedDestinations.isEmpty
          ? const Center(child: Text('No bookmarked places yet.'))
          : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 73 / 375),
        itemCount: bookmarkedDestinations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PlaceCard(destination: bookmarkedDestinations[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                        destination: bookmarkedDestinations[index],
                    ),
                  ),
                );
              },),
          );
        },
      ),
    );
  }
}
