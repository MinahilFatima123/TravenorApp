import 'package:flutter/material.dart';
import '../data/scheduled_data.dart';
import '../widgets/card_schedule.dart';
import '../widgets/custom_appbar.dart';

class ViewAllScheduleScreen extends StatelessWidget {
  const ViewAllScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'All Schedules', showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView.builder(
          itemCount: scheduledList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListtileSchedule(scheduledItem: scheduledList[index]),
            );
          },
        ),
      ),
    );
  }
}
