import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/add_notification_view_body.dart';
import 'package:flutter/material.dart';

class AddNotificationView extends StatelessWidget {
  const AddNotificationView({super.key});
  static const String routeName = "AddNotification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("إضافة إشعار", style: AppStyles.textStyle23Bold),
      ),
      body: AddNotificationViewBody(),
    );
  }
}
