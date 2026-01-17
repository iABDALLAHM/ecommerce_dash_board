import 'dart:io';

class NotificationEntity {
  final String? notificationTitle;
  final String? notificationBody;
  final int? discountPercentage;
  final File? image;
  String? notificationImageUrl;
    final DateTime date;


  NotificationEntity({
    required this.notificationTitle,
    required this.notificationBody,
    required this.discountPercentage,
    required this.image,
    this.notificationImageUrl, required this.date,
  });
}
