import 'package:flutter/material.dart';
import '../models/popular_package_model.dart';

class PopularPackageCard extends StatelessWidget {
  final PopularPackageItem popularpackageitem;

  const PopularPackageCard({super.key, required this.popularpackageitem});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
          top: 12,
          bottom: 12,
          right: 12,
        ),
        height: 140,
        width: 335,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                popularpackageitem.destination.imagePath,
                width: 95,
                height: 116,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 0.03733 * screenWidth),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          popularpackageitem.destination.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 5,
                        ),
                        height: 26,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,

                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '\$${popularpackageitem.destination.pricePerPerson}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 4),

                  Row(
                    children: [
                      Image.asset(
                        'assets/png/Calendar.png',
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(width: 3),
                      Text(
                        popularpackageitem.dateRange,
                        style: Theme.of(context).textTheme.displaySmall!
                            .copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),

                  SizedBox(height: 0.00985 * screenHeight),

                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 13),
                      const Icon(Icons.star, color: Colors.amber, size: 13),
                      const Icon(Icons.star, color: Colors.amber, size: 13),
                      SizedBox(width: screenWidth * 0.0107),
                      Text(
                        popularpackageitem.destination.rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8 / 812 * screenHeight),

                  Row(
                    children: [
                      SizedBox(
                        width: 51,
                        height: 24,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  'assets/png/image1_messages.png',
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  'assets/png/image2_messages.png',
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  'assets/png/image3_messages.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '${popularpackageitem.personsJoined} Person Joined',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
