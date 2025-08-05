import 'package:flutter/material.dart';

class SearchPlaces extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool showMic;
  final String hintText;

  const SearchPlaces({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.showMic = true,
    this.hintText = 'Search places',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: 375 / 375 * screenWidth,
      height: 48 / 812 * screenHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/png/search.png',
            width: 19,
            height: 19,
            color: Colors.grey.shade600,
          ),

          SizedBox(width: 16 / 375 * screenWidth),

          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hintText,
              ),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          if (showMic) ...[
            Container(height: 24, width: 1, color: Colors.grey.shade300),
            const SizedBox(width: 8),
            Image.asset(
              'assets/png/Microphone_chats.png',
              width: 24,
              height: 24,
              color: Colors.grey.shade600,
            ),
          ],
        ],
      ),
    );
  }
}
