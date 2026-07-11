class NotificationEntity {
  final String notificationId;
  final String notificationBody;
  final String notificationImage;
  final DateTime notificationDate;

  NotificationEntity({
    required this.notificationBody,
    required this.notificationImage,
    required this.notificationDate,
    required this.notificationId,
  });

  NotificationEntity copyWith({required String? notificationImage}) {
    return NotificationEntity(
      notificationBody: notificationBody,
      notificationImage: notificationImage ?? this.notificationImage,
      notificationDate: notificationDate,
      notificationId: notificationId,
    );
  }
}
