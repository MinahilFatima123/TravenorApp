class ChatModel {
  final String name;
  final String profileImage;
  final String lastMessage;
  final String time;
  final bool isTyping;
  final bool isRead;
  final bool isDelivered;
  final bool isOnline;

  ChatModel({
    required this.name,
    required this.profileImage,
    required this.lastMessage,
    required this.time,
    this.isTyping = false,
    this.isRead = true,
    this.isDelivered = true,
    this.isOnline = false,
  });
}
