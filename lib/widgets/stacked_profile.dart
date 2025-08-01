import 'package:flutter/material.dart';

class StackedProfiles extends StatelessWidget {
  final List<String> imagePaths;
  final int maxVisible;

  const StackedProfiles({
    super.key,
    required this.imagePaths,
    this.maxVisible = 3,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final avatarRadius = screenWidth * 0.032;
    final avatarDiameter = avatarRadius * 2;
    final overlapOffset = screenWidth * 0.037;

    final visibleImages = imagePaths.take(maxVisible).toList();
    final showExtra = imagePaths.length > maxVisible;
    final extraCount = imagePaths.length - maxVisible;

    final totalWidth =
        avatarDiameter + (visibleImages.length - 1) * overlapOffset;

    return SizedBox(
      width: totalWidth + (showExtra ? overlapOffset : 0),
      height: avatarDiameter,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < visibleImages.length; i++)
            Positioned(
              left: i * overlapOffset,
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundImage: AssetImage(visibleImages[i]),
              ),
            ),
          if (showExtra)
            Positioned(
              left: visibleImages.length * overlapOffset,
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  '+$extraCount',
                  style: TextStyle(
                    fontSize: screenWidth * 0.026,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
