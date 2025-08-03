import 'package:flutter/material.dart';

class SearchPlaces extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool showMic; // ✅ new
  final String hintText; // ✅ new

  const SearchPlaces({
    super.key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.showMic = true, // ✅ default true
    this.hintText = 'Search places', // ✅ default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 48,
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

          const SizedBox(width: 16),

          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hintText, // ✅ use dynamic hint text
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
