import '../models/messages_model.dart';

final List<ChatModel> chatList = [
  ChatModel(
    name: 'Sajib Rahman',
    profileImage: 'assets/png/image1_messages.png',
    lastMessage: 'Hi, John! 👋 How are you doing?',
    time: '09:46',
    isRead: true,
    isDelivered: true,
    isOnline: true,
  ),
  ChatModel(
    name: 'Adom Shafi',
    profileImage: 'assets/png/image2_messages.png',
    lastMessage: 'Typing...',
    time: '08:42',
    isTyping: true,
    isOnline: true,
  ),
  ChatModel(
    name: 'HR Rumen',
    profileImage: 'assets/png/image3_messages.png',
    lastMessage: 'You: Cool! ☺️ Let’s meet at 18:00 near the traveling!',
    time: '08:42',
    isDelivered: true,
    isOnline: false,
    isRead: false,
  ),
];
