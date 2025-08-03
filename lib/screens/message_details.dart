import 'package:flutter/material.dart';

class MessageDetailScreen extends StatelessWidget {
  const MessageDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Message Detail")),
      body: const Center(
        child: Text(
          'This is a message detail screen.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
