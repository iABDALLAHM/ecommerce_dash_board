class NotificationEntity {
  final String notificationId;
  final String notificationBody;
  final String notificationImage;
  final DateTime notificationDate;
  final bool notificationSeen;

  NotificationEntity({
    required this.notificationBody,
    required this.notificationImage,
    required this.notificationDate,
    required this.notificationId,
    required this.notificationSeen,
  });

  NotificationEntity copyWith({required String? notificationImage}) {
    return NotificationEntity(
      notificationBody: notificationBody,
      notificationImage: notificationImage ?? this.notificationImage,
      notificationDate: notificationDate,
      notificationId: notificationId,
      notificationSeen: notificationSeen,
    );
  }
}
