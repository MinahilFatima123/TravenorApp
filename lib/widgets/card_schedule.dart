import 'package:flutter/material.dart';
import '../models/scheduled_model.dart';
import 'package:intl/intl.dart';

class ListtileSchedule extends StatelessWidget {
  final ScheduledItem scheduledItem;

  const ListtileSchedule({super.key, required this.scheduledItem});

  @override
  Widget build(BuildContext context) {
    return
    //Padding(
    //padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    // child:
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 100,
        width: 335,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                scheduledItem.destination.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/png/Calendar.png',
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(width: 3),
                    Text(
                      DateFormat(
                        'd MMMM y',
                      ).format(scheduledItem.scheduledDate),

                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  scheduledItem.destination.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Image.asset(
                      'assets/png/Location.png',
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(width: 3),
                    Text(
                      scheduledItem.destination.location,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ],
        ),
      ),
      // ),
    );
  }
}
