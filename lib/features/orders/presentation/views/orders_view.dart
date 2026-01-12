import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = "orders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrdersViewBody());
  }
}
