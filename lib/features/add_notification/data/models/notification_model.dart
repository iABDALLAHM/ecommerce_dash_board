import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String? notificationTitle;
  final String? notificationBody;
  final int? discountPercentage;
  final String? notificationImageUrl;
  final DateTime? date;
  NotificationModel({
    required this.notificationTitle,
    required this.notificationBody,
    required this.discountPercentage,
    required this.notificationImageUrl,
    required this.date,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      date: notificationEntity.date,
      notificationImageUrl: notificationEntity.notificationImageUrl,
      notificationTitle: notificationEntity.notificationTitle,
      notificationBody: notificationEntity.notificationBody,
      discountPercentage: notificationEntity.discountPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "date": DateTime.now(),
      "notificationimageUrl": notificationImageUrl,
      "notificationTitle": notificationTitle,
      "notificationBody": notificationBody,
      "discountPercentage": discountPercentage,
    };
  }
}
