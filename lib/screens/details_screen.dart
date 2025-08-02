import 'package:flutter/material.dart';
import '../models/homescreen_model.dart';
import '../widgets/custom_appbar.dart';
//import '../data/homescreen_data.dart';
import '../widgets/gallery_row_widget.dart';
import '../widgets/expandable_text.dart';
import '../widgets/custom_button.dart';
import '../screens/schedule_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Destination destination;

  const DetailsScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Details',
        titleColor: Colors.white,
        iconColor: Colors.white,
        ellipseColor: const Color(0x33000000),
        trailing: Container(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.43,
              width: double.infinity,
              child: Image.asset(destination.imagePath, fit: BoxFit.cover),
            ),
            Transform.translate(
              offset: Offset(0, -screenHeight * 0.03),
              child: Container(
                width: screenWidth,
                padding: EdgeInsets.all(screenWidth * 0.0533),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.0197),
                      child: Center(
                        child: Image.asset(
                          'assets/png/bar_details.png',
                          width: screenWidth * 0.096,
                          height: screenHeight * 0.0049,

                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.0296),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              style: Theme.of(
                                context,
                              ).textTheme.displaySmall!.copyWith(fontSize: 24),
                            ),

                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              destination.location,
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),

                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            'assets/png/profile_detail.png',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.0296),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color(0xff7D848D),
                        ),
                        SizedBox(width: screenWidth * (4 / 375)),
                        Text(
                          destination.location.split(',')[0],
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[600],
                              ),
                        ),

                        SizedBox(width: screenWidth * 32 / 375),
                        Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            SizedBox(width: screenWidth * 0.0106),
                            Text(
                              destination.rating.toStringAsFixed(1),
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                            ),
                            Text(
                              '(${destination.totalReviews})',
                              style: Theme.of(context).textTheme.labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.grey[600],
                                  ),
                            ),
                            SizedBox(width: screenWidth * 33 / 375),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '\$${destination.pricePerPerson.toStringAsFixed(0)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' / Person',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.grey[600],
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.0296),
                    GalleryRowWidget(pictures: destination.pictures),
                    SizedBox(height: screenHeight * 0.0296),
                    Text(
                      'About Destination',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenHeight * (8 / 812)),
                    ExpandableTextByWords(
                      text: destination.about,
                      wordLimit: 25,
                    ),
                    SizedBox(height: screenHeight * (16 / 812)),
                    CustomButton(
                      text: 'Book Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScheduleScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
