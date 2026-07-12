import 'dart:io';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_dash_board/core/utils/backend_end_points.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/entities/notification_entity/notification_entity.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/cubits/add_notification_cubit/add_notification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationCubit extends Cubit<AddNotificationStates> {
  AddNotificationCubit({
    required this.notificationRepo,
    required this.imagesRepo,
  }) : super(InitialAddNotificationState());

  final NotificationRepository notificationRepo;
  final ImagesRepository imagesRepo;

  Future addNotification({required NotificationEntity notification}) async {
    emit(LoadingAddNotificationState());
    var response = await imagesRepo.uploadImage(
      file: File(notification.notificationImage),
      path: BackendEndPoints.addNotification,
    );

    response.fold(
      (failure) =>
          emit(FailureAddNotificationState(errorMessage: failure.errorMessage)),
      (imageUrl) async {
        final updatedNotification = notification.copyWith(
          notificationImage: imageUrl,
        );

        var result = await notificationRepo.addNotification(
          notification: updatedNotification,
        );

        result.fold(
          (failure) => emit(
            FailureAddNotificationState(errorMessage: failure.errorMessage),
          ),
          (success) => emit(SuccessAddNotificationState()),
        );
      },
    );
  }
}
