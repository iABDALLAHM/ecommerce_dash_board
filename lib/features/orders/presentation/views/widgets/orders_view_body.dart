import 'package:ecommerce_dash_board/constants.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(children: [const SizedBox(height: 25), FilterSection()]),
    );
  }
}
