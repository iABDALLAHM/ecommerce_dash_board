import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity/notification_entity.dart';

class NotificationModel {
  final String notificationBody;
  final String notificationImageUrl;
  final DateTime date;
  final List<String> readBy;
  final String id;

  NotificationModel({
    required this.notificationBody,
    required this.notificationImageUrl,
    required this.date,
    required this.readBy,
    required this.id,
  });

  factory NotificationModel.fromEntity({
    required NotificationEntity notificationEntity,
  }) {
    return NotificationModel(
      date: notificationEntity.notificationDate,
      notificationImageUrl: notificationEntity.notificationImage,
      notificationBody: notificationEntity.notificationBody,
      readBy: notificationEntity.readBy,
      id: notificationEntity.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "id": id,
      "readBy": readBy,
      "notificationImageUrl": notificationImageUrl,
      "notificationBody": notificationBody,
    };
  }
}
