import 'package:flutter/material.dart';
import '../models/homescreen_model.dart';
import '../widgets/stacked_profile.dart';

class PlaceCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback? onTap;
  const PlaceCard({super.key, required this.destination, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: Container(
          width: screenWidth * 0.7147,
          // height: screenHeight * 0.4726,
          padding: EdgeInsets.all(screenWidth * 0.0373),
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
                      destination.imagePath,
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
                      child: const Icon(
                        Icons.bookmark_border,
                        size: 20,
                        color: Colors.white,
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
                      destination.name,
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
                        destination.rating.toString(),
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
                      destination.location,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.0133),
                  StackedProfiles(imagePaths: destination.visitors),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
