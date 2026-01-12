import 'package:ecommerce_dash_board/core/utils/app_styles.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/get_orders_bloc_provider.dart';
import 'package:ecommerce_dash_board/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = "orders";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: GetOrdersBlocProvider(child: OrdersViewBody()),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      centerTitle: true,
      title: Text("Orders", style: AppStyles.textStyle23Bold),
    );
  }
}
