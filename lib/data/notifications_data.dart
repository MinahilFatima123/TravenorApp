import '../models/notifications_model.dart';

final List<NotificationModel> notificationList = [
  NotificationModel(
    name: 'Sajib Rahman',
    profileImage: 'assets/png/image1_messages.png',
    message: 'Get 60% off in our first booking',
    timestamp: DateTime.now().subtract(Duration(hours: 3)),
  ),
  NotificationModel(
    name: 'Adom Shafi',
    profileImage: 'assets/png/image2_messages.png',
    message: 'Get 60% off in our first booking',
    timestamp: DateTime.now().subtract(Duration(hours: 3)),
  ),
  NotificationModel(
    name: 'HR Rumen',
    profileImage: 'assets/png/image3_messages.png',
    message: 'Get 60% off in our first booking',
    timestamp: DateTime.now().subtract(Duration(hours: 3)),
  ),
];
