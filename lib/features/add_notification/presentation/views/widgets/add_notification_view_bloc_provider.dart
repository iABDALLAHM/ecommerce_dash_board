import 'package:ecommerce_dash_board/core/cubits/get_image_cubit/get_image_cubit.dart';
import 'package:ecommerce_dash_board/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/repositories/notification_repository/notification_repository.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/cubits/add_notification_cubit/add_notification_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repositories/images_repository/images_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationViewBlocProvider extends StatelessWidget {
  const AddNotificationViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetImageCubit()),
        BlocProvider(
          create: (context) => AddNotificationCubit(
            notificationRepo: getIt.get<NotificationRepository>(),
            imagesRepo: getIt.get<ImagesRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
