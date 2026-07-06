import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SeeLessWidget extends StatelessWidget {
  const SeeLessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(34, 244, 67, 54),
        ),
        child: Center(child: Text("SeeLess", style: AppStyles.textStyle13Bold)),
      ),
    );
  }
}