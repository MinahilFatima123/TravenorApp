import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../data/popular_package_data.dart';
import '../widgets/popular_package_card.dart';

class PopularPackageScreen extends StatelessWidget {
  const PopularPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Popular Package'),
      //  body: SingleChildScrollView(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Popular Trip Package',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  itemCount: popularPackageItem.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PopularPackageCard(
                      popularpackageitem: popularPackageItem[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
