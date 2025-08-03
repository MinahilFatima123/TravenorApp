import 'package:flutter/material.dart';
import '../models/messages_model.dart';

class ChatTile extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback? onTap;

  const ChatTile({super.key, required this.chat, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(chat.profileImage),
          ),
          if (chat.isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        chat.name,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        chat.isTyping ? 'Typing...' : chat.lastMessage,
        style: TextStyle(
          color: chat.isTyping ? Colors.blue : Colors.black54,
          fontWeight: chat.isTyping ? FontWeight.w500 : FontWeight.normal,
          fontSize: 14,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (chat.isDelivered && chat.isRead)
                Icon(Icons.done_all, color: Colors.green, size: 16)
              else if (chat.isDelivered)
                Icon(Icons.done_all, color: Colors.grey, size: 16)
              else
                Icon(Icons.check, color: Colors.grey, size: 16),

              const SizedBox(width: 4),

              Text(
                chat.time,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
