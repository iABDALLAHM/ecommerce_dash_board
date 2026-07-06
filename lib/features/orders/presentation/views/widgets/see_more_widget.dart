import 'package:ecommerce_dash_board/core/utils/app_colors.dart';
import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SeeMoreWidget extends StatelessWidget {
  const SeeMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.lightPrimaryColor,
        ),
        margin: EdgeInsets.only(top: 10),
        child: Center(child: Text("SeeMore", style: AppStyles.textStyle13Bold)),
      ),
    );
  }
}
