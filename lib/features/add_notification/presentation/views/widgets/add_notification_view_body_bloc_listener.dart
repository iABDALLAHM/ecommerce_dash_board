import 'package:ecommerce_dash_board/core/function/show_snack_bar.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/manager/add_notification_cubit/add_notification_cubit.dart';
import 'package:ecommerce_dash_board/features/add_notification/presentation/manager/add_notification_cubit/add_notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationViewBodyBlocListener extends StatelessWidget {
  const AddNotificationViewBodyBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNotificationCubit, AddNotificationStates>(
      listener: (context, state) {
        if (state is SuccessAddNotificationState) {
          Navigator.pop(context);
          showSnackBar(context, message: "تم إضافة إشعار  بنجاح");
        } else if (state is FailureAddNotificationState) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      child: child,
    );
  }
}
