import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/search_widget.dart';
import '../models/homescreen_model.dart';
import '../data/homescreen_data.dart';
import '../widgets/popular_place_widget.dart';
import '../screens/details_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Destination> filtered = destinations;

  void _search(String query) {
    setState(() {
      filtered = destinations
          .where((d) => d.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      body: TapRegion(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchPlaces(
                controller: _controller,
                onChanged: _search,
                onSubmitted: _search,
                showMic: true,
                hintText: 'Search Places',
              ),

              SizedBox(height: screenHeight * 30 / 812),
              Text(
                'Search Places',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 16 / 812),

              Expanded(
                // height: 800,
                child: MasonryGridView.count(
                  padding: EdgeInsets.only(bottom: 50),
                  //shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 12,
                  itemCount: _controller.text.isEmpty
                      ? destinations.length
                      : filtered.length,
                  itemBuilder: (context, index) {
                    final item = _controller.text.isEmpty
                        ? destinations[index]
                        : filtered[index];
                    return PopularPlaceCard(
                      destination: item,
                      showRating: false,

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(destination: item),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
