import 'package:ecommerce_dash_board/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAdminImage extends StatelessWidget {
  const CustomAdminImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Color(0xffE2E8F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: AppColors.primaryColor, width: 3),
        ),
      ),
      child: Center(child: Icon(Icons.person)),
    );
  }
}
