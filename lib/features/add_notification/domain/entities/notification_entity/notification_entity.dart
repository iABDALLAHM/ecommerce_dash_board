class NotificationEntity {
  final String id;
  final String notificationBody;
  final String notificationImage;
  final DateTime notificationDate;
  final List<String> readBy;

  NotificationEntity({
    required this.notificationBody,
    required this.notificationImage,
    required this.notificationDate,
    required this.id,
    this.readBy = const [],
  });

  NotificationEntity copyWith({required String? notificationImage}) {
    return NotificationEntity(
      notificationBody: notificationBody,
      notificationImage: notificationImage ?? this.notificationImage,
      notificationDate: notificationDate,
      id: id,
      readBy: readBy,
    );
  }
}
