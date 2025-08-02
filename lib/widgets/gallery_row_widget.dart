import 'package:flutter/material.dart';

class GalleryRowWidget extends StatelessWidget {
  final List<String> pictures;

  const GalleryRowWidget({super.key, required this.pictures});

  @override
  Widget build(BuildContext context) {
    int totalImages = pictures.length;
    int maxVisible = 4;
    int extraCount = totalImages - (maxVisible + 1);

    List<Widget> imageWidgets = [];

    for (
      int i = 0;
      i < (totalImages <= maxVisible ? totalImages : maxVisible);
      i++
    ) {
      imageWidgets.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            pictures[i],
            width: 42,
            height: 42,
            fit: BoxFit.cover,
          ),
        ),
      );
      imageWidgets.add(const SizedBox(width: 19));
    }

    if (totalImages > maxVisible) {
      imageWidgets.add(
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                pictures[maxVisible], // 5th image
                width: 42,
                height: 42,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Color.fromARGB(128, 0, 0, 0),

                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                '+${extraCount + 1}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: imageWidgets,
      ),
    );
  }
}
