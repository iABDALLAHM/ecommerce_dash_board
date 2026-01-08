import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomButton(text: "إضافة المنتج", onPressed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
