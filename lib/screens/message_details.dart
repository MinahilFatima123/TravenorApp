import 'package:flutter/material.dart';
import '../widgets/custom_appbar.dart';
import '../models/messages_model.dart';
import '../widgets/custom_textformfield.dart';

class MessageDetailScreen extends StatelessWidget {
  final ChatModel chat;
  const MessageDetailScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        title: chat.name,
        subtitle: chat.isOnline ? 'Active Now' : 'Not Active',
        trailing: GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/png/Ellipse 674.png',
                width: 44,
                height: 44,
                color: Colors.grey.shade100,
              ),
              Image.asset('assets/png/Call_chats.png', width: 24, height: 24),
            ],
          ),
        ),
      ),

      body: TapRegion(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(child: Container()),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: CustomTextFormField(
                        controller: messageController,
                        hintText: 'Type a message...',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                            right: 12,
                            top: 12,
                            bottom: 12,
                          ),
                          child: Image.asset(
                            'assets/png/attach.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/png/Ellipse 674.png',
                        width: 44,
                        height: 44,
                        color: Theme.of(context).primaryColor,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                      Image.asset(
                        'assets/png/Microphone_chats.png',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
