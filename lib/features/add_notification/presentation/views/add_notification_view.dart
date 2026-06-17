import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/add_notification_view_bloc_provider.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/add_notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNotificationView extends StatelessWidget {
  const AddNotificationView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return AddNotificationViewBlocProvider(
      child: Scaffold(
        appBar: buildAddNotificationAppBar(context),
        body: AddNotificationViewBody(),
      ),
    );
  }

  AppBar buildAddNotificationAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text("إضافة إشعار", style: AppStyles.textStyle23Bold),
    );
  }
}
