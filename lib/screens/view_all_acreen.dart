import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/homescreen_model.dart';
import '../widgets/place_card_widget.dart';
import '../widgets/custom_appbar.dart';
import '../screens/details_screen.dart';

class ViewAllDestinationsScreen extends StatelessWidget {
  final List<Destination> destinations;

  const ViewAllDestinationsScreen({super.key, required this.destinations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 9),
        child: MasonryGridView.count(
          padding: EdgeInsets.only(bottom: 50),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          itemCount: destinations.length,
          itemBuilder: (context, index) {
            // final randomHeight = 220 + (index % 3) * 40;

            return PlaceCard(
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
    );
  }
}
