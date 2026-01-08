import 'package:ecommerce_dash_board/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressWidget extends StatelessWidget {
  const CustomProgressWidget({
    super.key,
    required this.child,
    required this.state,
  });
  final Widget child;
  final bool state;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
      blur: 10,
      inAsyncCall: state,
      child: child,
    );
  }
}
