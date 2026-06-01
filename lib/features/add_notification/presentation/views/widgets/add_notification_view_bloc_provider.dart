import 'package:ecommerce_dash_board/core/services/get_it_service.dart';
import 'package:ecommerce_dash_board/features/add_notification/domain/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/manager/add_notification_cubit/add_notification_cubit.dart';
import 'package:ecommerce_dash_board/features/add_product/domain/repos/images_repo/images_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationViewBlocProvider extends StatelessWidget {
  const AddNotificationViewBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotificationCubit(
        notificationRepo: getIt.get<NotificationRepo>(),
        imagesRepo: getIt.get<ImagesRepo>(),
      ),
      child:  child);
  }
}