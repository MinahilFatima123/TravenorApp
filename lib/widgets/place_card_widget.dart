import 'package:flutter/material.dart';
import '../models/homescreen_model.dart';
import '../widgets/stacked_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/key.dart';



class PlaceCard extends StatefulWidget {
  final Destination destination;
  final VoidCallback? onTap;

  const PlaceCard({
    super.key,
    required this.destination,
    this.onTap,
  });

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool _isBookmarked = false;

  void _toggleBookmark() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedList = prefs.getStringList(StorageKeys.bookmarkedPlaces ) ?? [];

    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    if (_isBookmarked) {
      // Add to saved list
      savedList.add(widget.destination.name);
    } else {
      // Remove from saved list
      savedList.remove(widget.destination.name);
    }

    await prefs.setStringList(StorageKeys.bookmarkedPlaces , savedList);
  }


  void _loadBookmarkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedList = prefs.getStringList(StorageKeys.bookmarkedPlaces ) ?? [];

    setState(() {
      _isBookmarked = savedList.contains(widget.destination.name);
    });
  }


  @override
  void initState() {
    super.initState();
    _loadBookmarkStatus();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: Container(
          width: screenWidth * 0.7147,
          // height: 400,
          padding: EdgeInsets.only(
            left: screenWidth * 0.0373,
            right: screenWidth * 0.0373,
            top: screenWidth * 0.0373,
            bottom: screenWidth * 0.0373,
          ),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.destination.imagePath,
                      width: screenWidth * 0.64,
                      height: screenHeight * 0.3522,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.0172,
                    right: screenWidth * 0.0373,
                    child: Container(
                      width: screenWidth * 0.0907,
                      height: screenWidth * 0.0907,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0x33000000),
                      ),
                      child: IconButton(
                        icon: Icon(
                          _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: _toggleBookmark,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.0172),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.destination.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: screenWidth * 0.0107),
                      Text(
                        widget.destination.rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.0098),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: Color(0xff7D848D),
                  ),
                  SizedBox(width: screenWidth * 0.0107),
                  Expanded(
                    child: Text(
                      widget.destination.location,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.0133),
                  StackedProfiles(imagePaths: widget.destination.visitors),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
