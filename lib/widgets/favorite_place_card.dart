import 'package:flutter/material.dart';
import '../models/homescreen_model.dart';

class FavoritePlaceCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback? onTap;
  const FavoritePlaceCard({super.key, required this.destination, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          child: Container(
            width: 161,
            //height: 194,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.032,
              vertical: screenHeight * 0.0148,
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
                        destination.imagePath,
                        width: 137,
                        height: 124,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0x80FFFFFF),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          size: 14,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.00985), // 8/812

                Text(
                  destination.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: screenHeight * 0.0074),

                Row(
                  children: [
                    Image.asset(
                      'assets/png/Location.png',
                      width: 14,
                      height: 14,
                    ),
                    SizedBox(width: 3),
                    Text(
                      destination.location,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
