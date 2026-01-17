import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_dash_board/core/errors/failure.dart';
import 'package:ecommerce_dash_board/core/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_dash_board/core/services/database_service.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_notification/data/models/notification_model.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity.dart';

class NotificationRepoImplementation implements NotificationRepo {
  final DatabaseService databaseService;
  NotificationRepoImplementation({required this.databaseService});

  @override
  Future<Either<Failure, void>> addNotification({
    required NotificationEntity notification,
  }) async {
    try {
      await databaseService.addData(
        path: BackendEndPoints.addNotification,
        data: NotificationModel.fromEntity(
          notificationEntity: notification,
        ).toMap(),
      );
      return Right(null);
    } catch (e) {
      log(
        "error happend in NotificationRepoImplementation in addNotification $e",
      );
      return Left(
        ServerFailure(errorMessage: "لقد حدث خطأ ما اثناء اضافة الإشعار"),
      );
    }
  }
}
