import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/custom_appbar.dart';
import '../models/homescreen_model.dart';
import '../widgets/popular_place_widget.dart';
import '../screens/details_screen.dart';

class PopularPlaces extends StatelessWidget {
  final List<Destination> destinations;
  const PopularPlaces({super.key, required this.destinations});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: ' Popular Places'),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Popular Places',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * 0.0197),
            Expanded(
              // height: 800,
              child: MasonryGridView.count(
                padding: EdgeInsets.only(bottom: 50),
                //shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  // final randomHeight = 220 + (index % 3) * 40;

                  return PopularPlaceCard(
                    destination: destinations[index],
                    showRating: true,

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(destination: destinations[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
