import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_appbar.dart';
import '../widgets/custom_tab_bar.dart';
import '../data/notifications_data.dart';
import '../widgets/notification_listtile_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Notification'),
        body: Column(
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextTabBar(),
            ),
            // const Divider(),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 1),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: notificationList.length,
                          itemBuilder: (context, index) {
                            return NotificationTile(
                              notification: notificationList[index],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                        ),
                      ],
                    ),
                  ),

                  Center(child: Text("Earlier")),
                  Center(child: Text("Archived")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
