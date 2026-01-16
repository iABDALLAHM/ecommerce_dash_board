import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity.dart';

abstract class NotificationRepo {
  Future<Either<Failure, void>> addNotification({
    required NotificationEntity notification,
  });
}
