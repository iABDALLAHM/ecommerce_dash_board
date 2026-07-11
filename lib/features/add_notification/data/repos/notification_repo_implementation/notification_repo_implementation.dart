import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/custom_exception.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/errors/server_failure.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_dash_board/core/services/database_service/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_notification/data/models/notification_model/notification_model.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity/notification_entity.dart';

class NotificationRepoImplementation implements NotificationRepo {
  final DatabaseService databaseService;

  NotificationRepoImplementation({required this.databaseService});

  @override
  Future<Either<Failure, void>> addNotification({
    required NotificationEntity notification,
  }) async {
    try {
      await databaseService.addSingleData(
        documentId: notification.notificationId,
        path: BackendEndPoints.notification,
        data: NotificationModel.fromEntity(
          notificationEntity: notification,
        ).toMap(),
      );
      return Right(null);
    } on CustomException catch (e) {
      log(
        "error happend in NotificationRepoImplementation in addNotification $e",
      );
      return Left(ServerFailure(errorMessage: e.exceptionMeassge));
    }
  }
}
  