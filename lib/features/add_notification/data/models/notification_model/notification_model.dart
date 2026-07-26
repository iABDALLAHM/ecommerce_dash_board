import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity/notification_entity.dart';

class NotificationModel {
  final String notificationBody;
  final String notificationImageUrl;
  final DateTime notificationDate;
  final String notificationId;
  final bool notificationSeen;

  NotificationModel({
    required this.notificationBody,
    required this.notificationImageUrl,
    required this.notificationDate,
    required this.notificationId,
    required this.notificationSeen,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      notificationDate: notificationEntity.notificationDate,
      notificationImageUrl: notificationEntity.notificationImage,
      notificationBody: notificationEntity.notificationBody,
      notificationId: notificationEntity.notificationId,
      notificationSeen: notificationEntity.notificationSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "notificationImageUrl": notificationImageUrl,
      "notificationBody": notificationBody,
      "notificationDate": notificationDate,
      "notificationId": notificationId,
      "notificationSeen": notificationSeen,
    };
  }
}
