import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/core/widgets/custom_button.dart';
import 'package:ecommerce_dash_board/features/add_product/presentation/views/add_product_view.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/orders_view.dart';
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
              child: CustomButton(
                text: "إضافة منتج",
                onPressed: () {
                  Navigator.of(context).pushNamed(AddProductView.routeName);
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
                  Navigator.of(context).pushNamed(OrdersView.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
