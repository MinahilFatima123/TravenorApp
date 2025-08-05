import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';

import '../data/scheduled_data.dart';
import '../widgets/card_schedule.dart';
import '../screens/viewall_scheduled.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // ignore: unused_field
  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Schedule', showBackButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * (30 / 812)),
            Container(
              height: 148,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Theme.of(context).primaryColor,

                selectedTextColor: Colors.white,
                dateTextStyle: Theme.of(context).textTheme.displaySmall!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),

                dayTextStyle: Theme.of(context).textTheme.displaySmall!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                monthTextStyle: Theme.of(context).textTheme.displaySmall!
                    .copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    ),
                onDateChange: (date) {
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
            ),
            SizedBox(height: screenHeight * (30 / 812)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Schedule',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewAllScheduleScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'View all',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: ListView.builder(
                  itemCount: scheduledList.length > 3
                      ? 3
                      : scheduledList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListtileSchedule(
                      scheduledItem: scheduledList[index],
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
