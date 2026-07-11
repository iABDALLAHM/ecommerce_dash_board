import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity/notification_entity.dart';

class NotificationModel {
  final String notificationBody;
  final String notificationImageUrl;
  final DateTime notificationDate;
  final String notificationId;

  NotificationModel({
    required this.notificationBody,
    required this.notificationImageUrl,
    required this.notificationDate,
    required this.notificationId,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      notificationDate: notificationEntity.notificationDate,
      notificationImageUrl: notificationEntity.notificationImage,
      notificationBody: notificationEntity.notificationBody,
      notificationId: notificationEntity.notificationId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "notificationImageUrl": notificationImageUrl,
      "notificationBody": notificationBody,
      "notificationDate": notificationDate,
      "notificationId": notificationId,
    };
  }
}
