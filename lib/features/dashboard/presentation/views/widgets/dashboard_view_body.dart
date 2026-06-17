import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/utils/app_routes.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              child: CustomButton(
                text: "إضافة منتج",
                onPressed: () {
                  context.go(AppRoutes.addProduct);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomButton(
                text: "عرض المنتجات",
                onPressed: () {
                  context.go(AppRoutes.orders);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomButton(
                text: "إضافة اشعار",
                onPressed: () {
                  context.go(AppRoutes.addNotification);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
