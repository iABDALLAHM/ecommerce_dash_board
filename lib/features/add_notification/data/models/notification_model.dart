import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity.dart';

class NotificationModel {
  final String? notificationTitle;
  final String? notificationBody;
  final String? discountPercentage;

  NotificationModel({
    required this.notificationTitle,
    required this.notificationBody,
    required this.discountPercentage,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      notificationTitle: notificationEntity.notificationTitle,
      notificationBody: notificationEntity.notificationBody,
      discountPercentage: notificationEntity.discountPercentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "notificationTitle": notificationTitle,
      "notificationBody": notificationBody,
      "discountPercentage": discountPercentage,
    };
  }
}
