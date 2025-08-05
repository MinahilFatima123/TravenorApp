import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/custom_appbar.dart';
import '../models/homescreen_model.dart';
import '../widgets/favorite_place_card.dart';
import '../screens/details_screen.dart';

class FavoritePlaces extends StatelessWidget {
  final List<Destination> destinations;
  const FavoritePlaces({super.key, required this.destinations});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: 'Favorite Places'),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Places',
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

                  return FavoritePlaceCard(
                    destination: destinations[index],
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
