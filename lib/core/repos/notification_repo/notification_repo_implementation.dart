import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity.dart';

class NotificationRepoImplementation implements NotificationRepo {
  @override
  Future<Either<Failure, NotificationEntity>> addNotification() {
    
    throw UnimplementedError();
  }
}
