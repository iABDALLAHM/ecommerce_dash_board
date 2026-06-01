class NotificationEntity {
  final String notificationTitle;
  final String notificationBody;
  final int discountPercentage;
  final String image;
  String? notificationImageUrl;
  final DateTime date;

  NotificationEntity({
    required this.notificationTitle,
    required this.notificationBody,
    required this.discountPercentage,
    required this.image,
    this.notificationImageUrl,
    required this.date,
  });

  NotificationEntity copyWith({String? notificationImageUrl}) {
    return NotificationEntity(
      notificationImageUrl: notificationImageUrl ?? this.notificationImageUrl,
      notificationTitle: notificationTitle,
      notificationBody: notificationBody,
      discountPercentage: discountPercentage,
      image: image,
      date: date,
    );
  }
}
