import 'package:flutter/material.dart';

class CustomTextTabBar extends StatelessWidget {
  const CustomTextTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TabBar(
      indicatorColor: theme.primaryColor,
      labelColor: theme.primaryColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: theme.textTheme.displaySmall?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: theme.textTheme.displaySmall?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      tabs: const [
        Tab(text: 'Recent'),
        Tab(text: 'Earlier'),
        Tab(text: 'Archived'),
      ],
    );
  }
}
