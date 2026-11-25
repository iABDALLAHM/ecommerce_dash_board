import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_arrow_back.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/add_notification_body.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/views/widgets/add_notification_view_bloc_provider.dart';
import 'package:flutter/material.dart';

class AddNotificationView extends StatelessWidget {
  const AddNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNotificationViewBlocProvider(
      child: Scaffold(
        appBar: buildAddNotificationAppBar(context),
        body: AddNotificationBody(),
      ),
    );
  }

  AppBar buildAddNotificationAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: CustomArrowBack(),
      title: Text("إرسال إشعار للمستخدمين", style: AppStyles.textStyle23Bold),
    );
  }
}
