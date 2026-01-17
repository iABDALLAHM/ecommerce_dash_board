import 'package:ecommerce_dash_board/core/repos/images_repo/images_repo.dart';
import 'package:ecommerce_dash_board/core/repos/notification_repo/notification_repo.dart';
import 'package:ecommerce_dash_board/core/services/get_it_service.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/manager/add_notification_cubit/add_notification_cubit.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/add_notification_view_body.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/add_notification_view_body_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationView extends StatelessWidget {
  const AddNotificationView({super.key});
  static const String routeName = "AddNotification";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotificationCubit(
        notificationRepo: getIt.get<NotificationRepo>(),
        imagesRepo: getIt.get<ImagesRepo>(),
      ),
      child: Scaffold(
        appBar: buildAddNotificationAppBar(context),
        body: AddNotificationViewBodyBlocListener(
          child: AddNotificationViewBody(),
        ),
      ),
    );
  }

  AppBar buildAddNotificationAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text("إضافة إشعار", style: AppStyles.textStyle23Bold),
    );
  }
}
